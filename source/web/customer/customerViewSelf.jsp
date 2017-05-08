<%@ include file="/includes/imports.jsp"%>

<head>
<title><f:message key="lm.organization.info"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>
<body>

<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_memberLeftbar.jsp"/>
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
            <p class="form-control-static"><f:masterCode code="customer.type.${entity.type}"/></p>
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
        
        <button class="btn btn-default" type="button" onclick="javascript:doEdit();"><f:message key="cm.edit"/></button>&nbsp;
       </div>
    </div>
  </div>
</div>

</form>


<%@ include file="/includes/footer.jsp"%>

<script>
function doEdit() {
    submitLink('<c:url value="/organization/edit"/>/${entity.id}');
}
</script>
</body>
</html>