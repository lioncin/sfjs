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
              <a href="<c:url value="/szcea/detail" />">首页</a>
            </div>
            <div class="nav-item">
              <a href="<c:url value="/szcea/detail" />" />建设动态</a>
            </div>
            <div class="nav-item">
              <a href="<c:url value="/szcea/detail" />" />项目建设</a>
            </div>
            <div class="nav-item">
              <a href="<c:url value="/szcea/detail" />" />师资队伍</a>
            </div>
            <div class="nav-item">
              <a href="<c:url value="/szcea/detail" />" />制度建设</a>
            </div>
            <div class="nav-item">
              <a href="<c:url value="/szcea/detail" />" />督导通报</a>
            </div>
            <div class="nav-item">
              <a href="<c:url value="/szcea/detail" />" />校企合作</a>
            </div>
            <div class="nav-item">
              <a href="<c:url value="/szcea/detail" />" />政策法规</a>
            </div>
            <div class="nav-item last">
              <a href="<c:url value="/szcea/detail" />" />资料下载</a>
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
                <div class="line-title-b line-nav-t">学院简介</div>
              </div>
              <div class="line-nav-content-b">
                &#12288;当地时间2017年5月8日，菲律宾西米萨米斯省，渔民杀鱼时发现了一只满身文身的大鱼，照片在被传到社交网络上后引起了轩然大波。这只鱼全身都是图案，而且是充满艺术设计的图案，其中有一顶立在盾牌上的皇冠、一些花体文字还有一些树藤。毫无疑问，这些文身都是人类所为，但他究竟是怎样把文身刺在一条生活在海里的大鱼身上的呢？数千人在菲律宾新闻网GMA发布的这条新闻下留言发表自己的观点。这其中，一位名叫Steve Clark的观点比较理性，他认为这些文身是沉积在海里的垃圾或是纺织品印在鱼身上的。而大多数网友的评论都是脑洞大开，他们觉得，世界上很多东西都是未知的，尤其是海洋，有一位网友觉得：这条鱼是从海底监狱逃出来的。
                当地时间2017年5月8日，菲律宾西米萨米斯省，渔民杀鱼时发现了一只满身文身的大鱼，照片在被传到社交网络上后引起了轩然大波。这只鱼全身都是图案，而且是充满艺术设计的图案，其中有一顶立在盾牌上的皇冠、一些花体文字还有一些树藤。毫无疑问，这些文身都是人类所为，但他究竟是怎样把文身刺在一条生活在海里的大鱼身上的呢？数千人在菲律宾新闻网GMA发布的这条新闻下留言发表自己的观点。这其中，一位名叫Steve Clark的观点比较理性，他认为这些文身是沉积在海里的垃圾或是纺织品印在鱼身上的。而大多数网友的评论都是脑洞大开，他们觉得，世界上很多东西都是未知的，尤其是海洋，有一位网友觉得：这条鱼是从海底监狱逃出来的。
                当地时间2017年5月8日，菲律宾西米萨米斯省，渔民杀鱼时发现了一只满身文身的大鱼，照片在被传到社交网络上后引起了轩然大波。这只鱼全身都是图案，而且是充满艺术设计的图案，其中有一顶立在盾牌上的皇冠、一些花体文字还有一些树藤。毫无疑问，这些文身都是人类所为，但他究竟是怎样把文身刺在一条生活在海里的大鱼身上的呢？数千人在菲律宾新闻网GMA发布的这条新闻下留言发表自己的观点。这其中，一位名叫Steve Clark的观点比较理性，他认为这些文身是沉积在海里的垃圾或是纺织品印在鱼身上的。而大多数网友的评论都是脑洞大开，他们觉得，世界上很多东西都是未知的，尤其是海洋，有一位网友觉得：这条鱼是从海底监狱逃出来的。
                当地时间2017年5月8日，菲律宾西米萨米斯省，渔民杀鱼时发现了一只满身文身的大鱼，照片在被传到社交网络上后引起了轩然大波。这只鱼全身都是图案，而且是充满艺术设计的图案，其中有一顶立在盾牌上的皇冠、一些花体文字还有一些树藤。毫无疑问，这些文身都是人类所为，但他究竟是怎样把文身刺在一条生活在海里的大鱼身上的呢？数千人在菲律宾新闻网GMA发布的这条新闻下留言发表自己的观点。这其中，一位名叫Steve Clark的观点比较理性，他认为这些文身是沉积在海里的垃圾或是纺织品印在鱼身上的。而大多数网友的评论都是脑洞大开，他们觉得，世界上很多东西都是未知的，尤其是海洋，有一位网友觉得：这条鱼是从海底监狱逃出来的。
                当地时间2017年5月8日，菲律宾西米萨米斯省，渔民杀鱼时发现了一只满身文身的大鱼，照片在被传到社交网络上后引起了轩然大波。这只鱼全身都是图案，而且是充满艺术设计的图案，其中有一顶立在盾牌上的皇冠、一些花体文字还有一些树藤。毫无疑问，这些文身都是人类所为，但他究竟是怎样把文身刺在一条生活在海里的大鱼身上的呢？数千人在菲律宾新闻网GMA发布的这条新闻下留言发表自己的观点。这其中，一位名叫Steve Clark的观点比较理性，他认为这些文身是沉积在海里的垃圾或是纺织品印在鱼身上的。而大多数网友的评论都是脑洞大开，他们觉得，世界上很多东西都是未知的，尤其是海洋，有一位网友觉得：这条鱼是从海底监狱逃出来的。
                当地时间2017年5月8日，菲律宾西米萨米斯省，渔民杀鱼时发现了一只满身文身的大鱼，照片在被传到社交网络上后引起了轩然大波。这只鱼全身都是图案，而且是充满艺术设计的图案，其中有一顶立在盾牌上的皇冠、一些花体文字还有一些树藤。毫无疑问，这些文身都是人类所为，但他究竟是怎样把文身刺在一条生活在海里的大鱼身上的呢？数千人在菲律宾新闻网GMA发布的这条新闻下留言发表自己的观点。这其中，一位名叫Steve Clark的观点比较理性，他认为这些文身是沉积在海里的垃圾或是纺织品印在鱼身上的。而大多数网友的评论都是脑洞大开，他们觉得，世界上很多东西都是未知的，尤其是海洋，有一位网友觉得：这条鱼是从海底监狱逃出来的。
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