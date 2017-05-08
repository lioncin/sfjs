/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.action;

import java.util.ArrayList;
import java.util.Calendar;
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

import com.sanyet.fireball.base.AppContext;
import com.sanyet.fireball.base.AppUtil;
import com.sanyet.fireball.base.entity.SearchParam;
import com.sanyet.fireball.base.entity.SearchResult;
import com.sanyet.fireball.base.util.ConfigUtil;
import com.sanyet.fireball.base.util.ParamUtil;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.base.validation.Validator;
import com.sanyet.fireball.customer.entity.Customer;
import com.sanyet.fireball.customer.service.CustomerService;
import com.sanyet.fireball.szcea.StatisticsConsts;
import com.sanyet.fireball.szcea.entity.ConferenceDataSheet;
import com.sanyet.fireball.szcea.entity.StatConference;
import com.sanyet.fireball.szcea.entity.StatDetail;
import com.sanyet.fireball.szcea.entity.Statistics;
import com.sanyet.fireball.szcea.service.StatDetailService;
import com.sanyet.fireball.szcea.service.StatisticsService;
import com.sanyet.fireball.szcea.validator.ConferenceDataSheetValidator;
import com.sanyet.fireball.szcea.validator.ConferenceValidator;
import com.sanyet.fireball.szcea.validator.ExhibitionValidator;

/**
 * StatisticsMemberController
 *
 * @author hanjian
 */
@Controller
@RequestMapping("/organization/statistics")
public final class StatisticsMemberController {
    private static final Logger logger = LogManager.getLogger(StatisticsMemberController.class);

    @Autowired
    private StatisticsService statisticsService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private StatDetailService statDetailService;
    
    @RequestMapping("/exhibition/manage")
    public String exhibitionManage(HttpServletRequest request) throws Exception {
        return exhibitionSearch(request);
    }
    
    @RequestMapping("/exhibition/search")
    public String exhibitionSearch(HttpServletRequest request) throws Exception {
        Customer customer = getCurrentCustomer();
        String schStatYear = ParamUtil.getString(request, "schStatYear");
        String schFiledBy = ParamUtil.getString(request, "schFiledBy");
        int pageNo = ParamUtil.getInt(request, "pageNo", 1);
        String orderByColumn = ParamUtil.getString(request, "orderByColumn");
        String orderByType = ParamUtil.getString(request, "orderByType");
        
        SearchParam sp = new SearchParam();
        if (!StringUtil.isEmpty(schStatYear)) {
            sp.addFilterParam("schStatYear", schStatYear);
        }
        if (!StringUtil.isEmpty(schFiledBy)) {
            sp.addFilterParam("schFiledBy", schFiledBy);
        }
        sp.addFilterParam("schType", StatisticsConsts.CE_TYPE_EXHIBITION);
        sp.addFilterParam("schSubmittedBy", customer.getId());
        sp.setPageNo(pageNo);
        if (!StringUtil.isEmpty(orderByColumn)) {
            sp.setOrderBy(orderByColumn, orderByType);
        }
        sp.setPageSize(ConfigUtil.getInt("page.size"));

        SearchResult<Statistics> sr = statisticsService.searchStatistics(sp);
        request.setAttribute("l_searchResult", sr);
        request.setAttribute("l_searchParam", sp);

        return "/statistics/memberExhibitionList.jsp";
    }
    
    @RequestMapping("/exhibition/create")
    public String exhibitionCreate(HttpServletRequest request) {
        String statYear = ParamUtil.getString(request, "statYear");
        if (StringUtil.isEmpty(statYear)) {
            Calendar calendar = Calendar.getInstance();
            int currentYear = calendar.get(Calendar.YEAR);
            statYear = String.valueOf(currentYear);
        }
        ParamUtil.setRequestAttr(request, "statYear", statYear);
        
        return "/statistics/memberExhibitionEdit.jsp";
    }
    
    @RequestMapping(value="/exhibition/edit/{id}")
    public String exhibitionEdit(@PathVariable int id, HttpServletRequest request) throws Exception {
        Statistics statistics = statisticsService.getStatistics(id);
        List<StatDetail> statDetails = statDetailService.getStatDetailByStatId(id);
        ParamUtil.setRequestAttr(request, "statistics", statistics);
        ParamUtil.setRequestAttr(request, "statDetails", statDetails);
        return "/statistics/memberExhibitionEdit.jsp";
    }

