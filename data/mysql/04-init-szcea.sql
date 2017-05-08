﻿INSERT INTO CM_ROLE (ID, NAME, CREATED_AT, CREATED_BY) VALUES (1, '超级用户', NOW(), 1);
INSERT INTO CM_ROLE (ID, NAME, CREATED_AT, CREATED_BY) VALUES (2, '主管', NOW(), 1);
INSERT INTO CM_ROLE (ID, NAME, CREATED_AT, CREATED_BY) VALUES (3, '办事员', NOW(), 1);

INSERT INTO CM_GROUP (ID, NAME, DESCRIPTION, STATUS, CREATED_AT, CREATED_BY) VALUES (1, '超级用户', '超级用户', 'A', NOW(), 1);
INSERT INTO CM_GROUP (ID, NAME, DESCRIPTION, STATUS, CREATED_AT, CREATED_BY) VALUES (2, '主管', '主管', 'A', NOW(), 1);
INSERT INTO CM_GROUP (ID, NAME, DESCRIPTION, STATUS, CREATED_AT, CREATED_BY) VALUES (3, '办事员', '办事员', 'A', NOW(), 1);
INSERT INTO CM_GROUP (ID, NAME, DESCRIPTION, STATUS, CREATED_AT, CREATED_BY) VALUES (103, '会员', '会员', 'A', NOW(), 1);

INSERT INTO CM_USER (ID, USERNAME, PASSWORD, STATUS, CREATED_AT, CREATED_BY) VALUES (1, 'admin', '$2a$10$pqRCym5FQB4nneciWwUMc.gEDRfRKiOopfNH7cBgrBgLdXncNppCq', 'A', NOW(), 1);
INSERT INTO CM_USER (ID, USERNAME, PASSWORD, STATUS, CREATED_AT, CREATED_BY) VALUES (2, 'supervisor', '$2a$10$KfiLtu4KY8VihGPpJNbofezzaymTdtcKS4.9Si2h9clPC17CPZYoi', 'A', NOW(), 1);
INSERT INTO CM_USER (ID, USERNAME, PASSWORD, STATUS, CREATED_AT, CREATED_BY) VALUES (3, 'szcea', '$2a$10$7wZkNXX/Ij1QpfInxzfrQuvTrYaHBjLgj7HJ72QDjMc8lXvXXNXOu', 'A', NOW(), 1);

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
INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.name', '苏州市会展行业协会', NOW(), 1);
INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.englishName', 'SuZhou Convention and Exhibition Association', NOW(), 1);
INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.address', '苏州市西环路1638号国际经贸大厦28楼2801室', NOW(), 1);
INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.englishAddress', '', NOW(), 1);
INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.telephone', '+86-512-68700757', NOW(), 1);
INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.fax', '+86-512-68700757', NOW(), 1);

INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.postcode', '215004', NOW(), 1);
INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.url', 'www.ceasz.com', NOW(), 1);
INSERT INTO CM_CONFIG (QKEY, QVALUE, CREATED_AT, CREATED_BY) VALUES('website.icp', '苏ICP备16042859号', NOW(), 1);

