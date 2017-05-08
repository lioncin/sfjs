package com.sanyet.fireball.szcea.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sanyet.fireball.base.AppContext;
import com.sanyet.fireball.base.AppUtil;
import com.sanyet.fireball.base.docgenerator.PdfGenerator;
import com.sanyet.fireball.base.entity.Group;
import com.sanyet.fireball.base.entity.SearchParam;
import com.sanyet.fireball.base.entity.SearchResult;
import com.sanyet.fireball.base.message.MessageUtil;
import com.sanyet.fireball.base.numgenerator.NumberGenerator;
import com.sanyet.fireball.base.service.GroupService;
import com.sanyet.fireball.base.util.ConfigUtil;
import com.sanyet.fireball.base.util.DateUtil;
import com.sanyet.fireball.base.util.MiscUtil;
import com.sanyet.fireball.base.util.ParamUtil;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.base.validation.Validator;
import com.sanyet.fireball.customer.entity.Customer;
import com.sanyet.fireball.customer.service.CustomerService;
import com.sanyet.fireball.szcea.ActivityConsts;
import com.sanyet.fireball.szcea.entity.Activity;
import com.sanyet.fireball.szcea.service.ActivityService;
import com.sanyet.fireball.szcea.validator.ActivityValidator;

@Controller
@RequestMapping("/activity")
public class ActivityController {
    private static final Logger logger = LogManager.getLogger(ActivityController.class);
    @Autowired
    private ActivityService activityService;
    @Autowired
    private GroupService groupService;
    @Autowired
    private CustomerService customerService;
    
    @RequestMapping("/manage")
    public String manage(HttpServletRequest request) {
        return search(request);
    }
    
    @RequestMapping("/search")
    public String search(HttpServletRequest request) {
        String schName = ParamUtil.getString(request, "schName");
        String status = ParamUtil.getString(request, "status");
        int pageNo = ParamUtil.getInt(request, "pageNo", 1);
        String orderByColumn = ParamUtil.getString(request, "orderByColumn");
        String orderByType = ParamUtil.getString(request, "orderByType");
//        boolean isBrowser = ParamUtil.getBoolean(request, "isBrowser");
//        String crStatus = ParamUtil.getString(request, "crStatus");
        SearchParam sp = new SearchParam();
        if (!StringUtil.isEmpty(schName)) {
            sp.addFilterParam("schName", "%"+schName+"%");
        }
       
        //TODO
        //根据用户id知道他是会员用户还是员工用户，会员查询时要带上自己的id,员工查询所有用户的记录
        //会员用户时赋值
        AppContext appCtx = AppUtil.getAppContext();
        if (appCtx == null)
            throw new RuntimeException("app context is initialized.");
        Group[] groups = groupService.getGroupsByUser(appCtx.getUserId());
        
        int groupId = 0;
        if (groups != null) {
            for (Group group : groups) {
                groupId = group.getId();
                if(groupId == 103){
                    sp.addFilterParam("userId", appCtx.getUserId()); 
                    //还要修改通知前台的
                    ParamUtil.setSessionAttr(request, "groupId", groupId);
//                    request.setAttribute("groupId", groupId);
                    break;
                }else{
                    ParamUtil.setSessionAttr(request, "groupId", groupId);
//                    request.setAttribute("groupId", groupId);
                }
            }
        }
//        sp.addFilterParam("userId", null);
        if (!StringUtil.isEmpty(status)) {
            sp.addFilterParam("status", status);
        }
        sp.setPageNo(pageNo);
        if (!StringUtil.isEmpty(orderByColumn)) {
            sp.setOrderBy(orderByColumn, orderByType);
        }
        sp.setPageSize(ConfigUtil.getInt("page.size"));

        SearchResult<Activity> sr = activityService.searchActivitys(sp);
        request.setAttribute("l_searchResult", sr);
        request.setAttribute("l_searchParam", sp);
        String view = "/activity/conferenceList.jsp";
        return view;
    }
    