    @RequestMapping("/exhibition/save")
    public String exhibitionSave(HttpServletRequest request) throws Exception {
        Customer customer = getCurrentCustomer();
        int id = ParamUtil.getInt(request, "id", 0);
        String statYear = ParamUtil.getString(request, "statYear");
        ParamUtil.setRequestAttr(request, "statYear", statYear);
        // exist check
        SearchParam sp = new SearchParam();
        sp.addFilterParam("schStatYear", statYear);
        sp.addFilterParam("schType", StatisticsConsts.CE_TYPE_EXHIBITION);
        sp.addFilterParam("schSubmittedBy", customer.getId());
        SearchResult<Statistics> sr = statisticsService.searchStatistics(sp);
        if (sr != null && sr.getRowCount() > 0 && id == 0) {
            ParamUtil.setRequestAttr(request, "existCheck", true);
            return exhibitionCreate(request);
        }
        
        // statistics data
        Statistics statistics = new Statistics();
        statistics.setId(id);
        statistics.setStatYear(statYear);
        statistics.setSubmittedBy(customer.getId());
        statistics.setFiledBy(ParamUtil.getString(request, "filedBy"));
        statistics.setPhoneNo(ParamUtil.getString(request, "phoneNo"));
        statistics.setType(StatisticsConsts.CE_TYPE_EXHIBITION);
        // statDetail data
        String[] activityNames = ParamUtil.getStrings(request, "activityName");
        String[] locations = ParamUtil.getStrings(request, "location");
        Date[] holdFroms = ParamUtil.getDates(request, "holdFrom");
        String[] sponsors = ParamUtil.getStrings(request, "sponsor");
        String[] organizers =  ParamUtil.getStrings(request, "organizer");
        int[] countTimes =  ParamUtil.getInts(request, "countTime");
        double[] areas = ParamUtil.getDoubles(request, "area", 0);
        int[] visitorCounts = ParamUtil.getInts(request, "visitorCount");
        int[] addConferences = ParamUtil.getInts(request, "addConference");
        
        List<StatDetail> statDetails = new ArrayList<StatDetail>();
        if (activityNames != null && activityNames.length > 0) {
            int size = activityNames.length;
            for (int i = 0; i < size; i++) {
                StatDetail statDetail = new StatDetail();
                statDetail.setActivityName(activityNames[i]);
                statDetail.setLocation(locations[i]);
                statDetail.setHoldFrom(holdFroms[i]);
                statDetail.setSponsor(sponsors[i]);
                statDetail.setOrganizer(organizers[i]);
                statDetail.setCountTime(countTimes[i]);
                statDetail.setArea(areas[i]);
                statDetail.setVisitorCount(visitorCounts[i]);
                statDetail.setAddConference(addConferences[i]);
                statDetails.add(statDetail);
            }
            statistics.setStatDetail(statDetails);
        }
        
        Validator<Statistics> validator = new ExhibitionValidator(request);
        if (validator.validate()) {
            if (id > 0) {
                Statistics oldStatistics = statisticsService.getStatistics(id);
                oldStatistics.setSubmittedBy(customer.getId());
                oldStatistics.setFiledBy(ParamUtil.getString(request, "filedBy"));
                oldStatistics.setPhoneNo(ParamUtil.getString(request, "phoneNo"));
                oldStatistics.setType(StatisticsConsts.CE_TYPE_EXHIBITION);
                oldStatistics.setStatDetail(statDetails);
                statisticsService.updateStatistics(oldStatistics);
            } else {
                statisticsService.createStatistics(statistics);
            }
            ParamUtil.setRequestAttr(request, "createSuccess", true);
            return exhibitionCreate(request);
        } else {
            logger.info("Statistics validation failed, redirecting to info page...");
            ParamUtil.setRequestAttr(request, "statistics", statistics);
            ParamUtil.setRequestAttr(request, "statDetails", statDetails);
            ParamUtil.setRequestAttr(request, "validator", validator);
            return "/statistics/memberExhibitionEdit.jsp";
        }
    }
    
