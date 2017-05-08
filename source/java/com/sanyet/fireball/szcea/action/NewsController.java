package com.sanyet.fireball.szcea.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sanyet.fireball.base.AppConsts;
import com.sanyet.fireball.base.AppContext;
import com.sanyet.fireball.base.AppUtil;
import com.sanyet.fireball.base.acl.AccessChecker;
import com.sanyet.fireball.base.acl.PrivilegeCst;
import com.sanyet.fireball.base.action.ControllerHelper;
import com.sanyet.fireball.base.entity.Attachment;
import com.sanyet.fireball.base.entity.Group;
import com.sanyet.fireball.base.entity.Role;
import com.sanyet.fireball.base.entity.SearchParam;
import com.sanyet.fireball.base.entity.SearchResult;
import com.sanyet.fireball.base.service.GroupService;
import com.sanyet.fireball.base.service.RoleService;
import com.sanyet.fireball.base.util.ConfigUtil;
import com.sanyet.fireball.base.util.FileUtil;
import com.sanyet.fireball.base.util.ParamUtil;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.base.validation.Validator;
import com.sanyet.fireball.content.entity.Catalog;
import com.sanyet.fireball.content.entity.Content;
import com.sanyet.fireball.content.service.ContentService;
import com.sanyet.fireball.content.validator.ContentValidator;
import com.sanyet.fireball.szcea.ContentConsts;
import com.sanyet.fireball.szcea.NewsConsts;
import com.sanyet.fireball.szcea.SzceaCst;

@Controller
@RequestMapping("/news")
public class NewsController {
    private static final Logger logger = LogManager.getLogger(NewsController.class);
    
    @Autowired
    private ContentService contentService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private GroupService groupService;
    
    @RequestMapping("/manage")
    public String manage(HttpServletRequest request) throws Exception {
        return search(request);
    }
    
    @RequestMapping("/catalog/search")
    public String catalogSearch(HttpServletRequest request) throws Exception {
        String schName = ParamUtil.getString(request, "schName");
        String schParentName = ParamUtil.getString(request, "schParentName");
        int pageNo = ParamUtil.getInt(request, "pageNo", 1);
        String orderByColumn = ParamUtil.getString(request, "orderByColumn");
        String orderByType = ParamUtil.getString(request, "orderByType");
        // additional params
        String isBrowser = ParamUtil.getString(request, "isBrowser");
        SearchParam sp = new SearchParam();
        if (!StringUtil.isEmpty(schName)) {
            sp.addFilter("schName", "%" + schName + "%", true);
        }
        if (!StringUtil.isEmpty(schParentName)) {
            sp.addFilter("schParentName", "%" + schParentName + "%", true);
        }
        AppContext appCtx = AppUtil.getAppContext();
        if (appCtx == null) {
            throw new RuntimeException("the session is not authorized.");
        }
        //会员默认只能查到会展预告
        Group[] groups = groupService.getGroupsByUser(appCtx.getUserId());
        for(Group group : groups){
            if(SzceaCst.CM_GROUP_MEMBER  == group.getId()){
                sp.addFilter("schParentId", ContentConsts.CT_CATALOG_TRAILER, true); 
            }
        }
        sp.setPageNo(pageNo);
        if (!StringUtil.isEmpty(orderByColumn)) {
            sp.setOrderBy(orderByColumn, orderByType);
        }
        sp.setPageSize(ConfigUtil.getInt("page.size"));

        SearchResult<Catalog> sr = contentService.searchCatalogs(sp);
        request.setAttribute("l_searchResult", sr);
        request.setAttribute("l_searchParam", sp);

        String view = "/content/catalogList.jsp";
        if (!StringUtil.isEmpty(isBrowser)) {
            ParamUtil.setRequestAttr(request, "isMultiSelect", ParamUtil.getBoolean(request, "isMultiSelect"));
            ParamUtil.setRequestAttr(request, "callback", ParamUtil.getString(request, "callback"));
            view = "/content/ceaCatalogBrowser.jsp";
        }
        return view;
    }
    
