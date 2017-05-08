/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
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
import com.sanyet.fireball.base.entity.SearchParam;
import com.sanyet.fireball.base.entity.SearchResult;
import com.sanyet.fireball.base.entity.User;
import com.sanyet.fireball.base.message.MessageConsts;
import com.sanyet.fireball.base.message.MessageUtil;
import com.sanyet.fireball.base.message.entity.Message;
import com.sanyet.fireball.base.message.service.MessageService;
import com.sanyet.fireball.base.service.UserService;
import com.sanyet.fireball.base.util.ConfigUtil;
import com.sanyet.fireball.base.util.DateUtil;
import com.sanyet.fireball.base.util.ParamUtil;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.base.validation.Validator;
import com.sanyet.fireball.base.websocket.MessageSocket;
import com.sanyet.fireball.customer.entity.Customer;
import com.sanyet.fireball.customer.service.CustomerService;
import com.sanyet.fireball.szcea.CustomerConsts;
import com.sanyet.fireball.szcea.StatisticsConsts;
import com.sanyet.fireball.szcea.SzceaCst;
import com.sanyet.fireball.szcea.entity.ConferenceDataSheet;
import com.sanyet.fireball.szcea.entity.StatDetail;
import com.sanyet.fireball.szcea.entity.Statistics;
import com.sanyet.fireball.szcea.service.StatDetailService;
import com.sanyet.fireball.szcea.service.StatisticsService;
import com.sanyet.fireball.szcea.validator.MessageValidator;

/**
 * StatisticsController
 *
 * @author hanjian
 */
@Controller
@RequestMapping("/statistics")
public final class StatisticsController {
    private static final Logger logger = LogManager.getLogger(StatisticsController.class);

    @Autowired
    private StatisticsService statisticsService;
    @Autowired
    private UserService userService;
    @Autowired
    private MessageService messageService;
    @Autowired
    private StatDetailService statDetailService;
    @Autowired
    private CustomerService customerService;

    @RequestMapping("/exhibition/manage")
    public String exhibitionManage(HttpServletRequest request) {
        return exhibitionSearch(request);
    }

    @RequestMapping("/exhibition/search")
    public String exhibitionSearch(HttpServletRequest request) {
        String schStatYear = ParamUtil.getString(request, "schStatYear");
        String submittedBy = ParamUtil.getString(request, "submittedBy");
        String schFiledBy = ParamUtil.getString(request, "schFiledBy");
        int pageNo = ParamUtil.getInt(request, "pageNo", 1);
        String orderByColumn = ParamUtil.getString(request, "orderByColumn");
        String orderByType = ParamUtil.getString(request, "orderByType");
        SearchParam sp = new SearchParam();
        if (!StringUtil.isEmpty(schStatYear)) {
            sp.addFilterParam("schStatYear", schStatYear);
        }
        if (!StringUtil.isEmpty(submittedBy)) {
            sp.addFilterParam("submittedBy", submittedBy);
        }
        if (!StringUtil.isEmpty(schFiledBy)) {
            sp.addFilterParam("schFiledBy", schFiledBy);
        }
        sp.addFilterParam("schType", StatisticsConsts.CE_TYPE_EXHIBITION);
        sp.setPageNo(pageNo);
        if (!StringUtil.isEmpty(orderByColumn)) {
            sp.setOrderBy(orderByColumn, orderByType);
        }
        sp.setPageSize(ConfigUtil.getInt("page.size"));

        SearchResult<Statistics> sr = statisticsService.searchStatistics(sp);
        if (sr != null && sr.getRows() != null) {
            for (Statistics statistics : sr.getRows()) {
                Customer customer = customerService.getCustomer(statistics.getSubmittedBy());
                statistics.setCustomer(customer);
            }

        }
        request.setAttribute("l_searchResult", sr);
        request.setAttribute("l_searchParam", sp);

        return "/statistics/exhibitionList.jsp";
    }

