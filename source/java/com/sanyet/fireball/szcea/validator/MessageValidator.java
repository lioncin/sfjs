package com.sanyet.fireball.szcea.validator;

import javax.servlet.http.HttpServletRequest;

import com.sanyet.fireball.base.message.entity.Message;
import com.sanyet.fireball.base.validation.Validator;

public class MessageValidator extends Validator<Message> {

    public MessageValidator(HttpServletRequest request) {
        super(request);
    }

    @Override
    public boolean validate() {
        addCheck(isRequired(request.getParameter("subject")), "subject", "cm.val.required");
        addCheck(isRequired(request.getParameter("contentTxt")), "contentTxt", "cm.val.required");
        return hasNoError();
    }

}
