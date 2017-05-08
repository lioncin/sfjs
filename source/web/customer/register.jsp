<%@ include file="/includes/imports.jsp"%>

<%
String registerStatus = (String) ParamUtil.getSessionAttr(request, "registerStatus");
if(registerStatus == null){
    registerStatus = "";      
}else{
    ParamUtil.setSessionAttr(request, "registerStatus", "");
}
%>
<head>
<title><f:message key="member.register"/></title>
<%@ include file="/includes/styles.jsp"%>
<style>
body{
  background-image:url("../szcea/statics/images/rbp.png");
  background-size:cover;
}
label{
    color:#ffffff;
}
h4{
    color:#ffffff;
}
#topimg{
    padding-bottom:0px;
}
.page-header {
    border-bottom: 0;
    padding-bottom: 5px;
    marigin-top:3px;
}
.panel {
    background-color: transparent;
    border: 0;
    border-radius: 4px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
    margin-bottom: 20px;
    padding-right:120px;
}
.form-group{
    padding-left:70px;
}
.upload{
    color:#ffffff;
}
</style>
</head>

<body>
<div class="container">
<div class="col-md-8 col-md-offset-2">
<div class="row">
  <div class="col-md-12" align="center">
    <h4 class="page-header"><img src="<c:url value="../szcea/statics/images/r-logo.png"/>"/><br><f:message key="member.register"/></h4>
  </div>
</div>

<form class="form-horizontal" name="mainForm" id="mainForm" action="" method="post">
<input type="hidden" name="id" value="${entity.id}">
<input type="hidden" id="licenseFileData" name="licenseFileData">
<input type="hidden" id="taxFileData" name="taxFileData">
<input type="hidden" id="businessCfData" name="businessCfData">
<input type="hidden" id="qfProveData" name="qfProveData">
<!-- <input type="hidden" id="cOfAuthorityData" name="cOfAuthorityData">
<input type="hidden" id="workCfData" name="workCfData">
<input type="hidden" id="specimenCtData" name="specimenCtData">
<input type="hidden" id="quotationData" name="quotationData"> -->
<input type="hidden" id="otherData" name="otherData">
<input type="hidden" name="registerStatus" id="registerStatus" value="<%=registerStatus%>"/>

<div class="row">
  <div class="col-md-12">
    <div class="panel panel-default">
        <div class="panel-body" style="height:450px; overflow:auto;">
        <div style="display : none" id="warning" class="alert alert-warning"><f:message key="register.success"/></div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.organizationName"/>:</label>
            <div class="col-md-9"><input type="text" name="companyName" class="form-control l" value="${entity.companyName}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.login.userName"/>:</label>
            <div class="col-md-9"><input type="text" name="username" class="form-control m" style="display:inline; margin-right:10px" value="${entity.loginUser.username}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.user.password"/>:</label>
            <div class="col-md-9"><input type="password" name="password" class="form-control m"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.user.password2"/>:</label>
            <div class="col-md-9"><input type="password" name="password2" class="form-control m"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.licenseNo"/>:</label>
            <div class="col-md-9"><input type="text" name=licenseNo class="form-control l" value="${entity.licenseNo}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.legalRep"/>:</label>
            <div class="col-md-9"><input type="text" name=legalRep class="form-control m" value="${entity.legalRep}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.registeredCapital"/>:</label>
            <div class="col-md-9">
              <input type="text" name="registeredCapital" class="form-control s" value="${entity.registeredCapital}" style="display:inline"/>
              <label><f:message key="cm.customer.registeredCapital.unit"/></label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.companyAddress"/>:</label>
            <div class="col-md-9"><input type="text" name="address" class="form-control l" value="${entity.address}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.mainBusiness"/>:</label>
            <div class="col-md-9"><textarea name="mainBusiness" rows="5" style="width:280px;" class="form-control" >${entity.mainBusiness}</textarea></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.orgCode"/>:</label>
            <div class="col-md-9"><input type="text" name="orgCode" class="form-control m" value="${entity.orgCode}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.orgType"/></label>
            <div class="col-md-9">
              <p class="form-control-static"><f:masterCode name="orgType" css="form-control m" category="customer.org.type" code="${entity.orgType}"/></p>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.bankName"/>:</label>
            <div class="col-md-9"><input type="text" name="bankName" class="form-control l" value="${entity.bankName}"/></div>
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
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.companyEmail"/>:</label>
            <div class="col-md-9"><input type="text" name="email" class="form-control l" value="${entity.email}"/></div>
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
            <div class="col-md-9"><input type="text" name="headcount" class="form-control s" value="${entity.headcount}"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="cm.customer.industry"/></label>
            <div class="col-md-9">
              <p class="form-control-static"><f:masterCode name="industry" css="form-control m" category="customer.industry" code="${entity.industry}"/></p>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.license"/></label>
            <div class="col-md-9"><input type="file" id="licenseFile" name="licenseFile" class="upload"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.tax"/></label>
            <div class="col-md-9"><input type="file" id="taxFile" name="taxFile" class="upload"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.businessCertificate"/></label>
            <div class="col-md-9"><input type="file" id="businessCertificate" name="businessCertificate" class="upload"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.qualificationProve"/></label>
            <div class="col-md-9"><input type="file" id="qualificationProve" name="qualificationProve" class="upload"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><f:message key="cm.customer.other"/></label>
            <div class="col-md-9"><input type="file" id="other" name="other" class="upload"/></div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><span class="required">*</span><f:message key="ss.register.verificationCode"/>:</label>
            <div class="col-md-9"><input type="text" name="code" class="form-control m" style="display:inline; margin-right:10px" maxlength="4"/>&nbsp;<img id="codeImg" src="<c:url value="/getVerCode"/>" onclick="javascript:reloadImage();" class="clickable" style="margin-right:10px" alt="Click to refresh"/></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 col-md-offset-4">
              <input type="checkbox" id="agreement"  onclick="javascript:toggleAgreement();"/><label for="agreement"><f:message key="ss.register.agreement.admission.notice"/><a href="register2.jsp" target="_blank"><f:message key="ss.register.admission.notice"/></a></label>
            </div>
          </div>
           
          <div class="form-group">
            <div class="action col-md-4 col-md-offset-4">
              <input type="button" id="submitBtn" class="btn btn-default" onclick="javascript:doSubmit();" value="<f:message key="cm.submit"/>" disabled/>&nbsp;<input type="button" class="btn btn-default" onclick="javascript:resetForm();" value="<f:message key="cm.reset"/>"/>
            </div>
          </div>
       </div>
    </div>
  </div>

  <div id="footer" style="color:#FFF"><div id="copyright"><f:message key="in.footer.copyright"/></div></div>
