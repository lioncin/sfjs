/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.entity;

import com.sanyet.fireball.base.entity.BaseEntity;

/**
 * StatConference
 *
 * @author hanjian
 */
public class StatConference extends BaseEntity {
    private static final long serialVersionUID = 1L;

    // table name
    public static final String TABLE_NAME                   = "CE_STAT_CONFERENCE";

    // columns names
    public static final String COL_STAT_ID                  = "STAT_ID";
    public static final String COL_TYPE                     = "TYPE";
    public static final String COL_TIME                     = "TIME";
    public static final String COL_VISITOR_COUNT            = "VISITOR_COUNT";
    public static final String COL_LEVEL                    = "LEVEL";
    public static final String COL_REMARKS                  = "REMARKS";
    
    private int statId;
    private String type;
    private int time;
    private int visitorCount;
    private String level;
    private String remarks;
    public int getStatId() {
        return statId;
    }
    public void setStatId(int statId) {
        this.statId = statId;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public int getTime() {
        return time;
    }
    public void setTime(int time) {
        this.time = time;
    }
    public int getVisitorCount() {
        return visitorCount;
    }
    public void setVisitorCount(int visitorCount) {
        this.visitorCount = visitorCount;
    }
    public String getLevel() {
        return level;
    }
    public void setLevel(String level) {
        this.level = level;
    }
    public String getRemarks() {
        return remarks;
    }
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
