DROP TABLE IF EXISTS CE_ACTIVITY;
CREATE TABLE CE_ACTIVITY (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  CODE              VARCHAR(20)             COMMENT '项目编号',
  NAME              VARCHAR(100)            COMMENT '项目名称（中文）',
  NAME_EN           VARCHAR(100)            COMMENT '项目名称（英文）',
  LOCATION          VARCHAR(255)            COMMENT '举办地点/召开地点',
  PREPARE_FROM      DATE                    COMMENT '布展期（从）/注册报到期（从）',
  PREPARE_TO        DATE                    COMMENT '布展期（到）/注册报到期（到）',
  HOLD_FROM         DATE                    COMMENT '展出期（从）/会期（从）',
  HOLD_TO           DATE                    COMMENT '展出期（到）/会期（到）',
  IS_REGULAR        CHAR(1)                 COMMENT '是否定期召开',
  ANNUAL_TIME       TINYINT UNSIGNED        COMMENT '每年届数',
  HOLD_TIME         TINYINT UNSIGNED        COMMENT '已举办届数',
  HAS_NATIONAL_TM   CHAR(1)                 COMMENT '是否取得国家注册商标',
  HAS_INTER_CERT    CHAR(1)                 COMMENT '是否获得国际性组织认证',
  LEVEL             CHAR(1)                 COMMENT '展会层次/会议级别(I: 国际性, N: 国家级, P: 省级, C: 地级)',
  APPROVER          VARCHAR(100)            COMMENT '批准单位',
  SPONSOR           VARCHAR(100)            COMMENT '主办单位',
  ORGANIZER         VARCHAR(100)            COMMENT '承办单位',
  COUNT_1           DECIMAL(8, 2)           COMMENT '预计展出面积/预计参会人数',
  COUNT_2           DECIMAL(8, 2)           COMMENT '其中室内面积/其中境外参会人数',
  COUNT_3           SMALLINT UNSIGNED       COMMENT '标准展位数量/预计住宿天数',
  FEE_SCALE         DECIMAL(8, 2)           COMMENT '收费标准/住宿标准',
  HAS_ADD_ACTIVITY  CHAR(1)                 COMMENT '是否附加会议/是否附加展览会',
  ADD_SCALE         DECIMAL(8, 2)           COMMENT '人数规模/预计展会面积',
  ADD_TIME          TINYINT UNSIGNED        COMMENT '场次',
  DESCRIPTION       TEXT                    COMMENT '主要展出内容/主要会议内容',
  SUBMITTED_BY      VARCHAR(100)            COMMENT '报送单位',
  LEGAL_REP         VARCHAR(50)             COMMENT '法人代表',
  BIZ_ADDRESS       VARCHAR(255)            COMMENT '单位地址',
  BIZ_EMAIL         VARCHAR(255)            COMMENT '单位电子邮箱',
  BIZ_CONTACT       VARCHAR(50)             COMMENT '单位联系人',
  BIZ_PHONE         VARCHAR(30)             COMMENT '联系电话',
  DOCUMENTS         VARCHAR(255)            COMMENT '备案登记材料明细',
  TYPE              CHAR(1)                 COMMENT '类型(E: 展览, C: 会议)',
  STATUS            CHAR(1)                 COMMENT '状态（P - 待审核，A - 正常，R - 拒绝）',
  REMARKS           VARCHAR(100),
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CE_STATISTICS;
CREATE TABLE CE_STATISTICS (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  STAT_YEAR         VARCHAR(4)              COMMENT '统计年份',
  SUBMITTED_BY      INT UNSIGNED            COMMENT '提交单位',
  FILED_BY          VARCHAR(30)             COMMENT '填报人',
  PHONE_NO          VARCHAR(30)             COMMENT '联系电话',
  TYPE              CHAR(1)                 COMMENT '类型',
  REMARKS           VARCHAR(255)            COMMENT '备注',
  CREATED_AT        DATETIME NOT NULL,
  CREATED_BY        INT UNSIGNED NOT NULL,
  UPDATED_AT        DATETIME,
  UPDATED_BY        INT UNSIGNED
) ENGINE = INNODB;

DROP TABLE IF EXISTS CE_STAT_DETAIL;
CREATE TABLE CE_STAT_DETAIL (
  ID                INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  STAT_ID           INT UNSIGNED NOT NULL,
  ACTIVITY_ID       INT UNSIGNED            COMMENT '项目ID',
  ACTIVITY_NAME     VARCHAR(100)            COMMENT '展会名称',
  LOCATION          VARCHAR(255)            COMMENT '举办地点',
  HOLD_FROM         DATE                    COMMENT '举办时间',
  HOLD_TO           DATE                    COMMENT '举办时间',
  SPONSOR           VARCHAR(100)            COMMENT '主办单位',
  ORGANIZER         VARCHAR(100)            COMMENT '承办单位',
  COUNT_TIME        SMALLINT UNSIGNED       COMMENT '实际展位数',
  AREA              DECIMAL(8, 2)           COMMENT '展会面积',
  VISITOR_COUNT     SMALLINT UNSIGNED       COMMENT '专业观众人数',
  ADD_CONFERENCE    TINYINT UNSIGNED        COMMENT '附加会议',
  CONF_TYPE         CHAR(1)                 COMMENT '会议类别(G: 政府类, O: 社团类, B: 企业类, Z: 其他类)'
) ENGINE = INNODB;

DROP TABLE IF EXISTS CE_STAT_CONFERENCE;
CREATE TABLE CE_STAT_CONFERENCE (
  STAT_ID           INT UNSIGNED NOT NULL,
  TYPE              CHAR(1)                 COMMENT '会议类别',
  TIME              TINYINT UNSIGNED        COMMENT '场次',
  VISITOR_COUNT     SMALLINT UNSIGNED       COMMENT '人数',
  LEVEL             CHAR(1)                 COMMENT '会议级别',
  REMARKS           VARCHAR(255)            COMMENT '备注'
) ENGINE = INNODB;

