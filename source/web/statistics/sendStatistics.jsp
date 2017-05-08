<%@ include file="/includes/imports.jsp"%>

<%@ page import="com.sanyet.fireball.szcea.entity.Activity"%>

<%
  boolean isCreate = false;
  Activity entity = (Activity) ParamUtil.getRequestAttr(request, "entity");
  String success = (String) ParamUtil.getSessionAttr(request, "success");
  if (entity == null) {
      isCreate = true;
      entity = new Activity();
  }
  if(success == null){
      success = "";      
  }else{
      ParamUtil.setSessionAttr(request, "success", "");
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
<title><f:message key="ce.statistics.data.send"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>

<body>

<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_staffLeftbar.jsp"/>
</jsp:include>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="ce.statistics.data.send"/></h3>
    <div style="display : none" id="warning" class="alert alert-warning"><f:message key="statistics.send.success"/></div>  
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
<input type="hidden" name="success" id="success" value="<%=success%>"/>

<div class="row">
  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="ce.statistics.data.send.detail"/></div>
      <div class="panel-body">  
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="ce.statistics.data.send.subject"/></label>
          <div class="col-md-10"><input type="text" name="subject" class="form-control l" value=""/></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="ce.statistics.data.send.detail"/></label>
          <div class="col-md-10"><textarea class="form-control" name="contentTxt" id="contentTxt"></textarea></div>
        </div>
        <button class="btn btn-default" type="button" onclick="javascript:doSave();"><f:message key="statistics.save"/></button>
      </div>
    </div>
  </div>
</div>

</form>

<%@ include file="/includes/footer.jsp"%>
<%@ include file="/includes/validation.jsp"%>

<script>
$(document).ready(function() {
    if($('#success').val() == 'success'){
//      alert('<f:message key="complaint.send.success"/>');
     $('#success').val('');
     $('#warning').show();
     setTimeout(function () { $('#warning').hide(); }, 2000);
    }  
});

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
    submitForm('<c:url value="/statistics/sendStatistics"/>');
}

function doCancel() {
    submitLink('<c:url value="/member/manage"/>');
}
</script>
</body>
</html>