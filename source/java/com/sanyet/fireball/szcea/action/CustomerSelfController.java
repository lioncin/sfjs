/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.action;

import java.util.ArrayList;
import java.util.List;
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
import com.sanyet.fireball.base.entity.Attachment;
import com.sanyet.fireball.base.entity.Group;
import com.sanyet.fireball.base.entity.Role;
import com.sanyet.fireball.base.entity.User;
import com.sanyet.fireball.base.util.FileUtil;
import com.sanyet.fireball.base.util.ParamUtil;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.base.validation.Validator;
import com.sanyet.fireball.customer.entity.Customer;
import com.sanyet.fireball.customer.service.CustomerService;
import com.sanyet.fireball.szcea.CustomerConsts;
import com.sanyet.fireball.szcea.SzceaCst;
import com.sanyet.fireball.szcea.validator.CustomerValidator;

/**
 * CustomerSelfController
 *
 * @author hanjian
 */
@Controller
@RequestMapping("/organization")
public final class CustomerSelfController {
    private static final Logger logger = LogManager.getLogger(CustomerSelfController.class);

    @Autowired
    private CustomerService customerService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @RequestMapping("/manage")
    public String manage(HttpServletRequest request) {
        
        return unspecified(request);
    }
    
    @RequestMapping("/register")
    public String register(HttpServletRequest request) throws Exception {
        int id = ParamUtil.getInt(request, "id", 0);
        Customer customer = new Customer();
        customer.setId(id);
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
        customer.setStatus(CustomerConsts.CR_STATUS_AUTHSTR);
        customer.setRemarks(ParamUtil.getString(request, "remarks"));
        customer.setIndustry(ParamUtil.getString(request, "industry"));
        customer.setFax(ParamUtil.getString(request, "fax"));

        User loginUser = new User();
        int[] roleIds = {SzceaCst.CM_ROLE_MEMBER};
        if (roleIds != null && roleIds.length > 0) {
            Role[] roles = new Role[roleIds.length];
            for (int i = 0; i < roleIds.length; i++) {
                Role role = new Role();
                role.setId(roleIds[i]);
                roles[i] = role;
            }
            loginUser.setRoles(roles);
        }
        
        int[] groupIds = {SzceaCst.CM_GROUP_MEMBER};
        if (groupIds != null && groupIds.length > 0) {
            Group[] groups = new Group[groupIds.length];
            for (int i = 0; i < groupIds.length; i++) {
                Group group = new Group();
                group.setId(groupIds[i]);
                groups[i] = group;
            }
            loginUser.setGroups(groups);
        }
        loginUser.setPassword(passwordEncoder.encode(ParamUtil.getString(request, "password")));
        loginUser.setUsername(ParamUtil.getString(request, "username"));
        customer.setLoginUser(loginUser);

        Attachment[] attachments = getSupplierFile(request);
        if (attachments != null) {
            customer.setAttachments(attachments);
        }
        
        Validator<Customer> validator = new CustomerValidator(request, true, false, true);
        if (validator.validate()) {
            customerService.createCustomer(customer);
            logger.info("Save customer data successfully, redirecting...");
            ParamUtil.setSessionAttr(request, "registerStatus", "success");
            
            if ("Y".equals(ParamUtil.getString(request, "isFromPublic"))) {
                return "/customer/register.jsp";
//                return "redirect:/szcea/home";
//                return "redirect:/customer/login";
            } else {
                return "/customer/register.jsp";
//                return "redirect:/szcea/home";
//                return "redirect:/customer/login";
            }
        } else {
            logger.info("validation failed, redirecting to info page...");
            ParamUtil.setRequestAttr(request, "entity", customer);
            ParamUtil.setRequestAttr(request, "validator", validator);
            return "/customer/register.jsp";
        }
    }
    
    @RequestMapping(value="/view/{id}")
    public String view(@PathVariable int id, HttpServletRequest request) {
        Customer customer = customerService.getCustomerByUserId(id);
        ParamUtil.setRequestAttr(request, "entity", customer);
        if (customer != null) {
            ParamUtil.setRequestAttr(request, "attachments", customer.getAttachments());
        }
        return "/customer/customerViewSelf.jsp";
    }

