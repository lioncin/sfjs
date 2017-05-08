/*
 * Copyright 2016, SanYet.com. All rights reserved.
 */
package com.sanyet.fireball.szcea.tag;

import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

import com.sanyet.fireball.base.util.HtmlElemHelper;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.szcea.SzceaCst;

/**
 * <f:yearSelect name="" css="" firstYear="" lastYear="" firstOption="" selectYear=""/>
 *
 * @author lupeng
 */
public class YearSelectTag extends TagSupport {
    private static final long serialVersionUID = 1L;

    public static final int DEFAULT_FROM_YEAR = SzceaCst.DEFAULT_FROM_YEAR;
    private static final String SELECT_CURRENT_YEAR = "currentYear"; // selectYear = "currentYear"时选择当前时间
    
    private String name;
    private String css;
    private int firstYear;
    private int lastYear;
    private String firstOption;
    private String selectYear;
    

    public YearSelectTag() {
        super();
        init();
    }

    // resets local state
    private void init() {
        name = null;
        css = null;
        firstYear = 0;
        lastYear = 0;
        firstOption = null;
        selectYear = null;
    }

    // Releases any resources we may have (or inherit)
    public void release() {
        super.release();
        init();
    }

    public int doStartTag() throws JspException {
        try {
            String html = "";
            Map<String, String> yearSelAttrs = new HashMap<String, String>();
            yearSelAttrs.put("name", name);
            yearSelAttrs.put("id", name);
            if (StringUtil.isNotEmpty(css)) {
                yearSelAttrs.put("class", css);
            }
            Map<String, String> yearSelOpts = new LinkedHashMap<String, String>();
            Calendar calendar = Calendar.getInstance();
            int currentYear = calendar.get(Calendar.YEAR);
            int fromYear = DEFAULT_FROM_YEAR;
            int toYear = currentYear; // 默认到当前时间年份
            String optionYear = ""; // 默认不选
            if (firstYear != 0) {
                fromYear = firstYear;
            }
            if (lastYear != 0) {
                toYear = lastYear;
            }
            if (StringUtil.isNotEmpty(selectYear)) {
                if (SELECT_CURRENT_YEAR.equals(selectYear)) {
                    optionYear = String.valueOf(currentYear);
                } else {
                    optionYear = selectYear;
                }
            }
            if (StringUtil.isNotEmpty(firstOption)) {
                yearSelOpts.put("", firstOption);
            }
            for (int i = fromYear; i <= toYear; i++) {
                yearSelOpts.put(String.valueOf(i), String.valueOf(i));
            }
            html = HtmlElemHelper.generateSelect(yearSelAttrs, yearSelOpts, optionYear);

            pageContext.getOut().print(html);
        } catch (Exception ex) {
            throw new JspTagException("MasterCodeTag: " + ex.getMessage());
        }
        return SKIP_BODY;
    }

    public int doEndTag() {
        return EVAL_PAGE;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCss(String css) {
        this.css = css;
    }

    public void setFirstYear(int firstYear) {
        this.firstYear = firstYear;
    }

    public void setLastYear(int lastYear) {
        this.lastYear = lastYear;
    }

    public void setFirstOption(String firstOption) {
        this.firstOption = firstOption;
    }

    public void setSelectYear(String selectYear) {
        this.selectYear = selectYear;
    }
}
