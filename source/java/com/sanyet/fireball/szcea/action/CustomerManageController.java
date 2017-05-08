/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sanyet.fireball.base.AppContext;
import com.sanyet.fireball.base.AppUtil;
import com.sanyet.fireball.base.entity.SearchParam;
import com.sanyet.fireball.base.entity.SearchResult;
import com.sanyet.fireball.base.entity.User;
import com.sanyet.fireball.base.util.ConfigUtil;
import com.sanyet.fireball.base.util.MiscUtil;
import com.sanyet.fireball.base.util.ParamUtil;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.base.validation.Validator;
import com.sanyet.fireball.customer.entity.Customer;
import com.sanyet.fireball.customer.service.CustomerService;
import com.sanyet.fireball.szcea.CustomerConsts;
import com.sanyet.fireball.szcea.validator.CustomerValidator;

/**
 * CustomerManageController
 *
 * @author hanjian
 */
@Controller
@RequestMapping("/member")
public final class CustomerManageController {
    private static final Logger logger = LogManager.getLogger(CustomerManageController.class);

    @Autowired
    private CustomerService customerService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @RequestMapping("/login")
    public String login(HttpServletRequest request) {
        
        return "/customer/login.jsp";
    }
    
    @RequestMapping("/manage")
    public String manage(HttpServletRequest request) {
        
        return search(request);
    }
    
    @RequestMapping("/search")
    public String search(HttpServletRequest request) {
        String schName = ParamUtil.getString(request, "schName");
        int pageNo = ParamUtil.getInt(request, "pageNo", 1);
        String orderByColumn = ParamUtil.getString(request, "orderByColumn");
        String orderByType = ParamUtil.getString(request, "orderByType");
        String crStatus = ParamUtil.getString(request, "crStatus");
        boolean isBrowser = ParamUtil.getBoolean(request, "isBrowser");
        AppContext appCtx = AppUtil.getAppContext();
        if (appCtx == null)
            throw new RuntimeException("app context is initialized.");

        SearchParam sp = new SearchParam();
        if (!StringUtil.isEmpty(schName)) {
            sp.addFilterParam("schName", schName);
        }
        if (!StringUtil.isEmpty(crStatus)) {
            sp.addFilterParam("crStatus", crStatus);
        }
        
        sp.setPageNo(pageNo);
        if (!StringUtil.isEmpty(orderByColumn)) {
            sp.setOrderBy(orderByColumn, orderByType);
        }
        sp.setPageSize(ConfigUtil.getInt("page.size"));

        SearchResult<Customer> sr = customerService.searchCustomers(sp);
        request.setAttribute("l_searchResult", sr);
        request.setAttribute("l_searchParam", sp);
        String view = "/customer/customerList.jsp";
        if (isBrowser) {
            ParamUtil.setRequestAttr(request, "callback", ParamUtil.getString(request, "callback"));
            view = "/customer/organizationBrowser.jsp";
        }
        return view;
    }
    
    @RequestMapping("/approve")
    public String searchApprove(HttpServletRequest request) {
        String schName = ParamUtil.getString(request, "schName");
        int pageNo = ParamUtil.getInt(request, "pageNo", 1);
        String orderByColumn = ParamUtil.getString(request, "orderByColumn");
        String orderByType = ParamUtil.getString(request, "orderByType");
        String crStatus = CustomerConsts.CR_STATUS_AUTHSTR;
        AppContext appCtx = AppUtil.getAppContext();
        if (appCtx == null)
            throw new RuntimeException("app context is initialized.");

        SearchParam sp = new SearchParam();
        if (!StringUtil.isEmpty(schName)) {
            sp.addFilterParam("schName", schName);
        }
        if (!StringUtil.isEmpty(crStatus)) {
            sp.addFilterParam("crStatus", crStatus);
        }
        
        sp.setPageNo(pageNo);
        if (!StringUtil.isEmpty(orderByColumn)) {
            sp.setOrderBy(orderByColumn, orderByType);
        }
        sp.setPageSize(ConfigUtil.getInt("page.size"));

        SearchResult<Customer> sr = customerService.searchCustomers(sp);
        request.setAttribute("l_searchResult", sr);
        request.setAttribute("l_searchParam", sp);
        return "/customer/customerApproveList.jsp";
    }
    
    @RequestMapping(value="/view/{id}")
    public String view(@PathVariable int id, HttpServletRequest request) throws Exception {
        Customer customer = customerService.getCustomer(id);
        ParamUtil.setRequestAttr(request, "entity", customer);
        if (customer != null) {
            ParamUtil.setRequestAttr(request, "attachments", customer.getAttachments());
        }
        ParamUtil.setRequestAttr(request, "from", ParamUtil.getString(request, "from"));
        return "/customer/customerView.jsp";
    }
    
    @RequestMapping(value="/edit/{id}")
    public String edit(@PathVariable int id, HttpServletRequest request) throws Exception {
        Customer customer = customerService.getCustomer(id);
        ParamUtil.setRequestAttr(request, "entity", customer);
        return "/customer/customerEdit.jsp";
    }
    
