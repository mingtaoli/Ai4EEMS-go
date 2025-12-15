### 1\. Docker Compose 编排文件

**保存路径：** `deploy/docker-compose.yaml`

```
version: '3.7'
name: ai4eems-go

services:
  # 1. etcd: 服务注册中心和 APISIX 配置存储
  etcd:
    image: quay.io/coreos/etcd:v3.6.6
    container_name: ai4eems-etcd
    restart: always
    environment:
      - ALLOW_NONE_AUTHENTICATION=yes
      - ETCD_ADVERTISE_CLIENT_URLS=http://etcd:2379
      - ETCD_LISTEN_CLIENT_URLS=http://0.0.0.0:2379
    ports:
      - "2379:2379"
    healthcheck:
      test: ["CMD", "/usr/local/bin/etcdctl", "endpoint", "health"]
      interval: 5s
      timeout: 3s
      retries: 10

  # 2. apisix: 高性能 API 网关数据面
  apisix:
    image: apache/apisix:3.14.1-ubuntu
    container_name: ai4eems-apisix
    restart: always
    volumes:
      - ./apisix/config.yaml:/usr/local/apisix/conf/config.yaml
    environment:
      - APISIX_CONF_ETCD={"host":["http://etcd:2379"],"prefix":"/apisix"}
    depends_on:
      etcd:
        condition: service_healthy
    ports:
      - "9180:9180" # Admin API 端口
      - "9080:9080" # 默认 HTTP 流量入口
      - "9091:9091" # Prometheus 监控指标
      - "9443:9443" # 默认 HTTPS 流量入口

  # 3. apisix-dashboard: 可视化管理界面
  apisix-dashboard:
    image: apache/apisix-dashboard:3.0.1-alpine
    container_name: ai4eems-apisix-dashboard
    restart: always
    volumes:
      - ./apisix/dashboard_config.yaml:/usr/local/apisix-dashboard/conf/conf.yaml
    environment:
      - APISIX_CONFIG_ETCD_HOSTS=http://etcd:2379
    depends_on:
      - apisix
    ports:
      - "9000:9000" # Dashboard 访问端口
```

### 2\. APISIX 核心配置文件

**保存路径：** `deploy/apisix/config.yaml`

```yaml
# apisix/config.yaml

deployment:
  admin:
    allow_admin:
      - 0.0.0.0/0
    admin_key:
      - name: "admin"
        key: edd1c9f034335f136f87ad84b625c8f1 # APISIX 管理密钥，用于 Dashboard 认证
        role: admin

  etcd:
    host:
      - "http://etcd:2379" # 使用 Docker Compose 服务名
    prefix: "/apisix"
    timeout: 30
```

### 3\. APISIX Dashboard 配置文件

**保存路径：** `deploy/apisix/dashboard_config.yaml`

```yaml
# apisix/dashboard_config.yaml

conf:
  listen:
    host: "0.0.0.0"
    port: 9000

  etcd:
    endpoints:
      - "http://etcd:2379"
    prefix: "/apisix"
    timeout: 30

  jwt:
    expire: 3600
    key: "abc_default_secret_key_used_for_jwt_signing_and_verification"

  log:
    error_log:
      level: warn
      file_path: /usr/local/apisix-dashboard/logs/error.log
      
  apisix:
    host:
      - "http://apisix:9180" # APISIX Admin API 地址
    admin_key: "edd1c9f034335f136f87ad84b625c8f1" # 必须与 apisix/config.yaml 中的密钥一致

authentication:
  secret:
    secret
  expire_time: 3600
  users:
    - username: admin
      password: admin
    - username: user
      password: user
```

### 启动说明

1.  请确保文件路径和内容正确。
2.  在 `deploy/` 目录下执行启动命令：
    ```bash
    docker-compose -f docker-compose.yaml up -d
    ```
3.  **访问 Dashboard：** 成功启动后，您可以通过浏览器访问 `http://localhost:9000`，使用配置的用户 `admin/admin` 登录。