    @RequestMapping(value="/exhibition/view/{id}")
    public String exhibitionView(@PathVariable int id, HttpServletRequest request) throws Exception {
        Statistics statistics = statisticsService.getStatistics(id);
        List<StatDetail> statDetail = statDetailService.getStatDetailByStatId(id);
        statistics.setStatDetail(statDetail);
        ParamUtil.setRequestAttr(request, "entity", statistics);
        return "/statistics/memberExhibitionView.jsp";
    }
    
    @RequestMapping("/conference/manage")
    public String conferenceManage(HttpServletRequest request) throws Exception {
        return conferenceSearch(request);
    }
    
    @RequestMapping("/conference/search")
    public String conferenceSearch(HttpServletRequest request) throws Exception {
        Customer customer = getCurrentCustomer();
        String schStatYear = ParamUtil.getString(request, "schStatYear");
        String schFiledBy = ParamUtil.getString(request, "schFiledBy");
        int pageNo = ParamUtil.getInt(request, "pageNo", 1);
        String orderByColumn = ParamUtil.getString(request, "orderByColumn");
        String orderByType = ParamUtil.getString(request, "orderByType");
        
        SearchParam sp = new SearchParam();
        if (!StringUtil.isEmpty(schStatYear)) {
            sp.addFilterParam("schStatYear", schStatYear);
        }
        if (!StringUtil.isEmpty(schFiledBy)) {
            sp.addFilterParam("schFiledBy", schFiledBy);
        }
        sp.addFilterParam("schType", StatisticsConsts.CE_TYPE_CONFERENCE);
        sp.addFilterParam("schSubmittedBy", customer.getId());
        sp.setPageNo(pageNo);
        if (!StringUtil.isEmpty(orderByColumn)) {
            sp.setOrderBy(orderByColumn, orderByType);
        }
        sp.setPageSize(ConfigUtil.getInt("page.size"));

        SearchResult<Statistics> sr = statisticsService.searchStatistics(sp);
        request.setAttribute("l_searchResult", sr);
        request.setAttribute("l_searchParam", sp);

        return "/statistics/memberConferenceList.jsp";
    }
    
    @RequestMapping("/conference/create")
    public String conferenceCreate(HttpServletRequest request) throws Exception {
        String statYear = ParamUtil.getString(request, "statYear");
        if (StringUtil.isEmpty(statYear)) {
            Calendar calendar = Calendar.getInstance();
            int currentYear = calendar.get(Calendar.YEAR);
            statYear = String.valueOf(currentYear);
        }
        ParamUtil.setRequestAttr(request, "statYear", statYear);
        
        return "/statistics/memberConferenceEdit.jsp";
    }
    
    @RequestMapping(value="/conference/edit/{id}")
    public String conferenceEdit(@PathVariable int id, HttpServletRequest request) throws Exception {
        Statistics statistics = statisticsService.getStatistics(id);
        List<StatDetail> statDetails = statDetailService.getStatDetailByStatId(id);
        ParamUtil.setRequestAttr(request, "statistics", statistics);
        ParamUtil.setRequestAttr(request, "statDetails", statDetails);
        return "/statistics/memberConferenceEdit.jsp";
    }

