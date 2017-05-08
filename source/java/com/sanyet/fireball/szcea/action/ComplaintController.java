package com.sanyet.fireball.szcea.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sanyet.fireball.base.entity.Comment;
import com.sanyet.fireball.base.entity.SearchParam;
import com.sanyet.fireball.base.entity.SearchResult;
import com.sanyet.fireball.base.service.CommentService;
import com.sanyet.fireball.base.util.ConfigUtil;
import com.sanyet.fireball.base.util.ParamUtil;
import com.sanyet.fireball.base.util.StringUtil;

@Controller
@RequestMapping("/complaint")
public class ComplaintController {
    
    @Autowired
    private CommentService commentService;
    
    @RequestMapping("/manage")
    public String manage(HttpServletRequest request){
        return search(request);
    }
    
    @RequestMapping("/search")
    public String search(HttpServletRequest request) {
        String schName = ParamUtil.getString(request, "schName");
        String schPhone = ParamUtil.getString(request, "schPhone");
        int pageNo = ParamUtil.getInt(request, "pageNo", 1);
        String orderByColumn = ParamUtil.getString(request, "orderByColumn");
        String orderByType = ParamUtil.getString(request, "orderByType");
        SearchParam sp = new SearchParam();
        sp.addFilterParam("schRefType", 0);
        sp.addFilterParam("schRefId", "COMPLAINTS");
        if (!StringUtil.isEmpty(schName)) {
            sp.addFilterParam("schName", "%"+schName+"%");
        }
        if (!StringUtil.isEmpty(schPhone)) {
            sp.addFilterParam("schPhone", "%"+schPhone+"%");
        }
        sp.setPageNo(pageNo);
        if (!StringUtil.isEmpty(orderByColumn)) {
            sp.setOrderBy(orderByColumn, orderByType);
        }
        sp.setPageSize(ConfigUtil.getInt("page.size"));
        
        SearchResult<Comment> sr = commentService.searchComments(sp);
        request.setAttribute("l_searchResult", sr);
        request.setAttribute("l_searchParam", sp);
        return "/complaint/complaintList.jsp";
    }
    
    @RequestMapping(value="/view/{id}")
    public String view(@PathVariable int id, HttpServletRequest request) throws Exception {
        Comment comment = commentService.getComment(id);
        ParamUtil.setRequestAttr(request, "entity", comment);
        return "/complaint/complaintView.jsp";
    }
    
    @RequestMapping(value="/delete")
    public String delete(HttpServletRequest request) throws Exception {
        int[] ids = ParamUtil.getInts(request, "selector");
        if (ids != null) {
            commentService.deleteComments(ids);
        }
        int id = ParamUtil.getInt(request, "id");
        if (id > 0) {
            commentService.deleteComments(id);
        }
        return search(request);
    }
    
}
