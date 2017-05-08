<%@ include file="/includes/imports.jsp"%>

<%@ page import="com.sanyet.fireball.base.entity.ExtraAttr"%>
<%@ page import="com.sanyet.fireball.base.message.entity.Message"%>
<%@ page import="com.sanyet.fireball.content.ContentUtil"%>

<%
  Message entity = (Message) ParamUtil.getRequestAttr(request, "entity");
  if (entity == null) {
      entity = new Message();
  }

  // extra attributions
  ExtraAttr[] extraAttrs = AppUtil.getExtraAttrs(entity.getId(), Message.TABLE_NAME);
%>

<head>
<title><f:message key="ct.contentView.title"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>

<body>
<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/_leftbar.jsp"/>
</jsp:include>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="ct.messageList.Title"/></h3>
  </div>
</div>

<form class="form-horizontal"  name="mainForm" id="mainForm" action="" method="post">
<input type="hidden" name="roleId" value="1"/>
<input type="hidden" name="id" id="id" value="<%=entity.getId()%>"/>

<div class="row">
  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="ct.messageList.Title"/></div>
      <div class="panel-body">
<!--         <div class="form-group"> -->
<%--           <label class="col-md-2 control-label"><f:message key="cm.message.ID"/></label> --%>
<!--           <div class="col-md-10"> -->
<%--             <p class="form-control-static"><%=entity.getId()%></p> --%>
<!--           </div> -->
<!--         </div> -->
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.message.fromname"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=entity.getFromUserId()%></p>
          </div>
        </div>
<!--         <div class="form-group"> -->
<%--           <label class="col-md-2 control-label"><f:message key="cm.message.toname"/></label> --%>
<!--           <div class="col-md-10"> -->
<%--             <p class="form-control-static"><%=entity.getToUserId()%></p> --%>
<!--           </div> -->
<!--         </div> -->
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.message.subject"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getSubject())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.message.text"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getBody())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.message.status"/></label>
          <div class="col-md-10">
            <%
                String status = entity.getStatus();
                if(status != null && !"".equals(status)){
                    status = "message.send." + status;
                }
            %>
            <p class="form-control-static"><f:message key="<%=status%>"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.message.isread"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=entity.isRead()%></p>
          </div>
        </div>
       <%--  <div class="form-group">
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.extraAttr"/></label>
          <div class="col-md-10">
            <%@ include file="/includes/attachmentView.jsp"%>
          </div> --%>
<%--         <%@ include file="/includes/audit.jsp"%> --%>

        <button class="btn btn-default" type="button" onclick="javascript:doDelete();"><f:message key="cm.delete"/></button>&nbsp;<button class="btn btn-default" type="button" onclick="javascript:doCancel();"><f:message key="cm.cancel"/></button>

      </div>
    </div>
  </div>
</div>

</form>

<%@ include file="/includes/footer.jsp"%>

<script>
$(document).ready(function() {
    $('input.cal').datepicker({dateFormat: 'yy-mm-dd', changeYear: true}, $.datepicker.regional['zh-CN']);
    updateUnreadMessages();
});

function updateUnreadMessages() {
    $.ajax({
        url: APP_PATH + '/updateUnreadMessages',
        type: 'POST',
        success: function(res) {
            if (res.status == "SUCCESS") {
                console.log("success");
            }
        }
    });
 }
   
function doEdit() {
    submitForm('<c:url value="/content/edit/"/>' + $('#id').val());
}

function doCancel() {
    submitLink('<c:url value="/system/message/manage"/>');
}

function doDelete(){
    submitLink('<c:url value="/system/message/delete"/>?id='+$('#id').val());
}
</script>
</body>
</html>