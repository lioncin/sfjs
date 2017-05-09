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
    private MessageService messageService;
    
    @Autowired
    private ContentService contentService;
    
    @Autowired
    private AttachmentService attachmentService;
    
    @Autowired
    private CustomerService customerService;
        
    @Autowired
    private CommentService commentService;
    
    @Autowired
    private ActivityService activityService;
    
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
        
        //ads
        Content[] adsContent = contentService.getLatestContents(ContentConsts.CT_CATALOG_AD, 5);
        if(adsContent != null && adsContent.length > 0){
            Content c = adsContent[0];
            Attachment[] attas = attachmentService.getAttachments(Content.TABLE_NAME, c.getId());
            if (attas != null) {
                int attaSize = attas.length;
                String[] adsPath = new String[attaSize];
                for(int j=0;j<attaSize;j++){
                    adsPath[j] = attas[j].getPath();
                }
                ParamUtil.setRequestAttr(request, "adsPath", adsPath);
            }
        }
        
        //会展专题
        String projectImg = "";
        Content[] projects = contentService.getLatestContents(ContentConsts.CT_CATALOG_PROJECT, 1);
        if(projects != null && projects.length > 0){
            Content p = projects[0];
            Attachment[] pas = attachmentService.getAttachments(Content.TABLE_NAME, p.getId());
            if(pas != null && pas.length > 0){
                Attachment pa = pas[0];
                projectImg = pa.getPath();
            }
        }
        ParamUtil.setRequestAttr(request, "projectImg", projectImg);
        
        //会展预告   默认展示本市会展
        Content[] trailerContent = contentService.getLatestContents(ContentConsts.CT_CATALOG_BSHZ, 8);
        ParamUtil.setRequestAttr(request, "trailerContent", trailerContent);
        
        //会展服务  默认展示会展精英
        Content[] serviceContent = contentService.getLatestContents(ContentConsts.CT_CATALOG_HZJY, 8);
        ParamUtil.setRequestAttr(request, "serviceContent", serviceContent);

        //精彩瞬间
        Content[] jcContent = contentService.getLatestContents(ContentConsts.CT_CATALOG_JCSJ, 3);

        if(jcContent != null && jcContent.length > 0){
            for (Content content : jcContent) {
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
            
            ParamUtil.setRequestAttr(request, "jingcaiContent" , jcContent);
        }
        
        
        //场馆介绍
        Content[] venueContent = contentService.getLatestContents(ContentConsts.CT_CATALOG_VENUE, 10);
        if(venueContent != null && venueContent.length > 0){
            for (Content content : venueContent) {
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
            
            ParamUtil.setRequestAttr(request, "nevueImgs", venueContent);
        }
        
        return "/szcea/home.jsp";
    }

    /* 下载页面 */
    @RequestMapping("download")
    public String download(HttpServletRequest request){
        Content[] content = contentService.getLatestContents(ContentConsts.CT_CATALOG_DOWN, 100);
        ParamUtil.setRequestAttr(request, "content", content);
        return "/szcea/download.jsp";
    }

    /* 会展服务 */
    @RequestMapping("service/{id}")
    public String service(@PathVariable int id, HttpServletRequest request){
        return "/szcea/service.jsp";
    }
    
    /** 政策 **/
    @RequestMapping("policy/{id}")
    public String policy(@PathVariable int id,HttpServletRequest request){
        ParamUtil.setRequestAttr(request, "type" , id);
        return "/szcea/policy.jsp";
    }

    /** 概况页面 **/
    @RequestMapping("gaikuang/{id}")
    public String gaikuang(@PathVariable int id,HttpServletRequest request){
        ParamUtil.setRequestAttr(request, "type" , id);
        return "/szcea/gaikuang.jsp";
    }

    /** 会展机构 **/
    @RequestMapping("org/{id}")
    public String org(@PathVariable int id,HttpServletRequest request){
        // Content [] c = contentService.getLatestContents(ContentConsts.CT_CATALOG_INSTITUTION, 100);
        ParamUtil.setRequestAttr(request, "path", ConfigUtil.getString("file.server.path"));
        ParamUtil.setRequestAttr(request, "type", id);
        return "/szcea/org.jsp";
    }
    
    @RequestMapping(value="getOrg", produces="application/json; charset=UTF-8")
    public @ResponseBody String getOrg(HttpServletRequest request) {
        int num = Integer.parseInt(ParamUtil.getString(request, "limit"));
        int type = Integer.parseInt(ParamUtil.getString(request, "type"));
        Content[] contents = null;
        SearchParam sp = new SearchParam();
        List<Content> c = null;
        if(type == 9){
            sp.addFilter("schCatalogId", ContentConsts.CT_CATALOG_ZBDW, true);
//            contents = contentService.getLatestContents(ContentConsts.CT_CATALOG_ZBDW, num);
        } else{
            sp.addFilter("schCatalogId", ContentConsts.CT_CATALOG_CBDW, true);
//            contents = contentService.getLatestContents(ContentConsts.CT_CATALOG_CBDW, num);
        }
        sp.addFilter("status", "A", true);
        SearchResult<Content> sr = contentService.searchContents(sp);
        c = sr.getRows();
        int size = c.size();
        if(size > 0){
            contents = c.toArray(new Content[size]);
        }
        // image
        if (contents != null && contents.length > 0) {
            for (Content content : contents) {
                Attachment[] attachments = attachmentService.getAttachments(Content.TABLE_NAME, content.getId());
                if (attachments != null && attachments.length > 0) {
                    for (Attachment attachment : attachments) {
                        Attachment[] attachmentList = { attachment };
                        content.setAttachments(attachmentList);
                      }
//                    List<Attachment> images = new ArrayList<Attachment>();
//                    for (Attachment attachment : attachments) {
//                        if (attachment.getMimeType().startsWith("image")) {
//                            images.add(attachment);
//                        }
//                    }
//                    int imgLen = images.size();
//                    if (imgLen > 0) {
//                        content.setAttachments((Attachment[])images.toArray(new Attachment[imgLen]));
//                    }
                }
            }
        }
        ActionRes res = new ActionRes();
        res.addData("data", contents);
        return res.toJsonString();
    }
    
    /** 展会动态 **/
    @RequestMapping("dongtai/{id}")
    public String dongtai(@PathVariable int id,HttpServletRequest request){
        ParamUtil.setRequestAttr(request, "path", ConfigUtil.getString("file.server.path"));
        ParamUtil.setRequestAttr(request, "type", id);
        return "/szcea/dongtai.jsp";
    }
    
    @RequestMapping(value="getPolicy", produces="application/json; charset=UTF-8")
    public @ResponseBody String getPolicy(HttpServletRequest request) {
        int num = Integer.parseInt(ParamUtil.getString(request, "limit"));
        int type = Integer.parseInt(ParamUtil.getString(request, "type"));
        ActionRes res = new ActionRes();
        Content[] c = null;
        SearchParam sp = new SearchParam();
        List<Content> contents = null;
        if(type == 13){
            sp.addFilter("schCatalogId", ContentConsts.CT_CATALOG_ZTYJ, true);
//            c = contentService.getLatestContents(ContentConsts.CT_CATALOG_ZTYJ, num);
        } else if(type == 15){
            sp.addFilter("schCatalogId", ContentConsts.CT_CATALOG_YNDT, true);
//            c = contentService.getLatestContents(ContentConsts.CT_CATALOG_YNDT, num);
        } else {
            sp.addFilter("schCatalogId", type, true);
//            c = contentService.getLatestContents(type, num);
        }
        sp.addFilter("status", "A", true);
        SearchResult<Content> sr = contentService.searchContents(sp);
        contents = sr.getRows();
        int size = contents.size();
        if(size > 0){
            c = contents.toArray(new Content[size]);
        }
        res.addData("data", c);
        return res.toJsonString();
    }
    
    @RequestMapping(value="getGaikuang", produces="application/json; charset=UTF-8")
    public @ResponseBody String getGaikuang(HttpServletRequest request) {
        int num = Integer.parseInt(ParamUtil.getString(request, "limit"));
        int type = Integer.parseInt(ParamUtil.getString(request, "type"));
        SearchParam sp = new SearchParam();
        ActionRes res = new ActionRes();
        Content[] c = null;
        List<Content> Contennts = null;
        if(type == 2){
            sp.addFilter("schCatalogId", ContentConsts.CT_CATALOG_ZHANGC, true);
//            c = contentService.getLatestContents(ContentConsts.CT_CATALOG_ZHANGC, num);
        }else if(type == 3){
            sp.addFilter("schCatalogId", ContentConsts.CT_CATALOG_ASSOCIATION, true);
//            c = contentService.getLatestContents(ContentConsts.CT_CATALOG_ASSOCIATION, num);
        }else{
            sp.addFilter("schCatalogId", ContentConsts.CT_CATALOG_ZYWYH, true);
//            c = contentService.getLatestContents(ContentConsts.CT_CATALOG_ZYWYH, num);
        }
        sp.addFilter("status", "A", true);
        SearchResult<Content> sr = contentService.searchContents(sp);
        Contennts = sr.getRows();
        int size = Contennts.size();
        if(size > 0){
            c = Contennts.toArray(new Content[size]);
        }
        res.addData("data", c);
        return res.toJsonString();
    }
    
    @RequestMapping(value="getYuGao", produces="application/json; charset=UTF-8")
    public @ResponseBody String getYuGao(HttpServletRequest request) {
        int num = Integer.parseInt(ParamUtil.getString(request, "limit"));
        int type = Integer.parseInt(ParamUtil.getString(request, "type"));
        
        Content[] contents = null;
        ActionRes res = new ActionRes();
        contents = contentService.getLatestContents(type, num);

        if(contents != null){
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
        
        res.addData("data", contents);
        return res.toJsonString();
    }
    
    @RequestMapping(value="getFuWu", produces="application/json; charset=UTF-8")
    public @ResponseBody String getFuWu(HttpServletRequest request) {
        int num = Integer.parseInt(ParamUtil.getString(request, "limit"));
        int type = Integer.parseInt(ParamUtil.getString(request, "type"));
        
        ActionRes res = new ActionRes();
        Content[] contents = null;
        if(type == 3){
            contents = contentService.getLatestContents(ContentConsts.CT_CATALOG_HZJY, num);
        }else{
            contents = contentService.getLatestContents(ContentConsts.CT_CATALOG_HZTD, num);
        }
        res.addData("data", contents);
        return res.toJsonString();
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

    /** venue **/
    @RequestMapping("content/{id}")
    public String venue(@PathVariable int id,HttpServletRequest request){
        Content c = contentService.getContent(id);
        Attachment[] attachments = attachmentService.getAttachments(Content.TABLE_NAME, c.getId());
        
        if (attachments != null && attachments.length > 0) {
            for (Attachment attachment : attachments) {
                if(4 == c.getCatalog().getId() && attachment.getMimeType().startsWith("image")){ //精彩瞬间
                    Attachment[] attachmentList = { attachment };
                    ParamUtil.setRequestAttr(request, "jingcais", attachmentList);
                }

                if(8 == c.getCatalog().getId() && attachment.getMimeType().startsWith("image")){ //场馆介绍
                    Attachment[] attachmentList = { attachment };
                    ParamUtil.setRequestAttr(request, "changguans", attachmentList);
                }

                if(11 == c.getCatalog().getId()){ //会展政策才会看到附件
                    Attachment[] attachmentList = { attachment };
                    ParamUtil.setRequestAttr(request, "attachments", attachmentList);
                }
            }
        }
        ParamUtil.setRequestAttr(request, "content", c);
        return "/szcea/content.jsp";
    }
    
    @RequestMapping("dongtaiContent/{id}")
    public String dongtaiContent(@PathVariable int id,HttpServletRequest request){
        Content c = contentService.getContent(id);
        Attachment[] attachments = attachmentService.getAttachments(Content.TABLE_NAME, id);
        if (attachments != null && attachments.length > 0) {
            c.setAttachments(attachments);
        }
        ParamUtil.setRequestAttr(request, "content", c);
        //会展政策才会看到附件
        if(11 == c.getCatalog().getId()){
            ParamUtil.setRequestAttr(request, "attachments", attachments); 
        }
        return "/szcea/dongtaiContent.jsp";
    }
    
    /** 会员 **/
    @RequestMapping("member/{id}")
    public String member(@PathVariable int id,HttpServletRequest request){
        Customer customer = customerService.getCustomer(id);
        String path = "a.png";
        String name = customer.getCompanyName();
        String time = new Date().toString();
        if(customer.getUpdatedAt() != null){
            time = customer.getUpdatedAt().toString();
        }
        String desc = customer.getContact();
        ParamUtil.setRequestAttr(request, "path", path);
        ParamUtil.setRequestAttr(request, "name", name);
        ParamUtil.setRequestAttr(request, "time", time);
        ParamUtil.setRequestAttr(request, "desc", desc);
        return "/szcea/member.jsp";
    }
    
    /** 会展场馆 **/
    @RequestMapping("convention/{id}")
    public String convention(@PathVariable int id, HttpServletRequest request){
        ParamUtil.setRequestAttr(request, "type", id);
        return "/szcea/convention.jsp";
    }
    
    @RequestMapping(value="content", produces="application/json; charset=UTF-8")
    public @ResponseBody String getContent(HttpServletRequest request) {
        int id = Integer.parseInt(ParamUtil.getString(request, "id"));
        Content c = contentService.getContent(id);
        Attachment[] attachments = attachmentService.getAttachments(Content.TABLE_NAME, id);
        if (attachments != null && attachments.length > 0) {
            c.setAttachments(attachments);
        }
//        ParamUtil.setRequestAttr(request, "content", c);
//        //会展政策才会看到附件
//        if(11 == c.getCatalog().getId()){
//            ParamUtil.setRequestAttr(request, "attachments", attachments); 
//        }
        ActionRes res = new ActionRes();
        res.addData("data", c);
        return res.toJsonString();
    }
    
    @RequestMapping(value="getConvention", produces="application/json; charset=UTF-8")
    public @ResponseBody String getConvention(HttpServletRequest request) {
        int num = Integer.parseInt(ParamUtil.getString(request, "limit"));
        int type = Integer.parseInt(ParamUtil.getString(request, "type"));
        
        Content[] contents = null;
        SearchParam sp = new SearchParam();
        List<Content> c = null;
        sp.addFilter("schCatalogId", type, true);
        sp.addFilter("status", "A", true);
//        Content[] contents = contentService.getLatestContents(type, num);
        SearchResult<Content> sr = contentService.searchContents(sp);
        c = sr.getRows();
        int size = c.size();
        if(size > 0){
            contents = c.toArray(new Content[size]);
        }
        // image
        if (contents != null && contents.length > 0) {
            for (Content content : contents) {
                Attachment[] attachments = attachmentService.getAttachments(Content.TABLE_NAME, content.getId());
                if (attachments != null && attachments.length > 0) {
                    List<Attachment> images = new ArrayList<Attachment>();
                    for (Attachment attachment : attachments) {
                        if (attachment.getMimeType().startsWith("image")) {
                            images.add(attachment);
                        }
                    }
                    int imgLen = images.size();
                    if (imgLen > 0) {
                        content.setAttachments((Attachment[])images.toArray(new Attachment[imgLen]));
                    }
                }
            }
        }
        ActionRes res = new ActionRes();
        res.addData("data", contents);
        return res.toJsonString();
    }
    
    @RequestMapping(value="getNewsByCatalog", produces="application/json; charset=UTF-8")
    public @ResponseBody String getNewsByCatalog(HttpServletRequest request) {
        ActionRes res = new ActionRes();
        String catalogId = ParamUtil.getString(request, "catalogId");
        
        SearchParam sp = new SearchParam();
        sp.setPageNo(ParamUtil.getInt(request, "pageNo", 1));
        sp.addFilter("schCatalogId", catalogId, true);
        sp.setPageSize(ConfigUtil.getInt("page.size"));
        SearchResult<Content> sr = contentService.searchContents(sp);
        
        res.addData("data", sr);
        return res.toJsonString();
    }
    
    @RequestMapping("login")
    public String login(HttpServletRequest request){
        return "/szcea/login.jsp";
    }
    
    @RequestMapping("customerlogin")
    public String cusomerLogin(HttpServletRequest request){
        String username = "";
        String password = "";
        if(username!=""&&password!=""){
            return "/fireball/home.jsp";
        }else{
            return "/home.jsp";
        }
    }
    
    /** 投诉建议 **/
    @RequestMapping("/complaint")
    public String complaint(HttpServletRequest request){
        return "/szcea/complaintEdit.jsp";
    }
       
//    @RequestMapping("/sendComplaint")
//    public String sendComplaint(HttpServletRequest request){
//        //投诉建议放在cm_comment表中
//        //name放在AUTHOR_NAME，subject放在content，phone放在AUTHOR_ID，REF_TYPE写Complaints来标识投诉建议
//        String subject = ParamUtil.getString(request, "subject");
//        String name = ParamUtil.getString(request, "name");
//        String phone = ParamUtil.getString(request, "phone");
//        Comment comment = new Comment();
//        comment.setAuthorMobile(phone);
//        comment.setAuthorName(name);
//        comment.setContent(subject);
//        comment.setRefType("COMPLAINTS");
//        commentService.createComment(comment);
//        logger.info("A complaint has been created successfully, redirecting...");
//        ParamUtil.setSessionAttr(request, "sendStatus", "success");
//        return "redirect:/szcea/home";
//    }
    /** 发送投诉建议 **/
    @RequestMapping(value = "/sendComplaint", produces = "application/json; charset=UTF-8")
    public @ResponseBody String sendComplaint(HttpServletRequest request) {
        String subject = ParamUtil.getString(request, "subject");
        String name = ParamUtil.getString(request, "name");
        String phone = ParamUtil.getString(request, "phone");
        Comment comment = new Comment();
        comment.setAuthorMobile(phone);
        comment.setAuthorName(name);
        comment.setContent(subject);
        comment.setRefType("COMPLAINTS");
        commentService.createComment(comment);
   
        ActionRes res = new ActionRes();
        return res.toJsonString();
    }
    
    @RequestMapping(value = "/getLatestMessages", produces = "application/json; charset=UTF-8")
    public @ResponseBody String getLatestMessages(HttpServletRequest request) {
        AppContext appCtx = AppUtil.getAppContext();
        if (appCtx == null) {
            throw new RuntimeException("the session is not authorized.");
        }

        Message[] messages = messageService.getLatestMessages(appCtx.getUserId(), AppConsts.DEFAULT_MESSAGE_COUNT);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("messages", messages);
        ActionRes res = new ActionRes();
        res.addData("html", MessageUtil.getTemplateMessage("/latestMessages", params));
        return res.toJsonString();
    }
    
    @RequestMapping(value = "/getUnreadMessages", produces = "application/json; charset=UTF-8")
    public @ResponseBody String getUnreadMessages(HttpServletRequest request) {
        AppContext appCtx = AppUtil.getAppContext();
        if (appCtx == null) {
            throw new RuntimeException("the session is not authorized.");
        }

        int count = messageService.getUnreadMessages(appCtx.getUserId());
        ActionRes res = new ActionRes();
        res.addData("count", count);
        return res.toJsonString();
    }
    
    @RequestMapping(value = "/clickTopMenu", produces = "application/plain; charset=UTF-8")
    public @ResponseBody void clickTopMenu(HttpServletRequest request) {
        String url = ParamUtil.getString(request, "url");
        ParamUtil.setSessionAttr(request, "clickedTopMenu", url);
        logger.debug(String.format("Clicked on top menu %s.", url));
    }

    @RequestMapping(value = "/clickLeftMenu", produces = "application/plain; charset=UTF-8")
    public @ResponseBody void clickLeftMenu(HttpServletRequest request) {
        String url = ParamUtil.getString(request, "url");
        ParamUtil.setSessionAttr(request, "clickedLeftMenu", url);
        logger.debug(String.format("Clicked on left menu %s.", url));
    }

    @RequestMapping(value = "/getCities", produces = "application/plain; charset=UTF-8")
    public @ResponseBody String getCities(HttpServletRequest request) {
        String province = ParamUtil.getString(request, "province");
        if (StringUtil.isEmpty(province))
            return null;

        province = province.substring(province.indexOf(".") + 1);
        logger.info(String.format("Getting cities for province [%s]...", province));
        MasterCode[] cities = MasterCodeUtil.getChildMasterCodes(province);
        if (cities == null)
            return null;

        JsonArray ja = new JsonArray();
        for (MasterCode city : cities) {
            JsonObject jo = new JsonObject();
            jo.addProperty("code", city.getCode());
            jo.addProperty("label", city.getLabel());
            ja.add(jo);
        }
        String json = new Gson().toJson(ja);
        logger.info(json);
        return json;
    }

    @RequestMapping(value="/getActivitysInMonth", produces="application/json; charset=UTF-8")
    public @ResponseBody String getActivitysInMonth(HttpServletRequest request) {
        int year = ParamUtil.getInt(request, "year");
        int month = ParamUtil.getInt(request, "month");
        String type = ParamUtil.getString(request, "type");
        Activity[] activitys = activityService.getYearMonthActivity(year, month, type);
        ActionRes res = new ActionRes();
        res.addData("activitys", activitys);
        return res.toJsonString();
    }
}
