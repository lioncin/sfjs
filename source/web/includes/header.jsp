<%@ page import="com.sanyet.fireball.base.util.StringUtil"%>
<%@ page import="com.sanyet.fireball.base.util.ParamUtil"%>
<%@ page import="com.sanyet.fireball.base.AppUtil"%>
<%@ page import="com.sanyet.fireball.base.AppContext"%>
<%@ page import="com.sanyet.fireball.base.service.GroupService"%>
<%@ page import="com.sanyet.fireball.base.entity.Group"%>
<%@ page import="com.sanyet.fireball.customer.entity.Customer"%>
<%@ page import="com.sanyet.fireball.base.acl.AccessChecker"%>
<%@ page import="com.sanyet.fireball.szcea.SzceaCst"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fireball.tld" prefix="f"%>

<%
  String leftMenuPath = request.getParameter("leftMenuPath");
/*   AppContext appCtx = AppUtil.getAppContext(); */
 /*  if(appCtx != null){
  Group group = groupService.getGroup(appCtx.getUserId());
  } */
 /*  String userId = (String) ParamUtil.getSessionAttr(request, "userId"); */
 /* String userId = (String) session.getAttribute("userId"); */
%>

<div class="modal" id="waitingModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-body">
        <p><img src="<c:url value="/statics/images/loading.gif"/>"> <f:message key="cm.waiting"/></p>
      </div>
    </div>
  </div>
</div>

<div id="wrapper">

<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-top" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#" style="width: 250px;">Ceasz Admin</a>
    </div>

    <!-- top menu -->
    <div class="collapse navbar-collapse" id="navbar-top">
     <ul class="nav navbar-nav">
        <%-- <li><a href="javascript:clickTopMenu('<c:url value="/admin"/>');"><f:message key="in.navigator.home"/></a></li> --%>
        <f:access privilege="<%=SzceaCst.CT_CUSTOMER%>"><li><a href="javascript:clickTopMenu('<c:url value="/member"/>');"><f:message key="in.navigator.staff.center"/></a></li></f:access>
        <f:access privilege="<%=SzceaCst.CT_CONTENT%>"><li><a href="javascript:clickTopMenu('<c:url value="/content"/>');"><f:message key="in.navigator.content"/></a></li></f:access>
        <%-- <f:access privilege="<%=SzceaCst.CT_PRODUCT%>"><li><a href="javascript:clickTopMenu('<c:url value="/product"/>');"><f:message key="in.navigator.product"/></a></li></f:access>
        <f:access privilege="<%=SzceaCst.CT_STORE%>"><li><a href="javascript:clickTopMenu('<c:url value="/store"/>');"><f:message key="in.navigator.store"/></a></li></f:access>
        <f:access privilege="<%=SzceaCst.CT_EDUCATION%>"><li><a href="javascript:clickTopMenu('<c:url value="/education"/>');"><f:message key="in.navigator.education"/></a></li></f:access>
        <f:access privilege="<%=SzceaCst.CT_ASSEST%>"><li><a href="javascript:clickTopMenu('<c:url value="/asset/category"/>');"><f:message key="in.navigator.asset"/></a></li></f:access>
        <f:access privilege="<%=SzceaCst.CT_COMMUNITY%>"><li><a href="javascript:clickTopMenu('<c:url value="/community"/>');"><f:message key="in.navigator.community"/></a></li></f:access> --%>
        <f:access privilege="<%=SzceaCst.CT_SYSTEM%>"><li><a href="javascript:clickTopMenu('<c:url value="/system"/>');"><f:message key="in.navigator.system"/></a></li></f:access>
        <f:access privilege="<%=SzceaCst.CT_CUSTOMER_SELF%>"><li><a href="javascript:clickTopMenu('<c:url value="/organization"/>');"><f:message key="in.navigator.member.center"/></a></li></f:access>
      </ul>
      
      <!--<form class="navbar-form navbar-left" role="search">
        <div class="form-group">
        <a  class="dropdown-toggle" data-toggle="dropdown">
        
        
          <input type="text" class="form-control" placeholder="Search">
        </div><a href="javascript:getLatestMessages('<c:url value="/admin"/>','<c:url value="1"/>');">
        <button type="submit" class="btn btn-default">Submit</button>
      </form>-->

      <ul class="nav navbar-nav navbar-right navbar-top-links">
        <!-- messages -->
        <li id="latestMessage" class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#" onclick="javascript:getLatestMessages();">
            <i class="fa fa-envelope fa-fw"></i><i id="unreadMessage" ></i>  <i class="fa fa-caret-down"></i>
          </a>
        </li>
        
        <!-- tasks -->
        <!-- <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
          </a>
          <ul class="dropdown-menu dropdown-tasks">
            <li>
              <a href="#">
                <div>
                  <p>
                    <strong>Task 1</strong>
                    <span class="pull-right text-muted">40% Complete</span>
                  </p>
                  <div class="progress progress-striped active">
                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                      <span class="sr-only">40% Complete (success)</span>
                    </div>
                  </div>
                </div>
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <a href="#">
                <div>
                  <p>
                    <strong>Task 2</strong>
                    <span class="pull-right text-muted">20% Complete</span>
                  </p>
                  <div class="progress progress-striped active">
                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                      <span class="sr-only">20% Complete</span>
                    </div>
                  </div>
                </div>
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <a href="#">
                <div>
                  <p>
                    <strong>Task 3</strong>
                    <span class="pull-right text-muted">60% Complete</span>
                  </p>
                  <div class="progress progress-striped active">
                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                      <span class="sr-only">60% Complete (warning)</span>
                    </div>
                  </div>
                </div>
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <a href="#">
                <div>
                  <p>
                    <strong>Task 4</strong>
                    <span class="pull-right text-muted">80% Complete</span>
                  </p>
                  <div class="progress progress-striped active">
                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                      <span class="sr-only">80% Complete (danger)</span>
                    </div>
                  </div>
                </div>
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <a class="text-center" href="#">
                <strong>See All Tasks</strong>
                <i class="fa fa-angle-right"></i>
              </a>
            </li>
          </ul>
        </li>

        alerts
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
          </a>
          <ul class="dropdown-menu dropdown-alerts">
            <li>
              <a href="#">
                <div>
                  <i class="fa fa-comment fa-fw"></i> New Comment
                  <span class="pull-right text-muted small">4 minutes ago</span>
                </div>
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <a href="#">
                <div>
                  <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                  <span class="pull-right text-muted small">12 minutes ago</span>
                </div>
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <a href="#">
                <div>
                  <i class="fa fa-envelope fa-fw"></i> Message Sent
                  <span class="pull-right text-muted small">4 minutes ago</span>
                </div>
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <a href="#">
                <div>
                  <i class="fa fa-tasks fa-fw"></i> New Task
                  <span class="pull-right text-muted small">4 minutes ago</span>
                </div>
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <a href="#">
                <div>
                  <i class="fa fa-upload fa-fw"></i> Server Rebooted
                  <span class="pull-right text-muted small">4 minutes ago</span>
                </div>
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <a class="text-center" href="#">
                <strong>See All Alerts</strong>
                <i class="fa fa-angle-right"></i>
              </a>
            </li>
          </ul>
        </li> -->

        <!-- profile -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-user fa-fw"></i>  <i id="fa fa-caret-down" class="fa fa-caret-down"></i>
          </a>
          <ul class="dropdown-menu dropdown-user">
            <li><a href="javascript:clickTopMenu('<c:url value="/system/user/profile"/>');"><i class="fa fa-user fa-fw"></i><f:message key="cm.myAccount.profile"/></a></li>
            <li><a href="#"><i class="fa fa-gear fa-fw"></i><f:message key="cm.myAccount.settings"/></a></li>
            <li class="divider"></li>
            <li><a href="<c:url value="/j_spring_security_logout"/>"><i class="fa fa-sign-out fa-fw"></i> <f:message key="cm.logout"/></a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>

  <!-- left menu -->
  <div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
      <ul class="nav" id="side-menu">
        <li class="sidebar-search">
          <div class="input-group custom-search-form">
            <input type="text" class="form-control" placeholder="Search...">
            <span class="input-group-btn">
              <button class="btn btn-default" type="button">
                <i class="fa fa-search"></i>
              </button>
            </span>
          </div>
        </li>
        <%if (StringUtil.isNotEmpty(leftMenuPath)) {%>
        <jsp:include page="<%=leftMenuPath%>"/>
        <%}%>
      </ul>
    </div>
  </div>
 