    @RequestMapping(value="/edit/{id}")
    public String edit(@PathVariable int id, HttpServletRequest request) throws Exception {
        AppContext appCtx = AppUtil.getAppContext();
        int userId = 0;
        if (appCtx != null) {
            userId = appCtx.getUserId();
        }
        Customer customer = customerService.getCustomer(id);
        // longin user check
        if (userId == customer.getLoginUser().getId()) {
            ParamUtil.setRequestAttr(request, "entity", customer);
            return "/customer/customerEditSelf.jsp";
        }
        return unspecified(request);
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
        customer.setRemarks(ParamUtil.getString(request, "remarks"));
        customer.setIndustry(ParamUtil.getString(request, "industry"));
        customer.setFax(ParamUtil.getString(request, "fax"));
        Attachment[] attachments = getSupplierFile(request);
        // attachments
        customer.setAttachments(attachments);
        
        boolean changePwd = ParamUtil.getBoolean(request, "changePwd");
        boolean passwordCheck = true;
        if (changePwd) {
            String oldPassword = customer.getLoginUser().getPassword();
            String inputOldPW = ParamUtil.getString(request, "oldPassword");
            passwordCheck = passwordEncoder.matches(inputOldPW, oldPassword);
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
            return "/customer/customerViewSelf.jsp";
        } else {
            logger.info("validation failed, redirecting to info page...");
            ParamUtil.setRequestAttr(request, "entity", customer);
            ParamUtil.setRequestAttr(request, "validator", validator);
            if (changePwd) {
                ParamUtil.setRequestAttr(request, "changePassWord", true);
            }
            return "/customer/customerEditSelf.jsp";
        }
    }
    