</div>

</form>
</div>
</div>

<%@ include file="/includes/validation.jsp"%>
<script src="<c:url value="/statics/scripts/utils.js"/>"></script>
<script src="<c:url value="/statics/scripts/jquery-ui.min.js"/>"></script>
<script>
$(document).ready(function() {
    $('#licenseFile').change(function(e) {
        var file = e.target.files[0];
        var reader = new FileReader();

        reader.onload = function(f) {
            $('#licenseFileData').val(reader.result);
        }
        reader.readAsDataURL(file);
    });
});

$(document).ready(function() {
    if($('#registerStatus').val() == 'success'){
        $('#registerStatus').val('');
        $('#warning').show();
        setTimeout(function () { submitLink('<c:url value="/szcea/home"/>'); }, 3000);
    }
});

$(document).ready(function() {
    $('#taxFile').change(function(e) {
        var file = e.target.files[0];
        var reader = new FileReader();

        reader.onload = function(f) {
            $('#taxFileData').val(reader.result);
        }
        reader.readAsDataURL(file);
    });
});

$(document).ready(function() {
    $('#businessCertificate').change(function(e) {
        var file = e.target.files[0];
        var reader = new FileReader();

        reader.onload = function(f) {
            $('#businessCfData').val(reader.result);
        }
        reader.readAsDataURL(file);
    });
});

$(document).ready(function() {
    $('#qualificationProve').change(function(e) {
        var file = e.target.files[0];
        var reader = new FileReader();

        reader.onload = function(f) {
            $('#qfProveData').val(reader.result);
        }
        reader.readAsDataURL(file);
    });
});

/* $(document).ready(function() {
    $('#certificateOfAuthority').change(function(e) {
        var file = e.target.files[0];
        var reader = new FileReader();

        reader.onload = function(f) {
            $('#cOfAuthorityData').val(reader.result);
        }
        reader.readAsDataURL(file);
    });
});


$(document).ready(function() {
    $('#workCertificate').change(function(e) {
        var file = e.target.files[0];
        var reader = new FileReader();

        reader.onload = function(f) {
            $('#workCfData').val(reader.result);
        }
        reader.readAsDataURL(file);
    });
});

$(document).ready(function() {
    $('#specimenContract').change(function(e) {
        var file = e.target.files[0];
        var reader = new FileReader();

        reader.onload = function(f) {
            $('#specimenCtData').val(reader.result);
        }
        reader.readAsDataURL(file);
    });
});

$(document).ready(function() {
    $('#quotation').change(function(e) {
        var file = e.target.files[0];
        var reader = new FileReader();

        reader.onload = function(f) {
            $('#quotationData').val(reader.result);
        }
        reader.readAsDataURL(file);
    });
}); */

$(document).ready(function() {
    $('#other').change(function(e) {
        var file = e.target.files[0];
        var reader = new FileReader();

        reader.onload = function(f) {
            $('#otherData').val(reader.result);
        }
        reader.readAsDataURL(file);
    });
});