    @RequestMapping("/conference/save")
    public String conferenceSave(HttpServletRequest request) throws Exception {
        Customer customer = getCurrentCustomer();
        int id = ParamUtil.getInt(request, "id", 0);
        String statYear = ParamUtil.getString(request, "statYear");
        ParamUtil.setRequestAttr(request, "statYear", statYear);
        // exist check
        SearchParam sp = new SearchParam();
        sp.addFilterParam("schStatYear", statYear);
        sp.addFilterParam("schType", StatisticsConsts.CE_TYPE_CONFERENCE);
        sp.addFilterParam("schSubmittedBy", customer.getId());
        SearchResult<Statistics> sr = statisticsService.searchStatistics(sp);
        if (sr != null && sr.getRowCount() > 0 && id == 0) {
            ParamUtil.setRequestAttr(request, "existCheck", true);
            return conferenceCreate(request);
        }
        
        // statistics data
        Statistics statistics = new Statistics();
        statistics.setId(id);
        statistics.setStatYear(statYear);
        statistics.setSubmittedBy(customer.getId());
        statistics.setFiledBy(ParamUtil.getString(request, "filedBy"));
        statistics.setPhoneNo(ParamUtil.getString(request, "phoneNo"));
        statistics.setType(StatisticsConsts.CE_TYPE_CONFERENCE);
        // statDetail data
        String[] activityNames = ParamUtil.getStrings(request, "activityName");
        String[] sponsors = ParamUtil.getStrings(request, "sponsor");
        Date[] holdFroms = ParamUtil.getDates(request, "holdFrom");
        int[] countTimes = ParamUtil.getInts(request, "countTime");
        int[] visitorCounts = ParamUtil.getInts(request, "visitorCount");
        String[] confTypes = ParamUtil.getStrings(request, "confType");
        List<StatDetail> statDetails = new ArrayList<StatDetail>();
        if (activityNames != null && activityNames.length > 0) {
            int size = activityNames.length;
            for (int i = 0; i < size; i++) {
                StatDetail statDetail = new StatDetail();
                statDetail.setActivityName(activityNames[i]);
                statDetail.setSponsor(sponsors[i]);
                statDetail.setHoldFrom(holdFroms[i]);
                statDetail.setCountTime(countTimes[i]);
                statDetail.setVisitorCount(visitorCounts[i]);
                statDetail.setConfType(confTypes[i]);
                statDetails.add(statDetail);
            }
            statistics.setStatDetail(statDetails);
        }
        Validator<Statistics> validator = new ConferenceValidator(request);
        if (validator.validate()) {
            if (id > 0) {
                Statistics oldStatistics = statisticsService.getStatistics(id);
                oldStatistics.setSubmittedBy(customer.getId());
                oldStatistics.setFiledBy(ParamUtil.getString(request, "filedBy"));
                oldStatistics.setPhoneNo(ParamUtil.getString(request, "phoneNo"));
                oldStatistics.setType(StatisticsConsts.CE_TYPE_CONFERENCE);
                oldStatistics.setStatDetail(statDetails);
                statisticsService.updateStatistics(oldStatistics);
            } else {
                statisticsService.createStatistics(statistics);
            }
            ParamUtil.setRequestAttr(request, "createSuccess", true);
            return conferenceCreate(request);
        } else {
            logger.info("Statistics validation failed, redirecting to info page...");
            ParamUtil.setRequestAttr(request, "statistics", statistics);
            ParamUtil.setRequestAttr(request, "statDetails", statDetails);
            ParamUtil.setRequestAttr(request, "validator", validator);
            return "/statistics/memberConferenceEdit.jsp";
        }
    }
    
    @RequestMapping(value="/conference/view/{id}")
    public String conferenceView(@PathVariable int id, HttpServletRequest request) throws Exception {
        Statistics statistics = statisticsService.getStatistics(id);
        List<StatDetail> statDetail = statDetailService.getStatDetailByStatId(id);
        statistics.setStatDetail(statDetail);
        ParamUtil.setRequestAttr(request, "entity", statistics);
        return "/statistics/memberConferenceView.jsp";
    }
    
    @RequestMapping(value="/delete")
    public String delete(HttpServletRequest request) throws Exception {
        int[] ids = ParamUtil.getInts(request, "selector");
        if (ids != null) {
            statisticsService.deleteStatistics(ids);
        }
        int id = ParamUtil.getInt(request, "id");
        if (id > 0) {
            statisticsService.deleteStatistics(id);
        }
        String fromView = ParamUtil.getString(request, "conference");
        if ("exhibition".equals(fromView)) {
            return exhibitionSearch(request);
        } else if ("conference".equals(fromView)) {
            return conferenceSearch(request);
        }
        return exhibitionSearch(request);
    }
    