    @RequestMapping("/search")
    public String search(HttpServletRequest request) throws Exception {
        String schName = ParamUtil.getString(request, "schName");
        String schCatalogName = ParamUtil.getString(request, "schCatalogName");
        int pageNo = ParamUtil.getInt(request, "pageNo", 1);
        String orderByColumn = ParamUtil.getString(request, "orderByColumn");
        String orderByType = ParamUtil.getString(request, "orderByType");
        // additional params
        String isBrowser = ParamUtil.getString(request, "isBrowser");
        SearchParam sp = new SearchParam();
        if (!StringUtil.isEmpty(schName)) {
            sp.addFilter("schName", "%" + schName + "%", true);
        }
        if (!StringUtil.isEmpty(schCatalogName)) {
            sp.addFilter("schCatalogName", "%" + schCatalogName + "%", true);
        }
        
        //根据用户id知道他是会员用户还是员工用户，会员查询时要带上自己的id,员工查询所有用户的记录
        //会员用户时赋值
        AppContext appCtx = AppUtil.getAppContext();
        if (appCtx == null)
            throw new RuntimeException("app context is initialized.");
        Group[] groups = groupService.getGroupsByUser(appCtx.getUserId());
        
        int groupId = 0;
        String view = "/news/staffNewsList.jsp";//默认返回链接
        boolean flag = true;
        if (groups != null) {
            for (Group group : groups) {
                groupId = group.getId();
                if(groupId == 103){
                    sp.addFilterParam("schCreatedBy", appCtx.getUserId()); 
//                    //还要修改通知前台的
//                    ParamUtil.setSessionAttr(request, "groupId", groupId);
////                    request.setAttribute("groupId", groupId);
                    view = "/news/memberNewsList.jsp";
                    flag = false;
                    break;
                }else{
                    view = "/news/staffNewsList.jsp";
//                    ParamUtil.setSessionAttr(request, "groupId", groupId);
////                    request.setAttribute("groupId", groupId);
                }
            }
        }
        if(flag){
            //和原有的content搜索分开，只查会员已审批的新闻
            //把metaKeyword（seo关键字），metaDescription（seo描述）在创建时屏蔽，写成会员作为搜索条件
            sp.addFilterParam("metaKeyword", "员工");
            sp.addFilterParam("metaDescription", "员工");
            sp.addFilterParam("status", "A");
        }
        sp.setPageNo(pageNo);
        if (!StringUtil.isEmpty(orderByColumn)) {
            sp.setOrderBy(orderByColumn, orderByType);
        }
        sp.setPageSize(ConfigUtil.getInt("page.size"));

        SearchResult<Content> sr = contentService.searchContents(sp);
        request.setAttribute("l_searchResult", sr);
        request.setAttribute("l_searchParam", sp);
      
        if (!StringUtil.isEmpty(isBrowser)) {
            view = "/content/contentBrowser.jsp";
        }
        return view;
    }
    
    @RequestMapping("/approve")
    public String approve(HttpServletRequest request) throws Exception {
        String schName = ParamUtil.getString(request, "schName");
        String schCatalogName = ParamUtil.getString(request, "schCatalogName");
        int pageNo = ParamUtil.getInt(request, "pageNo", 1);
        String orderByColumn = ParamUtil.getString(request, "orderByColumn");
        String orderByType = ParamUtil.getString(request, "orderByType");
        // additional params
        SearchParam sp = new SearchParam();
        if (!StringUtil.isEmpty(schName)) {
            sp.addFilter("schName", "%" + schName + "%", true);
        }
        if (!StringUtil.isEmpty(schCatalogName)) {
            sp.addFilter("schCatalogName", "%" + schCatalogName + "%", true);
        }
        sp.addFilterParam("metaKeyword", "员工");
        sp.addFilterParam("metaDescription", "员工");
        sp.addFilter("status", NewsConsts.CT_STATUS_PENDING, true);
        sp.setPageNo(pageNo);
        if (!StringUtil.isEmpty(orderByColumn)) {
            sp.setOrderBy(orderByColumn, orderByType);
        }
        sp.setPageSize(ConfigUtil.getInt("page.size"));

        SearchResult<Content> sr = contentService.searchContents(sp);
        request.setAttribute("l_searchResult", sr);
        request.setAttribute("l_searchParam", sp);
      
        String view = "/news/approveList.jsp";
//        if (isBrowser) {
//            ParamUtil.setRequestAttr(request, "isMultiSelect", ParamUtil.getBoolean(request, "isMultiSelect"));
//            ParamUtil.setRequestAttr(request, "callback", ParamUtil.getString(request, "callback"));
//            view = "/activity/activityBrowser.jsp";
//        }
        return view;
    }
    