    @RequestMapping("/approve")
    public String approve(HttpServletRequest request) throws Exception {
        String schName = ParamUtil.getString(request, "schName");
        String status = ParamUtil.getString(request, "status");
        int pageNo = ParamUtil.getInt(request, "pageNo", 1);
        String orderByColumn = ParamUtil.getString(request, "orderByColumn");
        String orderByType = ParamUtil.getString(request, "orderByType");
//        boolean isBrowser = ParamUtil.getBoolean(request, "isBrowser");
//        String crStatus = ParamUtil.getString(request, "crStatus");
        SearchParam sp = new SearchParam();
        if (!StringUtil.isEmpty(schName)) {
            sp.addFilterParam("schName", "%"+schName+"%");
        }
        if (!StringUtil.isEmpty(status)) {
            sp.addFilterParam("status", status);
        }else{
        //待审核状态
        sp.addFilterParam("status", ActivityConsts.CT_STATUS_PENDING);
        }
        
        AppContext appCtx = AppUtil.getAppContext();
        if (appCtx == null)
            throw new RuntimeException("app context is initialized.");
        Group[] groups = groupService.getGroupsByUser(appCtx.getUserId());
        
        int groupId = 0;
        if (groups != null) {
            for (Group group : groups) {
                groupId = group.getId();
                if(groupId == 103){
                    sp.addFilterParam("userId", appCtx.getUserId()); 
                    //还要修改通知前台的
                    ParamUtil.setSessionAttr(request, "groupId", groupId);
//                    request.setAttribute("groupId", groupId);
                    break;
                }else{
                    ParamUtil.setSessionAttr(request, "groupId", groupId);
//                    request.setAttribute("groupId", groupId);
                }
            }
        }
        
        sp.setPageNo(pageNo);
        if (!StringUtil.isEmpty(orderByColumn)) {
            sp.setOrderBy(orderByColumn, orderByType);
        }
        sp.setPageSize(ConfigUtil.getInt("page.size"));

        SearchResult<Activity> sr = activityService.searchActivitys(sp);
        request.setAttribute("l_searchResult", sr);
        request.setAttribute("l_searchParam", sp);
        String view = "/activity/approveActivityList.jsp";
        return view;
    }
    
    @RequestMapping(value="/status")
    public String changeStatus(HttpServletRequest request) throws Exception {
        int id = ParamUtil.getInt(request, "id");
        Activity activity = activityService.getActivity(id);
        String remarks = ParamUtil.getString(request, "remarks");
        activity.setRemarks(remarks);
        String result = ParamUtil.getString(request, "result");
        if ("Y".equals(result)) {
            activity.setStatus(ActivityConsts.CT_STATUS_NORMAL);
            //编号
            if("C".equals(activity.getType())){
                String code = NumberGenerator.generateNumber("conference");
                activity.setCode(code);
            }else{
                String code = NumberGenerator.generateNumber("exhibition");
                activity.setCode(code);
            }
            
        }else{
            activity.setStatus(ActivityConsts.CT_STATUS_REJECT); 
        }
        //这个必须只能保证会员自己创建
        Customer customer = customerService.getCustomerByUserId(activity.getCreatedBy());
        //发送邮件通知
        String[] to = {customer.getEmail()};
        String[] cc = null;
        String subject = "活动报备审批通知";
        String text = "activity";
        Map<String, Object> html = new HashMap<String, Object>();
        html.put("username", customer.getLoginUser().getUsername());
        html.put("status", result);
        html.put("remarks", remarks);
        try {
            MiscUtil.sendMail(to, cc, subject, text, html);
        } catch (Exception e) {
           logger.error("活动报备审批结果邮件发送失败");
        }
        activityService.updateActivity(activity);
        if ("approve".equals(ParamUtil.getString(request, "from"))) {
            return "redirect:/activity/approve";
        } else {
            return "redirect:/activity/manage";
        }
    }
    
    @RequestMapping("conference/create")
    public String createConference(HttpServletRequest request) throws Exception {
        return "/activity/conferenceEdit.jsp";
    }
    
    @RequestMapping("exhibition/create")
    public String createExhibition(HttpServletRequest request) throws Exception {
        return "/activity/exhibitionEdit.jsp";
    }
    
