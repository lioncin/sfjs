/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.sanyet.fireball.base.AppConsts;
import com.sanyet.fireball.base.AppContext;
import com.sanyet.fireball.base.AppUtil;
import com.sanyet.fireball.base.MasterCodeUtil;
import com.sanyet.fireball.base.entity.ActionRes;
import com.sanyet.fireball.base.entity.Attachment;
import com.sanyet.fireball.base.entity.Comment;
import com.sanyet.fireball.base.entity.MasterCode;
import com.sanyet.fireball.base.entity.SearchParam;
import com.sanyet.fireball.base.entity.SearchResult;
import com.sanyet.fireball.base.message.MessageUtil;
import com.sanyet.fireball.base.message.entity.Message;
import com.sanyet.fireball.base.message.service.MessageService;
import com.sanyet.fireball.base.service.AttachmentService;
import com.sanyet.fireball.base.service.CommentService;
import com.sanyet.fireball.base.util.ConfigUtil;
import com.sanyet.fireball.base.util.ParamUtil;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.content.entity.Content;
import com.sanyet.fireball.content.service.ContentService;
import com.sanyet.fireball.customer.entity.Customer;
import com.sanyet.fireball.customer.service.CustomerService;
import com.sanyet.fireball.szcea.ContentConsts;
import com.sanyet.fireball.szcea.entity.Activity;
import com.sanyet.fireball.szcea.service.ActivityService;

/**
 * SzceaController
 *
 * @author lupeng
 */
@Controller
@RequestMapping("/szcea")
public final class SzceaController {
    private static final Logger logger = LogManager.getLogger(SzceaController.class);

    @Autowired
    private ContentService contentService;

    @Autowired
    private AttachmentService attachmentService;


    @RequestMapping("home")
    public String home(HttpServletRequest request){
        Content[] contents2 = contentService.getLatestContents(2, 10); //建设动态
        ParamUtil.setRequestAttr(request, "jsdt", contents2);

        Content[] contents3 = contentService.getLatestContents(3, 10); //项目建设
        ParamUtil.setRequestAttr(request, "xmjs", contents3);

        Content[] contents4 = contentService.getLatestContents(4, 10); //师资队伍
        ParamUtil.setRequestAttr(request, "szdw", contents4);

        Content[] contents5 = contentService.getLatestContents(5, 10); //制度建设
        ParamUtil.setRequestAttr(request, "zdjs", contents5);

        Content[] contents6 = contentService.getLatestContents(6, 10); //督导通报
        ParamUtil.setRequestAttr(request, "ddtb", contents6);

        Content[] contents7 = contentService.getLatestContents(7, 10); //校企合作
        ParamUtil.setRequestAttr(request, "xqhz", contents7);

        Content[] contents8 = contentService.getLatestContents(8, 10); //政策法规
        ParamUtil.setRequestAttr(request, "zcfg", contents8);

        Content[] contents9 = contentService.getLatestContents(9, 10); //资料下载
        ParamUtil.setRequestAttr(request, "zlxz", contents9);


        return "/szcea/home.jsp";
    }
}
