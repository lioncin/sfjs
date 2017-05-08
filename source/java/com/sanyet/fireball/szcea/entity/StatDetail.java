/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.entity;

import java.util.Date;

import com.sanyet.fireball.base.entity.BaseEntity;

/**
 * StatDetail
 *
 * @author hanjian
 */
public class StatDetail extends BaseEntity {
    private static final long serialVersionUID = 1L;

    // table name
    public static final String TABLE_NAME               = "CE_STAT_DETAIL";

    // columns names
    public static final String COL_ID                   = "ID";
    public static final String COL_STAT_ID              = "STAT_ID";
    public static final String COL_ACTIVITY_ID          = "ACTIVITY_ID";
    public static final String COL_ACTIVITY_NAME        = "ACTIVITY_NAME";
    public static final String COL_LOCATION             = "LOCATION";
    public static final String COL_HOLD_FROM            = "HOLD_FROM";
    public static final String COL_HOLD_TO              = "HOLD_TO";
    public static final String COL_SPONSOR              = "SPONSOR";
    public static final String COL_ORGANIZER            = "ORGANIZER";
    public static final String COL_COUNT_TIME           = "COUNT_TIME";
    public static final String COL_AREA                 = "AREA";
    public static final String COL_VISITOR_COUNT        = "VISITOR_COUNT";
    public static final String COL_ADD_CONFERENCE       = "ADD_CONFERENCE";
    public static final String COL_CONF_TYPE            = "CONF_TYPE";

    private int id;
    private int statId;
    private int activityId;
    private String activityName;
    private String location;
    private Date holdFrom;
    private Date holdTo;
    private String sponsor;
    private String organizer;
    private int countTime;
    private double area;
    private int visitorCount;
    private int addConference;
    private String confType;
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getStatId() {
        return statId;
    }
    public void setStatId(int statId) {
        this.statId = statId;
    }
    public int getActivityId() {
        return activityId;
    }
    public void setActivityId(int activityId) {
        this.activityId = activityId;
    }
    public String getActivityName() {
        return activityName;
    }
    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }
    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }
    public Date getHoldFrom() {
        return holdFrom;
    }
    public void setHoldFrom(Date holdFrom) {
        this.holdFrom = holdFrom;
    }
    public Date getHoldTo() {
        return holdTo;
    }
    public void setHoldTo(Date holdTo) {
        this.holdTo = holdTo;
    }
    public String getSponsor() {
        return sponsor;
    }
    public void setSponsor(String sponsor) {
        this.sponsor = sponsor;
    }
    public String getOrganizer() {
        return organizer;
    }
    public void setOrganizer(String organizer) {
        this.organizer = organizer;
    }
    public int getCountTime() {
        return countTime;
    }
    public void setCountTime(int countTime) {
        this.countTime = countTime;
    }
    public double getArea() {
        return area;
    }
    public void setArea(double area) {
        this.area = area;
    }
    public int getVisitorCount() {
        return visitorCount;
    }
    public void setVisitorCount(int visitorCount) {
        this.visitorCount = visitorCount;
    }
    public int getAddConference() {
        return addConference;
    }
    public void setAddConference(int addConference) {
        this.addConference = addConference;
    }
    public String getConfType() {
        return confType;
    }
    public void setConfType(String confType) {
        this.confType = confType;
    }
}
