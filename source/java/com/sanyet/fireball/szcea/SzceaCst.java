/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea;

/**
 * SzceaCst
 *
 * @author lupeng
 */
public final class SzceaCst {
    public static final int CT_CREATE = 1001;
    public static final int CT_UPDATE = 1002;
    public static final int CT_RETRIEVE = 1003;
    public static final int CT_DELETE = 1004;
    
    // 管理员的页面部分
//    public static final int CT_ADMIN = 1005;
    public static final int CT_CONTENT = 10;
    public static final int CT_PRODUCT = 20;
    public static final int CT_CUSTOMER = 30;
    public static final int CT_STORE = 40;
    public static final int CT_EDUCATION = 50;
    public static final int CT_ASSEST = 60;
    public static final int CT_COMMUNITY = 70;
    public static final int CT_SYSTEM = 80;
    public static final int CT_STATISTICS = 90;
    
    // 会员页面部分
//    public static final int CT_HOME = 1100;
    public static final int CT_CUSTOMER_SELF = 1101;
    public static final int CT_STATISTICS_SELF = 1102;
    
    /** 角色: 超级用户 */
    public static final int CM_ROLE_ADMIN           = 1;
    /** 角色: 主管 */
    public static final int CM_ROLE_MANAGER         = 2;
    /** 角色: 办事员 */
    public static final int CM_ROLE_CLERK           = 3;
    /** 角色: 会员 */
    public static final int CM_ROLE_MEMBER          = 103;

    /** 用户组: 超级用户 */
    public static final int CM_GROUP_ADMIN           = 1;
    /** 用户组: 主管 */
    public static final int CM_GROUP_MANAGER         = 2;
    /** 用户组: 办事员 */
    public static final int CM_GROUP_CLERK           = 3;
    /** 用户组: 会员 */
    public static final int CM_GROUP_MEMBER         = 103;
    
    /** 默认起始年 */
    public static final int DEFAULT_FROM_YEAR = 2016;
}
