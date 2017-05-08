/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.entity;

import java.util.List;

import com.sanyet.fireball.base.entity.AuditEntity;
import com.sanyet.fireball.customer.entity.Customer;

/**
 * Statistics
 *
 * @author hanjian
 */
public class Statistics extends AuditEntity {
    private static final long serialVersionUID = 1L;

    // table name
    public static final String TABLE_NAME               = "CE_STATISTICS";

    // columns names
    public static final String COL_ID                   = "ID";
    public static final String COL_STAT_YEAR            = "STAT_YEAR";
    public static final String COL_SUBMITTED_BY         = "SUBMITTED_BY";
    public static final String COL_FILED_BY             = "FILED_BY";
    public static final String COL_PHONE_NO             = "PHONE_NO";
    public static final String COL_TYPE                 = "TYPE";
    public static final String COL_REMARKS              = "REMARKS";

    private int id;
    private String statYear;
    private int submittedBy;
    private String filedBy;
    private String phoneNo;
    private String type;
    private String remarks;
    private List<StatDetail> statDetail;
    private List<StatConference> statConference;
    private List<ConferenceDataSheet> conferenceDataSheet;
    private Customer customer;
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getStatYear() {
        return statYear;
    }
    public void setStatYear(String statYear) {
        this.statYear = statYear;
    }
    public int getSubmittedBy() {
        return submittedBy;
    }
    public void setSubmittedBy(int submittedBy) {
        this.submittedBy = submittedBy;
    }
    public String getFiledBy() {
        return filedBy;
    }
    public void setFiledBy(String filedBy) {
        this.filedBy = filedBy;
    }
    public String getPhoneNo() {
        return phoneNo;
    }
    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public String getRemarks() {
        return remarks;
    }
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    public List<StatDetail> getStatDetail() {
        return statDetail;
    }
    public void setStatDetail(List<StatDetail> statDetail) {
        this.statDetail = statDetail;
    }
    public List<StatConference> getStatConference() {
        return statConference;
    }
    public void setStatConference(List<StatConference> statConference) {
        this.statConference = statConference;
    }
    public List<ConferenceDataSheet> getConferenceDataSheet() {
        return conferenceDataSheet;
    }
    public void setConferenceDataSheet(List<ConferenceDataSheet> conferenceDataSheet) {
        this.conferenceDataSheet = conferenceDataSheet;
    }
    public Customer getCustomer() {
        return customer;
    }
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
}
