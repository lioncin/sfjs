<%@ page import="com.sanyet.fireball.customer.entity.Customer"%>
<%@ page import="com.sanyet.fireball.base.entity.Attachment" %>
<%@ include file="/includes/imports.jsp"%>
<head>
<title><f:message key="cm.edit"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>

<body>

<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_staffLeftbar.jsp"/>
</jsp:include>

<div>
<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="cm.edit"/></h3>
  </div>
</div>

<form class="form-horizontal" name="mainForm" id="mainForm" action="" method="post">
<%
Customer customer = (Customer) ParamUtil.getRequestAttr(request, "entity");
Attachment[] attachments =  customer != null ? customer.getAttachments() : null;
Attachment licenseAttachment = null;
Attachment taxAttachment = null;
Attachment businessCfAttachment = null;
Attachment qfProveAttachment = null;
Attachment otherAttachment = null;
if (attachments != null) {
  for (Attachment attachment : attachments) {
      if ("BUSINESS LICENSE".equals(attachment.getDescription())) {
          licenseAttachment = attachment;
      } else if ("TAX REGISTRATION CERTIFICATE".equals(attachment.getDescription())) {
          taxAttachment = attachment;
      } else if ("BUSINESS CERTIFICATE".equals(attachment.getDescription())) {
          businessCfAttachment = attachment;
      } else if ("QUALIFICATION PROVE".equals(attachment.getDescription())) {
          qfProveAttachment = attachment;
      } else if ("OTHER".equals(attachment.getDescription())) {
          otherAttachment = attachment;
      }
  }
}
%>
<input type="hidden" name="id" value="${entity.id}">
<input type="hidden" name="roleId" value="103"/>
<input type="hidden" name="groupId" value="103"/>
<!-- <input type="hidden" id="licenseFileData" name="licenseFileData">
<input type="hidden" id="taxFileData" name="taxFileData">
<input type="hidden" id="businessCfData" name="businessCfData">
<input type="hidden" id="qfProveData" name="qfProveData">
<input type="hidden" id="cOfAuthorityData" name="cOfAuthorityData">
<input type="hidden" id="workCfData" name="workCfData">
<input type="hidden" id="specimenCtData" name="specimenCtData">
<input type="hidden" id="quotationData" name="quotationData">
<input type="hidden" id="otherData" name="otherData"> -->