$(document).ready(function() {
    $('input.cal').datepicker({dateFormat: 'yy-mm-dd', changeYear: true}, $.datepicker.regional['zh-CN']);

    // init client side validations
    $('input[name="companyName"]').attr('onblur', 'javascript:checkRequired("companyName");');
    $('input[name="username"]').attr('onblur', 'javascript:checkUsernameExists();');
    $('input[name="password"]').attr('onblur', 'javascript:checkPassword();');
    $('input[name="password2"]').attr('onblur', 'javascript:checkPassword2();');
    $('input[name="licenseNo"]').attr('onblur', 'javascript:checkRequired("licenseNo");');
    $('input[name="legalRep"]').attr('onblur', 'javascript:checkRequired("legalRep");');
    $('input[name="address"]').attr('onblur', 'javascript:checkRequired("address");');
    $('input[name="orgCode"]').attr('onblur', 'javascript:checkRequired("orgCode");');
    $('input[name="bankName"]').attr('onblur', 'javascript:checkRequired("bankName");');
    $('input[name="accountNo"]').attr('onblur', 'javascript:checkRequired("accountNo");');
    $('input[name="taxNo"]').attr('onblur', 'javascript:checkRequired("taxNo");');
    $('input[name="contact"]').attr('onblur', 'javascript:checkRequired("contact");');
    $('input[name="phone"]').attr('onblur', 'javascript:checkRequired("phone");');
    $('input[name="code"]').attr('onblur', 'javascript:checkCodeCorrect();');
    toggleAgreement();
//     loadErrors();
});

function toggleAgreement() {
    if ($('#agreement').is(':checked')) {
        $('#submitBtn').attr('disabled', false);
    } else {
        $('#submitBtn').attr('disabled', true);
    }
}

function maxMoney(name) {
    clearErrorMsg(name);
    var re = /^[0-9]+.?[0-9]*$/;
    var p1 = $('input[name="'+name+'"]').val();
    if(isEmpty(p1)){
        return true;
    }
    if(!re.test(p1)){
        showErrorMsg(name, '<f:message key="cm.validation.number"/>', p1);
        return false;
    }
    if(p1 > 999999.99){
        showErrorMsg(name, '<f:message key="cm.validation.maxMoney"/>', p1);
        return false; 
    }
    return true;
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
        showErrorMsg(name, String.format('<f:message key="cm.val.minLength"/>', minLen), val);
        return false;
    }
    return true;
}

function checkUsernameExists() {
    clearIconAndErrorMsg('username');
    if (!checkRequired('username') || !checkMaxLength('username', 16) || !checkMinLength('username', 4))
        return;

    var val = $.trim($('input[name="username"]').val());
    $.ajax({
        url: '<c:url value="/system/user/checkUserExists"/>',
        data: 'username=' + val,
        type: 'POST',
        success: function(txt) {
            if (txt == 'N') {
                showIconMsg('username', '<img src="<c:url value="/statics/images/icon-right.gif"/>"/>', val);
            } else {
                showErrorMsg('username', '<f:message key="ss.register.usernameExists"/>', val);
            }
        }
    });
}

function checkPassword() {
    clearIconAndErrorMsg('password');
    if (!checkRequired('password') || !checkMinLength('password', 6)) {
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

function checkPassword2() {
    clearErrorMsg('password2');
    var p2 = $('input[name="password2"]').val();
    if (p2 == '') {
        showErrorMsg('password2', '<f:message key="cm.validation.required"/>');
        return false;
    }
    var p1 = $('input[name="password"]').val();
    if (p1 != '' && p1 != p2) {
        showErrorMsg('password2', '<f:message key="ss.register.samePassword"/>');
        return false;
    }
    return true;
}

function checkCodeCorrect() {
    clearIconAndErrorMsg('code');
    if (!checkRequired('code'))
        return;

    var val = $.trim($('input[name="code"]').val());
    $.ajax({
        url: '<c:url value="/system/user/checkVerifyCode"/>',
        data: 'code=' + val,
        type: 'POST',
        success: function(txt) {
            if (txt == 'Y') {
                showIconMsg('code', '<img src="<c:url value="/statics/images/icon-right.gif"/>"/>', val);
            } else {
                showErrorMsg('code', '<f:message key="cm.val.code"/>', val);
            }
        }
    });
}

function reloadImage() {
    $('#codeImg').attr('src', '<c:url value="/getVerCode?"/>' + (new Date()).getTime());
}

function doSubmit() {
    if (checkRequired("companyName") & checkRequired("username") & checkPassword() & checkPassword2()
        & checkRequired("licenseNo") & checkRequired("legalRep") & checkRequired("address") & checkRequired("orgCode")
        & checkRequired("bankName") & checkRequired("accountNo") & checkRequired("taxNo") & checkRequired("contact") & checkRequired("phone")
        & checkRequired("code") & checkEmail("email") & maxMoney("registeredCapital") ) {
         if (confirm('<f:message key="cm.confirm.register"/>')) {
         submitForm('<c:url value="/organization/register"/>');
         }
    }
}

function resetForm() {
    clearAllErrorMsgs();
    $("#mainForm")[0].reset();
}
</script>
</body>
</html>