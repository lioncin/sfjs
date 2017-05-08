/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.validator;

import javax.servlet.http.HttpServletRequest;

import com.sanyet.fireball.base.validation.Validator;
import com.sanyet.fireball.szcea.entity.StatConference;

/**
 * ConferenceDataSheetValidator
 *
 * @author hanjian
 */
public class ConferenceDataSheetValidator extends Validator<StatConference> {

    public ConferenceDataSheetValidator(HttpServletRequest request) {
        super(request);
    }

    public boolean validate() {
        addCheck(isDigits(request.getParameter("iGT")), "iGT", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("iGV")), "iGV", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("iOT")), "iOT", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("iOV")), "iOV", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("iBT")), "iBT", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("iBV")), "iBV", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("iZT")), "iZT", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("iZV")), "iZV", "cm.val.numeric");

        addCheck(isDigits(request.getParameter("nGT")), "nGT", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("nGV")), "nGV", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("nOT")), "nOT", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("nOV")), "nOV", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("nBT")), "nBT", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("nBV")), "nBV", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("nZT")), "nZT", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("nZV")), "nZV", "cm.val.numeric");

        addCheck(isDigits(request.getParameter("pGT")), "pGT", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("pGV")), "pGV", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("pOT")), "pOT", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("pOV")), "pOV", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("pBT")), "pBT", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("pBV")), "pBV", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("pZT")), "pZT", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("pZV")), "pZV", "cm.val.numeric");

        addCheck(isDigits(request.getParameter("cGT")), "cGT", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("cGV")), "cGV", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("cOT")), "cOT", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("cOV")), "cOV", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("cBT")), "cBT", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("cBV")), "cBV", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("cZT")), "cZT", "cm.val.numeric");
        addCheck(isDigits(request.getParameter("cZV")), "cZV", "cm.val.numeric");
        addCheck(isRequired(request.getParameter("filedBy")), "filedBy", "cm.val.required");
        addCheck(isRequired(request.getParameter("phoneNo")), "phoneNo", "cm.val.required");
        return hasNoError();
    }
}