    @RequestMapping(value="/conference/dataSheet")
    public String conferenceDataSheet(HttpServletRequest request) throws Exception {
        Customer customer = getCurrentCustomer();
        String statYear = ParamUtil.getString(request, "statYear");
        if (StringUtil.isEmpty(statYear)) {
            Calendar calendar = Calendar.getInstance();
            int currentYear = calendar.get(Calendar.YEAR);
            statYear = String.valueOf(currentYear);
        }
        SearchParam sp = new SearchParam();
        sp.addFilterParam("schStatYear", statYear);
        sp.addFilterParam("schSubmittedBy", customer.getId());
        List<ConferenceDataSheet> conferenceDataSheet = statisticsService.getConferenceDataSheet(sp);
        Map<String, ConferenceDataSheet> conferenceDatas = new HashMap<String, ConferenceDataSheet>();
        if (conferenceDataSheet != null && conferenceDataSheet.size() > 0) {
            // 统计表
            Statistics oldStatistics = statisticsService.getStatistics(conferenceDataSheet.get(0).getStatId());
            ParamUtil.setRequestAttr(request, "statistics", oldStatistics);
            for (ConferenceDataSheet conferenceData: conferenceDataSheet) {
                conferenceDatas.put(conferenceData.getLevel(), conferenceData);    
            }
        }
        ParamUtil.setRequestAttr(request, "statYear", statYear);
        ParamUtil.setRequestAttr(request, "entity", conferenceDatas);
        ParamUtil.setRequestAttr(request, "customer", customer);
        return "/statistics/memberConferenceDataSheet.jsp";
    }
    
    @RequestMapping(value="/conference/dataSheet/save")
    public String conferenceDataSheetSave(HttpServletRequest request) throws Exception {
        Customer customer = getCurrentCustomer();
        int statConferenceId = ParamUtil.getInt(request, "statConferenceId", 0);
        String statYear = ParamUtil.getString(request, "statYear");
        Statistics statistics = new Statistics();
        statistics.setId(statConferenceId);
        statistics.setSubmittedBy(customer.getId());
        statistics.setStatYear(statYear);
        statistics.setFiledBy(ParamUtil.getString(request, "filedBy"));
        statistics.setPhoneNo(ParamUtil.getString(request, "phoneNo"));
        statistics.setType(StatisticsConsts.CE_TYPE_DATASHEET_CONF);
        setStatConference(request, statistics);
        // 统计年份
        ParamUtil.setRequestAttr(request, "statYear", statYear);
        
        Validator<StatConference> validator = new ConferenceDataSheetValidator(request);
        if (validator.validate()) {
            if (statConferenceId > 0) {
                Statistics oldStatistics = statisticsService.getStatistics(statConferenceId);
                // 是否是自己机构的表单check
                if (oldStatistics == null || oldStatistics.getSubmittedBy() != customer.getId()) {
                    return conferenceDataSheet(request);
                }
                statisticsService.updateConferenceDataSheet(statistics);
            } else {
                statisticsService.creatConferenceDataSheet(statistics);
            }
        } else {
            logger.info("StatConference validation failed, redirecting to info page...");
            if (statConferenceId > 0) {
                // 统计表
                Statistics oldStatistics = statisticsService.getStatistics(statConferenceId);
                ParamUtil.setRequestAttr(request, "statistics", oldStatistics);
            }
            ParamUtil.setRequestAttr(request, "entity", getConferenceDataSheet(request));
            ParamUtil.setRequestAttr(request, "validator", validator);
            ParamUtil.setRequestAttr(request, "customer", customer);
            return "/statistics/memberConferenceDataSheet.jsp";
        }
        
        return conferenceDataSheet(request);
    }
    
    @RequestMapping
    public String unspecified(HttpServletRequest request) throws Exception {
        logger.info("Accessing to member statistics...");
        return exhibitionSearch(request);
        
    }
    
    /**
     * 获取当前登录用户所在机构
     * @return Customer
     * @throws Exception
     */
    private Customer getCurrentCustomer() throws Exception {
        AppContext appCtx = AppUtil.getAppContext();
        int userId = 0;
        if (appCtx != null) {
            userId = appCtx.getUserId();
        }
        Customer customer = customerService.getCustomerByUserId(userId);
        if (customer == null) {
            throw new RuntimeException("app context is initialized.");
        }
        return customer;
    }
    