    @RequestMapping("/create")
    public String createConference(HttpServletRequest request) throws Exception {
        return "/news/newsEdit.jsp";
    }
    
    @RequestMapping("/save")
    public String save(HttpServletRequest request) {
        int id = ParamUtil.getInt(request, "id", 0);

        Content content = new Content();
        content.setName(ParamUtil.getString(request, "name"));
        Catalog catalog = new Catalog();
        catalog.setId(ParamUtil.getInt(request, "catalogId", 0));
        content.setCatalog(catalog);
        content.setTitle(ParamUtil.getString(request, "title"));
        content.setShowTitle(StringUtil.getBoolean(ParamUtil.getString(request, "showTitle")));
        content.setSummary(ParamUtil.getString(request, "summary"));
        content.setContent(ParamUtil.getString(request, "contentTxt"));
        content.setAuthor(ParamUtil.getString(request, "author"));
        content.setSource(ParamUtil.getString(request, "source"));
        content.setTag(ParamUtil.getString(request, "tag"));
        //作为员工查会员新闻的条件
        content.setMetaKeywords("员工");
        content.setMetaDescription("员工");
        content.setCanComment(StringUtil.getBoolean(ParamUtil.getString(request, "canComment")));
        content.setStickTop(StringUtil.getBoolean(ParamUtil.getString(request, "stickTop")));
        content.setPublishDate(ParamUtil.getDate(request, "publishDate"));
        content.setStatus(ParamUtil.getString(request, "status"));
        content.setExtraAttrs(ControllerHelper.getExtraAttrs(request));
        Attachment[] attchments = ControllerHelper.getAttachments(request);
        content.setAttachments(attchments);

        Validator<Content> validator = new ContentValidator(request);
        if (validator.validate()) {
            // save the attachments to local disk;
            if (attchments != null) {
                for (Attachment attachment : attchments) {
                    String fileData = attachment.getData();
                    if (StringUtil.isNotEmpty(fileData)) {
                        if (fileData.indexOf("id_") != -1) {
                            attachment.setId(Integer.parseInt(fileData.substring(3)));
                        } else {
                            Map<String, Object> result = FileUtil.parseDataUrl(fileData);
                            String path = FileUtil.saveUploadedFile(AppConsts.DIR_CONTENT, attachment.getName(), (byte[]) result.get("fileData"));
                            attachment.setPath(path);
                            attachment.setSize((double) result.get("fileSize"));
                            attachment.setMimeType((String) result.get("mimeType"));
                        }
                    }
                }
            }
            if (id > 0) {
                // retrieve the old entity first
                Content entity = contentService.getContent(id);
                entity.setName(content.getName());
                entity.setCatalog(content.getCatalog());
                entity.setTitle(content.getTitle());
                entity.setShowTitle(content.isShowTitle());
                entity.setSummary(content.getSummary());
                entity.setContent(content.getContent());
                entity.setAuthor(content.getAuthor());
                entity.setSource(content.getSource());
                entity.setTag(content.getTag());
                entity.setMetaKeywords(content.getMetaKeywords());
                entity.setMetaDescription(content.getMetaDescription());
                entity.setCanComment(content.isCanComment());
                entity.setStickTop(content.isStickTop());
                entity.setPublishDate(content.getPublishDate());
                entity.setStatus(content.getStatus());
                entity.setAttachments(content.getAttachments());

                contentService.updateContent(entity);
            } else {
                contentService.createContent(content);
            }
            logger.info("A content has been created successfully, redirecting...");
            return unspecified(request);
        } else {
            logger.info("Content validation failed, redirecting to info page...");
            ParamUtil.setRequestAttr(request, "entity", content);
            ParamUtil.setRequestAttr(request, "validator", validator);
            return "/news/newsEdit.jsp";
        }
    }
    
