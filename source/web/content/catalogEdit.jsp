<%@ include file="/includes/imports.jsp"%>

<%@ page import="com.sanyet.fireball.content.entity.Catalog"%>

<%
  boolean isCreate = false;
  Catalog entity = (Catalog) ParamUtil.getRequestAttr(request, "entity");
  if (entity == null) {
      isCreate = true;
      entity = new Catalog();
  }
  String parentName = null;
  int parentId = 0;
  if (entity.getParent() != null) {
      parentName = entity.getParent().getName();
      parentId = entity.getParent().getId();
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

  String titleKey = isCreate ? "ct.catalogEdit.title.create" : "ct.catalogEdit.title.edit";
%>

<head>
<title><f:message key="pd.productList.title"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>

<body>

<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/content/_leftbar.jsp"/>
</jsp:include>

<div class="row">
  <div class="col-md-12">
    <h1 class="page-header"><f:message key="ct.catalogEdit.mainTitle"/></h1>
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
      <div class="panel-heading"><f:message key="cm.catalog.name"/></div>
      <div class="panel-body">
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.catalog.name"/></label>
          <div class="col-md-10">
            <input class="form-control l" name="name" value="<%=StringUtil.getNonNull(entity.getName())%>" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.catalog.parent"/></label>
          <div class="col-md-10"><p class="form-control-static"><a href="javascript:showCatalogPopup('<%=parentId%>');"><i class="fa fa-search"></i></a>&nbsp;<span id="parentNameSpan"><%=StringUtil.getNonNull(parentName)%></span><input type="hidden" name="parentId" id="parentId" value="<%=parentId%>"/></p></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.catalog.tag"/></label>
          <div class="col-md-10"><input class="form-control l" name="tag" value="<%=StringUtil.getNonNull(entity.getTag())%>" /></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.catalog.title"/></label>
          <div class="col-md-10"><input class="form-control l" name="title" value="<%=StringUtil.getNonNull(entity.getTitle())%>" /></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.catalog.showTitle"/></label>
          <div class="col-md-10"><input type="checkbox" name="showTitle" value="Y"<%=entity.isShowTitle() ? " checked" : ""%>/></div>
        </div>
         <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.status"/></label>
          <div class="col-md-10"><%=HtmlElemHelper.generateSelect(statusSelAttrs, statusSelOpts, status)%></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.description"/></label>
          <div class="col-md-10"><textarea class="form-control" name="description" rows="5" cols="50"><%=StringUtil.getNonNull(entity.getDescription())%></textarea></div>
        </div>
        <button class="btn btn-default" type="button" onclick="javascript:doSave();"><f:message key="cm.save"/></button>&nbsp;<button class="btn btn-default" type="button" onclick="javascript:doCancel();"><f:message key="cm.cancel"/></button>
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

function showCatalogPopup(id) {
    var opts = {'url': '<c:url value="/content/catalog/search"/>', 'data': {'isBrowser': true, 'callback': 'updateSelectedCatalog'}};
    showPopupDialog(opts);
}

function updateSelectedCatalog(id, name) {
    if (parseInt(id) > 0) {
        $('#parentId').val(id);
        $('#parentNameSpan').html(name);
    }
}

function doSave() {
    submitForm('<c:url value="/content/catalog/save"/>');
}

function doCancel() {
    submitLink('<c:url value="/content/catalog/manage"/>');
}
</script>
</body>
</html>