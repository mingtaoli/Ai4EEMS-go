-- ----------------------------
-- Table structure for system_users
-- ----------------------------
DROP TABLE IF EXISTS system_users;
CREATE TABLE system_users
(
    id          int8         NOT NULL,
    username    varchar(30)  NOT NULL,
    password    varchar(100) NOT NULL DEFAULT '',
    nickname    varchar(30)  NOT NULL,
    remark      varchar(500) NULL     DEFAULT NULL,
    dept_id     int8         NULL     DEFAULT NULL,
    post_ids    varchar(255) NULL     DEFAULT NULL,
    email       varchar(50)  NULL     DEFAULT '',
    mobile      varchar(11)  NULL     DEFAULT '',
    sex         int2         NULL     DEFAULT 0,
    avatar      varchar(512) NULL     DEFAULT '',
    status      int2         NOT NULL DEFAULT 0,
    login_ip    varchar(50)  NULL     DEFAULT '',
    login_date  timestamp    NULL     DEFAULT NULL,
    creator     varchar(64)  NULL     DEFAULT '',
    create_time timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64)  NULL     DEFAULT '',
    update_time timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted     int2         NOT NULL DEFAULT 0,
    tenant_id   int8         NOT NULL DEFAULT 0
);

ALTER TABLE system_users
    ADD CONSTRAINT pk_system_users PRIMARY KEY (id);

COMMENT ON COLUMN system_users.id IS '用户ID';
COMMENT ON COLUMN system_users.username IS '用户账号';
COMMENT ON COLUMN system_users.password IS '密码';
COMMENT ON COLUMN system_users.nickname IS '用户昵称';
COMMENT ON COLUMN system_users.remark IS '备注';
COMMENT ON COLUMN system_users.dept_id IS '部门ID';
COMMENT ON COLUMN system_users.post_ids IS '岗位编号数组';
COMMENT ON COLUMN system_users.email IS '用户邮箱';
COMMENT ON COLUMN system_users.mobile IS '手机号码';
COMMENT ON COLUMN system_users.sex IS '用户性别';
COMMENT ON COLUMN system_users.avatar IS '头像地址';
COMMENT ON COLUMN system_users.status IS '帐号状态（0正常 1停用）';
COMMENT ON COLUMN system_users.login_ip IS '最后登录IP';
COMMENT ON COLUMN system_users.login_date IS '最后登录时间';
COMMENT ON COLUMN system_users.creator IS '创建者';
COMMENT ON COLUMN system_users.create_time IS '创建时间';
COMMENT ON COLUMN system_users.updater IS '更新者';
COMMENT ON COLUMN system_users.update_time IS '更新时间';
COMMENT ON COLUMN system_users.deleted IS '是否删除';
COMMENT ON COLUMN system_users.tenant_id IS '租户编号';
COMMENT ON TABLE system_users IS '用户信息表';