    @RequestMapping(value = "/exhibition/view/{id}")
    public String exhibitionView(@PathVariable int id, HttpServletRequest request) throws Exception {
        Statistics statistics = statisticsService.getStatistics(id);
        List<StatDetail> statDetail = statDetailService.getStatDetailByStatId(id);
        Customer customer = customerService.getCustomer(statistics.getSubmittedBy());
        statistics.setStatDetail(statDetail);
        statistics.setCustomer(customer);
        ParamUtil.setRequestAttr(request, "entity", statistics);
        return "/statistics/exhibitionView.jsp";
    }

    @RequestMapping("/conference/manage")
    public String conferenceManage(HttpServletRequest request) {
        return conferenceSearch(request);
    }

    @RequestMapping("/conference/search")
    public String conferenceSearch(HttpServletRequest request) {
        String schStatYear = ParamUtil.getString(request, "schStatYear");
        String submittedBy = ParamUtil.getString(request, "submittedBy");
        String schFiledBy = ParamUtil.getString(request, "schFiledBy");
        int pageNo = ParamUtil.getInt(request, "pageNo", 1);
        String orderByColumn = ParamUtil.getString(request, "orderByColumn");
        String orderByType = ParamUtil.getString(request, "orderByType");
        SearchParam sp = new SearchParam();
        if (!StringUtil.isEmpty(schStatYear)) {
            sp.addFilterParam("schStatYear", schStatYear);
        }
        if (!StringUtil.isEmpty(submittedBy)) {
            sp.addFilterParam("submittedBy", submittedBy);
        }
        if (!StringUtil.isEmpty(schFiledBy)) {
            sp.addFilterParam("schFiledBy", schFiledBy);
        }
        sp.addFilterParam("schType", StatisticsConsts.CE_TYPE_CONFERENCE);
        sp.setPageNo(pageNo);
        if (!StringUtil.isEmpty(orderByColumn)) {
            sp.setOrderBy(orderByColumn, orderByType);
        }
        sp.setPageSize(ConfigUtil.getInt("page.size"));

        SearchResult<Statistics> sr = statisticsService.searchStatistics(sp);
        if (sr != null && sr.getRows() != null) {
            for (Statistics statistics : sr.getRows()) {
                Customer customer = customerService.getCustomer(statistics.getSubmittedBy());
                statistics.setCustomer(customer);
            }

        }
        request.setAttribute("l_searchResult", sr);
        request.setAttribute("l_searchParam", sp);

        return "/statistics/conferenceList.jsp";
    }

    @RequestMapping(value = "/conference/view/{id}")
    public String conferenceView(@PathVariable int id, HttpServletRequest request) throws Exception {
        Statistics statistics = statisticsService.getStatistics(id);
        List<StatDetail> statDetail = statDetailService.getStatDetailByStatId(id);
        Customer customer = customerService.getCustomer(statistics.getSubmittedBy());
        statistics.setStatDetail(statDetail);
        statistics.setCustomer(customer);
        ParamUtil.setRequestAttr(request, "entity", statistics);
        return "/statistics/conferenceView.jsp";
    }

    @RequestMapping(value = "/conference/dataSheet")
    public String conferenceDataSheet(HttpServletRequest request) throws Exception {
        String statYear = ParamUtil.getString(request, "statYear");
        String submittedBy = ParamUtil.getString(request, "submittedBy");
        if (StringUtil.isEmpty(statYear)) {
            Calendar calendar = Calendar.getInstance();
            int currentYear = calendar.get(Calendar.YEAR);
            statYear = String.valueOf(currentYear);
        }
        SearchParam sp = new SearchParam();
        sp.addFilterParam("schStatYear", statYear);
        if (!StringUtil.isEmpty(submittedBy)) {
            sp.addFilterParam("schSubmittedBy", submittedBy);
        }
        Map<String, ConferenceDataSheet> conferenceDatas = conferenceDataSheet(sp);
        
        ParamUtil.setRequestAttr(request, "entity", conferenceDatas);
        ParamUtil.setRequestAttr(request, "l_searchParam", sp);
        ParamUtil.setRequestAttr(request, "organizationName", ParamUtil.getString(request, "organizationName"));
        ParamUtil.setRequestAttr(request, "crStatus", CustomerConsts.CR_STATUS_NORMAL);
        return "/statistics/conferenceDataSheet.jsp";
    }
    
