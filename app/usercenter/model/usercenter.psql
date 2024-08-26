-- 删除现有的表（如果存在）
DROP TABLE IF EXISTS ai4energy_user;

-- 创建新表
CREATE TABLE ai4energy_user (
    id SERIAL PRIMARY KEY NOT NULL,
    loginName VARCHAR(255) NOT NULL,
    realName VARCHAR(255),
    password VARCHAR(255) NOT NULL,
    mobile VARCHAR(32),
    email VARCHAR(255),
    avatar VARCHAR(255),
    status SMALLINT DEFAULT 0,
    createdTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deletedTime TIMESTAMP,
    remark VARCHAR(512),
    UNIQUE (loginName),
    UNIQUE (mobile),
    UNIQUE (email)
);

-- 添加注释
COMMENT ON TABLE ai4energy_user IS '用户表';
COMMENT ON COLUMN ai4energy_user.loginName IS '登录名';
COMMENT ON COLUMN ai4energy_user.realName IS '真实姓名';
COMMENT ON COLUMN ai4energy_user.password IS '密码';
COMMENT ON COLUMN ai4energy_user.mobile IS '手机号';
COMMENT ON COLUMN ai4energy_user.email IS '邮箱';
COMMENT ON COLUMN ai4energy_user.avatar IS '头像地址';
COMMENT ON COLUMN ai4energy_user.status IS '状态 0:未启用 1:正常';
COMMENT ON COLUMN ai4energy_user.createdTime IS '创建时间';
COMMENT ON COLUMN ai4energy_user.updatedTime IS '更新时间';
COMMENT ON COLUMN ai4energy_user.deletedTime IS '删除时间';
COMMENT ON COLUMN ai4energy_user.remark IS '备注';

-- 为字段创建索引
CREATE INDEX idx_loginName ON ai4energy_user (loginName);
CREATE INDEX idx_mobile ON ai4energy_user (mobile);
CREATE INDEX idx_email ON ai4energy_user (email);

-- 插入初始数据
INSERT INTO ai4energy_user (loginName, realName, password, mobile, email, status, remark)
VALUES
('mingtaoli', '李明涛', '$2a$06$A2NXVmndfGG/yl6ktMl96uA24s4wIAL62rRiBu6CEfbQL7vGYuf52', '17782560245', 'mingtao@xjtu.edu.cn', 1, 'First user');