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
        <div class="row">
          <div class="row-content">
            <div class="row-left">
              <span class="js_today"></span>
            </div>
            <div class="row-right">

            </div>
          </div>
        </div>

        <div class="line">
          <div class="line-content line-nav">
            <div class="line-item line-nav-left">
              <div class="line-title">
                <div class="line-title-b line-nav-t">学院概况</div>
              </div>
              <div class="line-nav-list">
                <div class="line-nav-item line-nav-item-hover">
                  建设动态
                </div>
                <div class="line-nav-item">
                  项目建设
                </div>
                <div class="line-nav-item">
                  师资队伍
                </div>
                <div class="line-nav-item">
                  制度建设
                </div>
                <div class="line-nav-item">
                  督导通报
                </div>
                <div class="line-nav-item">
                  校企合作
                </div>
                <div class="line-nav-item">
                  政策法规
                </div>
                <div class="line-nav-item">
                  资料下载
                </div>
              </div>
            </div>
            <div class="line-item line-nav-content">
              <div class="line-title">
                <div class="line-title-b line-nav-t">${content.name }</div>
              </div>
              <div class="line-nav-content-b">
                ${content.content }
              </div>
            </div>
          </div>
        </div>

        <div class="footer">
            <div class="footer-top-bg">
            <div class="footer-top">
              友情链接 ：
              <a href="#" target="_blank">苏州服务外包学院</a>
              <span>|</span>
              <a href="#" target="_blank">苏州服务外包学院</a>
            </div>
            </div>
            <div class="footer-content-bg">
            <div class="footer-content">
              <div class="footer-address">
                <div class="footer-list">
                  <a href="<c:url value="/szcea/detail" />" />首页</a>  <span>|</span>
                      <a href="#">学院概况</a>      <span>|</span>
                      <a href="#">院校设置</a>      <span>|</span>
                      <a href="#">学校概况</a>
                </div>
                <div class="footer-tel">
                  <span class="fa fa-phone"></span>0512-54551222
                </div>
                <div class="footer-contact">
                  <div style="padding-bottom: 8px;">邮箱：mi@sisd.edu.cn</div>
                  <div>地址：苏州工业园区若水路99号</div>
                </div>
              </div>
              <div class="footer-weixin">
                  <img src="<c:url value="/szcea/statics/images/siso.jpg"/>"/>
                  <div class="footer-weixin-title">扫一扫，关注我们</div>
              </div>
            </div>
             </div>
        </div>
      </div>
    </div>
  </div>

  <script src="<c:url value="/szcea/statics/scripts/jquery.min.js"/>"></script>
  <script src="<c:url value="/szcea/statics/scripts/a.js"/>"></script>
  <script src="<c:url value="/szcea/statics/scripts/b.js"/>"></script>
</body>
</html>

<script type="text/javascript">
  var data = [
    {amount : 11},
    {amount : 22},
    {amount : 33},
    {amount : 44},
    {amount : undefined}
  ]
  var data_map = data.map(function(e){
    if (e.amount == undefined) {
      e.amount = 0;
    }else{
      return e.amount;
    }

  })
  var sum = data.reduce(function(a,c) {
    console.log(c.amount);
    return a + c.amount;
  },0);
</script>