    @RequestMapping("/save")
    public String save(HttpServletRequest request) throws Exception {
        int id = ParamUtil.getInt(request, "id", 0);
        
        Activity activity = new Activity();
        activity.setName(ParamUtil.getString(request, "name"));
        activity.setName_en(ParamUtil.getString(request, "name_en"));
        activity.setLocation(ParamUtil.getString(request, "location"));
        activity.setPrepareFrom(ParamUtil.getDate(request, "prepareFrom"));
        activity.setPrepareTo(ParamUtil.getDate(request, "prepareTo"));
        activity.setHoldFrom(ParamUtil.getDate(request, "holdFrom"));
        activity.setHoldTo(ParamUtil.getDate(request, "holdTo"));
        activity.setIsRegular("Y".equals(ParamUtil.getString(request, "isRegular")) ? "Y" : "N");
        activity.setAnnualTime(ParamUtil.getInt(request, "annualTime"));
        activity.setHoldTime(ParamUtil.getInt(request, "holdTime"));
        activity.setHasNationalTM("Y".equals(ParamUtil.getString(request, "hasNationalTM")) ? "Y" : "N");
        activity.setHasInterCert("Y".equals(ParamUtil.getString(request, "hasInterCert")) ? "Y" : "N");
        activity.setLevel(ParamUtil.getString(request, "level"));
        activity.setApprover(ParamUtil.getString(request, "approver"));
        activity.setSponsor(ParamUtil.getString(request, "sponsor"));
        activity.setOrganizer(ParamUtil.getString(request, "organizer"));
        activity.setCount_1(ParamUtil.getDouble(request, "count_1",0));
        activity.setCount_2(ParamUtil.getDouble(request, "count_2",0));
        activity.setCount_3(ParamUtil.getInt(request, "count_3"));
        activity.setFeeScale(ParamUtil.getDouble(request, "feeScale",0));
        activity.setHasAddActivity("Y".equals(ParamUtil.getString(request, "hasAddProject")) ? "Y" : "N");
        activity.setAddScale(ParamUtil.getDouble(request, "addScale",0));
        activity.setAddTime(ParamUtil.getInt(request, "addTime"));
        activity.setDescription(ParamUtil.getString(request, "description"));
        activity.setSubmittedBy(ParamUtil.getString(request, "submittedBy"));
        activity.setLegalRep(ParamUtil.getString(request, "legalRep"));
        activity.setBizAddress(ParamUtil.getString(request, "bizAddress"));
        activity.setBizEmail(ParamUtil.getString(request, "bizEmail"));
        activity.setBizContact(ParamUtil.getString(request, "bizContact"));
        activity.setBizPhone(ParamUtil.getString(request, "bizPhone"));
        activity.setDocuments(ParamUtil.getString(request, "documents"));
        activity.setType(ParamUtil.getString(request, "type"));
        activity.setStatus(ActivityConsts.CT_STATUS_PENDING);

        Validator<Activity> validator = new ActivityValidator(request);
        if (validator.validate()) {
            if (id > 0) {
                // retrieve the old entity first
                Activity entity = activityService.getActivity(id);
                entity.setName(activity.getName());
                entity.setName_en(activity.getName_en());
                entity.setLocation(activity.getLocation());
                entity.setPrepareFrom(activity.getPrepareFrom());
                entity.setPrepareTo(activity.getPrepareTo());
                entity.setHoldFrom(activity.getHoldFrom());
                entity.setHoldTo(activity.getHoldTo());
                entity.setIsRegular(activity.getIsRegular());
                entity.setAnnualTime(activity.getAnnualTime());
                entity.setHoldTime(activity.getHoldTime());
                entity.setHasNationalTM(activity.getHasNationalTM());
                entity.setHasInterCert(activity.getHasInterCert());
                entity.setLevel(activity.getLevel());
                entity.setApprover(activity.getApprover());
                entity.setSponsor(activity.getSponsor());
                entity.setOrganizer(activity.getOrganizer());
                entity.setCount_1(activity.getCount_1());
                entity.setCount_2(activity.getCount_2());
                entity.setCount_3(activity.getCount_3());
                entity.setFeeScale(activity.getFeeScale());
                entity.setHasAddActivity(activity.getHasAddActivity());
                entity.setAddScale(activity.getAddScale());
                entity.setAddTime(activity.getAddTime());
                entity.setDescription(activity.getDescription());
                entity.setSubmittedBy(activity.getSubmittedBy());
                entity.setLegalRep(activity.getLegalRep());
                entity.setBizAddress(activity.getBizAddress());
                entity.setBizEmail(activity.getBizEmail());
                entity.setBizContact(activity.getBizContact());
                entity.setBizPhone(activity.getBizPhone());
                entity.setDocuments(activity.getDocuments());
                entity.setType(activity.getType());
                entity.setStatus(activity.getStatus());
//
                activityService.updateActivity(entity);
            } else {
                activityService.createActivity(activity);
            }
            logger.info("A activity has been created successfully, redirecting...");
            return unspecified(request);
        } else {
            logger.info("activity validation failed, redirecting to info page...");
            ParamUtil.setRequestAttr(request, "entity", activity);
            ParamUtil.setRequestAttr(request, "validator", validator);
            if("C".equals(activity.getType())){
                return "/activity/conferenceEdit.jsp";
            }else{
                return "/activity/exhibitionEdit.jsp";
            }
        }
    }
    
