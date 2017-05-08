<%@ include file="/includes/imports.jsp"%>

<%@ page import="com.sanyet.fireball.szcea.entity.Activity"%>

<%
  boolean isCreate = false;
  Activity entity = (Activity) ParamUtil.getRequestAttr(request, "entity");
  if (entity == null) {
      isCreate = true;
      entity = new Activity();
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
<title><f:message key="lm.convention.report"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>

<body>

<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_memberLeftbar.jsp"/>
</jsp:include>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="lm.convention.report"/></h3>
  </div>
</div>

<form class="form-horizontal" name="mainForm" id="mainForm" action="" method="post" enctype="multipart/form-data">
<input type="hidden" name="act" id="act"/>
<input type="hidden" name="roleId" value="1"/>
<input type="hidden" name="id" value="<%=entity.getId()%>"/>
<input type="hidden" name="type" value="C"/>

<input type="hidden" name="isBrowser" id="isBrowser"/>
<input type="hidden" name="actionUrl" id="actionUrl" value="<c:url value="/project/search"/>"/>
<input type="hidden" name="pageNo" id="pageNo"/>
<input type="hidden" name="orderByColumn" id="orderByColumn"/>
<input type="hidden" name="orderByType" id="orderByType"/>

<div class="row">
  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="lm.convention.content"/></div>
      <div class="panel-body">
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.name"/></label>
          <div class="col-md-10">
            <input class="form-control l" name="name" value="<%=StringUtil.getNonNull(entity.getName())%>" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.name_en"/></label>
          <div class="col-md-10">
            <input class="form-control l" name="name_en" value="<%=StringUtil.getNonNull(entity.getName_en())%>" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.clocation"/></label>
          <div class="col-md-10">
            <input class="form-control m" name="location" value="<%=StringUtil.getNonNull(entity.getLocation())%>" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.prepareFrom"/></label>
          <div class="col-md-10">
            <input class="form-control cal" name="prepareFrom" value="<f:date value="${entity.prepareFrom}"/>">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.prepareTo"/></label>
          <div class="col-md-10">
            <input class="form-control cal" name="prepareTo" value="<f:date value="${entity.prepareTo}"/>">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.holdFrom"/></label>
          <div class="col-md-10">
            <input class="form-control cal" name="holdFrom" value="<f:date value="${entity.holdFrom}"/>">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.holdTo"/></label>
          <div class="col-md-10">
            <input class="form-control cal" name="holdTo" value="<f:date value="${entity.holdTo}"/>">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.isRegular"/></label>
          <div class="col-md-10">
          <input type="checkbox" name="isRegular" value="Y"<%="Y".equals(entity.getIsRegular() )? " checked" : ""%>/>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.annualTime"/></label>
          <div class="col-md-10">
          <input class="form-control s" name="annualTime" value="<%=StringUtil.getNonNull(entity.getAnnualTime())%>" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.holdTime"/></label>
          <div class="col-md-10">
          <input class="form-control s" name="holdTime" value="<%=StringUtil.getNonNull(entity.getHoldTime())%>" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.hasNationalTM"/></label>
          <div class="col-md-10">
          <input type="checkbox" name="hasNationalTM" value="Y"<%="Y".equals(entity.getHasNationalTM() )? " checked" : ""%>/>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.hasInterCert"/></label>
          <div class="col-md-10">
          <input type="checkbox" name="hasInterCert" value="Y"<%="Y".equals(entity.getHasInterCert()) ? " checked" : ""%>/>
          </div>
        </div>
        <%if(entity.getId() == 0) {%>
         <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.level"/></label>
          <div class="col-md-10">
          <input name="level" type="radio" id="level1" value="I" checked/><label for="level1"><f:message key="cm.conference.level1"/></label>
          <input name="level" type="radio" id="level2" value="N"/><label for="level2"><f:message key="cm.conference.level2"/></label>
          <input name="level" type="radio" id="level3" value="P"/><label for="level3"><f:message key="cm.conference.level3"/></label>
          </div>
        </div>
        <%} else { %>
         <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.level"/></label>
          <div class="col-md-10">
          <input name="level" type="radio" id="level1" value="I"<%="I".equals(entity.getLevel()) ? " checked" : ""%>/><label for="level1"><f:message key="cm.conference.level1"/></label>
          <input name="level" type="radio" id="level2" value="N"<%="N".equals(entity.getLevel()) ? " checked" : ""%>/><label for="level2"><f:message key="cm.conference.level2"/></label>
          <input name="level" type="radio" id="level3" value="P"<%="P".equals(entity.getLevel()) ? " checked" : ""%>/><label for="level3"><f:message key="cm.conference.level3"/></label>
          </div>
        </div>
        <%} %>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.approver"/></label>
          <div class="col-md-10"><input class="form-control l" name="approver" value="<%=StringUtil.getNonNull(entity.getApprover())%>" /></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.sponsor"/></label>
          <div class="col-md-10"><input class="form-control l" name="sponsor" value="<%=StringUtil.getNonNull(entity.getSponsor())%>" /></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.organizer"/></label>
          <div class="col-md-10"><input class="form-control l" name="organizer" value="<%=StringUtil.getNonNull(entity.getOrganizer())%>" /></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.count_1"/></label>
          <div class="col-md-10"><input class="form-control s" name="count_1" value="${entity.count_1}" /></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.count_2"/></label>
          <div class="col-md-10"><input class="form-control s" name="count_2" value="${entity.count_2}" /></div>
        </div>
         <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.count_3"/></label>
          <div class="col-md-10"><input class="form-control s" name="count_3" value="${entity.count_3}" /></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.feeScale"/></label>
          <div class="col-md-10"><input class="form-control s" name="feeScale" value="${entity.feeScale}" /></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.hasAddProject"/></label>
          <div class="col-md-10">
          <input type="checkbox" name="hasAddProject" value="Y"<%="Y".equals(entity.getHasAddActivity()) ? " checked" : ""%>/>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.addScale"/></label>
          <div class="col-md-10">
          <input class="form-control s" name="addScale" value="${entity.addScale}" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.description"/></label>
          <div class="col-md-10"><textarea class="form-control" name="description" rows="4" cols="50"><%=StringUtil.getNonNull(entity.getDescription())%></textarea></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.submittedBy"/></label>
          <div class="col-md-10"><input class="form-control l" name="submittedBy" value="<%=StringUtil.getNonNull(entity.getSubmittedBy())%>" /></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.legalRep"/></label>
          <div class="col-md-10"><input class="form-control l" name="legalRep" value="<%=StringUtil.getNonNull(entity.getLegalRep())%>" /></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.bizAddress"/></label>
          <div class="col-md-10"><input class="form-control l" name="bizAddress" value="<%=StringUtil.getNonNull(entity.getBizAddress())%>" /></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.bizEmail"/></label>
          <div class="col-md-10"><input class="form-control l" name="bizEmail" value="<%=StringUtil.getNonNull(entity.getBizEmail())%>" /></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.bizContact"/></label>
          <div class="col-md-10"><input class="form-control l" name="bizContact" value="<%=StringUtil.getNonNull(entity.getBizContact())%>" /></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.bizPhone"/></label>
          <div class="col-md-10"><input class="form-control l" name="bizPhone" value="<%=StringUtil.getNonNull(entity.getBizPhone())%>" /></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required">*</span><f:message key="cm.conference.documents"/></label>
          <div class="col-md-10"><textarea class="form-control" name="documents" rows="4" cols="50"><%=StringUtil.getNonNull(entity.getDocuments())%></textarea></div>
        </div>
        <button class="btn btn-default" type="button" onclick="javascript:doSave();"><f:message key="activity.save"/></button>&nbsp;<button class="btn btn-default" type="button" onclick="javascript:doCancel();"><f:message key="cm.cancel"/></button>
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
    
    // init client side validations
    $('input[name="name"]').attr('onblur', 'javascript:checkRequired("name");');
    $('input[name="name_en"]').attr('onblur', 'javascript:checkRequired("name_en");');
    $('input[name="location"]').attr('onblur', 'javascript:checkRequired("location");');
    $('input[name="holdTime"]').attr('onblur', 'javascript:checkNumber("holdTime");');
    $('input[name="approver"]').attr('onblur', 'javascript:checkRequired("approver");');
    $('input[name="sponsor"]').attr('onblur', 'javascript:checkRequired("sponsor");');
    $('input[name="organizer"]').attr('onblur', 'javascript:checkRequired("organizer");');
    $('input[name="count_1"]').attr('onblur', 'javascript:checkNumber("count_1");');
    $('input[name="count_2"]').attr('onblur', 'javascript:checkNumber("count_2");');
    $('input[name="count_3"]').attr('onblur', 'javascript:checkNumber("count_3");');
    $('input[name="feeScale"]').attr('onblur', 'javascript:checkNumber("feeScale");');
    $('input[name="submittedBy"]').attr('onblur', 'javascript:checkRequired("submittedBy");');
    $('input[name="legalRep"]').attr('onblur', 'javascript:checkRequired("legalRep");');
    $('input[name="bizAddress"]').attr('onblur', 'javascript:checkRequired("bizAddress");');
    $('input[name="bizEmail"]').attr('onblur', 'javascript:checkEmail("bizEmail");');
    $('input[name="bizContact"]').attr('onblur', 'javascript:checkRequired("bizContact");');
    $('input[name="bizPhone"]').attr('onblur', 'javascript:checkNumber2("bizPhone");');
    $('textarea[name="description"]').attr('onblur', 'javascript:checkRequired2("description");');
    $('textarea[name="documents"]').attr('onblur', 'javascript:checkRequired2("documents");');
    toggleAgreement();
    loadErrors();
});

