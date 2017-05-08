/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.entity;

import com.sanyet.fireball.base.entity.BaseEntity;

/**
 * ConferenceDataSheet
 *
 * @author hanjian
 */
public class ConferenceDataSheet extends BaseEntity {
    private static final long serialVersionUID = 1L;

    // table name
    public static final String TABLE_NAME               = "";

    // columns names
    public static final String COL_STAT_ID                  = "STAT_ID";
    public static final String COL_LEVEL                    = "LEVEL";
    public static final String COL_G_TIME                   = "G_TIME";
    public static final String COL_G_VISITOR_COUNT          = "G_VISITOR_COUNT";
    public static final String COL_O_TIME                   = "O_TIME";
    public static final String COL_O_VISITOR_COUNT          = "O_VISITOR_COUNT";
    public static final String COL_B_TIME                   = "B_TIME";
    public static final String COL_B_VISITOR_COUNT          = "B_VISITOR_COUNT";
    public static final String COL_Z_TIME                   = "Z_TIME";
    public static final String COL_Z_VISITOR_COUNT          = "Z_VISITOR_COUNT";
    public static final String COL_SUBTOTAL_TIME            = "SUBTOTAL_TIME";
    public static final String COL_SUBTOTAL_VISITOR_COUNT   = "SUBTOTAL_VISITOR_COUNT";
    public static final String COL_REMARKS                  = "REMARKS";
    
    private int statId;
    private String level;
    private int gTime;
    private int gVisitorCount;
    private int oTime;
    private int oVisitorCount;
    private int bTime;
    private int bVisitorCount;
    private int zTime;
    private int zVisitorCount;
    private int subtotalTime;
    private int subtotalVisitorCount;
    private String remarks;
    public int getStatId() {
        return statId;
    }
    public void setStatId(int statId) {
        this.statId = statId;
    }
    public String getLevel() {
        return level;
    }
    public void setLevel(String level) {
        this.level = level;
    }
    public int getgTime() {
        return gTime;
    }
    public void setgTime(int gTime) {
        this.gTime = gTime;
    }
    public int getgVisitorCount() {
        return gVisitorCount;
    }
    public void setgVisitorCount(int gVisitorCount) {
        this.gVisitorCount = gVisitorCount;
    }
    public int getoTime() {
        return oTime;
    }
    public void setoTime(int oTime) {
        this.oTime = oTime;
    }
    public int getoVisitorCount() {
        return oVisitorCount;
    }
    public void setoVisitorCount(int oVisitorCount) {
        this.oVisitorCount = oVisitorCount;
    }
    public int getbTime() {
        return bTime;
    }
    public void setbTime(int bTime) {
        this.bTime = bTime;
    }
    public int getbVisitorCount() {
        return bVisitorCount;
    }
    public void setbVisitorCount(int bVisitorCount) {
        this.bVisitorCount = bVisitorCount;
    }
    public int getzTime() {
        return zTime;
    }
    public void setzTime(int zTime) {
        this.zTime = zTime;
    }
    public int getzVisitorCount() {
        return zVisitorCount;
    }
    public void setzVisitorCount(int zVisitorCount) {
        this.zVisitorCount = zVisitorCount;
    }
    public int getSubtotalTime() {
        return subtotalTime;
    }
    public void setSubtotalTime(int subtotalTime) {
        this.subtotalTime = subtotalTime;
    }
    public int getSubtotalVisitorCount() {
        return subtotalVisitorCount;
    }
    public void setSubtotalVisitorCount(int subtotalVisitorCount) {
        this.subtotalVisitorCount = subtotalVisitorCount;
    }
    public String getRemarks() {
        return remarks;
    }
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