    /**
     * 取得会议数据表
     * @param sp
     * @return
     */
    private Map<String, ConferenceDataSheet> conferenceDataSheet(SearchParam sp) {
        List<ConferenceDataSheet> conferenceDataSheet = statisticsService.getConferenceDataSheet(sp);
        Map<String, ConferenceDataSheet> conferenceDatas = new HashMap<String, ConferenceDataSheet>();
        if (conferenceDataSheet != null && conferenceDataSheet.size() > 0) {
            for (ConferenceDataSheet conferenceData : conferenceDataSheet) {
                conferenceDatas.put(conferenceData.getLevel(), conferenceData);
            }
        }
        return conferenceDatas;
    }

    @RequestMapping("/saveAsPdf")
    public void saveAsPdf(HttpServletRequest request, HttpServletResponse response)
            throws UnsupportedEncodingException {
        int statisticsId = ParamUtil.getInt(request, "statisticsId", 0);
        Statistics statistics = statisticsService.getStatistics(statisticsId);
        String statYear = statistics.getStatYear();
        String type = statistics.getType();
        List<StatDetail> statDetail = statDetailService.getStatDetailByStatId(statisticsId);
        Customer customer = customerService.getCustomer(statistics.getSubmittedBy());
        statistics.setStatDetail(statDetail);
        statistics.setCustomer(customer);
        if (statisticsId == 0 || statistics == null || statDetail == null || customer == null || StringUtil.isEmpty(type) ||
                (!StatisticsConsts.CE_TYPE_CONFERENCE.equals(type) && !StatisticsConsts.CE_TYPE_EXHIBITION.equals(type))) {
            savePdfNotFound(response);
            return;
        }
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("project", statistics);
        
        String updateAt = DateUtil.formatDate(statistics.getUpdatedAt());
        String[] updateYMD = updateAt.split("-");
        String year = updateYMD[0];
        String month = updateYMD[1];
        String day = updateYMD[2];
        String company_name = customer.getCompanyName();
        String name = statistics.getFiledBy();
        String tel = statistics.getPhoneNo();

        params.put("statYear", statYear);
        params.put("year", year);
        params.put("month", month);
        params.put("day", day);
        params.put("company_name", company_name);
        params.put("name", name);
        params.put("tel", tel);

        PdfGenerator gen = new PdfGenerator();
        byte[] data = null;
        String fileName = "1";
        if (StatisticsConsts.CE_TYPE_CONFERENCE.equals(type)) {
            data = gen.generate(MessageUtil.getTemplateMessage("/conferenceData", params));
            fileName = "苏州市" + statYear + "年度会议数据统计表（一）";
        } else if (StatisticsConsts.CE_TYPE_EXHIBITION.equals(type)) {
            data = gen.generate(MessageUtil.getTemplateMessage("/exhiData", params));
            fileName = "苏州市" + statYear + "年展会统计表";
        }
        response.setContentLength(data.length);
        fileName = URLEncoder.encode(fileName, "UTF-8");

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
    
    /**
     * 导出pdf数据不全错误提示
     * @param response
     */
    private void savePdfNotFound(HttpServletResponse response) {
        try {
            response.setCharacterEncoding("UTF_8");
            response.setHeader("Content-type","text/html;charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.write(MessageUtil.getMessage("ce.check.statistics.data.notfound"));
            writer.flush();
            writer.close();
        } catch (IOException ex) {
            throw new RuntimeException(ex);
        }
    }

    @RequestMapping("/conference/saveDataSheetAsPdf")
    public void saveDataSheetAsPdf(HttpServletRequest request, HttpServletResponse response)
            throws UnsupportedEncodingException {
        String statYear = ParamUtil.getString(request, "statYear");
        int submittedBy = ParamUtil.getInt(request, "submittedBy", 0);
        Customer customer = customerService.getCustomer(submittedBy);
        Statistics statistics = statisticsService.getStatisticsByMore(statYear, submittedBy, StatisticsConsts.CE_TYPE_DATASHEET_CONF);
        if (StringUtil.isEmpty(statYear) || submittedBy == 0 || customer == null || statistics == null) {
            try {
                response.setCharacterEncoding("UTF_8");
                response.setHeader("Content-type","text/html;charset=UTF-8");
                PrintWriter writer = response.getWriter();
                writer.write(MessageUtil.getMessage("ce.check.statistics.data.notfound"));
                writer.flush();
                writer.close();
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
            return;
        }
        SearchParam sp = new SearchParam();
        sp.addFilterParam("schStatYear", statYear);
        sp.addFilterParam("schSubmittedBy", submittedBy);
        Map<String, ConferenceDataSheet> conferenceDatas = conferenceDataSheet(sp);
        ConferenceDataSheet iData = conferenceDatas.get("I") != null ? conferenceDatas.get("I") : new ConferenceDataSheet();
        ConferenceDataSheet nData = conferenceDatas.get("N") != null ? conferenceDatas.get("N") : new ConferenceDataSheet();
        ConferenceDataSheet pData = conferenceDatas.get("P") != null ? conferenceDatas.get("P") : new ConferenceDataSheet();
        ConferenceDataSheet cData = conferenceDatas.get("C") != null ? conferenceDatas.get("C") : new ConferenceDataSheet();
        ConferenceDataSheet tData = conferenceDatas.get("TOTAL") != null ? conferenceDatas.get("TOTAL") : new ConferenceDataSheet();
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("project", conferenceDatas);

        String updateAt = DateUtil.formatDate(statistics.getUpdatedAt());
        String[] updateYMD = updateAt.split("-");
        String year = updateYMD[0];
        String month = updateYMD[1];
        String day = updateYMD[2];
        String company_name = customer.getCompanyName();
        String name = statistics.getFiledBy();
        String tel = statistics.getPhoneNo();

        params.put("statYear", statYear);
        params.put("year", year);
        params.put("month", month);
        params.put("day", day);
        params.put("company_name", company_name);
        params.put("name", name);
        params.put("tel", tel);
        params.put("iData", iData);
        params.put("nData", nData);
        params.put("pData", pData);
        params.put("cData", cData);
        params.put("tData", tData);

        PdfGenerator gen = new PdfGenerator();
        byte[] data = null;
        data = gen.generate(MessageUtil.getTemplateMessage("/datasheet", params));
        response.setContentLength(data.length);
        String fileName = "苏州市" + statYear + "年度会议数据统计表(二)";
        fileName = URLEncoder.encode(fileName, "UTF-8");

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

    @RequestMapping(value = "/send")
    public String send(HttpServletRequest request) throws Exception {
        return "/statistics/sendStatistics.jsp";
    }

    @RequestMapping(value = "/sendStatistics")
    public String sendStatistics(HttpServletRequest request) throws Exception {
        AppContext appCtx = AppUtil.getAppContext();
        if (appCtx == null)
            throw new RuntimeException("app context is initialized.");

        String body = ParamUtil.getString(request, "contentTxt");
        String subject = ParamUtil.getString(request, "subject");
        Validator<Message> validator = new MessageValidator(request);
        if (validator.validate()) {
            SearchResult<User> sr = userService.getUsersByRole(SzceaCst.CM_ROLE_MEMBER);
            if (sr != null) {
                List<User> users = sr.getRows();
                for (User user : users) {
                    Message entity = new Message();
                    entity.setToUserId(user.getId());
                    entity.setSubject(subject);
                    entity.setBody(body);
                    entity.setFromUserId(appCtx.getUserId());
                    entity.setStatus(MessageConsts.CM_STATUS_SUCCESS);
                    entity.setRead(false);
                    messageService.createMessage(entity);
                    //通知的roleid为103的会员，担心在这时间过长
                    int count = messageService.getUnreadMessages(entity.getToUserId());
                    if(count > 0){
                        MessageSocket.broadcastToUser(entity.getToUserId(), count);
                    }
                }
            }
            logger.info("A message has been created successfully, redirecting...");
            ParamUtil.setSessionAttr(request, "success", "success");
            return "redirect:/statistics/send";
//            return "/statistics/sendStatistics.jsp";
        } else {
            ParamUtil.setRequestAttr(request, "validator", validator);
            return "/statistics/sendStatistics.jsp";
        }

    }

    @RequestMapping
    public String unspecified(HttpServletRequest request) {
        logger.info("Accessing to STATISTICS...");
        return exhibitionSearch(request);

    }
}