    /**
     * 设置会议数据统计表值
     * @param request
     * @param statistics
     */
    private void setStatConference(HttpServletRequest request, Statistics statistics) {
        if (request == null || statistics == null) {
            return;
        }
        List<StatConference> statConferenceList = new ArrayList<StatConference>();
        // 国际-政府
        StatConference iG = new StatConference();
        iG.setType(StatisticsConsts.CE_CONF_TYPE_GOVERNMENT);
        iG.setTime(ParamUtil.getInt(request, "iGT"));
        iG.setVisitorCount(ParamUtil.getInt(request, "iGV"));
        iG.setLevel(StatisticsConsts.CE_CONF_LEVEL_INTERNATIONAL);
        iG.setRemarks(ParamUtil.getString(request, "iR"));
        statConferenceList.add(iG);
        // 国际-社团
        StatConference iO = new StatConference();
        iO.setType(StatisticsConsts.CE_CONF_TYPE_ORGANIZATION);
        iO.setTime(ParamUtil.getInt(request, "iOT"));
        iO.setVisitorCount(ParamUtil.getInt(request, "iOV"));
        iO.setLevel(StatisticsConsts.CE_CONF_LEVEL_INTERNATIONAL);
        iO.setRemarks(ParamUtil.getString(request, "iR"));
        statConferenceList.add(iO);
        // 国际-企业
        StatConference iB = new StatConference();
        iB.setType(StatisticsConsts.CE_CONF_TYPE_BUSINESS);
        iB.setTime(ParamUtil.getInt(request, "iBT"));
        iB.setVisitorCount(ParamUtil.getInt(request, "iBV"));
        iB.setLevel(StatisticsConsts.CE_CONF_LEVEL_INTERNATIONAL);
        iB.setRemarks(ParamUtil.getString(request, "iR"));
        statConferenceList.add(iB);
        // 国际-其他
        StatConference iZ = new StatConference();
        iZ.setType(StatisticsConsts.CE_CONF_TYPE_OTHER);
        iZ.setTime(ParamUtil.getInt(request, "iZT"));
        iZ.setVisitorCount(ParamUtil.getInt(request, "iZV"));
        iZ.setLevel(StatisticsConsts.CE_CONF_LEVEL_INTERNATIONAL);
        iZ.setRemarks(ParamUtil.getString(request, "iR"));
        statConferenceList.add(iZ);
        // 全国-政府
        StatConference nG = new StatConference();
        nG.setType(StatisticsConsts.CE_CONF_TYPE_GOVERNMENT);
        nG.setTime(ParamUtil.getInt(request, "nGT"));
        nG.setVisitorCount(ParamUtil.getInt(request, "nGV"));
        nG.setLevel(StatisticsConsts.CE_CONF_LEVEL_NATIONAL);
        nG.setRemarks(ParamUtil.getString(request, "nR"));
        statConferenceList.add(nG);
        // 全国-社团
        StatConference nO = new StatConference();
        nO.setType(StatisticsConsts.CE_CONF_TYPE_ORGANIZATION);
        nO.setTime(ParamUtil.getInt(request, "nOT"));
        nO.setVisitorCount(ParamUtil.getInt(request, "nOV"));
        nO.setLevel(StatisticsConsts.CE_CONF_LEVEL_NATIONAL);
        nO.setRemarks(ParamUtil.getString(request, "nR"));
        statConferenceList.add(nO);
        // 全国-企业
        StatConference nB = new StatConference();
        nB.setType(StatisticsConsts.CE_CONF_TYPE_BUSINESS);
        nB.setTime(ParamUtil.getInt(request, "nBT"));
        nB.setVisitorCount(ParamUtil.getInt(request, "nBV"));
        nB.setLevel(StatisticsConsts.CE_CONF_LEVEL_NATIONAL);
        nB.setRemarks(ParamUtil.getString(request, "nR"));
        statConferenceList.add(nB);
        // 全国-其他
        StatConference nZ = new StatConference();
        nZ.setType(StatisticsConsts.CE_CONF_TYPE_OTHER);
        nZ.setTime(ParamUtil.getInt(request, "nZT"));
        nZ.setVisitorCount(ParamUtil.getInt(request, "nZV"));
        nZ.setLevel(StatisticsConsts.CE_CONF_LEVEL_NATIONAL);
        nZ.setRemarks(ParamUtil.getString(request, "nR"));
        statConferenceList.add(nZ);
        // 省级-政府
        StatConference pG = new StatConference();
        pG.setType(StatisticsConsts.CE_CONF_TYPE_GOVERNMENT);
        pG.setTime(ParamUtil.getInt(request, "pGT"));
        pG.setVisitorCount(ParamUtil.getInt(request, "pGV"));
        pG.setLevel(StatisticsConsts.CE_CONF_LEVEL_PROVINCIAL);
        pG.setRemarks(ParamUtil.getString(request, "pR"));
        statConferenceList.add(pG);
        // 省级-社团
        StatConference pO = new StatConference();
        pO.setType(StatisticsConsts.CE_CONF_TYPE_ORGANIZATION);
        pO.setTime(ParamUtil.getInt(request, "pOT"));
        pO.setVisitorCount(ParamUtil.getInt(request, "pOV"));
        pO.setLevel(StatisticsConsts.CE_CONF_LEVEL_PROVINCIAL);
        pO.setRemarks(ParamUtil.getString(request, "pR"));
        statConferenceList.add(pO);
        // 省级-企业
        StatConference pB = new StatConference();
        pB.setType(StatisticsConsts.CE_CONF_TYPE_BUSINESS);
        pB.setTime(ParamUtil.getInt(request, "pBT"));
        pB.setVisitorCount(ParamUtil.getInt(request, "pBV"));
        pB.setLevel(StatisticsConsts.CE_CONF_LEVEL_PROVINCIAL);
        pB.setRemarks(ParamUtil.getString(request, "pR"));
        statConferenceList.add(pB);
        // 省级-其他
        StatConference pZ = new StatConference();
        pZ.setType(StatisticsConsts.CE_CONF_TYPE_OTHER);
        pZ.setTime(ParamUtil.getInt(request, "pZT"));
        pZ.setVisitorCount(ParamUtil.getInt(request, "pZV"));
        pZ.setLevel(StatisticsConsts.CE_CONF_LEVEL_PROVINCIAL);
        pZ.setRemarks(ParamUtil.getString(request, "pR"));
        statConferenceList.add(pZ);
        // 市级-政府
        StatConference cG = new StatConference();
        cG.setType(StatisticsConsts.CE_CONF_TYPE_GOVERNMENT);
        cG.setTime(ParamUtil.getInt(request, "cGT"));
        cG.setVisitorCount(ParamUtil.getInt(request, "cGV"));
        cG.setLevel(StatisticsConsts.CE_CONF_LEVEL_CITY);
        cG.setRemarks(ParamUtil.getString(request, "cR"));
        statConferenceList.add(cG);
        // 市级-社团
        StatConference cO = new StatConference();
        cO.setType(StatisticsConsts.CE_CONF_TYPE_ORGANIZATION);
        cO.setTime(ParamUtil.getInt(request, "cOT"));
        cO.setVisitorCount(ParamUtil.getInt(request, "cOV"));
        cO.setLevel(StatisticsConsts.CE_CONF_LEVEL_CITY);
        cO.setRemarks(ParamUtil.getString(request, "cR"));
        statConferenceList.add(cO);
        // 市级-企业
        StatConference cB = new StatConference();
        cB.setType(StatisticsConsts.CE_CONF_TYPE_BUSINESS);
        cB.setTime(ParamUtil.getInt(request, "cBT"));
        cB.setVisitorCount(ParamUtil.getInt(request, "cBV"));
        cB.setLevel(StatisticsConsts.CE_CONF_LEVEL_CITY);
        cB.setRemarks(ParamUtil.getString(request, "cR"));
        statConferenceList.add(cB);
        // 市级-其他
        StatConference cZ = new StatConference();
        cZ.setType(StatisticsConsts.CE_CONF_TYPE_OTHER);
        cZ.setTime(ParamUtil.getInt(request, "cZT"));
        cZ.setVisitorCount(ParamUtil.getInt(request, "cZV"));
        cZ.setLevel(StatisticsConsts.CE_CONF_LEVEL_CITY);
        cZ.setRemarks(ParamUtil.getString(request, "cR"));
        statConferenceList.add(cZ);
        statistics.setStatConference(statConferenceList);
    }
    
