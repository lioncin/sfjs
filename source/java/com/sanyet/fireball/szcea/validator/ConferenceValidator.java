/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.validator;

import javax.servlet.http.HttpServletRequest;

import com.sanyet.fireball.base.validation.Validator;
import com.sanyet.fireball.szcea.entity.Statistics;

/**
 * ExhibitionValidator
 *
 * @author hanjian
 */
public class ConferenceValidator extends Validator<Statistics> {

    public ConferenceValidator(HttpServletRequest request) {
        super(request);
    }

    public boolean validate() {
        addCheck(isRequired(request.getParameter("filedBy")), "filedBy", "cm.val.required");
        addCheck(isRequired(request.getParameter("phoneNo")), "phoneNo", "cm.val.required");
        addCheck(isRequired(request.getParameter("activityName")), "activityName", "cm.val.required");
        addCheck(isRequired(request.getParameter("sponsor")), "sponsor", "cm.val.required");
        addCheck(isRequired(request.getParameter("holdFrom")), "holdFrom", "cm.val.required");
        addCheck(isDate(request.getParameter("holdFrom")), "holdFrom", "cm.val.date");
        addCheck(isDigits(request.getParameter("countTime")), "countTime", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("visitorCount")), "visitorCount", "cm.val.numeric");
        return hasNoError();
    }
}
