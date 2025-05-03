# goctl 从pg数据库生成model代码

参考https://go-zero.dev/docs/tutorials/cli/model， 找到“goctl model pg 指令”部分。

```shell
# 注意用户名、密码、数据库名、表名，还有服务器的ip
goctl model pg datasource --url="postgres://ai4eems_user:ai4eems_password@127.0.0.1:5432/ai4eems_db?sslmode=disable" --table="user" --dir .
```