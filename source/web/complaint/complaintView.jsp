<%@ include file="/includes/imports.jsp"%>

<%@ page import="com.sanyet.fireball.szcea.entity.Activity"%>
<%@ page import="com.sanyet.fireball.base.entity.Comment"%>

<%
  boolean isCreate = false;
  Comment entity = (Comment) ParamUtil.getRequestAttr(request, "entity");
  if (entity == null) {
      isCreate = true;
      entity = new Comment();
  }

  String titleKey = isCreate ? "ct.catalogEdit.title.create" : "ct.catalogEdit.title.edit";
%>

<head>
<title><f:message key="ce.advice.send"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>

<body>

<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_staffLeftbar.jsp"/>
</jsp:include>

<div class="container">
<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="ce.advice.send"/></h3>
  </div>
</div>

<form class="form-horizontal" name="mainForm" id="mainForm" action="" method="post" enctype="multipart/form-data">
<input type="hidden" name="act" id="act"/>
<input type="hidden" name="roleId" value="1"/>
<input type="hidden" name="id" value="<%=entity.getId()%>"/>

<input type="hidden" name="isBrowser" id="isBrowser"/>
<input type="hidden" name="actionUrl" id="actionUrl" value="<c:url value="/project/search"/>"/>
<input type="hidden" name="pageNo" id="pageNo"/>
<input type="hidden" name="orderByColumn" id="orderByColumn"/>
<input type="hidden" name="orderByType" id="orderByType"/>

<div class="row">
  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="ce.advice.send.detail"/></div>
      <div class="panel-body">
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="ce.advice.name"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getAuthorName())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="ce.advice.phone"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getAuthorMobile())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="ce.advice.send"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getContent())%></p>
          </div>
        </div>
        <button class="btn btn-default" type="button" onclick="javascript:doDelete();"><f:message key="cm.delete"/></button>&nbsp;<button class="btn btn-default" type="button" onclick="javascript:doCancel();"><f:message key="cm.cancel"/></button>
      </div>
    </div>
  </div>
</div>

</form>

<%@ include file="/includes/footer.jsp"%>
<%@ include file="/includes/validation.jsp"%>

<script>
$(document).ready(function() {
    $('input.cal').datepicker({dateFormat: 'yy-mm-dd', changeYear: true}, $.datepicker.regional['zh-CN']);
    
});

function showCatalogPopup(id) {
    var opts = {'url': '<c:url value="/activity/search"/>', 'data': {'isBrowser': true, 'callback': 'updateSelectedCatalog'}};
    showPopupDialog(opts);
}

function updateSelectedCatalog(id, name) {
    if (parseInt(id) > 0) {
        $('#parentId').val(id);
        $('#parentNameSpan').html(name);
    }
}

function doSave() {
    submitForm('<c:url value="/complaint/sendComplaint"/>');
}

function doCancel() {
    submitLink('<c:url value="/complaint/manage"/>');
}

function doDelete() {
    if (confirm('<f:message key="cm.confirm.delete"/>')) {
      submitForm('<c:url value="/complaint/delete"/>/?id=${entity.id}');
    }
  }
</script>
</body>
</html>