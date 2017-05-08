<%@ include file="/includes/imports.jsp"%>

<head>
<title><f:message key="lm.member.manage"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>
<body>

<jsp:include page="/includes/header.jsp">
    <jsp:param name="leftMenuPath" value="/includes/_staffLeftbar.jsp"/>
</jsp:include>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="lm.organization.info"/></h3>
  </div>
</div>

<form class="form-horizontal" role="form" name="mainForm" id="mainForm" action="" method="post">
<input type="hidden" name="roleId" value="1"/>
<input type="hidden" id="id" name="id" value="${entity.id}"/>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="lm.organization.info"/></div>
      <div class="panel-body">
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.organizationName"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.companyName}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.login.userName"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.loginUser.username}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.status"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><f:masterCode code="customer.status.${entity.status}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.licenseNo"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.licenseNo}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.legalRep"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.legalRep}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.registeredCapital"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.registeredCapital}"/><label><f:message key="cm.customer.registeredCapital.unit"/></label></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.companyAddress"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.address}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.mainBusiness"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.mainBusiness}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.orgCode"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.orgCode}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.orgType"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><f:masterCode code="customer.org.type.${entity.orgType}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.bankName"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.bankName}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.accountNo"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.accountNo}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.taxNo"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.taxNo}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.website"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.website}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.companyEmail"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.email}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.contactFullname"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.contact}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.phone"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.phone}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.fax"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.fax}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.established"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><f:date value="${entity.establishedOn}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.headcount"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.headcount}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.industry"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><f:masterCode code="customer.industry.${entity.industry}"/></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.type"/></label>
          <div class="col-md-10">
            <c:choose>
            <c:when test="${entity.status == 'P'}">
            <f:masterCode name="type" css="form-control m" category="customer.type" code="${entity.type}" firstOption="cm.select"/>
            </c:when>
            <c:otherwise>
            <p class="form-control-static"><f:masterCode code="customer.type.${entity.type}"/></p>
            </c:otherwise>
            </c:choose>
          </div>
        </div>
        <%-- <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.customer.rating"/></label>
          <div class="col-md-10">
            <p class="form-control-static"><c:out value="${entity.rating}"/></p>
          </div>
        </div> --%>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="cm.attachment"/></label>
          <div class="col-md-10">
            <%@ include file="/includes/attachmentView.jsp"%>
          </div>
        </div>
        <%@ include file="/includes/audit.jsp"%>
        <c:choose>
        <c:when test="${entity.status == 'P'}">
        <%@ include file="/includes/approveRemark.jsp"%>
        </c:when>
        <c:when test="${entity.status == 'A'}">
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="examine.approve.disable"/></label>
          <div class="col-md-10">
            <input type="hidden" name="result" value="D">
            <textarea name="remarks" rows="5" cols="50" class="form-control" ></textarea>
          </div>
        </div>
        </c:when>
        <c:otherwise>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="examine.approve.enabled"/></label>
          <div class="col-md-10">
            <input type="hidden" name="result" value="A">
            <textarea name="remarks" rows="5" cols="50" class="form-control" ></textarea>
          </div>
        </div>
        </c:otherwise>
        </c:choose>
        <button class="btn btn-default" type="button" onclick="javascript:doCancel();"><f:message key="cm.cancel"/></button>&nbsp;
        <c:if test="${entity.status != 'P'}">
        <button class="btn btn-default" type="button" onclick="javascript:doEdit();"><f:message key="cm.edit"/></button>&nbsp;
        </c:if>
        <input type="button" id="submitBtn" class="btn btn-default" onclick="javascript:changeStatus();" value="<c:choose><c:when test="${entity.status == 'P'}"><f:message key="cm.submit"/></c:when><c:when test="${entity.status == 'A'}"><f:message key="examine.approve.result.d"/></c:when><c:otherwise><f:message key="examine.approve.result.a"/></c:otherwise></c:choose>"/>
       </div>
    </div>
  </div>
</div>

</form>

<%@ include file="/includes/footer.jsp"%>

<%@ include file="/includes/validation.jsp"%>
<script>
$(document).ready(function() {
});

function doCancel() {
  var from = '${from}';
  var status = '${entity.status}';
  if (status == "P" && from == "approve") {
    submitLink('<c:url value="/member/approve"/>');
  } else {
    submitLink('<c:url value="/member/manage"/>');
  }
}

function changeStatus(){
  var from = '${from}';
  var status = '${entity.status}';
  if (confirm('<f:message key="examine.approve.affirm"/>')) {
    submitForm('<c:url value="/member/status"/>' + "?from=" + from);
  }
}

function doEdit() {
  submitLink('<c:url value="/member/edit"/>/${entity.id}');
}
</script>
</body>
</html>