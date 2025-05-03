-- 删除现有表（如果存在）
DROP TABLE IF EXISTS "user";

-- 创建新表（使用蛇形命名和 TIMESTAMPTZ）
CREATE TABLE "user" (
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
COMMENT ON TABLE "user" IS '用户表';
COMMENT ON COLUMN "user".login_name IS '登录名';
COMMENT ON COLUMN "user".real_name IS '真实姓名';
COMMENT ON COLUMN "user".password IS '密码';
COMMENT ON COLUMN "user".mobile IS '手机号';
COMMENT ON COLUMN "user".email IS '邮箱';
COMMENT ON COLUMN "user".avatar IS '头像地址';
COMMENT ON COLUMN "user".status IS '状态 0:未启用 1:正常';
COMMENT ON COLUMN "user".created_time IS '创建时间';
COMMENT ON COLUMN "user".updated_time IS '更新时间';
COMMENT ON COLUMN "user".deleted_time IS '删除时间';
COMMENT ON COLUMN "user".remark IS '备注';

-- 创建触发器函数（自动更新 updated_time）
CREATE OR REPLACE FUNCTION update_updated_time_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_time = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_user_updated_time 
BEFORE UPDATE ON "user" -- 应用于 "user" 表
FOR EACH ROW
EXECUTE FUNCTION update_updated_time_column();

-- 插入初始数据
INSERT INTO "user" (login_name, real_name, password, mobile, email, status, remark)
VALUES (
  'mingtaoli',
  '李明涛',
  '$2a$06$A2NXVmndfGG/yl6ktMl96uA24s4wIAL62rRiBu6CEfbQL7vGYuf52', -- 请确保这是一个安全的哈希密码
  '17782560245',
  'mingtao@xjtu.edu.cn',
  1,
  'First user'
);