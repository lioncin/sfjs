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
<html>
<head>
  <title>主页</title>
  <meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="<c:url value="/szcea/statics/styles/b.css"/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value="/szcea/statics/styles/a.css"/>"/>
</head>
<body>
  <div class="container">
    <div class="content">
      <div class="header-container">
        <div class="header-content">
          <div class="banner">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner" role="listbox">
                <div class="item active">
                   <img src="<c:url value="/szcea/statics/images/banner4.png"/>"/>
                </div>
                <div class="item">
                   <img src="<c:url value="/szcea/statics/images/banner4.png"/>"/>
                </div>
                <div class="item">
                   <img src="<c:url value="/szcea/statics/images/banner4.png"/>"/>
                </div>
              </div>
            </div>
          </div>
          <div class="header-logo">
            <img src="<c:url value="/szcea/statics/images/logo.png"/>"/>
          </div>
        </div>
        <div class="nav-container">
          <div class="nav-content">
            <div class="nav-item">
              <a href="<c:url value="/" />">首页</a>
            </div>
            <div class="nav-item">
              <a href="<c:url value="/szcea/detail" />/2" />建设动态</a>
            </div>
            <div class="nav-item">
              <a href="<c:url value="/szcea/detail" />/3" />项目建设</a>
            </div>
            <div class="nav-item">
              <a href="<c:url value="/szcea/detail" />/4" />师资队伍</a>
            </div>
            <div class="nav-item">
              <a href="<c:url value="/szcea/detail" />/5" />制度建设</a>
            </div>
            <div class="nav-item">
              <a href="<c:url value="/szcea/detail" />/6" />督导通报</a>
            </div>
            <div class="nav-item">
              <a href="<c:url value="/szcea/detail" />/7" />校企合作</a>
            </div>
            <div class="nav-item">
              <a href="<c:url value="/szcea/detail" />/8" />政策法规</a>
            </div>
            <div class="nav-item last">
              <a href="<c:url value="/szcea/detail" />/9" />资料下载</a>
            </div>

          </div>
        </div>