<%@ include file="/includes/imports.jsp"%>

<%@ page import="com.sanyet.fireball.szcea.entity.Activity"%>

<%
  Activity entity = (Activity) ParamUtil.getRequestAttr(request, "entity");
  if (entity == null) {
      entity = new Activity();
  }
  Integer groupId = (Integer) ParamUtil.getSessionAttr(request, "groupId");
  if (groupId == null) {
      groupId = 0;
  }
%>

<head>
<title><f:message key="cm.conference.view"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>

<body>

<%if(groupId == 103) {%>
<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_memberLeftbar.jsp"/>
</jsp:include>
<%} else { %>
<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_staffLeftbar.jsp"/>
</jsp:include>
<%} %>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="ct.conferenceEdit.mainTitle"/></h3>
  </div>
</div>

<form class="form-horizontal" name="mainForm" id="mainForm" action="" method="post" enctype="multipart/form-data">
<input type="hidden" name="roleId" value="1"/>
<input type="hidden" id="id" name="id" value="<%=entity.getId()%>"/>

<div class="row">
  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="ct.conferenceEdit.mainTitle"/></div>
      <div class="panel-body">
        <div class="form-group">
          <label class="col-md-2 col-xs-4 control-label"><span class="required"></span><f:message key="cm.conference.name"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getName())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 col-xs-4 control-label"><span class="required"></span><f:message key="cm.conference.name_en"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getName_en())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.clocation"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getLocation())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required"></span><f:message key="cm.conference.prepareFrom"/></label>
          <div class="col-md-10">
            <p class="form-control-static">${entity.prepareFrom}</p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required"></span><f:message key="cm.conference.prepareTo"/></label>
          <div class="col-md-10">
            <p class="form-control-static">${entity.prepareTo}</p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required"></span><f:message key="cm.conference.holdFrom"/></label>
          <div class="col-md-10">
            <p class="form-control-static">${entity.holdFrom}</p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><span class="required"></span><f:message key="cm.conference.holdTo"/></label>
          <div class="col-md-10">
            <p class="form-control-static">${entity.holdTo}</p>
          </div>
          </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.isRegular"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><f:masterCode code="activity.${entity.isRegular}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.annualTime"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=entity.getAnnualTime()%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.holdTime"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=entity.getHoldTime()%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.hasNationalTM"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><f:masterCode code="activity.${entity.hasNationalTM}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.hasInterCert"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><f:masterCode code="activity.${entity.hasInterCert}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.level"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><f:masterCode code="conference.level.${entity.level}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.approver"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getApprover())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.sponsor"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getSponsor())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.organizer"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getOrganizer())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.count_1"/></label>
          <div class="col-md-10"><p class="form-control-static"><%=entity.getCount_1()%></p></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.count_2"/></label>
          <div class="col-md-10"><p class="form-control-static"><%=entity.getCount_2()%></p></div>
        </div>
         <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.count_3"/></label>
          <div class="col-md-10"><p class="form-control-static"><%=entity.getCount_3()%></p></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.feeScale"/></label>
          <div class="col-md-10"><p class="form-control-static"><%=entity.getFeeScale()%></p></div>
        </div>
         <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.hasAddProject"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><f:masterCode code="activity.${entity.hasAddActivity}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.addScale"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=entity.getAddScale()%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.description"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getDescription())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.submittedBy"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getSubmittedBy())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.legalRep"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getLegalRep())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.bizAddress"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getBizAddress())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.bizEmail"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getBizEmail())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.bizContact"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getBizContact())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.bizPhone"/></label>
          <div class="col-md-10">
          <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getBizPhone())%></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.conference.documents"/></label>
          <div class="col-md-10">
           <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getDocuments())%></p>
          </div>
        </div>
        <%if("P".equals(entity.getStatus()) && groupId != 103) {%>
        <%@ include file="/includes/approveRemark.jsp"%>
         <button class="btn btn-default" type="button" onclick="javascript:approveCancel();"><f:message key="cm.cancel"/></button>&nbsp;
        <input type="button" id="submitBtn" class="btn btn-default" onclick="javascript:changeStatus();" value="<f:message key="cm.submit"/>"/>
        <%} else { %>
            <%if(!"P".equals(entity.getStatus())) {%>
            <%@ include file="/includes/approveRemarkView.jsp"%>
            <%} %>
             <button class="btn btn-default" type="button" onclick="javascript:doDelete();"><f:message key="cm.delete"/></button>&nbsp;<button class="btn btn-default" type="button" onclick="javascript:doCancel();"><f:message key="cm.cancel"/></button>&nbsp;
            <%if(groupId != 103) {%>
                <%if("A".equals(entity.getStatus())) {%>
                <button class="btn btn-default" type="button" onclick="javascript:saveAsPdf();"><f:message key="cm.saveAsPdf"/></button>
                <%} %>
            <%} else {%>
            <button class="btn btn-default" type="button" onclick="javascript:doEdit();"><f:message key="cm.edit"/></button>&nbsp;
            <%} %>
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

function doDelete() {
    if (confirm('<f:message key="cm.confirm.delete"/>')) {
      submitForm('<c:url value="/activity/delete"/>/?id=${entity.id}');
    }
  }


function doEdit() {
    submitForm('<c:url value="/activity/edit/"/>' + $('#id').val());
}

function changeStatus() {
    submitForm('<c:url value="/activity/status/"/>?id=' + $('#id').val() + '&from=approve');
}

function doCancel() {
    submitLink('<c:url value="/activity/manage"/>');
}

function approveCancel() {
    submitLink('<c:url value="/activity/approve"/>');
}

function saveAsPdf() {
    window.open('<c:url value="/activity/saveAsPdf"/>/' + $('#id').val());
}
</script>
</body>
</html>