
-- 会展协会这个目录没有用，因此目前它的二级目录直接弄成一级的
-- INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (20, '会展协会', 'HZXH', 0, NOW(), 1);
UPDATE CT_CATALOG SET NAME='章程' WHERE ID=13;
-- 原协会动态update协会活动
UPDATE CT_CATALOG SET NAME='协会活动' WHERE ID=2;
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (20, '专业委员会', 'ZYWYH', 0, NOW(), 1);

INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (21, '主办单位', 'ZBDW', 0, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (22, '承办单位', 'CBWD', 0, NOW(), 1);

UPDATE CT_CATALOG SET NAME='会展研究' WHERE ID=10;
UPDATE CT_CATALOG SET NAME='大咖发声' WHERE ID=12;
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (23, '专题研究', 'ZTYJ', 10, NOW(), 1);
INSERT INTO CT_CATALOG (ID, NAME, TITLE, PARENT_ID, CREATED_AT, CREATED_BY) VALUES (24, '业内动态', 'YNDT', 10, NOW(), 1);