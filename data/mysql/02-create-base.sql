DROP TABLE IF EXISTS CM_GROUP;
CREATE TABLE CM_GROUP (
  ID                SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NAME              VARCHAR(50) NOT NULL,
  PARENT_ID         SMALLINT UNSIGNED,
  DESCRIPTION       VARCHAR(255),
  STATUS            CHAR(1) DEFAULT 'A',
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_ROLE;
CREATE TABLE CM_ROLE (
  ID                SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NAME              VARCHAR(50) NOT NULL,
  PARENT_ID         SMALLINT UNSIGNED,
  DESCRIPTION       VARCHAR(255),
  STATUS            CHAR(1) DEFAULT 'A',
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_USER;
CREATE TABLE CM_USER (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  USERNAME          VARCHAR(50) NOT NULL,
  PASSWORD          VARCHAR(60) NOT NULL,
  PROFILE_ID        INT UNSIGNED DEFAULT 0,
  STATUS            CHAR(1),
  CURR_LOGIN_AT     DATETIME,
  CURR_LOGIN_FROM   VARCHAR(15),
  LAST_LOGIN_AT     DATETIME,
  LAST_LOGIN_FROM   VARCHAR(15),
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_GROUP_USER;
CREATE TABLE CM_GROUP_USER (
  GROUP_ID          SMALLINT UNSIGNED NOT NULL,
  USER_ID           INT UNSIGNED NOT NULL
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_ROLE_USER;
CREATE TABLE CM_ROLE_USER (
  ROLE_ID           SMALLINT UNSIGNED NOT NULL,
  USER_ID           INT UNSIGNED NOT NULL
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_PERMISSION;
CREATE TABLE CM_PERMISSION (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  REF_ID            INT UNSIGNED            COMMENT '资源ID',
  REF_TYPE          VARCHAR(30)             COMMENT '资源类型',
  ROLE_ID           SMALLINT UNSIGNED       COMMENT '角色ID',
  GROUP_ID          SMALLINT UNSIGNED       COMMENT '分组ID',
  USER_ID           INT UNSIGNED            COMMENT '用户ID',
  PRIVILEGE         SMALLINT UNSIGNED       COMMENT '权限',
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_PROFILE;
CREATE TABLE CM_PROFILE (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FULLNAME          VARCHAR(50)               COMMENT '姓名',
  AVATAR_PATH       VARCHAR(100)              COMMENT '头像',
  NATIONALITY       VARCHAR(20)               COMMENT '民族',
  POLITICAL_STATUS  VARCHAR(20)               COMMENT '政治面貌',
  GENDER            CHAR(1)                   COMMENT '性别',
  BIRTHDAY          DATE                      COMMENT '出生日期',
  ID_NO             VARCHAR(20)               COMMENT '身份证号',
  UNIVERSITY        VARCHAR(100)              COMMENT '毕业院校',
  COLLEGE           VARCHAR(50)               COMMENT '所在学院',
  MAJOR             VARCHAR(50)               COMMENT '所学专业',
  CLASS             VARCHAR(50)               COMMENT '所在班级',
  TITLE             VARCHAR(100)              COMMENT '职位',
  COMPANY           VARCHAR(100)              COMMENT '工作单位',
  PHONE             VARCHAR(20)               COMMENT '固定电话',
  MOBILE            VARCHAR(20)               COMMENT '手机号',
  EMAIL             VARCHAR(50)               COMMENT '电子邮件',
  WEIBO             VARCHAR(100)              COMMENT '微博',
  QQ                VARCHAR(20)               COMMENT 'QQ',
  QQ_QR_CODE        VARCHAR(100)              COMMENT 'QQ二维码',
  WEIXIN            VARCHAR(50)               COMMENT '微信',
  WEIXIN_QR_CODE    VARCHAR(100)              COMMENT '微信二维码',
  WEBSITE           VARCHAR(100)              COMMENT '主页地址',
  PROVINCE          VARCHAR(50),
  CITY              VARCHAR(50),
  POSTCODE          VARCHAR(10),
  FAX               VARCHAR(20),
  ADDRESS_DESC      VARCHAR(100)              COMMENT '地址',
  ADDRESS_ID        INT UNSIGNED,
  REMARKS           VARCHAR(255),
  PASSWORD          VARCHAR(60)               COMMENT '资料修改密码',
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_ADDRESS;
CREATE TABLE CM_ADDRESS (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  PROVINCE          VARCHAR(50),
  CITY              VARCHAR(50),
  ADDRESS           VARCHAR(100),
  POSTCODE          VARCHAR(10),
  PHONE             VARCHAR(20),
  MOBILE            VARCHAR(20),
  FAX               VARCHAR(20),
  EMAIL             VARCHAR(50),
  LATITUDE          NUMERIC(9, 6)              COMMENT '纬度',
  LONGITUDE         NUMERIC(9, 6)              COMMENT '经度',
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_AUDIT_LOG;
CREATE TABLE CM_AUDIT_LOG (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  USER_ID           INT UNSIGNED NOT NULL,
  IP                VARCHAR(15),
  ACTION            CHAR(1),  -- 'A': ACCESS, 'L': LOGIN, 'C': CREATE, 'U': UPDATE, 'D': DELETE, 'V': VIEW
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_BLACKLIST;
CREATE TABLE CM_BLACKLIST (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  USER_ID           INT UNSIGNED NOT NULL,
  TYPE              CHAR(1),  -- 'I': INFORM
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_AUTO_LOGIN;
CREATE TABLE CM_AUTO_LOGIN (
  USERNAME          VARCHAR(50) NOT NULL,
  SERIES            VARCHAR(64) NOT NULL PRIMARY KEY,
  TOKEN             VARCHAR(64),
  LAST_USED         DATETIME NOT NULL
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_MASTER_CODE;
CREATE TABLE CM_MASTER_CODE (
  CODE              VARCHAR(50) NOT NULL PRIMARY KEY,
  PARENT            VARCHAR(50),
  LABEL             VARCHAR(100) NOT NULL,
  DESCRIPTION       VARCHAR(255),
  DISPLAY_ORDER     TINYINT,
  TYPE              CHAR(1) DEFAULT 'U',    -- 'U': User, 'S': System
  CACHED            CHAR(1) DEFAULT 'Y',    -- 'Y': Yes, 'N': No
  STATUS            CHAR(1) DEFAULT 'A',    -- 'A': Active, 'I': Inactive
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_TASK_DEF;
CREATE TABLE CM_TASK_DEF (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  TASK_DEF_CD       VARCHAR(30) NOT NULL,
  TASK_DEF_NAME     VARCHAR(100) NOT NULL,
  STAGE_NO          VARCHAR(30) NOT NULL,
  STAGE_DESC        VARCHAR(255),
  ACTOR_ROLE_CD     VARCHAR(30),
  ACTOR_USER_ID     INT UNSIGNED,
  PROCESS_PAGE      VARCHAR(255),
  PROCESS_CLASS     VARCHAR(255),
  APPROVED_STAGE    VARCHAR(30),
  REJECTED_STAGE    VARCHAR(30),
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_TASK;
CREATE TABLE CM_TASK (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  TASK_DEF_CD       VARCHAR(30) NOT NULL,
  REF_ID            INT UNSIGNED NOT NULL,
  REF_TYPE          VARCHAR(30) NOT NULL,
  NAME              VARCHAR(100),
  CURRENT_STAGE     VARCHAR(10),
  REMARKS           VARCHAR(255),
  STATUS            CHAR(1) DEFAULT 'O',    -- 'O': Open, 'C': Closed
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_TASK_ACTOR;
CREATE TABLE CM_TASK_ACTOR (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  TASK_ID           INT UNSIGNED NOT NULL,
  STAGE_NO          VARCHAR(10) NOT NULL,
  ACTOR_ID          INT UNSIGNED,
  DECISION          CHAR(1),                -- 'A': Approved, 'R': Rejected
  REMARKS           VARCHAR(255),
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_EXTRA_ATTR;
CREATE TABLE CM_EXTRA_ATTR (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  REF_ID            INT UNSIGNED NOT NULL,
  REF_TYPE          VARCHAR(30) NOT NULL,
  NAME              VARCHAR(100),
  VALUE             VARCHAR(255),
  TAG               VARCHAR(255),
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_COMMENT;
CREATE TABLE CM_COMMENT (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  AUTHOR_ID         INT UNSIGNED,
  AUTHOR_NAME       VARCHAR(50),
  REF_ID            INT UNSIGNED NOT NULL,
  REF_TYPE          VARCHAR(30) NOT NULL,
  QUOTE_ID          INT UNSIGNED,
  CONTENT           TEXT,
  STATUS            CHAR(1) DEFAULT 'P',    -- 'A': Approved, 'R': Rejected, 'P': Pending
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_RATING;
CREATE TABLE CM_RATING (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  REF_ID            INT UNSIGNED NOT NULL,
  REF_TYPE          VARCHAR(30) NOT NULL,
  SCORE             TINYINT UNSIGNED NOT NULL,   -- 0, 1, 2, 3, 4, 5
  MARKED_AT         DATETIME NOT NULL,
  MARKED_BY         INT UNSIGNED NOT NULL
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_WEIXIN_USER;
CREATE TABLE CM_WEIXIN_USER (
  APP_ID            VARCHAR(30) NOT NULL,   -- AppID
  OPEN_ID           VARCHAR(50) NOT NULL,   -- OpenID
  USER_ID           INT UNSIGNED NOT NULL
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_VEHICLE;
CREATE TABLE CM_VEHICLE (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  USER_ID           INT UNSIGNED,
  NO                VARCHAR(10) NOT NULL,
  BRAND             VARCHAR(20),
  MODEL             VARCHAR(50),
  COLOR             CHAR(1),
  REMARKS           VARCHAR(255),
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_CONFIG;
CREATE TABLE CM_CONFIG (
  QKEY              VARCHAR(50) NOT NULL PRIMARY KEY,
  QVALUE            VARCHAR(255),
  REMARKS           VARCHAR(255),
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_ATTACHMENT;
CREATE TABLE CM_ATTACHMENT (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  REF_ID            INT UNSIGNED NOT NULL,
  REF_TYPE          VARCHAR(30) NOT NULL,
  NAME              VARCHAR(100) NOT NULL,
  MIME_TYPE         VARCHAR(100) NOT NULL,
  FILE_SIZE         DECIMAL(8, 2),
  FILE_PATH         VARCHAR(255) NOT NULL,
  DESCRIPTION       VARCHAR(255),
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_MESSAGE;
CREATE TABLE CM_MESSAGE (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  TO_USER_ID        INT UNSIGNED NOT NULL   COMMENT '收件人',
  FROM_USER_ID      INT UNSIGNED NOT NULL   COMMENT '发件人',
  SUBJECT           VARCHAR(100)            COMMENT '标题',
  BODY              TEXT                    COMMENT '正文',
  STATUS            CHAR(1) NOT NULL        COMMENT '状态 S: 发送成功; F: 发送失败; T: 草稿;',
  IS_READ           CHAR(1) NOT NULL        COMMENT '已读',
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_SEQUENCE_NUM;
CREATE TABLE CM_SEQUENCE_NUM (
  NAME              VARCHAR(50) NOT NULL PRIMARY KEY  COMMENT '编号名称',
  CURR_VALUE        INT NOT NULL                      COMMENT '当前值',
  FULL_FORMAT       VARCHAR(50) NOT NULL              COMMENT '完整格式',
  NUMBER_FORMAT     VARCHAR(10)                       COMMENT '数字格式',
  DATE_FORMAT       VARCHAR(20)                       COMMENT '日期格式',
  RESET_POINT       CHAR(1)                           COMMENT '重置点',
  UPDATED_AT        DATETIME                          COMMENT '更新时间'
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_PAYMENT_TXN;
CREATE TABLE CM_PAYMENT_TXN (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FEE_TYPE          CHAR(1)                 COMMENT '费用类型',
  REF_ID            INT UNSIGNED NOT NULL,
  REF_TYPE          VARCHAR(30) NOT NULL,
  PAYMENT_METHOD    CHAR(1)                 COMMENT '付款方式',
  TXN_NO            VARCHAR(30)             COMMENT '交易号',
  AMOUNT            DECIMAL(8, 2)           COMMENT '费用总计',
  RECEIPT_NO        VARCHAR(30)             COMMENT '发票号',
  STATUS            CHAR(1)                 COMMENT '支付状态',
  PAID_BY           INT UNSIGNED            COMMENT '付款人',
  PAID_AT           DATETIME                COMMENT '付款时间',
  REMARKS           VARCHAR(255)            COMMENT '备注',
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CM_PUBLIC_HOLIDAY;
CREATE TABLE CM_PUBLIC_HOLIDAY (
  NAME              VARCHAR(50) NOT NULL          COMMENT '假期名称',
  TARGET_DATE       DATE NOT NULL                 COMMENT '日期',
  TYPE              CHAR(1) NOT NULL DEFAULT 'H'  COMMENT '类型(W: 工作日, P: 休息日)',
  REMARKS           VARCHAR(255)                  COMMENT '备注',
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CT_CATALOG;
CREATE TABLE CT_CATALOG (
  ID                SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NAME              VARCHAR(100),
  PARENT_ID         SMALLINT UNSIGNED,
  TITLE             VARCHAR(100),
  SHOW_TITLE        CHAR(1) DEFAULT 'Y',
  TAG               VARCHAR(255),
  DESCRIPTION       VARCHAR(255),
  STATUS            CHAR(1) DEFAULT 'A',
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CT_CONTENT;
CREATE TABLE CT_CONTENT (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NAME              VARCHAR(100)                COMMENT '名称',
  CATALOG_ID        SMALLINT UNSIGNED NOT NULL,
  TITLE             VARCHAR(100)                COMMENT '标题',
  SHOW_TITLE        CHAR(1) DEFAULT 'Y',
  TAG               VARCHAR(255)                COMMENT '标签',
  SUMMARY           TEXT                        COMMENT '摘要',
  CONTENT           TEXT                        COMMENT '正文',
  IMAGE_PATH        TEXT,
  SOURCE            VARCHAR(100)                COMMENT '来源',
  AUTHOR            VARCHAR(50)                 COMMENT '作者',
  PUBLISH_DATE      DATE                        COMMENT '发布日期',
  HITS              INT UNSIGNED DEFAULT 0      COMMENT '点击数',
  LIKES             INT UNSIGNED DEFAULT 0      COMMENT '点赞数',
  META_KEYWORDS     VARCHAR(255)                COMMENT 'SEO关键字',
  META_DESCRIPTION  VARCHAR(255)                COMMENT 'SEO描述',
  CAN_COMMENT       CHAR(1) DEFAULT 'N'         COMMENT '可否评论',
  STICK_TOP         CHAR(1) DEFAULT 'N'         COMMENT '置顶',
  STATUS            CHAR(1) DEFAULT 'P'         COMMENT '状态 P待审批 A已审批 I停用',
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CT_SURVEY;
CREATE TABLE CT_SURVEY (
  ID                SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  SUBJECT           VARCHAR(200),
  VOTE_MODE         CHAR(1) DEFAULT 'S',
  SORT_ORDER        TINYINT UNSIGNED DEFAULT 0,
  STATUS            CHAR(1) DEFAULT 'A',
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CT_SURVEY_OPTION;
CREATE TABLE CT_SURVEY_OPTION (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  SURVEY_ID         SMALLINT UNSIGNED NOT NULL,
  TEXT              VARCHAR(200),
  SORT_ORDER        TINYINT UNSIGNED DEFAULT 0,
  VOTES             INT UNSIGNED DEFAULT 0
) ENGINE = INNODB;

DROP TABLE IF EXISTS CT_SURVEY_VOTER;
CREATE TABLE CT_SURVEY_VOTER (
  SURVEY_OPTION_ID  INT UNSIGNED NOT NULL,
  VOTER_ID          INT UNSIGNED NOT NULL
) ENGINE = INNODB;

DROP TABLE IF EXISTS CT_LINK;
CREATE TABLE CT_LINK (
  ID                SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NAME              VARCHAR(50),
  I18N_NAME         VARCHAR(255),
  TAG               VARCHAR(50),
  TITLE             VARCHAR(100),
  SHOW_TITLE        CHAR(1) DEFAULT 'Y',
  PARENT_ID         SMALLINT UNSIGNED,
  URL               VARCHAR(255),
  SORT_ORDER        TINYINT UNSIGNED DEFAULT 0,
  STATUS            CHAR(1) DEFAULT 'A',
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CT_FORM;
CREATE TABLE CT_FORM (
  ID                SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NAME              VARCHAR(30),
  TITLE             VARCHAR(100),
  NO_PATTERN        VARCHAR(30),
  STATUS            CHAR(1) DEFAULT 'A',
  DESCRIPTION       VARCHAR(255),
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CT_FORM_FIELD;
CREATE TABLE CT_FORM_FIELD (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FORM_ID           INT UNSIGNED NOT NULL,
  LEGEND            VARCHAR(50),
  NAME              VARCHAR(30),
  LABEL             VARCHAR(100),
  IS_MANDATORY      CHAR(1) DEFAULT 'N',
  TYPE              CHAR(1) DEFAULT 'T',
  HINT              VARCHAR(50),
  SORT_ORDER        TINYINT UNSIGNED DEFAULT 0,
  DESCRIPTION       VARCHAR(255),
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CT_FIELD_OPTION;
CREATE TABLE CT_FIELD_OPTION (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FIELD_ID          INT UNSIGNED NOT NULL,
  NAME              VARCHAR(30),
  LABEL             VARCHAR(100),
  VALUE             VARCHAR(30),
  SORT_ORDER        TINYINT UNSIGNED DEFAULT 0
) ENGINE = INNODB;

DROP TABLE IF EXISTS CT_USER_FORM;
CREATE TABLE CT_USER_FORM (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FORM_ID           INT UNSIGNED NOT NULL,
  NO                VARCHAR(30),
  REMARKS           VARCHAR(255),
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CT_USER_FORM_FIELD;
CREATE TABLE CT_USER_FORM_FIELD (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  USER_FORM_ID      INT UNSIGNED NOT NULL,
  FIELD_ID          INT UNSIGNED NOT NULL,
  DATA              TEXT,
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;