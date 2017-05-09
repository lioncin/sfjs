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
        // 展会动态
        Content[] contents = contentService.getLatestContents(ContentConsts.CT_CATALOG_EXHIBITION, 8);
        if (contents != null && contents.length > 0) {
            // 选取一张图片附件
            for (Content content : contents) {
                Attachment[] attachments = attachmentService.getAttachments(Content.TABLE_NAME, content.getId());
                if (attachments != null && attachments.length > 0) {
                    for (Attachment attachment : attachments) {
                        if (attachment.getMimeType().startsWith("image")) {
                            Attachment[] attachmentList = { attachment };
                            content.setAttachments(attachmentList);
                            break;
                        }
                    }
                }
            }
        }
        ParamUtil.setRequestAttr(request, "exhibitionDynamics", contents);
        
                
        return "/szcea/home.jsp";
    }

    /* 下载页面 */
    @RequestMapping("download")
    public String download(HttpServletRequest request){
        Content[] content = contentService.getLatestContents(ContentConsts.CT_CATALOG_DOWN, 100);
        ParamUtil.setRequestAttr(request, "content", content);
        return "/szcea/download.jsp";
    }

    
    @RequestMapping(value="getDongtai", produces="application/json; charset=UTF-8")
    public @ResponseBody String getDongtai(HttpServletRequest request) {
        int num = Integer.parseInt(ParamUtil.getString(request, "limit"));
        int type = Integer.parseInt(ParamUtil.getString(request, "type"));
        
        ActionRes res = new ActionRes();
        Content[] contents = null;
        SearchParam sp = new SearchParam();
        List<Content> c = null;
        if(type==1){
            sp.addFilter("schCatalogId", ContentConsts.CT_CATALOG_EXHIBITION, true);
//            contents = contentService.getLatestContents(ContentConsts.CT_CATALOG_EXHIBITION, num);
        }
        if(type==4){
            sp.addFilter("schCatalogId", ContentConsts.CT_CATALOG_HOLIDAY, true);
//            contents = contentService.getLatestContents(ContentConsts.CT_CATALOG_HOLIDAY, num);
        }
        sp.addFilter("status", "A", true);
        SearchResult<Content> sr = contentService.searchContents(sp);
        c = sr.getRows();
        int size = c.size();
        if(size > 0){
            contents = c.toArray(new Content[size]);
        }
        if (contents != null) {
            for (Content content : contents) {
                Attachment[] attachments = attachmentService.getAttachments(Content.TABLE_NAME, content.getId());
                if (attachments != null && attachments.length > 0) {
                    for (Attachment attachment : attachments) {
                      Attachment[] attachmentList = { attachment };
                      content.setAttachments(attachmentList);
                    }
                }
            }
        }
        res.addData("data", contents);
        return res.toJsonString();
    }
}