function toggleAgreement() {
    if ($('#agreement').is(':checked')) {
        $('#submitBtn').attr('disabled', false);
    } else {
        $('#submitBtn').attr('disabled', true);
    }
}

function checkRequired(name) {
    clearErrorMsg(name);
    var p1 = $('input[name="'+name+'"]').val();
    if (isEmpty(p1)) {
        showErrorMsg(name, '<f:message key="cm.validation.required"/>');
        return false;
    }
    return true;
}

function checkRequired2(name) {
    clearErrorMsg(name);
    var p1 = $('textarea[name="'+name+'"]').val();
    if (isEmpty(p1)) {
        showErrorMsg(name, '<f:message key="cm.validation.required"/>');
        return false;
    }
    return true;
}

function checkDate(name){
    clearErrorMsg(name);
    var re = /^(\d{4})-(\d{2})-(\d{2})$/
    var p1 = $('input[name="'+name+'"]').val();
    if(isEmpty(p1)){
        showErrorMsg(name, '<f:message key="cm.validation.required"/>', p1);
        return false;
    } 
    if(!re.test(p1)){
        showErrorMsg(name, '<f:message key="cm.validation.date"/>', p1);
        return false;
    }
    return true;
}

function checkNumber(name) {
    clearErrorMsg(name);
    var re = /^[0-9]+.?[0-9]*$/;
    var p1 = $('input[name="'+name+'"]').val();
    if(isEmpty(p1)){
        showErrorMsg(name, '<f:message key="cm.validation.required"/>', p1);
        return false;
    }
    if(!re.test(p1)){
        showErrorMsg(name, '<f:message key="cm.validation.number"/>', p1);
        return false;
    }
    return true;
}

