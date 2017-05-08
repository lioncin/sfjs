<%@ include file="/includes/imports.jsp"%>

<%@ page import="com.sanyet.fireball.base.entity.ExtraAttr"%>
<%@ page import="com.sanyet.fireball.base.message.entity.Message"%>

<%
  boolean isCreate = false;
  Message entity = (Message) ParamUtil.getRequestAttr(request, "entity");
  if (entity == null) {
      isCreate = true;
      entity = new Message();
  }
  String catalogName = null;
  int catalogId = 0;
  if (entity.getSubject() != null) {
      catalogName = entity.getSubject();
      catalogId = entity.getId();
  }

  Map<String, String> statusSelAttrs = new HashMap<String, String>();
  statusSelAttrs.put("name", "status");
  statusSelAttrs.put("class", "form-control s");
  Map<String, String> statusSelOpts = new LinkedHashMap<String, String>();
  statusSelOpts.put("A", MessageUtil.getMessage("cm.status.a"));
  statusSelOpts.put("I", MessageUtil.getMessage("cm.status.i"));
  String status = entity.getStatus();
  if (StringUtil.isEmpty(status)) {
      status = "A";
  }

  String titleKey = isCreate ? "ct.messageEdit.title.create" : "ct.messageEdit.title.edit";

  // extra attributions
  ExtraAttr[] extraAttrs = AppUtil.getExtraAttrs(entity.getId(), Message.TABLE_NAME);
%>

<head>
<title><f:message key="<%=titleKey%>"/></title>
<%@ include file="/includes/styles.jsp"%>
<script src="<c:url value="/statics/scripts/ckeditor/ckeditor.js"/>"></script>
</head>

<body>

<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/_leftbar.jsp"/>
</jsp:include>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="ct.messageEdit.mainTitle"/></h3>
  </div>
</div>

<form class="form-horizontal" name="mainForm" id="mainForm" action="" method="post" enctype="multipart/form-data">
<input type="hidden" name="act" id="act"/>
<input type="hidden" name="roleId" value="1"/>
<input type="hidden" name="id" value="<%=entity.getId()%>"/>

<input type="hidden" name="isBrowser" id="isBrowser"/>
<input type="hidden" name="actionUrl" id="actionUrl" value="<c:url value="/system/message/search"/>"/>
<input type="hidden" name="pageNo" id="pageNo"/>
<input type="hidden" name="orderByColumn" id="orderByColumn"/>
<input type="hidden" name="orderByType" id="orderByType"/>


<div class="row">
  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="ct.messageEdit.mainTitle"/></div>
        <div class="panel-body">
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.message.subject"/></label>
          <div class="col-md-10"><input type="text" name="subject" class="form-control l" value="<%=StringUtil.getNonNull(entity.getSubject())%>"/></div>
        </div>
         <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.message.text"/></label>
          <div class="col-md-10"><textarea class="form-control" rows="5" name="text">${entity.getBody()}</textarea></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.message.toname"/></label>
          <div class="col-md-10"><input type="text" name="toname" class="form-control l" value="<%=StringUtil.getNonNull(entity.getToUserId())%>"/></div>
        </div>
       
    <%--     <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.status"/></label>
          <div class="col-md-10"><%=HtmlElemHelper.generateSelect(statusSelAttrs, statusSelOpts, status)%></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.attachment"/></label>
          <div class="col-md-10"><%@ include file="/includes/attachmentEdit.jsp"%></div>
        </div> --%>
        <button class="btn btn-default" type="button" onclick="javascript:doSave();"><f:message key="cm.save"/></button>&nbsp;<button class="btn btn-default" type="button" onclick="javascript:doCancel();"><f:message key="cm.cancel"/></button>
      </div>
    </div>
  </div>
</div>
</form>

<%@ include file="/includes/footer.jsp"%>
<%@ include file="/includes/validation.jsp"%>

<script src="<c:url value="/statics/scripts/dynamic-table.js"/>"></script>

<script>
$(document).ready(function() {
    $('input.cal').datepicker({dateFormat: 'yy-mm-dd', changeYear: true}, $.datepicker.regional['zh-CN']);
    CKEDITOR.replace('contentTxt', {height: '500px'});
});

function showCatalogPopup(id) {
    var opts = {'url': '<c:url value="/system/message/search"/>', 'data': {'isBrowser': true, 'callback': 'updateSelectedCatalog'}};
    showPopupDialog(opts);
}

function updateSelectedCatalog(id, name) {
    if (parseInt(id) > 0) {
        $('#catalogId').val(id);
        $('#catalogNameSpan').html(name);
    }
}

function doSave() {
    submitForm('<c:url value="/system/message/save"/>');
}

function doCancel() {
    submitLink('<c:url value="/system/message/manage"/>');
}
</script>
</body>
</html>