<div class="row">
  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading"><c:choose><c:when test="${entity.id > 0}"><f:message key="cm.edit"/></c:when><c:otherwise><f:message key="cm.register"/></c:otherwise></c:choose></div>
        <div class="panel-body">
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.organizationName"/>:</label>
            <div class="col-md-9"><input type="text" name="companyName" class="form-control l" value="${entity.companyName}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.login.userName"/>:</label>
            <div class="col-md-9"><p class="form-control-static">${entity.loginUser.username}</p></div>
          </div>
          
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.user.password"/>:</label>
            <div class="col-md-9"><p class="form-control-static"><input type="checkbox" name="changePwd" id="changePwd" onclick="javascript:toggleElementOnCheck('changePwd', 'changePwdDiv');" value="Y"/><label for="changePwd"><f:message key="cm.user.changePwd"/></label></p></div>
          </div>
          <div id="changePwdDiv" style="display:none;">
            <div class="form-group">
              <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.user.newPwd"/>:</label>
              <div class="col-md-9"><input type="password" name="newPassword" class="form-control m"/></div>
            </div>
            <div class="form-group">
              <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.user.newPwd2"/>:</label>
              <div class="col-md-9"><input type="password" name="newPassword2" class="form-control m"/></div>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.licenseNo"/>:</label>
            <div class="col-md-9"><input type="text" name=licenseNo class="form-control m" value="${entity.licenseNo}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.legalRep"/>:</label>
            <div class="col-md-9"><input type="text" name=legalRep class="form-control m" value="${entity.legalRep}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.registeredCapital"/>:</label>
            <div class="col-md-9">
              <input type="text" name=registeredCapital class="form-control s" value="${entity.registeredCapital}" style="display:inline"/>
              <label><f:message key="cm.customer.registeredCapital.unit"/></label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.companyAddress"/>:</label>
            <div class="col-md-9"><input type="text" name="address" class="form-control l" value="${entity.address}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.mainBusiness"/>:</label>
            <div class="col-md-9"><textarea name="mainBusiness" rows="5" cols="50" class="form-control" >${entity.mainBusiness}</textarea></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.orgCode"/>:</label>
            <div class="col-md-9"><input type="text" name=orgCode class="form-control m" value="${entity.orgCode}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.orgType"/></label>
            <div class="col-md-9">
              <p class="form-control-static"><f:masterCode name="orgType" css="form-control m" category="customer.org.type" code="${entity.orgType}"/></p>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.bankName"/>:</label>
            <div class="col-md-9"><input type="text" name=bankName class="form-control l" value="${entity.bankName}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.accountNo"/>:</label>
            <div class="col-md-9"><input type="text" name="accountNo" class="form-control l" value="${entity.accountNo}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.taxNo"/>:</label>
            <div class="col-md-9"><input type="text" name="taxNo" class="form-control m" value="${entity.taxNo}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.website"/></label>
            <div class="col-md-9"><input type="text" name="website" class="form-control l" value="${entity.website}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.companyEmail"/>:</label>
            <div class="col-md-9"><input type="text" name="email" class="form-control m" value="${entity.email}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.contactFullname"/>:</label>
            <div class="col-md-9"><input type="text" name="contact" class="form-control m" value="${entity.contact}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.phone"/>:</label>
            <div class="col-md-9"><input type="text" name="phone" class="form-control m" value="${entity.phone}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.fax"/>:</label>
            <div class="col-md-9"><input type="text" name="fax" class="form-control m" value="${entity.fax}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.established"/>:</label>
            <div class="col-md-9"><input type="text" name="established" class="form-control cal" value="<f:date value="${entity.establishedOn}"/>"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.headcount"/>:</label>
            <div class="col-md-9"><input type="text" name="headcount" class="form-control m" value="${entity.headcount}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.industry"/></label>
            <div class="col-md-9">
              <p class="form-control-static"><f:masterCode name="industry" css="form-control m" category="customer.industry" code="${entity.industry}"/></p>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.type"/></label>
            <div class="col-md-9">
              <p class="form-control-static"><f:masterCode name="type" css="form-control m" category="customer.type" code="${entity.type}" firstOption="cm.select"/></p>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.license"/></label>
            <div class="col-md-9">
              <%if (licenseAttachment != null) {%>
              <div>
                <a id="licenseDown" href="<f:download path="<%=licenseAttachment.getPath()%>"/>" download="<%=licenseAttachment.getName()%>"><%=licenseAttachment.getName()%></a>&nbsp;&nbsp;
              </div>
              <%} %>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.tax"/></label>
            <div class="col-md-9">
              <%if (taxAttachment != null) {%>
              <div>
                <a id="taxDown" href="<f:download path="<%=taxAttachment.getPath()%>"/>" download="<%=taxAttachment.getName()%>"><%=taxAttachment.getName()%></a>&nbsp;&nbsp;
              </div>
              <%} %>
            </div>
          </div>    
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.businessCertificate"/></label>
            <div class="col-md-9">
              <%if (businessCfAttachment != null) {%>
              <div>
                <a id="businessCertificateDown" href="<f:download path="<%=businessCfAttachment.getPath()%>"/>" download="<%=businessCfAttachment.getName()%>"><%=businessCfAttachment.getName()%></a>&nbsp;&nbsp;
              </div>
              <%} %>
            </div>
          </div>    
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.qualificationProve"/></label>
            <div class="col-md-9">
              <%if (qfProveAttachment != null) {%>
              <div>
                <a id="qualificationProveDown" href="<f:download path="<%=qfProveAttachment.getPath()%>"/>" download="<%=qfProveAttachment.getName()%>"><%=qfProveAttachment.getName()%></a>&nbsp;&nbsp;
              </div>
              <%} %>
            </div>
          </div>
            <%-- <div class="form-group">
              <label class="col-md-3 control-label"><f:message key="cm.customer.certificateOfAuthority"/></label>
              <div class="col-md-9"><input type="file" id="certificateOfAuthority" name="certificateOfAuthority" class="upload"/></div>
            </div>
            <div class="form-group">
              <label class="col-md-3 control-label"><f:message key="cm.customer.workCertificate"/></label>
              <div class="col-md-9"><input type="file" id="workCertificate" name="workCertificate" class="upload"/></div>
            </div>    
            <div class="form-group">
              <label class="col-md-3 control-label"><f:message key="cm.customer.specimenContract"/></label>
              <div class="col-md-9"><input type="file" id="specimenContract" name="specimenContract" class="upload"/></div>
            </div>
            <div class="form-group">
              <label class="col-md-3 control-label"><f:message key="cm.customer.quotation"/></label>
              <div class="col-md-9"><input type="file" id="quotation" name="quotation" class="upload"/></div>
            </div> --%>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.other"/></label>
            <div class="col-md-9">
              <%if (otherAttachment != null) {%>
              <div>
                <a id="otherDown" href="<f:download path="<%=otherAttachment.getPath()%>"/>" download="<%=otherAttachment.getName()%>"><%=otherAttachment.getName()%></a>&nbsp;&nbsp;
              </div>
              <%} %>
            </div>
          </div>
          <div class="action">
            <input type="button" id="submitBtn" class="btn btn-default" onclick="javascript:doSubmit();" value="<f:message key="cm.submit"/>"/>&nbsp;
            <input type="button" class="btn btn-default" onclick="javascript:resetForm();" value="<f:message key="cm.reset"/>"/>
          </div>
       </div>
    </div>
  </div>

  <div id="footer"><%@ include file="/includes/footer.jsp"%></div>