function checkNumber2(name) {
    clearErrorMsg(name);
    var p1 = $('input[name="'+name+'"]').val();
    if(isEmpty(p1)){
        showErrorMsg(name, '<f:message key="cm.validation.required"/>', p1);
        return false;
    }
    if(!(parseInt(p1)==p1)){
        showErrorMsg(name, '<f:message key="cm.validation.number2"/>', p1);
        return false;
    }
    return true;
}

function checkNumberSize(name1,name2) {
    clearErrorMsg(name2);
    var re = /^[0-9]+.?[0-9]*$/;
    var p1 = $('input[name="'+name1+'"]').val();
    var p2 = $('input[name="'+name2+'"]').val();
    checkNumber2(name1);
    checkNumber2(name2);
/*     if(isEmpty(p1)){
        showErrorMsg(name, '<f:message key="cm.validation.required"/>', p1);
        return false;
    }
    if(!re.test(p1)){
        showErrorMsg(name, '<f:message key="cm.validation.number"/>', p1);
        return false;
    } */
    if(parseFloat(p1) < parseFloat(p2)){
        showErrorMsg(name2, '<f:message key="cm.validation.numberSize"/>', p2);
        return false;
    }
    return true;
}

function checkEmail(email) {
    clearErrorMsg(email);
    var val = $.trim($('input[name="'+email+'"]').val());
    if(isEmpty(val)){
        showErrorMsg(email, '<f:message key="cm.val.email"/>', val);
        return false;
    }
    var regEx = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
    if (!isEmpty(val) && !regEx.test(val)) {
        showErrorMsg(email, '<f:message key="cm.val.email"/>', val);
        return false;
    }
    return true;
}

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

