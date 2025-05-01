-- 删除现有表（如果存在）
DROP TABLE IF EXISTS ai4energy_user;

-- 创建新表（使用蛇形命名和 TIMESTAMPTZ）
CREATE TABLE ai4energy_user (
    id SERIAL PRIMARY KEY NOT NULL,
    login_name VARCHAR(255) NOT NULL,
    real_name VARCHAR(255),
    password VARCHAR(255) NOT NULL,
    mobile VARCHAR(32),
    email VARCHAR(255),
    avatar VARCHAR(255),
    status SMALLINT DEFAULT 0,
    created_time TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_time TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    deleted_time TIMESTAMPTZ,
    remark VARCHAR(512),
    UNIQUE (login_name),
    UNIQUE (mobile),
    UNIQUE (email)
);

-- 添加注释
COMMENT ON TABLE ai4energy_user IS '用户表';
COMMENT ON COLUMN ai4energy_user.login_name IS '登录名';
COMMENT ON COLUMN ai4energy_user.real_name IS '真实姓名';
COMMENT ON COLUMN ai4energy_user.password IS '密码';
COMMENT ON COLUMN ai4energy_user.mobile IS '手机号';
COMMENT ON COLUMN ai4energy_user.email IS '邮箱';
COMMENT ON COLUMN ai4energy_user.avatar IS '头像地址';
COMMENT ON COLUMN ai4energy_user.status IS '状态 0:未启用 1:正常';
COMMENT ON COLUMN ai4energy_user.created_time IS '创建时间';
COMMENT ON COLUMN ai4energy_user.updated_time IS '更新时间';
COMMENT ON COLUMN ai4energy_user.deleted_time IS '删除时间';
COMMENT ON COLUMN ai4energy_user.remark IS '备注';

-- 创建触发器（自动更新 updated_time）
CREATE OR REPLACE FUNCTION update_updated_time_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_time = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_ai4energy_user_updated_time
BEFORE UPDATE ON ai4energy_user
FOR EACH ROW
EXECUTE FUNCTION update_updated_time_column();

-- 插入初始数据
INSERT INTO ai4energy_user (login_name, real_name, password, mobile, email, status, remark)
VALUES (
  'mingtaoli',
  '李明涛',
  '$2a$06$A2NXVmndfGG/yl6ktMl96uA24s4wIAL62rRiBu6CEfbQL7vGYuf52',
  '17782560245',
  'mingtao@xjtu.edu.cn',
  1,
  'First user'
);