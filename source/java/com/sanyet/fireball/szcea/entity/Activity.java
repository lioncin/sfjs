package com.sanyet.fireball.szcea.entity;

import java.util.Date;

import com.sanyet.fireball.base.entity.AuditEntity;
import com.sanyet.fireball.base.jdbc.annotation.Column;
import com.sanyet.fireball.base.jdbc.annotation.PrimaryKey;
import com.sanyet.fireball.base.jdbc.annotation.Table;
import com.sanyet.fireball.base.jdbc.annotation.Column.Type;

@Table(name=Activity.TABLE_NAME)
public class Activity extends AuditEntity {
    private static final long serialVersionUID = 1L;

    // table name
    public static final String TABLE_NAME               = "CE_ACTIVITY";
    
    // columns names
    public static final String COL_ID                   = "ID";
    public static final String COL_CODE                 = "CODE";
    public static final String COL_NAME                 = "NAME";
    public static final String COL_NAME_EN              = "NAME_EN";
    public static final String COL_LOCATION             = "LOCATION";
    public static final String COL_PREPARE_FROM         = "PREPARE_FROM";
    public static final String COL_PREPARE_TO           = "PREPARE_TO";
    public static final String COL_HOLD_FROM            = "HOLD_FROM";
    public static final String COL_HOLD_TO              = "HOLD_TO";
    public static final String COL_IS_REGULAR           = "IS_REGULAR";
    public static final String COL_ANNUAL_TIME          = "ANNUAL_TIME";
    public static final String COL_HOLD_TIME            = "HOLD_TIME";
    public static final String COL_HAS_NATIONAL_TM      = "HAS_NATIONAL_TM";
    public static final String COL_HAS_INTER_CERT       = "HAS_INTER_CERT";
    public static final String COL_LEVEL                = "LEVEL";
    public static final String COL_APPROVER             = "APPROVER";
    public static final String COL_SPONSOR              = "SPONSOR";
    public static final String COL_ORGANIZER            = "ORGANIZER";
    public static final String COL_COUNT_1              = "COUNT_1";
    public static final String COL_COUNT_2              = "COUNT_2";
    public static final String COL_COUNT_3              = "COUNT_3";
    public static final String COL_FEE_SCALE            = "FEE_SCALE";
    public static final String COL_HAS_ADD_ACTIVITY     = "HAS_ADD_ACTIVITY";
    public static final String COL_ADD_SCALE            = "ADD_SCALE";
    public static final String COL_ADD_TIME             = "ADD_TIME";
    public static final String COL_DESCRIPTION          = "DESCRIPTION";
    public static final String COL_SUBMITTED_BY         = "SUBMITTED_BY";
    public static final String COL_LEGAL_REP            = "LEGAL_REP";
    public static final String COL_BIZ_ADDRESS          = "BIZ_ADDRESS";
    public static final String COL_BIZ_EMAIL            = "BIZ_EMAIL";
    public static final String COL_BIZ_CONTACT          = "BIZ_CONTACT";
    public static final String COL_BIZ_PHONE            = "BIZ_PHONE";
    public static final String COL_DOCUMENTS            = "DOCUMENTS";
    public static final String COL_TYPE                 = "TYPE";
    public static final String COL_STATUS               = "STATUS";
    public static final String COL_REMARKS               = "REMARKS";
    