function checkIsEmpty(name) {
    clearErrorMsg(name);
    var p1 = $('input[name="'+name+'"]').val();
    if (!isEmpty(p1)) {
        if(name == "addScale"){
            if (p1 == '0.0') {
                return true;
            }
            showErrorMsg(name, '<f:message key="cm.conference.addScale.empty"/>'); 
        }
        if(name == "annualTime"){
            showErrorMsg(name, '<f:message key="cm.conference.annualTime.empty"/>'); 
        }
        return false;
    }
    return true;
}

function maxFee(name) {
    clearErrorMsg(name);
    var re = /^[0-9]+.?[0-9]*$/;
    var p1 = $('input[name="'+name+'"]').val();
    if(isEmpty(p1)){
        showErrorMsg(name, '<f:message key="cm.validation.required"/>', p1);
        return false;
    }
    if(!re.test(p1)){
        showErrorMsg(name, '<f:message key="cm.validation.number"/>', p1);
        return false;
    }
    if(p1 > 999999.99){
        showErrorMsg(name, '<f:message key="cm.validation.maxFee"/>', p1);
        return false; 
    }
    return true;
}

function doSave() {
    var flag1 = true;
    var flag2 = true;
    if ($('input[name="hasAddProject"]').is( ":checked" ) ){
        flag1 = checkNumber("addScale");
    }else{
        flag1 = checkIsEmpty("addScale");
    }
    if ($('input[name="isRegular"]').is( ":checked" ) ){
        flag2 = checkNumber2("annualTime");
    }else{
        flag2 = checkIsEmpty("annualTime");
    }
    if( flag1 & flag2){
        if (checkRequired("name") & checkRequired("name_en") & checkRequired("location") & checkDate("prepareFrom") & checkDate("prepareTo") & checkDate("holdFrom") & checkDate("holdTo") 
                & checkNumber("holdTime") & checkRequired("approver") & checkRequired("sponsor") & checkRequired2("documents") & checkRequired2("description")
                & checkRequired("organizer") & checkNumber2("count_1") & checkNumber2("count_2") & checkNumber2("count_3") & maxFee("feeScale") & checkNumberSize("count_1","count_2")
                & checkRequired("submittedBy") & checkRequired("legalRep") & checkRequired("bizAddress") & checkRequired("bizEmail") & checkRequired("bizContact") & checkNumber2("bizPhone")){
        submitForm('<c:url value="/activity/save"/>');
        }  
    }
   
}

function doCancel() {
    submitLink('<c:url value="/activity/manage"/>');
}
</script>
</body>
</html>