    private Attachment[] getSupplierFile(HttpServletRequest request) {
        List<Attachment> attachments = new ArrayList<Attachment>();
        //get file name
        String licenseFile = ParamUtil.getString(request, "licenseFile");
        String taxFile= ParamUtil.getString(request, "taxFile");
        String businessCertificate = ParamUtil.getString(request, "businessCertificate");
        String qualificationProve = ParamUtil.getString(request, "qualificationProve");
//        String certificateOfAuthority = ParamUtil.getString(request, "certificateOfAuthority");
//        String workCertificate= ParamUtil.getString(request, "workCertificate");
//        String specimenContract = ParamUtil.getString(request, "specimenContract");
//        String quotation = ParamUtil.getString(request, "quotation");
        String other = ParamUtil.getString(request, "other");
        //get file data
        String licenseFileData = ParamUtil.getString(request, "licenseFileData");
        String taxFileData = ParamUtil.getString(request, "taxFileData");
        String businessCfData = ParamUtil.getString(request, "businessCfData");
        String qfProveData = ParamUtil.getString(request, "qfProveData");
//        String cOfAuthorityData = ParamUtil.getString(request, "cOfAuthorityData");
//        String workCfData = ParamUtil.getString(request, "workCfData");
//        String specimenCtData = ParamUtil.getString(request, "specimenCtData");
//        String quotationData = ParamUtil.getString(request, "quotationData");
        String otherData = ParamUtil.getString(request, "otherData");
        
//        Map<String, Object> cOfAuthorityResult = FileUtil.parseDataUrl(cOfAuthorityData);
//        Map<String, Object> workCfResult = FileUtil.parseDataUrl(workCfData);
//        Map<String, Object> specimenCtResult = FileUtil.parseDataUrl(specimenCtData);
//        Map<String, Object> quotationResult = FileUtil.parseDataUrl(quotationData);
        
        //save in attachment[]
        if (StringUtil.isNotEmpty(licenseFileData)) {
            Attachment attachment = new Attachment();
            if (licenseFileData.indexOf("id_") != -1) {
                attachment.setId(Integer.parseInt(licenseFileData.substring(3)));
            } else {
                Map<String, Object> licenseResult = FileUtil.parseDataUrl(licenseFileData);
                String path = FileUtil.saveUploadedFile("supplier", licenseFile, (byte[]) licenseResult.get("fileData"));
                attachment.setPath(path);
                attachment.setSize((double) licenseResult.get("fileSize"));
                attachment.setMimeType((String) licenseResult.get("mimeType"));
                attachment.setName(licenseFile);
                attachment.setDescription("BUSINESS LICENSE");
            }
            attachments.add(attachment);
        }
        
        if (StringUtil.isNotEmpty(taxFileData)) {
            Attachment attachment1 = new Attachment();
            if (taxFileData.indexOf("id_") != -1) {
                attachment1.setId(Integer.parseInt(taxFileData.substring(3)));
            } else {
                Map<String, Object> taxResult = FileUtil.parseDataUrl(taxFileData);
                String path1 = FileUtil.saveUploadedFile("supplier", taxFile, (byte[]) taxResult.get("fileData"));
                attachment1.setPath(path1);
                attachment1.setSize((double) taxResult.get("fileSize"));
                attachment1.setMimeType((String) taxResult.get("mimeType"));
                attachment1.setName(taxFile);
                attachment1.setDescription("TAX REGISTRATION CERTIFICATE");
            }
            attachments.add(attachment1);
        }
        
        if (StringUtil.isNotEmpty(businessCfData)) {
            Attachment attachment2 = new Attachment();
            if (businessCfData.indexOf("id_") != -1) {
                attachment2.setId(Integer.parseInt(businessCfData.substring(3)));
            } else {
                Map<String, Object> businessCfResult = FileUtil.parseDataUrl(businessCfData);
                String path2 = FileUtil.saveUploadedFile("supplier", businessCertificate, (byte[]) businessCfResult.get("fileData"));
                attachment2.setPath(path2);
                attachment2.setSize((double) businessCfResult.get("fileSize"));
                attachment2.setMimeType((String) businessCfResult.get("mimeType"));
                attachment2.setName(businessCertificate);
                attachment2.setDescription("BUSINESS CERTIFICATE");
            }
            attachments.add(attachment2);
        }
        
        if (StringUtil.isNotEmpty(qfProveData)) {
            Attachment attachment3 = new Attachment();
            if (qfProveData.indexOf("id_") != -1) {
                attachment3.setId(Integer.parseInt(qfProveData.substring(3)));
            } else {
                Map<String, Object> qfProveResult = FileUtil.parseDataUrl(qfProveData);
                String path3 = FileUtil.saveUploadedFile("supplier", qualificationProve, (byte[]) qfProveResult.get("fileData"));
                attachment3.setPath(path3);
                attachment3.setSize((double) qfProveResult.get("fileSize"));
                attachment3.setMimeType((String) qfProveResult.get("mimeType"));
                attachment3.setName(qualificationProve);
                attachment3.setDescription("QUALIFICATION PROVE");
            }
            attachments.add(attachment3);
        }
        
//        String path4 = FileUtil.saveUploadedFile("supplier", certificateOfAuthority, (byte[]) cOfAuthorityResult.get("fileData"));
//        Attachment attachment4 = new Attachment();
//        attachment4.setPath(path4);
//        attachment4.setSize((double) cOfAuthorityResult.get("fileSize"));
//        attachment4.setMimeType((String) cOfAuthorityResult.get("mimeType"));
//        attachment4.setName(certificateOfAuthority);
//        attachment4.setDescription("CERTIFICATE OF AUTHORITY");
//        attchments[4] = attachment4;
//        
//        String path5 = FileUtil.saveUploadedFile("supplier", workCertificate, (byte[]) workCfResult.get("fileData"));
//        Attachment attachment5 = new Attachment();
//        attachment5.setPath(path5);
//        attachment5.setSize((double) workCfResult.get("fileSize"));
//        attachment5.setMimeType((String) workCfResult.get("mimeType"));
//        attachment5.setName(workCertificate);
//        attachment5.setDescription("WORK CERTIFICATE");
//        attchments[5] = attachment5;
//        
//        String path6 = FileUtil.saveUploadedFile("supplier", specimenContract, (byte[]) specimenCtResult.get("fileData"));
//        Attachment attachment6 = new Attachment();
//        attachment6.setPath(path6);
//        attachment6.setSize((double) specimenCtResult.get("fileSize"));
//        attachment6.setMimeType((String) specimenCtResult.get("mimeType"));
//        attachment6.setName(specimenContract);
//        attachment6.setDescription("SPECIMEN CONTRACT");
//        attchments[6] = attachment6;
//        
//        String path7 = FileUtil.saveUploadedFile("supplier", quotation, (byte[]) quotationResult.get("fileData"));
//        Attachment attachment7 = new Attachment();
//        attachment7.setPath(path7);
//        attachment7.setSize((double) quotationResult.get("fileSize"));
//        attachment7.setMimeType((String) quotationResult.get("mimeType"));
//        attachment7.setName(quotation);
//        attachment7.setDescription("QUOTATION");
//        attchments[7] = attachment7;
        
        if (StringUtil.isNotEmpty(otherData)) {
            Attachment attachment8 = new Attachment();
            if (otherData.indexOf("id_") != -1) {
                attachment8.setId(Integer.parseInt(otherData.substring(3)));
            } else {
                Map<String, Object> otherResult = FileUtil.parseDataUrl(otherData);
                String path8 = FileUtil.saveUploadedFile("supplier", other, (byte[]) otherResult.get("fileData"));
                attachment8.setPath(path8);
                attachment8.setSize((double) otherResult.get("fileSize"));
                attachment8.setMimeType((String) otherResult.get("mimeType"));
                attachment8.setName(other);
                attachment8.setDescription("OTHER");
            }
            attachments.add(attachment8);
        }
        
        if (attachments.size() > 0) {
            return (Attachment[])attachments.toArray(new Attachment[attachments.size()]);
        }
        return null;
    }
    
    @RequestMapping
    public String unspecified(HttpServletRequest request) {
        logger.info("Accessing to STORE...");
        AppContext appCtx = AppUtil.getAppContext();
        Customer supplier = new Customer();
        int userId = 0;
        if (appCtx != null) {
            userId = appCtx.getUserId();
            supplier = customerService.getCustomerByUserId(userId);
        }

        
        if (supplier != null) {
            return view(userId, request);
        } else {
            return view(userId, request);
        }
        
    }
}
