﻿INSERT INTO CM_ROLE (ID, NAME, CREATED_AT, CREATED_BY) VALUES (1, '超级用户', NOW(), 1);
INSERT INTO CM_ROLE (ID, NAME, CREATED_AT, CREATED_BY) VALUES (2, '主管', NOW(), 1);
INSERT INTO CM_ROLE (ID, NAME, CREATED_AT, CREATED_BY) VALUES (3, '办事员', NOW(), 1);

INSERT INTO CM_GROUP (ID, NAME, DESCRIPTION, STATUS, CREATED_AT, CREATED_BY) VALUES (1, '超级用户', '超级用户', 'A', NOW(), 1);
INSERT INTO CM_GROUP (ID, NAME, DESCRIPTION, STATUS, CREATED_AT, CREATED_BY) VALUES (2, '主管', '主管', 'A', NOW(), 1);
INSERT INTO CM_GROUP (ID, NAME, DESCRIPTION, STATUS, CREATED_AT, CREATED_BY) VALUES (3, '办事员', '办事员', 'A', NOW(), 1);
INSERT INTO CM_GROUP (ID, NAME, DESCRIPTION, STATUS, CREATED_AT, CREATED_BY) VALUES (103, '会员', '会员', 'A', NOW(), 1);

INSERT INTO CM_USER (ID, USERNAME, PASSWORD, STATUS, CREATED_AT, CREATED_BY) VALUES (1, 'admin', '$2a$10$pqRCym5FQB4nneciWwUMc.gEDRfRKiOopfNH7cBgrBgLdXncNppCq', 'A', NOW(), 1);
INSERT INTO CM_USER (ID, USERNAME, PASSWORD, STATUS, CREATED_AT, CREATED_BY) VALUES (2, 'supervisor', '$2a$10$KfiLtu4KY8VihGPpJNbofezzaymTdtcKS4.9Si2h9clPC17CPZYoi', 'A', NOW(), 1);
INSERT INTO CM_USER (ID, USERNAME, PASSWORD, STATUS, CREATED_AT, CREATED_BY) VALUES (3, 'sfjs', '$2a$10$7wZkNXX/Ij1QpfInxzfrQuvTrYaHBjLgj7HJ72QDjMc8lXvXXNXOu', 'A', NOW(), 1);

INSERT INTO CM_ROLE_USER (ROLE_ID, USER_ID) VALUES (1, 1);
INSERT INTO CM_ROLE_USER (ROLE_ID, USER_ID) VALUES (2, 2);
INSERT INTO CM_ROLE_USER (ROLE_ID, USER_ID) VALUES (3, 3);
INSERT INTO CM_GROUP_USER (GROUP_ID, USER_ID) VALUES (1, 1);
INSERT INTO CM_GROUP_USER (GROUP_ID, USER_ID) VALUES (2, 2);
INSERT INTO CM_GROUP_USER (GROUP_ID, USER_ID) VALUES (3, 3);

INSERT INTO CM_PERMISSION (ROLE_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (1, 1001, NOW(), 1);
INSERT INTO CM_PERMISSION (ROLE_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (1, 1002, NOW(), 1);
INSERT INTO CM_PERMISSION (ROLE_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (1, 1003, NOW(), 1);
INSERT INTO CM_PERMISSION (ROLE_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (1, 1004, NOW(), 1);
INSERT INTO CM_PERMISSION (ROLE_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (1, 10, NOW(), 1);
INSERT INTO CM_PERMISSION (ROLE_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (1, 20, NOW(), 1);
INSERT INTO CM_PERMISSION (ROLE_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (1, 30, NOW(), 1);
INSERT INTO CM_PERMISSION (ROLE_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (1, 40, NOW(), 1);
INSERT INTO CM_PERMISSION (ROLE_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (1, 50, NOW(), 1);
INSERT INTO CM_PERMISSION (ROLE_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (1, 60, NOW(), 1);
INSERT INTO CM_PERMISSION (ROLE_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (1, 70, NOW(), 1);
INSERT INTO CM_PERMISSION (ROLE_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (1, 80, NOW(), 1);
INSERT INTO CM_PERMISSION (ROLE_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (1, 90, NOW(), 1);

INSERT INTO CM_PERMISSION (ROLE_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (3, 10, NOW(), 1);
INSERT INTO CM_PERMISSION (ROLE_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (3, 30, NOW(), 1);

INSERT INTO CM_PERMISSION (GROUP_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (103, 1101, NOW(), 1);
INSERT INTO CM_PERMISSION (GROUP_ID, PRIVILEGE, CREATED_AT, CREATED_BY) VALUES (103, 1102, NOW(), 1);

-- 网站配置
INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.name', '苏州工业园区服务外包职业学院', NOW(), 1);
INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.englishName', '苏州工业园区服务外包职业学院', NOW(), 1);
INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.address', '苏州市工业园区科教创新区若水路99号', NOW(), 1);
INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.englishAddress', '', NOW(), 1);
INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.telephone', '+86-512-62933000', NOW(), 1);
INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.fax', '+86-512-62932151', NOW(), 1);

INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.postcode', '215004', NOW(), 1);
INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.url', 'www.siso.edu.cn', NOW(), 1);
INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.icp', '苏ICP备10020871号', NOW(), 1);


INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (2, '建设动态', 'JSDT', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (3, '项目建设', 'XMJS', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (4, '师资队伍', 'SZDW', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (5, '制度建设', 'ZDJS', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (6, '督导通报', 'DDTB', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (7, '校企合作', 'XQHZ', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (8, '政策法规', 'ZCFG', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (9, '资料下载', 'ZLXZ', 0, NOW(), 1);

-- 顶部菜单
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (1, '首页', 'TOP, HOME', 'Home', '/', 1, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (2, '建设动态', 'TOP, JSDT', 'JSDT', '/szcea/jsdt.jsp', 2, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (3, '项目建设', 'TOP, XMJS', 'XMJS', '/szcea/xmjs.jsp', 3, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (4, '师资队伍', 'TOP, SZDW', 'SZDW', '/szcea/szdw.jsp', 4, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (5, '制度建设', 'TOP, ZDJS', 'ZDJS', '/szcea/zdjs.jsp', 5, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (6, '督导通报', 'TOP, DDTB', 'DDTB', '/szcea/ddtb.jsp', 6, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (7, '校企合作', 'TOP, XQHZ', 'XQHZ', '/szcea/xqhz.jsp', 7, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (8, '政策法规', 'TOP, ZCFG', 'ZCFG', '/szcea/zcfg.jsp', 8, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (9, '资料下载', 'TOP, ZLXZ', 'ZLXZ', '/szcea/zlxz.jsp', 9, NOW(), 1);

-- 友情链接
INSERT INTO CT_LINK (ID, NAME, TAG, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (101, '苏州工业园区服务外包有限公司', 'FOOTER, FRIEND', 'http://www.sipso.com.cn', 1, NOW(), 1);

