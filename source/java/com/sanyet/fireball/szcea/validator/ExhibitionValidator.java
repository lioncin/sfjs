/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.validator;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.sanyet.fireball.base.util.DateUtil;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.base.validation.Validator;
import com.sanyet.fireball.szcea.entity.Statistics;

/**
 * ExhibitionValidator
 *
 * @author hanjian
 */
public class ExhibitionValidator extends Validator<Statistics> {

    public ExhibitionValidator(HttpServletRequest request) {
        super(request);
    }

    public boolean validate() {
        addCheck(isRequired(request.getParameter("filedBy")), "filedBy", "cm.val.required");
        addCheck(isRequired(request.getParameter("phoneNo")), "phoneNo", "cm.val.required");
        addCheck(isRequired(request.getParameter("activityName")), "activityName", "cm.val.required");
        addCheck(isRequired(request.getParameter("location")), "location", "cm.val.required");
        addCheck(isRequired(request.getParameter("holdFrom")), "holdFrom", "cm.val.required");
        addCheck(isRequired(request.getParameter("sponsor")), "sponsor", "cm.val.required");
        addCheck(isRequired(request.getParameter("organizer")), "organizer", "cm.val.required");
        addCheck(isDate(request.getParameter("holdFrom")), "holdFrom", "cm.val.date");
//        addCheck(isDate(request.getParameter("holdTo")), "holdTo", "cm.val.date");
//        addCheck(isBeforeDate(request.getParameter("holdFrom"), request.getParameter("holdTo")), "holdTo", "cm.val.after");
        addCheck(isDigits(request.getParameter("countTime")), "countTime", "cm.val.numeric");
        addCheck(isNumeric(request.getParameter("area")), "area", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("visitorCount")), "visitorCount", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("addConference")), "addConference", "cm.val.numeric");
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