    @PrimaryKey
    @Column(name=Activity.COL_ID, type=Type.INT)
    private int id;
    @Column(name=Activity.COL_CODE, type=Type.STRING)
    private String code;
    @Column(name=Activity.COL_NAME, type=Type.STRING)
    private String name;
    @Column(name=Activity.COL_NAME_EN, type=Type.STRING)
    private String name_en;
    @Column(name=Activity.COL_LOCATION, type=Type.STRING)
    private String location;
    @Column(name=Activity.COL_PREPARE_FROM, type=Type.DATETIME)
    private Date prepareFrom; 
    @Column(name=Activity.COL_PREPARE_TO, type=Type.DATETIME)
    private Date prepareTo; 
    @Column(name=Activity.COL_HOLD_FROM, type=Type.DATETIME)
    private Date holdFrom;
    @Column(name=Activity.COL_HOLD_TO, type=Type.DATETIME)
    private Date holdTo;
    @Column(name=Activity.COL_IS_REGULAR, type=Type.STRING)
    private String isRegular;
    @Column(name=Activity.COL_ANNUAL_TIME, type=Type.INT)
    private int annualTime;
    @Column(name=Activity.COL_HOLD_TIME, type=Type.INT)
    private int holdTime;
    @Column(name=Activity.COL_HAS_NATIONAL_TM, type=Type.STRING)
    private String hasNationalTM;
    @Column(name=Activity.COL_HAS_INTER_CERT, type=Type.STRING)
    private String hasInterCert;
    @Column(name=Activity.COL_LEVEL, type=Type.STRING)
    private String level;
    @Column(name=Activity.COL_APPROVER, type=Type.STRING)
    private String approver;
    @Column(name=Activity.COL_SPONSOR, type=Type.STRING)
    private String sponsor;
    @Column(name=Activity.COL_ORGANIZER, type=Type.STRING)
    private String organizer;
    @Column(name=Activity.COL_COUNT_1, type=Type.DOUBLE)
    private double count_1;
    @Column(name=Activity.COL_COUNT_2, type=Type.DOUBLE)
    private double count_2;
    @Column(name=Activity.COL_COUNT_3, type=Type.INT)
    private int count_3;
    @Column(name=Activity.COL_FEE_SCALE, type=Type.DOUBLE)
    private double feeScale;
    @Column(name=Activity.COL_HAS_ADD_ACTIVITY, type=Type.STRING)
    private String hasAddActivity;
    @Column(name=Activity.COL_ADD_SCALE, type=Type.DOUBLE)
    private double addScale;
    @Column(name=Activity.COL_ADD_TIME, type=Type.INT)
    private int addTime;
    @Column(name=Activity.COL_DESCRIPTION, type=Type.STRING)
    private String description;
    @Column(name=Activity.COL_SUBMITTED_BY, type=Type.STRING)
    private String submittedBy;
    @Column(name=Activity.COL_LEGAL_REP, type=Type.STRING)
    private String legalRep;
    @Column(name=Activity.COL_BIZ_ADDRESS, type=Type.STRING)
    private String bizAddress;
    @Column(name=Activity.COL_BIZ_EMAIL, type=Type.STRING)
    private String bizEmail;
    @Column(name=Activity.COL_BIZ_CONTACT, type=Type.STRING)
    private String bizContact;
    @Column(name=Activity.COL_BIZ_PHONE, type=Type.STRING)
    private String bizPhone;
    @Column(name=Activity.COL_DOCUMENTS, type=Type.STRING)
    private String documents;
    @Column(name=Activity.COL_TYPE, type=Type.STRING)
    private String type;
    @Column(name=Activity.COL_STATUS, type=Type.STRING)
    private String status;
    @Column(name=Activity.COL_REMARKS, type=Type.STRING)
    private String remarks;
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getName_en() {
        return name_en;
    }
    public void setName_en(String name_en) {
        this.name_en = name_en;
    }
    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }
    public Date getPrepareFrom() {
        return prepareFrom;
    }
    public void setPrepareFrom(Date prepareFrom) {
        this.prepareFrom = prepareFrom;
    }
    public Date getPrepareTo() {
        return prepareTo;
    }
    public void setPrepareTo(Date prepareTo) {
        this.prepareTo = prepareTo;
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
    public String getIsRegular() {
        return isRegular;
    }
    public void setIsRegular(String isRegular) {
        this.isRegular = isRegular;
    }
    public int getAnnualTime() {
        return annualTime;
    }
    public void setAnnualTime(int annualTime) {
        this.annualTime = annualTime;
    }
    public int getHoldTime() {
        return holdTime;
    }
    public void setHoldTime(int holdTime) {
        this.holdTime = holdTime;
    }
    public String getHasNationalTM() {
        return hasNationalTM;
    }
    public void setHasNationalTM(String hasNationalTM) {
        this.hasNationalTM = hasNationalTM;
    }
    public String getHasInterCert() {
        return hasInterCert;
    }
    public void setHasInterCert(String hasInterCert) {
        this.hasInterCert = hasInterCert;
    }
    public String getLevel() {
        return level;
    }
    public void setLevel(String level) {
        this.level = level;
    }
    public String getApprover() {
        return approver;
    }
    public void setApprover(String approver) {
        this.approver = approver;
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
    public double getCount_1() {
        return count_1;
    }
    public void setCount_1(double count_1) {
        this.count_1 = count_1;
    }
    public double getCount_2() {
        return count_2;
    }
    public void setCount_2(double count_2) {
        this.count_2 = count_2;
    }
    public int getCount_3() {
        return count_3;
    }
    public void setCount_3(int count_3) {
        this.count_3 = count_3;
    }
    public double getFeeScale() {
        return feeScale;
    }
    public void setFeeScale(double feeScale) {
        this.feeScale = feeScale;
    }
    public String getHasAddActivity() {
        return hasAddActivity;
    }
    public void setHasAddActivity(String hasAddActivity) {
        this.hasAddActivity = hasAddActivity;
    }
    public double getAddScale() {
        return addScale;
    }
    public void setAddScale(double addScale) {
        this.addScale = addScale;
    }
    public int getAddTime() {
        return addTime;
    }
    public void setAddTime(int addTime) {
        this.addTime = addTime;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getSubmittedBy() {
        return submittedBy;
    }
    public void setSubmittedBy(String submittedBy) {
        this.submittedBy = submittedBy;
    }
    public String getLegalRep() {
        return legalRep;
    }
    public void setLegalRep(String legalRep) {
        this.legalRep = legalRep;
    }
    public String getBizAddress() {
        return bizAddress;
    }
    public void setBizAddress(String bizAddress) {
        this.bizAddress = bizAddress;
    }
    public String getBizEmail() {
        return bizEmail;
    }
    public void setBizEmail(String bizEmail) {
        this.bizEmail = bizEmail;
    }
    public String getBizContact() {
        return bizContact;
    }
    public void setBizContact(String bizContact) {
        this.bizContact = bizContact;
    }
    public String getBizPhone() {
        return bizPhone;
    }
    public void setBizPhone(String bizPhone) {
        this.bizPhone = bizPhone;
    }
    public String getDocuments() {
        return documents;
    }
    public void setDocuments(String documents) {
        this.documents = documents;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getRemarks() {
        return remarks;
    }
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    
}
