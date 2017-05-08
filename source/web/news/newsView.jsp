<%@ include file="/includes/imports.jsp"%>

<%@ page import="com.sanyet.fireball.base.entity.ExtraAttr"%>
<%@ page import="com.sanyet.fireball.content.entity.Content"%>
<%@ page import="com.sanyet.fireball.content.ContentUtil"%>

<%
  Content entity = (Content) ParamUtil.getRequestAttr(request, "entity");
  if (entity == null) {
      entity = new Content();
  }

  // extra attributions
  ExtraAttr[] extraAttrs = AppUtil.getExtraAttrs(entity.getId(), Content.TABLE_NAME);
%>

<head>
<title><f:message key="ct.contentView.title"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>

<body>
<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_memberLeftbar.jsp"/>
</jsp:include>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="ct.contentView.mainTitle"/></h3>
  </div>
</div>

<form class="form-horizontal"  name="mainForm" id="mainForm" action="" method="post">
<input type="hidden" name="roleId" value="1"/>
<input type="hidden" name="id" id="id" value="<%=entity.getId()%>"/>

<div class="row">
  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="ct.contentView.mainTitle"/></div>
      <div class="panel-body">
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.name"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getName())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.catalog"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getCatalog() == null ? "" : entity.getCatalog().getName())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.tag"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getTag())%></p>
          </div>
        </div>
    <%--     <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.metaKeyword"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getMetaKeywords())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.metaDescription"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getMetaDescription())%></p>
          </div>
        </div> --%>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.summary"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getSummary())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.content"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getContent())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.title"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getTitle())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.showTitle"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=MessageUtil.getMessage("cm." + (entity.isShowTitle() ? "yes" : "no"))%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.canComment"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=MessageUtil.getMessage("cm." + (entity.isCanComment() ? "yes" : "no"))%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.stickTop"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=MessageUtil.getMessage("cm." + (entity.isStickTop() ? "yes" : "no"))%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.author"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getAuthor())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.source"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getSource())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.publishDate"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><f:date value="${entity.publishDate}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.status"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=ContentUtil.getContentStatusDesc(entity.getStatus())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.extraAttr"/></label>
          <div class="col-md-10">
            <%@ include file="/includes/attachmentView.jsp"%>
          </div>
        </div>
        <%@ include file="/includes/audit.jsp"%>
        <%if(!"P".equals(entity.getStatus())) {%>
        <%@ include file="/includes/approveRemarkView.jsp"%>
        <button class="btn btn-default" type="button" onclick="javascript:doDelete();"><f:message key="cm.delete"/></button>&nbsp;<button class="btn btn-default" type="button" onclick="javascript:doCancel();"><f:message key="cm.cancel"/></button>
        <%} else{%>
        <button class="btn btn-default" type="button" onclick="javascript:doEdit();"><f:message key="cm.edit"/></button>&nbsp;<button class="btn btn-default" type="button" onclick="javascript:doDelete();"><f:message key="cm.delete"/></button>&nbsp;<button class="btn btn-default" type="button" onclick="javascript:doCancel();"><f:message key="cm.cancel"/></button>
        <%} %>
        
        
      </div>
    </div>
  </div>
</div>

</form>

<%@ include file="/includes/footer.jsp"%>

<script>
$(document).ready(function() {
    $('input.cal').datepicker({dateFormat: 'yy-mm-dd', changeYear: true}, $.datepicker.regional['zh-CN']);
});

function doEdit() {
    submitForm('<c:url value="/news/edit/"/>' + $('#id').val());
}

function doCancel() {
    submitLink('<c:url value="/news/manage"/>');
}

function doDelete(){
    submitLink('<c:url value="/news/delete"/>?id='+$('#id').val());
}
</script>
</body>
</html>