    @RequestMapping(value="/view/{id}")
    public String view(@PathVariable int id, HttpServletRequest request) throws Exception {
        Activity activity = activityService.getActivity(id);
        ParamUtil.setRequestAttr(request, "entity", activity);
        if("C".equals(activity.getType())){
            return "/activity/conferenceView.jsp";
        }else{
            return "/activity/exhibitionView.jsp";
        }
    }
    
    @RequestMapping(value="/approveView/{id}")
    public String approveView(@PathVariable int id, HttpServletRequest request) throws Exception {
        Activity activity = activityService.getActivity(id);
        ParamUtil.setRequestAttr(request, "entity", activity);
        if("C".equals(activity.getType())){
            return "/activity/approveConference.jsp";
        }else{
            return "/activity/approveExhibition.jsp";
        }
    }
    
    @RequestMapping(value="/edit/{id}")
    public String edit(@PathVariable int id, HttpServletRequest request) throws Exception {
        Activity activity = activityService.getActivity(id);
        ParamUtil.setRequestAttr(request, "entity", activity);
        if("C".equals(activity.getType())){
            return "/activity/conferenceEdit.jsp";
        }else{
            return "/activity/exhibitionEdit.jsp";
        }
        
    }
    
    @RequestMapping(value="/delete")
    public String delete(HttpServletRequest request) throws Exception {
        int[] ids = ParamUtil.getInts(request, "selector");
        if (ids != null) {
            activityService.deleteActivitys(ids);
        }
        int id = ParamUtil.getInt(request, "Id");
        if (id > 0) {
            activityService.deleteActivity(id);
        }
        return unspecified(request);
    }
    
    @RequestMapping("/saveAsPdf/{id}")
    public void saveAsPdf(@PathVariable int id, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> params = new HashMap<String, Object>();
        Activity activity = activityService.getActivity(id);
        params.put("project", activity);
        String date = DateUtil.formatDate(activity.getCreatedAt());
        String[] times = date.split("-");
        if(times != null && times.length > 0){
            params.put("year", times[0]); 
            params.put("month", times[1]); 
            params.put("day", times[2]); 
        }
        PdfGenerator gen = new PdfGenerator();
        byte[] data = null;
        if("C".equals(activity.getType())){
            data = gen.generate(MessageUtil.getTemplateMessage("/conference", params));
        }else{
            data = gen.generate(MessageUtil.getTemplateMessage("/exhibition", params));
        }
        if(data != null){
            response.setContentLength(data.length);  
        }

        String fileName = activity.getName();
        fileName = URLEncoder.encode(fileName,"UTF-8");
        response.setContentType("application/pdf; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        if (request.getHeader("User-Agent").indexOf("Firefox") != -1) { // FF
            response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + fileName + ".pdf");
        } else { // not FF
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName + ".pdf");
        }
        
        try {
            ServletOutputStream output = response.getOutputStream();
            output.write(data);
            output.flush();
            output.close();
        } catch (IOException ex) {
            throw new RuntimeException(ex);
        }
    }
    
    @RequestMapping
    public String unspecified(HttpServletRequest request) throws Exception {
        logger.info("Accessing to Activity...");
        return "redirect:/activity/manage";
    }
    
}