    /**
     * 设置会议数据统计表值
     * @param request
     * @param statistics
     */
    private Map<String, ConferenceDataSheet> getConferenceDataSheet(HttpServletRequest request) {
        Map<String, ConferenceDataSheet> conferenceDatas = new HashMap<String, ConferenceDataSheet>();
        ConferenceDataSheet iData = new ConferenceDataSheet();
        iData.setgTime(ParamUtil.getInt(request, "iGT"));
        iData.setgVisitorCount(ParamUtil.getInt(request, "iGV"));
        iData.setoTime(ParamUtil.getInt(request, "iOT"));
        iData.setoVisitorCount(ParamUtil.getInt(request, "iOV"));
        iData.setbTime(ParamUtil.getInt(request, "iBT"));
        iData.setbVisitorCount(ParamUtil.getInt(request, "iBV"));
        iData.setzTime(ParamUtil.getInt(request, "iZT"));
        iData.setzVisitorCount(ParamUtil.getInt(request, "iZV"));
        iData.setRemarks(ParamUtil.getString(request, "iR"));
        conferenceDatas.put(StatisticsConsts.CE_CONF_LEVEL_INTERNATIONAL, iData);
        ConferenceDataSheet nData = new ConferenceDataSheet();
        nData.setgTime(ParamUtil.getInt(request, "nGT"));
        nData.setgVisitorCount(ParamUtil.getInt(request, "nGV"));
        nData.setoTime(ParamUtil.getInt(request, "nOT"));
        nData.setoVisitorCount(ParamUtil.getInt(request, "nOV"));
        nData.setbTime(ParamUtil.getInt(request, "nBT"));
        nData.setbVisitorCount(ParamUtil.getInt(request, "nBV"));
        nData.setzTime(ParamUtil.getInt(request, "nZT"));
        nData.setzVisitorCount(ParamUtil.getInt(request, "nZV"));
        nData.setRemarks(ParamUtil.getString(request, "nR"));
        conferenceDatas.put(StatisticsConsts.CE_CONF_LEVEL_NATIONAL, nData);
        ConferenceDataSheet pData = new ConferenceDataSheet();
        pData.setgTime(ParamUtil.getInt(request, "pGT"));
        pData.setgVisitorCount(ParamUtil.getInt(request, "pGV"));
        pData.setoTime(ParamUtil.getInt(request, "pOT"));
        pData.setoVisitorCount(ParamUtil.getInt(request, "pOV"));
        pData.setbTime(ParamUtil.getInt(request, "pBT"));
        pData.setbVisitorCount(ParamUtil.getInt(request, "pBV"));
        pData.setzTime(ParamUtil.getInt(request, "pZT"));
        pData.setzVisitorCount(ParamUtil.getInt(request, "pZV"));
        pData.setRemarks(ParamUtil.getString(request, "pR"));
        conferenceDatas.put(StatisticsConsts.CE_CONF_LEVEL_PROVINCIAL, pData);
        ConferenceDataSheet cData = new ConferenceDataSheet();
        cData.setgTime(ParamUtil.getInt(request, "cGT"));
        cData.setgVisitorCount(ParamUtil.getInt(request, "cGV"));
        cData.setoTime(ParamUtil.getInt(request, "cOT"));
        cData.setoVisitorCount(ParamUtil.getInt(request, "cOV"));
        cData.setbTime(ParamUtil.getInt(request, "cBT"));
        cData.setbVisitorCount(ParamUtil.getInt(request, "cBV"));
        cData.setzTime(ParamUtil.getInt(request, "cZT"));
        cData.setzVisitorCount(ParamUtil.getInt(request, "cZV"));
        cData.setRemarks(ParamUtil.getString(request, "cR"));
        conferenceDatas.put(StatisticsConsts.CE_CONF_LEVEL_CITY, cData);
        return conferenceDatas;
    }
}