INSERT INTO CT_CATALOG (ID, NAME, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (1, '展会动态', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (2, '协会动态', 'Event', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (3, '会展专题', 'Project', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (4, '精彩瞬间', 'Videos', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (5, '会展预告', 'Trailer', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (6, '首页广告', 'Banner', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (7, '会展服务', 'Service', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (8, '场馆介绍', 'Venue', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (9, '会展机构', 'Institution', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (10, '政策研究', 'Policy', 0, NOW(), 1);

-- 顶部菜单
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (1, '平台首页', 'TOP, HOME', 'Home', '/', 1, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (2, '苏州概况', 'TOP, SUZHOU', 'Suzhou', '/szcea/suzhou.jsp', 2, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (3, '市会展办', 'TOP, SHIHUI', 'Expo', '/szcea/shihui.jsp', 3, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (4, '协会概况', 'TOP, GAIKUANG', 'SZCEA', '/szcea/gaikuang.jsp', 4, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (5, '展会动态', 'TOP, DONGTAI', 'Information', '/szcea/dongtai', 5, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (6, '会展机构', 'TOP, JIGOU', 'Institution', '/szcea/org/9', 6, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (7, '会展场馆', 'TOP, CHANGGUAN', 'Convention', '/szcea/convention', 7, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (8, '网上申报', 'TOP, SHENBAO', 'Application', '/admin', 8, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, TITLE, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (9, '政策研究', 'TOP, ZHENGCE', 'Research', '/szcea/policy', 9, NOW(), 1);

-- 友情链接
INSERT INTO CT_LINK (ID, NAME, TAG, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (101, '苏州国际博览中心', 'FOOTER, FRIEND', 'http://www.suzhouexpo.com', 1, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (102, '苏州金鸡湖国际会议中心', 'FOOTER, FRIEND', 'http://www.szjicc.com', 2, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (103, '苏州雅式国际展览', 'FOOTER, FRIEND', 'http://www.yashichina.com', 3, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (104, '苏州节庆会展策划', 'FOOTER, FRIEND', 'http://www.xycmgf.com/JQCMDefault.aspx', 4, NOW(), 1);
INSERT INTO CT_LINK (ID, NAME, TAG, URL, SORT_ORDER, CREATED_AT, CREATED_BY) VALUES (105, '苏州广电国际会展中心', 'FOOTER, FRIEND', 'http://www.sbsecc.com', 5, NOW(), 1);

INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('politic.PASSES', NULL, '群众', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('politic.MEMBER', NULL, '共青团员', 2, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('politic.PARTY', NULL, '中国党员', 3, 'Y', NOW(), 1);

-- 会议类别
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('conference.type.G', NULL, '政府类', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('conference.type.O', NULL, '社团类', 2, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('conference.type.B', NULL, '企业类', 3, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('conference.type.Z', NULL, '其他类', 4, 'Y', NOW(), 1);

INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('customer.org.type.1', NULL, '机关', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('customer.org.type.3', NULL, '事业单位', 2, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('customer.org.type.5', NULL, '企业', 3, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('customer.org.type.7', NULL, '社会团体', 4, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('customer.org.type.9', NULL, '其他组织机构', 5, 'Y', NOW(), 1);

INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('customer.status.P', NULL, '待审核', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('customer.status.R', NULL, '未通过审核', 2, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('customer.status.A', NULL, '正常', 3, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('customer.status.D', NULL, '停用', 4, 'Y', NOW(), 1);

INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('conference.level.I', NULL, '国际性', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('conference.level.N', NULL, '全国性', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('conference.level.P', NULL, '省市性', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('exhibition.level.N', NULL, '国家级', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('exhibition.level.P', NULL, '省级', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('exhibition.level.C', NULL, '地级', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('activity.N', NULL, '否', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('activity.status.A', NULL, '正常', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('activity.status.P', NULL, '待审核', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('activity.status.R', NULL, '拒绝', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('activity.type.C', NULL, '会议项目', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('activity.type.E', NULL, '展览项目', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('activity.Y', NULL, '是', 1, 'Y', NOW(), 1);

INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('news.status.A', NULL, '已审', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('news.status.I', NULL, '停用', 1, 'Y', NOW(), 1);
INSERT INTO CM_MASTER_CODE (CODE, PARENT, LABEL, DISPLAY_ORDER, CACHED, CREATED_AT, CREATED_BY) VALUES ('news.status.P', NULL, '待审', 1, 'Y', NOW(), 1);

INSERT INTO CM_SEQUENCE_NUM (NAME, CURR_VALUE, FULL_FORMAT, NUMBER_FORMAT, DATE_FORMAT, RESET_POINT, UPDATED_AT) VALUES ('conference', 1, '<date>H<num>', '00', 'yyyy', 'Y', NOW());
INSERT INTO CM_SEQUENCE_NUM (NAME, CURR_VALUE, FULL_FORMAT, NUMBER_FORMAT, DATE_FORMAT, RESET_POINT, UPDATED_AT) VALUES ('exhibition', 1, '<date>Z<num>', '00', 'yyyy', 'Y', NOW());

