<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.LinkedHashMap"%>

<%@ page import="org.springframework.web.servlet.support.RequestContextUtils"%>

<%@ page import="com.sanyet.fireball.base.entity.User"%>
<%@ page import="com.sanyet.fireball.base.AppContext"%>
<%@ page import="com.sanyet.fireball.base.AppConsts"%>
<%@ page import="com.sanyet.fireball.base.AppUtil"%>
<%@ page import="com.sanyet.fireball.base.validation.ValidError"%>
<%@ page import="com.sanyet.fireball.base.validation.Validator"%>
<%@ page import="com.sanyet.fireball.base.util.DateUtil"%>
<%@ page import="com.sanyet.fireball.base.util.FileUtil"%>
<%@ page import="com.sanyet.fireball.base.util.MiscUtil"%>
<%@ page import="com.sanyet.fireball.base.util.NumberUtil"%>
<%@ page import="com.sanyet.fireball.base.util.ParamUtil"%>
<%@ page import="com.sanyet.fireball.base.util.StringUtil"%>
<%@ page import="com.sanyet.fireball.base.util.HtmlElemHelper"%>
<%@ page import="com.sanyet.fireball.base.message.MessageUtil"%>
<%@ page import="com.sanyet.fireball.content.ContentUtil"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fireball.tld" prefix="f"%>
<%@ taglib uri="/WEB-INF/tlds/szcea.tld" prefix="ce"%>

<%
  // globle codes
  String siteLang = "zh-CN";  // en, zh-CN

  AppContext _appCtx = AppUtil.getAppContext();

  String APP_PATH = request.getContextPath();

  pageContext.setAttribute("website", ContentUtil.getWebsite());
%>

<!DOCTYPE html>

<html lang="<%=siteLang%>">
<head>
<title>${website.name}</title>
<%@ page contentType="text/html;charset=UTF-8"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="会展,展会,展览,会议,活动">
<meta name="author" content="linx@sipso.com.cn">

<link rel="shortcut icon" href="<c:url value="/szcea/statics/images/favicon.png"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/szcea/statics/styles/szcea.css"/>"/>

<!--[if lt IE 9]>
  <script src="statics/scripts/html5shiv.min.js"></script>
  <script src="statics/scripts/respond.min.js"></script>
<![endif]-->

</head>
<body>
    <div id="header">
        <div id="header-container">
            <div class="left logo">
               <img src="<c:url value="/szcea/statics/images/logo.png"/>"/>
            </div>
            <div class="right content">
                <div class="name left"><f:message key="ce.website.home.zbdw" /><br /><f:message key="ce.website.home.xbdw" />
                </div>
                <div class="login right">
                    <a class="login right btn" href="javascript:clickTopMenu('<c:url value="/customer/register2.jsp"/>');"><f:message key="member.register" /></a>
                    <a class="login right btn" href="javascript:clickTopMenu('<c:url value="/admin"/>');"><f:message key="ce.website.home.memberlogin" /></a>
                </div>
                <div class="cls"></div>
            </div>
            <div class="cls"></div>
        </div><!-- end of header container -->
    </div><!-- end of header -->

    <div id="menu">
        <div id="menu-container">
            <ce:header tag="TOP"/>
        </div>
    </div><!-- end of menu -->