    @RequestMapping("/modify")
    public String modify(HttpServletRequest request) throws Exception {
        int id = ParamUtil.getInt(request, "id", 0);
        Customer customer = customerService.getCustomer(id);
        // customer data
        customer.setType(ParamUtil.getString(request, "type"));
        customer.setCompanyName(ParamUtil.getString(request, "companyName"));
        customer.setLicenseNo(ParamUtil.getString(request, "licenseNo"));
        customer.setLegalRep(ParamUtil.getString(request, "legalRep"));
        customer.setRegisteredCapital(ParamUtil.getDouble(request, "registeredCapital", 0));
        customer.setAddress(ParamUtil.getString(request, "address"));
        customer.setMainBusiness(ParamUtil.getString(request, "mainBusiness"));
        customer.setOrgCode(ParamUtil.getString(request, "orgCode"));
        customer.setOrgType(ParamUtil.getString(request, "orgType"));
        customer.setBankName(ParamUtil.getString(request, "bankName"));
        customer.setAccountNo(ParamUtil.getString(request, "accountNo"));
        customer.setTaxNo(ParamUtil.getString(request, "taxNo"));
        customer.setWebsite(ParamUtil.getString(request, "website"));
        customer.setEmail(ParamUtil.getString(request, "email"));
        customer.setContact(ParamUtil.getString(request, "contact"));
        customer.setPhone(ParamUtil.getString(request, "phone"));
        customer.setEstablishedOn(ParamUtil.getDate(request, "established"));
        customer.setHeadcount(ParamUtil.getInt(request, "headcount"));
        customer.setIndustry(ParamUtil.getString(request, "industry"));
        customer.setFax(ParamUtil.getString(request, "fax"));
        
        boolean changePwd = ParamUtil.getBoolean(request, "changePwd");
        boolean passwordCheck = true;
        if (changePwd) {
            // login user
            User user = customer.getLoginUser();
            user.setPassword(passwordEncoder.encode(ParamUtil.getString(request, "newPassword")));
            customer.setLoginUser(user);
        }
        
        Validator<Customer> validator = new CustomerValidator(request, false, changePwd, passwordCheck);
        if (validator.validate()) {
            customerService.updateCustomer(customer, changePwd);
            logger.info("Modify customer data successfully, redirecting...");

            Customer newCustomer = customerService.getCustomer(id);
            ParamUtil.setRequestAttr(request, "entity", newCustomer);
            ParamUtil.setRequestAttr(request, "attachments", newCustomer.getAttachments());
            return "/customer/customerView.jsp";
        } else {
            logger.info("validation failed, redirecting to info page...");
            ParamUtil.setRequestAttr(request, "entity", customer);
            ParamUtil.setRequestAttr(request, "validator", validator);
            if (changePwd) {
                ParamUtil.setRequestAttr(request, "changePassWord", true);
            }
            return "/customer/customerEdit.jsp";
        }
    }
    
    @RequestMapping(value = "/status")
    public String editStatus(HttpServletRequest request) {
        int id = ParamUtil.getInt(request, "id");
        Customer customer = customerService.getCustomer(id);
        String result = ParamUtil.getString(request, "result");
        String remarks = ParamUtil.getString(request, "remarks", "");
        if ("Y".equals(result)) {
            customer.setStatus(CustomerConsts.CR_STATUS_NORMAL);
            customer.setType(ParamUtil.getString(request, "type"));
         
        } else if ("N".equals(result)) {
            customer.setStatus(CustomerConsts.CR_STATUS_REFER);
        } else if (CustomerConsts.CR_STATUS_DISABLE.equals(result)){
            customer.setStatus(CustomerConsts.CR_STATUS_DISABLE);
        } else if (CustomerConsts.CR_STATUS_NORMAL.equals(result)){
            customer.setStatus(CustomerConsts.CR_STATUS_NORMAL);
        }
        customer.setRemarks(ParamUtil.getString(request, "remarks"));
        customerService.updateCustomerStatus(customer);
        if ("Y".equals(result) || "N".equals(result)) {
            //发送邮件通知
            String[] to = {customer.getEmail()};
            String[] cc = null;
            String subject = "会员申请审批通知";
            String text = "member";
            Map<String, Object> html = new HashMap<String, Object>();
            html.put("username", customer.getLoginUser().getUsername());
            html.put("status", result);
            html.put("remarks", remarks);
            try {
                MiscUtil.sendMail(to, cc, subject, text, html);
            } catch (Exception e) {
               logger.error("会员审批结果邮件发送失败");
            }
        }
        if ("approve".equals(ParamUtil.getString(request, "from"))) {
            return searchApprove(request);
        } else {
            return search(request);
        }
    }
    
    @RequestMapping(value="/delete")
    public String delete(HttpServletRequest request) throws Exception {
        int[] ids = ParamUtil.getInts(request, "selector");
        if (ids != null) {
            customerService.deleteCustomers(ids);;
        }
        int id = ParamUtil.getInt(request, "id");
        if (id > 0) {
            customerService.deleteCustomer(id);;
        }
        return unspecified(request);
    }
    
    @RequestMapping
    public String unspecified(HttpServletRequest request) {
        logger.info("Accessing to Customer...");
        return "redirect:/member/manage";
    }
}
