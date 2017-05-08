package com.sanyet.fireball.szcea.validator;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.sanyet.fireball.base.util.DateUtil;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.base.validation.Validator;
import com.sanyet.fireball.szcea.entity.Activity;

public class ActivityValidator extends Validator<Activity> {

    public ActivityValidator(HttpServletRequest request) {
        super(request);
    }

    @Override
    public boolean validate() {
        addCheck(isRequired(request.getParameter("name")), "name", "cm.val.required");
        addCheck(isRequired(request.getParameter("name_en")), "name_en", "cm.val.required");
        addCheck(isRequired(request.getParameter("location")), "location", "cm.val.required");
        addCheck(isDate(request.getParameter("prepareFrom")), "prepareFrom", "cm.val.date");
        addCheck(isDate(request.getParameter("prepareTo")), "prepareTo", "cm.val.date");
        addCheck(isBeforeDate(request.getParameter("prepareFrom"), request.getParameter("prepareTo")), "prepareTo", "cm.val.after");
        addCheck(isDate(request.getParameter("holdFrom")), "holdFrom", "cm.val.date");
        addCheck(isDate(request.getParameter("holdTo")), "holdTo", "cm.val.date");
        addCheck(isBeforeDate(request.getParameter("holdFrom"), request.getParameter("holdTo")), "holdTo", "cm.val.after");
        addCheck(isBeforeDate(request.getParameter("prepareTo"), request.getParameter("holdFrom")), "holdFrom", "cm.validation.prepare.hold.date");
        
        addCheck(isDigits(request.getParameter("annualTime")), "annualTime", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("holdTime")), "holdTime", "cm.val.numeric");
        addCheck(isRequired(request.getParameter("level")), "level", "cm.val.required");
        addCheck(isRequired(request.getParameter("approver")), "approver", "cm.val.required");
        addCheck(isRequired(request.getParameter("sponsor")), "sponsor", "cm.val.required");
        addCheck(isRequired(request.getParameter("organizer")), "organizer", "cm.val.required");
        addCheck(isRequired(request.getParameter("count_1")), "count_1", "cm.val.required");
        addCheck(isRequired(request.getParameter("count_2")), "count_2", "cm.val.required");
        addCheck(isRequired(request.getParameter("count_3")), "count_3", "cm.val.required");
        addCheck(isRequired(request.getParameter("feeScale")), "feeScale", "cm.val.required");
//        addCheck(isDigits(request.getParameter("addScale")), "addScale", "cm.val.numeric");
        addCheck(isRequired(request.getParameter("description")), "description", "cm.val.required");
        addCheck(isRequired(request.getParameter("submittedBy")), "submittedBy", "cm.val.required");
        addCheck(isRequired(request.getParameter("legalRep")), "legalRep", "cm.val.required");
        addCheck(isRequired(request.getParameter("bizAddress")), "bizAddress", "cm.val.email");
        addCheck(isEmail(request.getParameter("bizEmail")), "bizEmail", "cm.val.email");
        addCheck(isRequired(request.getParameter("bizContact")), "bizContact", "cm.val.required");
        addCheck(isRequired(request.getParameter("bizPhone")), "bizPhone", "cm.val.required");
        addCheck(isRequired(request.getParameter("documents")), "documents", "cm.val.required");
        addCheck(isRequired(request.getParameter("type")), "type", "cm.val.required");
//        addCheck(isRequired(request.getParameter("status")), "status", "cm.val.required");
        return hasNoError();
    }
    
    private boolean isBeforeDate(String value, String value2) {
        if (StringUtil.isEmpty(value) || StringUtil.isEmpty(value2)) {
            return true;
        }
        try {
            Date d = DateUtil.parseDate(value);
            Date d2 = DateUtil.parseDate(value2);
            return (d != null && d2 != null && d.getTime() <= d2.getTime());
        } catch (Exception ex) {
            return false;
        }
    }
    
}
