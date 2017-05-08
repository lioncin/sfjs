/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.tag;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

import com.sanyet.fireball.base.AppUtil;
import com.sanyet.fireball.base.entity.SearchParam;
import com.sanyet.fireball.base.entity.SearchResult;
import com.sanyet.fireball.base.entity.User;
import com.sanyet.fireball.base.message.MessageUtil;
import com.sanyet.fireball.base.service.UserService;
import com.sanyet.fireball.base.util.ConfigUtil;
import com.sanyet.fireball.base.util.DateUtil;
import com.sanyet.fireball.base.util.FileUtil;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.customer.entity.Customer;
import com.sanyet.fireball.customer.service.CustomerService;
import com.sanyet.fireball.szcea.CustomerConsts;

/**
 * <f:member orderBy="" orderByType="" size=""/>
 *
 * @author hanjian
 */
public class MemberTag extends TagSupport {
    private static final long serialVersionUID = 1L;

    private static final String PATH_SEP = "/";
    
    private String orderBy;
    private String orderByType;
    private int size;
    

    public MemberTag() {
        super();
        init();
    }

    // resets local state
    private void init() {
        orderBy = null;
        orderByType = null;
        size = 0;
    }

    // Releases any resources we may have (or inherit)
    public void release() {
        super.release();
        init();
    }

    public int doStartTag() throws JspException {
        try {
            String html = "";
            CustomerService customerService = AppUtil.getBean(CustomerService.class);
            UserService userService = AppUtil.getBean(UserService.class);
            SearchParam sp = new SearchParam();
            // 默认最新的五条会员
            sp.addFilterParam("crStatus", CustomerConsts.CR_STATUS_NORMAL);
            if (StringUtil.isNotEmpty(orderBy) && StringUtil.isNotEmpty(orderByType)) {
                sp.setOrderBy(orderBy, orderByType);
            } else {
                sp.setOrderBy(Customer.COL_CREATED_AT, SearchParam.DESCENDING);
            }
            sp.setPageNo(1);
            if (size > 0) {
                sp.setPageSize(size);
            } else {
                sp.setPageSize(5);
            }
            SearchResult<Customer> customers = customerService.searchCustomers(sp);
            int count = 0;
            if (customers != null && customers.getRows() != null) {
                List<Customer> customerList = customers.getRows();
                count = customerList.size();
                StringBuilder sb = new StringBuilder();
                // 默认头像地址
                String defaultAvatarUrl = PATH_SEP + ConfigUtil.getString("app.name") + "/statics/images/default_avatar.png";
                //sb.append("<div class=\"all_size" + count + "\">");
                for(int i = 0; i < count; i++){
                    Customer customer = customerList.get(i);
                    User user = userService.getUser(customer.getLoginUser().getId());
                    int cusomterId = customerList.get(i).getId();
                    String url = PATH_SEP + ConfigUtil.getString("app.name")+ "/member/" + cusomterId;
                    
                    sb.append("<a class=\"member-item\" href=\""+url+"\">");
                    sb.append(" <div class=\"member-item-b\">");
                    sb.append("     <div>会员名称</div>");
                    sb.append("     <div>"+customer.getCompanyName()+"</div>");
                    sb.append("     <div>入会时间</div>");
                    sb.append("     <div>"+DateUtil.formatDate(user.getCreatedAt())+"</div>");
                    sb.append("</div></a>");

                    // if (i + 1 == count) {
                    // sb.append("<a href=\""+url+"\" class=\"member-i left last size" + count + "\">");
                    // } else {
                    // sb.append("<a href=\""+url+"\" class=\"member-i left size" + count + "\">");
                    // }
                    // if (user.getProfile() != null && user.getProfile().getAvatarPath() != null && user.getProfile().getAvatarPath() != "") {
                    // sb.append("  <div class=\"avatar\"><img alt=\"pic\" src=\"" + FileUtil.getDownloadUrl(user.getProfile().getAvatarPath()) + "\" onerror=\"this.src='" + defaultAvatarUrl + "'\"  /></div>");
                    // } else {
                    // sb.append("  <div class=\"avatar\"><img alt=\"pic\" src=\"" + defaultAvatarUrl + "\" /></div>");
                    // }
                    // //sb.append("  <div class=\"name\">" + MessageUtil.getMessage("ce.wetsite.home.admin") + " : " + user.getUsername() + "</div>");
                    // sb.append("  <div class=\"name\">" + customer.getCompanyName() + "</div>");

                    // sb.append("  <div class=\"detail hidden\">");
                    // //sb.append("      <div class=\"c\">" + MessageUtil.getMessage("ce.wetsite.home.admin") + " : " + user.getUsername() + "</div>");
                    // sb.append("      <div class=\"c\">" + customer.getCompanyName() + "</div>");
                    // sb.append("      <div class=\"c\">" + MessageUtil.getMessage("ce.wetsite.home.addtime") + " : " + DateUtil.formatDate(user.getCreatedAt()) + "</div>");
                    // if (customer.getMainBusiness() != null) {
                    // //sb.append("      <div class=\"c\">" + MessageUtil.getMessage("ce.wetsite.home.detail") + " : " + user.getProfile().getRemarks() + "</div>"); 
                    // sb.append("      <div class=\"c\">" + MessageUtil.getMessage("ce.wetsite.home.detail") + " : " + customer.getMainBusiness() + "</div>");
                    // } else {
                    // sb.append("      <div class=\"c\">" + MessageUtil.getMessage("ce.wetsite.home.detail") + "</div>"); 
                    // }
                    // sb.append("  </div>");
                    // sb.append("  <div class=\"window\"><div class=\"bg\"></div></div>");
                    // sb.append("</a>");
                }
                //sb.append("</div>");
                sb.append("<div class=\"cls\"></div>");
                html = sb.toString();
            }

            pageContext.getOut().print(html);
        } catch (Exception ex) {
            throw new JspTagException("MemberTag: " + ex.getMessage());
        }
        return SKIP_BODY;
    }

    public int doEndTag() {
        return EVAL_PAGE;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    public void setOrderByType(String orderByType) {
        this.orderByType = orderByType;
    }

    public void setSize(int size) {
        this.size = size;
    }
}
