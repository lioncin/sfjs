<%@ include file="/includes/imports.jsp"%>

<%@ page import="com.sanyet.fireball.content.entity.Catalog"%>
<%@ page import="com.sanyet.fireball.content.ContentUtil"%>

<%
  Catalog entity = (Catalog) ParamUtil.getRequestAttr(request, "entity");
  if (entity == null) {
      entity = new Catalog();
  }
%>

<head>
<title><f:message key="ct.catalogView.title"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>

<body>
<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/content/_leftbar.jsp"/>
</jsp:include>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="ct.catalogView.mainTitle"/></h3>
  </div>
</div>

<form class="form-horizontal" name="mainForm" id="mainForm" action="" method="post">
<input type="hidden" name="roleId" value="1"/>
<input type="hidden" name="id" value="<%=entity.getId()%>"/>

<div class="row">
  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="ct.catalogView.mainTitle"/></div>
      <div class="panel-body">
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.catalog.name"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getName())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.catalog.parent"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getParent() == null ? "" : entity.getParent().getName())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.catalog.tag"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getTag())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.catalog.title"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getTitle())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.catalog.showTitle"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=MessageUtil.getMessage("cm." + (entity.isShowTitle() ? "yes" : "no"))%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.status"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=ContentUtil.getStatusDesc(entity.getStatus())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.description"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getDescription())%></p>
          </div>
        </div>

        <%@ include file="/includes/audit.jsp"%>
        
        <button class="btn btn-default" type="button" onclick="javascript:doEdit();"><f:message key="cm.edit"/></button>&nbsp;<button class="btn btn-default" type="button" onclick="javascript:doDelete();"><f:message key="cm.delete"/></button>&nbsp;<button class="btn btn-default" type="button" onclick="javascript:doCancel();"><f:message key="cm.cancel"/></button>

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
    submitForm('<c:url value="/content/catalog/edit/"/>' + $('#id').val());
}

function doCancel() {
    submitLink('<c:url value="/content/catalog/manage"/>');
}
</script>
</body>
</html>