</nav>
</div>

  <div id="page-wrapper">
    <div class="container-fluid">
<script type="text/javascript">
$(document).ready(function() {
 //   getUnreadMessages();
    window.setInterval(getUnreadMessages, 60000); //循环执行  
});
function getUnreadMessages() {
 $.ajax({
     url: APP_PATH + '/getUnreadMessages',
     type: 'POST',
     success: function(res) {
         if (res.status == "SUCCESS") {
             var count = res.data.count;
             if(count > 0){
                 $('#unreadMessage').addClass("unreadMessage");
             }else{
                 $('#unreadMessage').removeClass("unreadMessage");
             }
         }
     }
 });
}

var socket = null;
$(function(){
  function parseObj(StringData){
    return (new Function("return" + StringData))();
  }
  //创建socket对象
  socket = null;
  var url = 'ws://'+ window.location.host+'${pageContext.request.contextPath}/game';
  if ('MozWebSocket' in window) {
      socket = new MozWebSocket(url);
  } else if ('WebSocket' in window) {
      socket = new WebSocket(url);
  }
  //连接创建后调用
  socket.onopen = function() {
      console.log("open");
  }
  
  //接收到服务器消息后调用
    socket.onmessage = function(message) {
        var data=parseObj(message.data);
        if(data.text > 0){
            $('#unreadMessage').addClass("unreadMessage");
        }else{
            $('#unreadMessage').removeClass("unreadMessage"); 
        }
    };

  //关闭连接的时候调用
    socket.onclose = function(){
        console.log("close");
    }
  //出错时调用
    socket.onerror = function() {
        console.log("error");
    }
  
});
</script>