-- ----------------------------
-- Records of system_users
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, 'admin', '$2a$04$KljJDa/LK7QfDm0lF5OhuePhlPfjRH3tB2Wu351Uidz.oQGJXevPi', '芋道源码', '管理员', 103, '[1,2]', '11aoteman@126.com', '18818260277', 2, 'http://test.yudao.iocoder.cn/test/20250502/avatar_1746154660449.png', 0, '0:0:0:0:0:0:0:1', '2025-05-10 18:03:15', 'admin', '2021-01-05 17:03:47', NULL, '2025-05-10 18:03:15', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (100, 'yudao', '$2a$04$h.aaPKgO.odHepnk5PCsWeEwKdojFWdTItxGKfx1r0e1CSeBzsTJ6', '芋道', '不要吓我', 104, '[1]', 'yudao@iocoder.cn', '15601691300', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2025-04-08 09:36:40', '', '2021-01-07 09:07:17', NULL, '2025-04-21 14:23:08', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (103, 'yuanma', '$2a$04$fUBSmjKCPYAUmnMzOb6qE.eZCGPhHi1JmAKclODbfS/O7fHOl2bH6', '源码', NULL, 106, NULL, 'yuanma@iocoder.cn', '15601701300', 0, NULL, 0, '0:0:0:0:0:0:0:1', '2024-08-11 17:48:12', '', '2021-01-13 23:50:35', NULL, '2025-04-21 14:23:08', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (104, 'test', '$2a$04$BrwaYn303hjA/6TnXqdGoOLhyHOAA0bVrAFu6.1dJKycqKUnIoRz2', '测试号', NULL, 107, '[1,2]', '111@qq.com', '15601691200', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2025-03-28 20:01:16', '', '2021-01-21 02:13:53', NULL, '2025-04-21 14:23:08', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (107, 'admin107', '$2a$10$dYOOBKMO93v/.ReCqzyFg.o67Tqk.bbc2bhrpyBGkIw9aypCtr2pm', '芋艿', NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '', NULL, '1', '2022-02-20 22:59:33', '1', '2025-04-21 14:23:08', '0', 118);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (108, 'admin108', '$2a$10$y6mfvKoNYL1GXWak8nYwVOH.kCWqjactkzdoIDgiKl93WN3Ejg.Lu', '芋艿', NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '', NULL, '1', '2022-02-20 23:00:50', '1', '2025-04-21 14:23:08', '0', 119);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (109, 'admin109', '$2a$10$JAqvH0tEc0I7dfDVBI7zyuB4E3j.uH6daIjV53.vUS6PknFkDJkuK', '芋艿', NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '', NULL, '1', '2022-02-20 23:11:50', '1', '2025-04-21 14:23:08', '0', 120);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (110, 'admin110', '$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm', '小王', NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '0:0:0:0:0:0:0:1', '2024-07-20 22:23:17', '1', '2022-02-22 00:56:14', NULL, '2025-04-21 14:23:08', '0', 121);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (111, 'test', '$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm', '测试用户', NULL, NULL, '[]', '', '', 0, NULL, 0, '0:0:0:0:0:0:0:1', '2023-12-30 11:42:17', '110', '2022-02-23 13:14:33', NULL, '2025-04-21 14:23:08', '0', 121);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (112, 'newobject', '$2a$04$dB0z8Q819fJWz0hbaLe6B.VfHCjYgWx6LFfET5lyz3JwcqlyCkQ4C', '新对象', NULL, 100, '[]', '', '15601691235', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2024-03-16 23:11:38', '1', '2022-02-23 19:08:03', NULL, '2025-04-21 14:23:08', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (113, 'aoteman', '$2a$10$0acJOIk2D25/oC87nyclE..0lzeu9DtQ/n3geP4fkun/zIVRhHJIO', '芋道1', NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '127.0.0.1', '2022-03-19 18:38:51', '1', '2022-03-07 21:37:58', '1', '2025-05-05 15:30:53', '0', 122);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (114, 'hrmgr', '$2a$10$TR4eybBioGRhBmDBWkqWLO6NIh3mzYa8KBKDDB5woiGYFVlRAi.fu', 'hr 小姐姐', NULL, NULL, '[5]', '', '15601691236', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2024-03-24 22:21:05', '1', '2022-03-19 21:50:58', NULL, '2025-04-21 14:23:08', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (115, 'aotemane', '$2a$04$GcyP0Vyzb2F2Yni5PuIK9ueGxM0tkZGMtDwVRwrNbtMvorzbpNsV2', '阿呆', '11222', 102, '[1,2]', '7648@qq.com', '15601691229', 2, NULL, 0, '', NULL, '1', '2022-04-30 02:55:43', '1', '2025-04-21 14:23:08', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (117, 'admin123', '$2a$04$sEtimsHu9YCkYY4/oqElHem2Ijc9ld20eYO6lN.g/21NfLUTDLB9W', '测试号02', '1111', 100, '[2]', '', '15601691234', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2024-10-02 10:16:20', '1', '2022-07-09 17:40:26', NULL, '2025-04-21 14:23:08', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (118, 'goudan', '$2a$04$jth0yOj8cSJq84D6vrzusOHDwW/LpBfgBnQ6bfFlD8zNZfM632Ta2', '狗蛋', NULL, 103, '[1]', '', '15601691239', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2024-03-17 09:10:27', '1', '2022-07-09 17:44:43', '1', '2025-04-21 14:23:08', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (131, 'hh', '$2a$04$jyH9h6.gaw8mpOjPfHIpx.8as2Rzfcmdlj5rlJFwgCw4rsv/MTb2K', '呵呵', NULL, 100, '[]', '777@qq.com', '15601882312', 1, NULL, 0, '', NULL, '1', '2024-04-27 08:45:56', '1', '2025-04-21 14:23:08', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (139, 'wwbwwb', '$2a$04$aOHoFbQU6zfBk/1Z9raF/ugTdhjNdx7culC1HhO0zvoczAnahCiMq', '小秃头', NULL, NULL, NULL, '', '', 0, NULL, 0, '0:0:0:0:0:0:0:1', '2024-09-10 21:03:58', NULL, '2024-09-10 21:03:58', NULL, '2025-04-21 14:23:08', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (141, 'admin1', '$2a$04$oj6F6d7HrZ70kYVD3TNzEu.m3TPUzajOVuC66zdKna8KRerK1FmVa', '新用户', NULL, NULL, NULL, '', '', 0, '', 0, '0:0:0:0:0:0:0:1', '2025-04-08 13:09:07', '1', '2025-04-08 13:09:07', '1', '2025-04-08 13:09:07', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_users_seq;
CREATE SEQUENCE system_users_seq
    START 142;

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS system_dept;
CREATE TABLE system_dept
(
    id             int8        NOT NULL,
    name           varchar(30) NOT NULL DEFAULT '',
    parent_id      int8        NOT NULL DEFAULT 0,
    sort           int4        NOT NULL DEFAULT 0,
    leader_user_id int8        NULL     DEFAULT NULL,
    phone          varchar(11) NULL     DEFAULT NULL,
    email          varchar(50) NULL     DEFAULT NULL,
    status         int2        NOT NULL,
    creator        varchar(64) NULL     DEFAULT '',
    create_time    timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater        varchar(64) NULL     DEFAULT '',
    update_time    timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted        int2        NOT NULL DEFAULT 0,
    tenant_id      int8        NOT NULL DEFAULT 0
);

ALTER TABLE system_dept
    ADD CONSTRAINT pk_system_dept PRIMARY KEY (id);

COMMENT ON COLUMN system_dept.id IS '部门id';
COMMENT ON COLUMN system_dept.name IS '部门名称';
COMMENT ON COLUMN system_dept.parent_id IS '父部门id';
COMMENT ON COLUMN system_dept.sort IS '显示顺序';
COMMENT ON COLUMN system_dept.leader_user_id IS '负责人';
COMMENT ON COLUMN system_dept.phone IS '联系电话';
COMMENT ON COLUMN system_dept.email IS '邮箱';
COMMENT ON COLUMN system_dept.status IS '部门状态（0正常 1停用）';
COMMENT ON COLUMN system_dept.creator IS '创建者';
COMMENT ON COLUMN system_dept.create_time IS '创建时间';
COMMENT ON COLUMN system_dept.updater IS '更新者';
COMMENT ON COLUMN system_dept.update_time IS '更新时间';
COMMENT ON COLUMN system_dept.deleted IS '是否删除';
COMMENT ON COLUMN system_dept.tenant_id IS '租户编号';
COMMENT ON TABLE system_dept IS '部门表';

-- ----------------------------
-- Records of system_dept
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (100, '数智能源', 0, 0, 1, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2025-03-29 15:47:53', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (101, '深圳总公司', 100, 1, 104, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2025-03-29 15:49:55', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (102, '长沙分公司', 100, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:40', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (103, '研发部门', 101, 1, 1, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2024-10-02 10:22:03', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (104, '市场部门', 101, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:38', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (105, '测试部门', 101, 3, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2022-05-16 20:25:15', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (106, '财务部门', 101, 4, 103, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '103', '2022-01-15 21:32:22', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (107, '运维部门', 101, 5, 1, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2023-12-02 09:28:22', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (108, '市场部门', 102, 1, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2022-02-16 08:35:45', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (109, '财务部门', 102, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:29', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (110, '新部门', 0, 1, NULL, NULL, NULL, 0, '110', '2022-02-23 20:46:30', '110', '2022-02-23 20:46:30', '0', 121);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (111, '顶级部门', 0, 1, NULL, NULL, NULL, 0, '113', '2022-03-07 21:44:50', '113', '2022-03-07 21:44:50', '0', 122);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (112, '产品部门', 101, 100, 1, NULL, NULL, 1, '1', '2023-12-02 09:45:13', '1', '2023-12-02 09:45:31', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (113, '支持部门', 102, 3, 104, NULL, NULL, 1, '1', '2023-12-02 09:47:38', '1', '2025-03-29 15:00:56', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_dept_seq;
CREATE SEQUENCE system_dept_seq
    START 114;


-- ----------------------------
-- Table structure for system_post
-- ----------------------------
DROP TABLE IF EXISTS system_post;
CREATE TABLE system_post
(
    id          int8         NOT NULL,
    code        varchar(64)  NOT NULL,
    name        varchar(50)  NOT NULL,
    sort        int4         NOT NULL,
    status      int2         NOT NULL,
    remark      varchar(500) NULL     DEFAULT NULL,
    creator     varchar(64)  NULL     DEFAULT '',
    create_time timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64)  NULL     DEFAULT '',
    update_time timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted     int2         NOT NULL DEFAULT 0,
    tenant_id   int8         NOT NULL DEFAULT 0
);

ALTER TABLE system_post
    ADD CONSTRAINT pk_system_post PRIMARY KEY (id);

COMMENT ON COLUMN system_post.id IS '岗位ID';
COMMENT ON COLUMN system_post.code IS '岗位编码';
COMMENT ON COLUMN system_post.name IS '岗位名称';
COMMENT ON COLUMN system_post.sort IS '显示顺序';
COMMENT ON COLUMN system_post.status IS '状态（0正常 1停用）';
COMMENT ON COLUMN system_post.remark IS '备注';
COMMENT ON COLUMN system_post.creator IS '创建者';
COMMENT ON COLUMN system_post.create_time IS '创建时间';
COMMENT ON COLUMN system_post.updater IS '更新者';
COMMENT ON COLUMN system_post.update_time IS '更新时间';
COMMENT ON COLUMN system_post.deleted IS '是否删除';
COMMENT ON COLUMN system_post.tenant_id IS '租户编号';
COMMENT ON TABLE system_post IS '岗位信息表';

-- ----------------------------
-- Records of system_post
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_post (id, code, name, sort, status, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, 'ceo', '董事长', 1, 0, '', 'admin', '2021-01-06 17:03:48', '1', '2023-02-11 15:19:04', '0', 1);
INSERT INTO system_post (id, code, name, sort, status, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, 'se', '项目经理', 2, 0, '', 'admin', '2021-01-05 17:03:48', '1', '2023-11-15 09:18:20', '0', 1);
INSERT INTO system_post (id, code, name, sort, status, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4, 'user', '普通员工', 4, 0, '111222', 'admin', '2021-01-05 17:03:48', '1', '2025-03-24 21:32:40', '0', 1);
INSERT INTO system_post (id, code, name, sort, status, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, 'HR', '人力资源', 5, 0, '`', '1', '2024-03-24 20:45:40', '1', '2025-03-29 19:08:10', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_post_seq;
CREATE SEQUENCE system_post_seq
    START 6;

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS system_role;
CREATE TABLE system_role
(
    id                  int8         NOT NULL,
    name                varchar(30)  NOT NULL,
    code                varchar(100) NOT NULL,
    sort                int4         NOT NULL,
    data_scope          int2         NOT NULL DEFAULT 1,
    data_scope_dept_ids varchar(500) NOT NULL DEFAULT '',
    status              int2         NOT NULL,
    type                int2         NOT NULL,
    remark              varchar(500) NULL     DEFAULT NULL,
    creator             varchar(64)  NULL     DEFAULT '',
    create_time         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater             varchar(64)  NULL     DEFAULT '',
    update_time         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted             int2         NOT NULL DEFAULT 0,
    tenant_id           int8         NOT NULL DEFAULT 0
);

ALTER TABLE system_role
    ADD CONSTRAINT pk_system_role PRIMARY KEY (id);

COMMENT ON COLUMN system_role.id IS '角色ID';
COMMENT ON COLUMN system_role.name IS '角色名称';
COMMENT ON COLUMN system_role.code IS '角色权限字符串';
COMMENT ON COLUMN system_role.sort IS '显示顺序';
COMMENT ON COLUMN system_role.data_scope IS '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）';
COMMENT ON COLUMN system_role.data_scope_dept_ids IS '数据范围 ( 指定部门数组)';
COMMENT ON COLUMN system_role.status IS '角色状态（0正常 1停用）';
COMMENT ON COLUMN system_role.type IS '角色类型';
COMMENT ON COLUMN system_role.remark IS '备注';
COMMENT ON COLUMN system_role.creator IS '创建者';
COMMENT ON COLUMN system_role.create_time IS '创建时间';
COMMENT ON COLUMN system_role.updater IS '更新者';
COMMENT ON COLUMN system_role.update_time IS '更新时间';
COMMENT ON COLUMN system_role.deleted IS '是否删除';
COMMENT ON COLUMN system_role.tenant_id IS '租户编号';
COMMENT ON TABLE system_role IS '角色信息表';

-- ----------------------------
-- Records of system_role
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, '超级管理员', 'super_admin', 1, 1, '', 0, 1, '超级管理员', 'admin', '2021-01-05 17:03:48', '', '2022-02-22 05:08:21', '0', 1);
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, '普通角色', 'common', 2, 2, '', 0, 1, '普通角色', 'admin', '2021-01-05 17:03:48', '', '2022-02-22 05:08:20', '0', 1);
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3, 'CRM 管理员', 'crm_admin', 2, 1, '', 0, 1, 'CRM 专属角色', '1', '2024-02-24 10:51:13', '1', '2024-02-24 02:51:32', '0', 1);
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (101, '测试账号', 'test', 0, 1, '[]', 0, 2, '123', '', '2021-01-06 13:49:35', '1', '2025-04-30 17:38:28', '0', 1);
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (109, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', '0', 121);
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (111, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2022-03-07 21:37:58', '1', '2022-03-07 21:37:58', '0', 122);
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (155, '测试数据权限', 'test-dp', 3, 2, '[100,102,103,104,105,108]', 0, 2, '', '1', '2025-03-31 14:58:06', '1', '2025-04-17 23:07:44', '0', 1);
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (158, '2', '3', 4, 1, '', 0, 2, NULL, '1', '2025-04-17 20:08:08', '1', '2025-04-17 23:05:31', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_role_seq;
CREATE SEQUENCE system_role_seq
    START 159;



-- ----------------------------
-- Table structure for system_user_post
-- ----------------------------
DROP TABLE IF EXISTS system_user_post;
CREATE TABLE system_user_post
(
    id          int8        NOT NULL,
    user_id     int8        NOT NULL DEFAULT 0,
    post_id     int8        NOT NULL DEFAULT 0,
    creator     varchar(64) NULL     DEFAULT '',
    create_time timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64) NULL     DEFAULT '',
    update_time timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted     int2        NOT NULL DEFAULT 0,
    tenant_id   int8        NOT NULL DEFAULT 0
);

ALTER TABLE system_user_post
    ADD CONSTRAINT pk_system_user_post PRIMARY KEY (id);

COMMENT ON COLUMN system_user_post.id IS 'id';
COMMENT ON COLUMN system_user_post.user_id IS '用户ID';
COMMENT ON COLUMN system_user_post.post_id IS '岗位ID';
COMMENT ON COLUMN system_user_post.creator IS '创建者';
COMMENT ON COLUMN system_user_post.create_time IS '创建时间';
COMMENT ON COLUMN system_user_post.updater IS '更新者';
COMMENT ON COLUMN system_user_post.update_time IS '更新时间';
COMMENT ON COLUMN system_user_post.deleted IS '是否删除';
COMMENT ON COLUMN system_user_post.tenant_id IS '租户编号';
COMMENT ON TABLE system_user_post IS '用户岗位表';

-- ----------------------------
-- Records of system_user_post
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (112, 1, 1, 'admin', '2022-05-02 07:25:24', 'admin', '2022-05-02 07:25:24', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (113, 100, 1, 'admin', '2022-05-02 07:25:24', 'admin', '2022-05-02 07:25:24', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (115, 104, 1, '1', '2022-05-16 19:36:28', '1', '2022-05-16 19:36:28', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (116, 117, 2, '1', '2022-07-09 17:40:26', '1', '2022-07-09 17:40:26', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (117, 118, 1, '1', '2022-07-09 17:44:44', '1', '2022-07-09 17:44:44', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (119, 114, 5, '1', '2024-03-24 20:45:51', '1', '2024-03-24 20:45:51', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (123, 115, 1, '1', '2024-04-04 09:37:14', '1', '2024-04-04 09:37:14', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (124, 115, 2, '1', '2024-04-04 09:37:14', '1', '2024-04-04 09:37:14', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (125, 1, 2, '1', '2024-07-13 22:31:39', '1', '2024-07-13 22:31:39', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_user_post_seq;
CREATE SEQUENCE system_user_post_seq
    START 126;

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS system_user_role;
CREATE TABLE system_user_role
(
    id          int8        NOT NULL,
    user_id     int8        NOT NULL,
    role_id     int8        NOT NULL,
    creator     varchar(64) NULL     DEFAULT '',
    create_time timestamp   NULL     DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64) NULL     DEFAULT '',
    update_time timestamp   NULL     DEFAULT CURRENT_TIMESTAMP,
    deleted     int2        NOT NULL DEFAULT 0,
    tenant_id   int8        NOT NULL DEFAULT 0
);

ALTER TABLE system_user_role
    ADD CONSTRAINT pk_system_user_role PRIMARY KEY (id);

COMMENT ON COLUMN system_user_role.id IS '自增编号';
COMMENT ON COLUMN system_user_role.user_id IS '用户ID';
COMMENT ON COLUMN system_user_role.role_id IS '角色ID';
COMMENT ON COLUMN system_user_role.creator IS '创建者';
COMMENT ON COLUMN system_user_role.create_time IS '创建时间';
COMMENT ON COLUMN system_user_role.updater IS '更新者';
COMMENT ON COLUMN system_user_role.update_time IS '更新时间';
COMMENT ON COLUMN system_user_role.deleted IS '是否删除';
COMMENT ON COLUMN system_user_role.tenant_id IS '租户编号';
COMMENT ON TABLE system_user_role IS '用户和角色关联表';

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, 1, 1, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:17', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, 2, 2, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:13', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4, 100, 101, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:13', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, 100, 1, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:12', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (6, 100, 2, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:11', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (10, 103, 1, '1', '2022-01-11 13:19:45', '1', '2022-01-11 13:19:45', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (14, 110, 109, '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', '0', 121);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (15, 111, 110, '110', '2022-02-23 13:14:38', '110', '2022-02-23 13:14:38', '0', 121);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (16, 113, 111, '1', '2022-03-07 21:37:58', '1', '2022-03-07 21:37:58', '0', 122);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (18, 1, 2, '1', '2022-05-12 20:39:29', '1', '2022-05-12 20:39:29', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (22, 115, 2, '1', '2022-07-21 22:08:30', '1', '2022-07-21 22:08:30', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (35, 112, 1, '1', '2024-03-15 20:00:24', '1', '2024-03-15 20:00:24', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (36, 118, 1, '1', '2024-03-17 09:12:08', '1', '2024-03-17 09:12:08', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (38, 114, 101, '1', '2024-03-24 22:23:03', '1', '2024-03-24 22:23:03', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (46, 117, 1, '1', '2024-10-02 10:16:11', '1', '2024-10-02 10:16:11', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (47, 104, 2, '1', '2025-01-04 10:40:33', '1', '2025-01-04 10:40:33', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (48, 100, 155, '1', '2025-04-04 10:41:14', '1', '2025-04-04 10:41:14', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_user_role_seq;
CREATE SEQUENCE system_user_role_seq
    START 49;


-- ----------------------------
-- Table structure for system_login_log
-- ----------------------------
DROP TABLE IF EXISTS system_login_log;
CREATE TABLE system_login_log
(
    id          int8         NOT NULL,
    log_type    int8         NOT NULL,
    trace_id    varchar(64)  NOT NULL DEFAULT '',
    user_id     int8         NOT NULL DEFAULT 0,
    user_type   int2         NOT NULL DEFAULT 0,
    username    varchar(50)  NOT NULL DEFAULT '',
    result      int2         NOT NULL,
    user_ip     varchar(50)  NOT NULL,
    user_agent  varchar(512) NOT NULL,
    creator     varchar(64)  NULL     DEFAULT '',
    create_time timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64)  NULL     DEFAULT '',
    update_time timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted     int2         NOT NULL DEFAULT 0,
    tenant_id   int8         NOT NULL DEFAULT 0
);

ALTER TABLE system_login_log
    ADD CONSTRAINT pk_system_login_log PRIMARY KEY (id);

COMMENT ON COLUMN system_login_log.id IS '访问ID';
COMMENT ON COLUMN system_login_log.log_type IS '日志类型';
COMMENT ON COLUMN system_login_log.trace_id IS '链路追踪编号';
COMMENT ON COLUMN system_login_log.user_id IS '用户编号';
COMMENT ON COLUMN system_login_log.user_type IS '用户类型';
COMMENT ON COLUMN system_login_log.username IS '用户账号';
COMMENT ON COLUMN system_login_log.result IS '登陆结果';
COMMENT ON COLUMN system_login_log.user_ip IS '用户 IP';
COMMENT ON COLUMN system_login_log.user_agent IS '浏览器 UA';
COMMENT ON COLUMN system_login_log.creator IS '创建者';
COMMENT ON COLUMN system_login_log.create_time IS '创建时间';
COMMENT ON COLUMN system_login_log.updater IS '更新者';
COMMENT ON COLUMN system_login_log.update_time IS '更新时间';
COMMENT ON COLUMN system_login_log.deleted IS '是否删除';
COMMENT ON COLUMN system_login_log.tenant_id IS '租户编号';
COMMENT ON TABLE system_login_log IS '系统访问记录';

DROP SEQUENCE IF EXISTS system_login_log_seq;
CREATE SEQUENCE system_login_log_seq
    START 1;