    @RequestMapping(value="/status")
    public String changeStatus(HttpServletRequest request) throws Exception {
        int id = ParamUtil.getInt(request, "id");
        Content entity = contentService.getContent(id, false);
        String remarks = ParamUtil.getString(request, "remarks");
        entity.setRemarks(remarks);
        String result = ParamUtil.getString(request, "result");
        if ("Y".equals(result)) {
            entity.setStatus(NewsConsts.CT_STATUS_ACTIVE);
        }else{
            entity.setStatus(NewsConsts.CT_STATUS_INACTIVE);
        }
        contentService.updateContent(entity);
        if ("approve".equals(ParamUtil.getString(request, "from"))) {
            return "redirect:/news/approve";
        } else {
            return "redirect:/news/manage";
        }
       
    }
    
    @RequestMapping(value="/view/{id}")
    public String view(@PathVariable int id, HttpServletRequest request) throws Exception {
        AccessChecker.hasAccessRight(PrivilegeCst.CT_RETRIEVE);
        
        Content entity = contentService.getContent(id, false);
        ParamUtil.setRequestAttr(request, "entity", entity);
        if (entity != null) {
            ParamUtil.setRequestAttr(request, "attachments", entity.getAttachments());
        }
        return "/news/newsView.jsp";
    }

    @RequestMapping(value="/staffView/{id}")
    public String staffView(@PathVariable int id, HttpServletRequest request) throws Exception {
        AccessChecker.hasAccessRight(PrivilegeCst.CT_RETRIEVE);
        
        Content entity = contentService.getContent(id, false);
        ParamUtil.setRequestAttr(request, "entity", entity);
        if (entity != null) {
            ParamUtil.setRequestAttr(request, "attachments", entity.getAttachments());
        }
        return "/news/staffNewsView.jsp";
    }
    
    @RequestMapping(value="/approveView/{id}")
    public String approveView(@PathVariable int id, HttpServletRequest request) throws Exception {
        AccessChecker.hasAccessRight(PrivilegeCst.CT_RETRIEVE);
        
        Content entity = contentService.getContent(id, false);
        ParamUtil.setRequestAttr(request, "entity", entity);
        if (entity != null) {
            ParamUtil.setRequestAttr(request, "attachments", entity.getAttachments());
        }
        return "/news/approveNews.jsp";
    }
    
    @RequestMapping(value="/edit/{id}")
    public String edit(@PathVariable int id, HttpServletRequest request) throws Exception {
        AccessChecker.hasAccessRight(PrivilegeCst.CT_UPDATE);
        
        //得到用户的roleid，只有roleid为1的超级管理员才可以改变content状态
        //从待审批P可以改为已审批A，停用I
        AppContext appCtx = AppUtil.getAppContext();
        if (appCtx == null) {
            throw new RuntimeException("the session is not authorized.");
        }
        Role role = roleService.getUserRole(appCtx.getUserId());
        if(role != null){
            request.setAttribute("roleId", role.getId());
        }else{
            request.setAttribute("roleId", 0); 
        }
        
        Content entity = contentService.getContent(id, false);
        ParamUtil.setRequestAttr(request, "entity", entity);
        if (entity != null) {
            ParamUtil.setRequestAttr(request, "attachments", entity.getAttachments());
        }
        return "/news/newsEdit.jsp";
    }
    
    @RequestMapping(value="/delete")
    public String delete(HttpServletRequest request) throws Exception {
        AccessChecker.hasAccessRight(PrivilegeCst.CT_DELETE);
        
        int[] ids = ParamUtil.getInts(request, "selector");
        if (ids != null) {
            contentService.deleteContents(ids);
        }
        int id = ParamUtil.getInt(request, "id");
        if (id > 0) {
            contentService.deleteContent(id);
        }
        return unspecified(request);
    }
    
    @RequestMapping
    public String unspecified(HttpServletRequest request) {
        logger.info("Accessing to CONTENT...");
        AppContext appCtx = AppUtil.getAppContext();
        if (appCtx != null) {
            appCtx.setModule(AppConsts.MD_CONTENT);
        }
        return "redirect:/news/manage";
    }
    
}