</div>

</form>
</div>

<%@ include file="/includes/validation.jsp"%>
<script type="text/javascript">

$(document).ready(function() {
    $('input.cal').datepicker({dateFormat: 'yy-mm-dd', changeYear: true}, $.datepicker.regional['zh-CN']);

    if ('${changePassWord}') {
      $('#changePwd').attr('checked', 'checked');
      $('#changePwdDiv').removeAttr('style');
    }
    
    // init client side validations
    $('input[name="companyName"]').attr('onblur', 'javascript:checkRequired("companyName");');
    $('input[name="licenseNo"]').attr('onblur', 'javascript:checkRequired("licenseNo");');
    $('input[name="legalRep"]').attr('onblur', 'javascript:checkRequired("legalRep");');
    $('input[name="address"]').attr('onblur', 'javascript:checkRequired("address");');
    $('input[name="orgCode"]').attr('onblur', 'javascript:checkRequired("orgCode");');
    $('input[name="bankName"]').attr('onblur', 'javascript:checkRequired("bankName");');
    $('input[name="accountNo"]').attr('onblur', 'javascript:checkRequired("accountNo");');
    $('input[name="taxNo"]').attr('onblur', 'javascript:checkRequired("taxNo");');
    $('input[name="contact"]').attr('onblur', 'javascript:checkRequired("contact");');
    $('input[name="phone"]').attr('onblur', 'javascript:checkRequired("phone");');
    loadErrors();
});

function checkRequired(name) {
    clearErrorMsg(name);
    var p1 = $('input[name="'+name+'"]').val();
    if (isEmpty(p1)) {
        showErrorMsg(name, '<f:message key="cm.validation.required"/>');
        return false;
    }
    return true;
}

function checkMaxLength(name, maxLen) {
    clearIconAndErrorMsg(name);
    var val = $('input[name="'+name+'"]').val();
    if (val.length > maxLen) {
        showErrorMsg(name, String.format('<f:message key="cm.val.maxLength"/>', maxLen), val);
        return false;
    }
    return true;
}

function checkMinLength(name, minLen) {
    clearErrorMsg(name);
    var val = $('input[name="'+name+'"]').val();
    if (val.length < minLen) {
        showErrorMsg(name, String.format('<f:message key="cm.val.maxLength"/>', minLen), val);
        return false;
    }
    return true;
}

function checkEmail(email) {
    clearErrorMsg(email);
    var val = $.trim($('input[name="'+email+'"]').val());
    var regEx = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
    if (!isEmpty(val) && !regEx.test(val)) {
        showErrorMsg(email, '<f:message key="cm.val.email"/>', val);
        return false;
    }
    return true;
}

function doSubmit() {
    if (checkRequired("companyName") & checkRequired("licenseNo") & checkRequired("legalRep") & checkRequired("address") & checkRequired("orgCode")
        & checkRequired("bankName") & checkRequired("accountNo") & checkRequired("taxNo") & checkRequired("contact") & checkRequired("phone")
        & checkEmail("companyEmail") & checkEmail("contactEmail")) {
        submitForm('<c:url value="/member/modify"/>');
    }
}

function resetForm() {
    clearAllErrorMsgs();
    $("#mainForm")[0].reset();
}


</script>
</body>
</html>