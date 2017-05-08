/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.validator;

import javax.servlet.http.HttpServletRequest;

import com.sanyet.fireball.base.AppUtil;
import com.sanyet.fireball.base.service.UserService;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.base.validation.Validator;
import com.sanyet.fireball.customer.entity.Customer;

/**
 * CustomerValidator
 *
 * @author hanjian
 */
public class CustomerValidator extends Validator<Customer> {

    private static final int USERNAME_MIN_LEN = 4;
    private static final int USERNAME_MAX_LEN = 16;
    private static final int PASSWORD_MIN_LEN = 6;
    
    private boolean isCreate;
    private boolean changePwd;
    private boolean passwordCheck;

    public CustomerValidator(HttpServletRequest request, boolean isCreate, boolean changePwd, boolean passwordCheck) {
        super(request);
        this.isCreate = isCreate;
        this.changePwd = changePwd;
        this.passwordCheck = passwordCheck;
    }

    public boolean validate() {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String code = request.getParameter("code");
        String sessionCode = (String)request.getSession().getAttribute("checkCodeAttr");
        addCheck(isRequired(request.getParameter("companyName")), "companyName", "cm.val.required");
        if (isCreate) {
            addCheck(isRequired(username), "username", "cm.val.required");
            try {
                UserService userService = AppUtil.getBean(UserService.class);
                addCheck(userService.getUserByName(username) == null, "username", "ss.register.usernameExists");
            } catch (Exception e) {}
            addCheck(checkMinLength(username, USERNAME_MIN_LEN), "username", "cm.val.minLength", String.valueOf(USERNAME_MIN_LEN));
            addCheck(checkMaxLength(username, USERNAME_MAX_LEN), "username", "cm.val.maxLength", String.valueOf(USERNAME_MAX_LEN));
            addCheck(checkMinLength(password, PASSWORD_MIN_LEN), "password", "cm.val.minLength", String.valueOf(PASSWORD_MIN_LEN));
            addCheck(isRequired(password), "password", "cm.val.required");
            addCheck(isRequired(password2), "password2", "cm.val.required");
            addCheck(isEqual(password, password2), "password2", "ss.register.samePassword");
            addCheck(isRequired(code), "code", "cm.val.required");
            addCheck(isEqual(code, sessionCode), "code", "cm.val.code");
        } else {
            if (changePwd) {
                addCheck(passwordCheck, "oldPassword", "cm.val.password");
                String newPassword = request.getParameter("newPassword");
                String newPassword2 = request.getParameter("newPassword2");
                addCheck(checkMinLength(newPassword, PASSWORD_MIN_LEN), "newPassword", "cm.val.minLength", String.valueOf(PASSWORD_MIN_LEN));
                addCheck(isRequired(newPassword), "newPassword", "cm.val.required");
                addCheck(isRequired(newPassword2), "newPassword2", "cm.val.required");
                addCheck(isEqual(newPassword, newPassword2), "newPassword2", "ss.register.samePassword");
            }
        }
        addCheck(isRequired(request.getParameter("licenseNo")), "licenseNo", "cm.val.required");
        addCheck(isRequired(request.getParameter("legalRep")), "legalRep", "cm.val.required");
        addCheck(isRequired(request.getParameter("address")), "address", "cm.val.required");
        addCheck(isRequired(request.getParameter("orgCode")), "orgCode", "cm.val.required");
        addCheck(isRequired(request.getParameter("orgType")), "orgType", "cm.val.required");
        addCheck(isRequired(request.getParameter("bankName")), "bankName", "cm.val.required");
        addCheck(isRequired(request.getParameter("accountNo")), "accountNo", "cm.val.required");
        addCheck(isRequired(request.getParameter("taxNo")), "taxNo", "cm.val.required");
        addCheck(isRequired(request.getParameter("contact")), "contact", "cm.val.required");
        addCheck(isRequired(request.getParameter("phone")), "phone", "cm.val.required");
        addCheck(isDate(request.getParameter("established")), "established", "cm.val.date");
        addCheck(isEmail(request.getParameter("companyEmail")), "companyEmail", "cm.val.email");
        addCheck(isEmail(request.getParameter("contactEmail")), "contactEmail", "cm.val.email");
        addCheck(isNumeric(request.getParameter("registeredCapital")), "registeredCapital", "cm.val.numeric");
        addCheck(isNumeric(request.getParameter("headcount")), "headcount", "cm.val.numeric");
        return hasNoError();
    }

    private boolean isEqual(String str1, String str2) {
        return StringUtil.isEmpty(str1) || StringUtil.isEmpty(str2) || str1.equals(str2);
    }
}
