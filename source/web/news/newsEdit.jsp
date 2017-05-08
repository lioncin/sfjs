<%@ include file="/includes/imports.jsp"%>

<%@ page import="com.sanyet.fireball.base.entity.ExtraAttr"%>
<%@ page import="com.sanyet.fireball.content.entity.Content"%>

<%
  boolean isCreate = false;
  Content entity = (Content) ParamUtil.getRequestAttr(request, "entity");
  Integer roleId = (Integer) ParamUtil.getRequestAttr(request, "roleId");
  if (entity == null) {
      isCreate = true;
      entity = new Content();
  }
  if (roleId == null) {
      roleId = 0;
  }
  String catalogName = null;
  int catalogId = 0;
  if (entity.getCatalog() != null) {
      catalogName = entity.getCatalog().getName();
      catalogId = entity.getCatalog().getId();
  }

  Map<String, String> statusSelAttrs = new HashMap<String, String>();
  statusSelAttrs.put("name", "status");
  statusSelAttrs.put("class", "form-control s");
  Map<String, String> statusSelOpts = new LinkedHashMap<String, String>();
  String status = entity.getStatus();
  if(roleId == 1){
      if (StringUtil.isEmpty(status)) {
          status = "P";
          statusSelOpts.put("P", MessageUtil.getMessage("ct.status.p"));
      }else{
          statusSelOpts.put("P", MessageUtil.getMessage("ct.status.p"));
          statusSelOpts.put("A", MessageUtil.getMessage("ct.status.c"));
          statusSelOpts.put("I", MessageUtil.getMessage("cm.status.i")); 
      }
  }else{
          status = "P";
          statusSelOpts.put("P", MessageUtil.getMessage("ct.status.p"));
  }

  String titleKey = isCreate ? "ct.contentEdit.title.create" : "ct.contentEdit.title.edit";

  // extra attributions
  ExtraAttr[] extraAttrs = AppUtil.getExtraAttrs(entity.getId(), Content.TABLE_NAME);
%>

<head>
<title><f:message key="<%=titleKey%>"/></title>
<%@ include file="/includes/styles.jsp"%>
<script src="<c:url value="/statics/scripts/ckeditor/ckeditor.js"/>"></script>
</head>

<body>

<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_memberLeftbar.jsp"/>
</jsp:include>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="ct.contentEdit.mainTitle"/></h3>
  </div>
</div>

<form class="form-horizontal" name="mainForm" id="mainForm" action="" method="post" enctype="multipart/form-data">
<input type="hidden" name="act" id="act"/>
<input type="hidden" name="roleId" value="1"/>
<input type="hidden" name="id" value="<%=entity.getId()%>"/>

<input type="hidden" name="isBrowser" id="isBrowser"/>
<input type="hidden" name="actionUrl" id="actionUrl" value="<c:url value="/content/catalog/search"/>"/>
<input type="hidden" name="pageNo" id="pageNo"/>
<input type="hidden" name="orderByColumn" id="orderByColumn"/>
<input type="hidden" name="orderByType" id="orderByType"/>


<div class="row">
  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="ct.contentEdit.mainTitle"/></div>
        <div class="panel-body">
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.content.name"/></label>
          <div class="col-md-10"><input type="text" name="name" class="form-control l" value="<%=StringUtil.getNonNull(entity.getName())%>"/></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.content.catalog"/></label>
          <div class="col-md-10"><p class="form-control-static"><a href="javascript:showCatalogPopup('0');"><i class="fa fa-search"></i></a>&nbsp;<span id="catalogNameSpan"><%=StringUtil.getNonNull(catalogName)%></span><input name="catalogId" id="catalogId" value="<%=catalogId%>" type="hidden"></p></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.tag"/></label>
          <div class="col-md-10"><input type="text" name="tag" class="form-control l" value="<%=StringUtil.getNonNull(entity.getTag())%>"/></div>
        </div>
     <%--    <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.metaKeyword"/></label>
          <div class="col-md-10"><input type="text" name="metaKeyword" class="form-control l" value="<%=StringUtil.getNonNull(entity.getMetaKeywords())%>"/></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.metaDescription"/></label>
          <div class="col-md-10"><input type="text" name="metaDescription" class="form-control l" value="<%=StringUtil.getNonNull(entity.getMetaDescription())%>"/></div>
        </div> --%>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.summary"/></label>
          <div class="col-md-10"><textarea class="form-control" name="summary" rows="5" style="width:80%;"><%=StringUtil.getNonNull(entity.getSummary())%></textarea></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.content"/></label>
          <div class="col-md-10"><textarea class="form-control" name="contentTxt" id="contentTxt"><%=StringUtil.getNonNull(entity.getContent())%></textarea></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.title"/></label>
          <div class="col-md-10"><input type="text" name="title" class="form-control l" value="<%=StringUtil.getNonNull(entity.getTitle())%>"/></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.showTitle"/></label>
          <div class="col-md-10"><input type="checkbox" name="showTitle" value="Y"<%=entity.isShowTitle() ? " checked" : ""%>/></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.canComment"/></label>
          <div class="col-md-10"><input type="checkbox" name="canComment" value="Y"<%=entity.isCanComment() ? " checked" : ""%>/></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.stickTop"/></label>
          <div class="col-md-10"><input type="checkbox" name="stickTop" value="Y"<%=entity.isStickTop() ? " checked" : ""%>/></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.author"/></label>
          <div class="col-md-10"><input type="text" name="author" class="form-control m" value="<%=StringUtil.getNonNull(entity.getAuthor())%>"/></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.source"/></label>
          <div class="col-md-10"><input type="text" name="source" class="form-control l" value="<%=StringUtil.getNonNull(entity.getSource())%>"/></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.content.publishDate"/></label>
          <div class="col-md-10"><input class="form-control cal" name="publishDate" value="<f:date value="${entity.publishDate}"/>"></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.status"/></label>
          <div class="col-md-10"><%=HtmlElemHelper.generateSelect(statusSelAttrs, statusSelOpts, status)%></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.attachment"/></label>
          <div class="col-md-10"><%@ include file="/includes/attachmentEdit.jsp"%></div>
        </div>
        <button class="btn btn-default" type="button" onclick="javascript:doSave();"><f:message key="cm.save"/></button>&nbsp;<button class="btn btn-default" type="button" onclick="javascript:doCancel();"><f:message key="cm.cancel"/></button>
      </div>
    </div>
  </div>
</div>
</form>

<%@ include file="/includes/footer.jsp"%>

<script src="<c:url value="/statics/scripts/dynamic-table.js"/>"></script>

<script>
$(document).ready(function() {
    $('input.cal').datepicker({dateFormat: 'yy-mm-dd', changeYear: true}, $.datepicker.regional['zh-CN']);
    CKEDITOR.replace('contentTxt', {height: '500px'});
});

function showCatalogPopup(id) {
    var opts = {'url': '<c:url value="/news/catalog/search"/>', 'data': {'isBrowser': true, 'callback': 'updateSelectedCatalog'}};
    showPopupDialog(opts);
}

function updateSelectedCatalog(id, name) {
    if (parseInt(id) > 0) {
        $('#catalogId').val(id);
        $('#catalogNameSpan').html(name);
    }
}

function doSave() {
    submitForm('<c:url value="/news/save"/>');
}

function doCancel() {
    submitLink('<c:url value="/news/manage"/>');
}
</script>
</body>
</html>