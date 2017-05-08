<%@ include file="/includes/imports.jsp"%>

<%
  // java codes
%>

<head>
<title><f:message key="ss.login.title"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>

<body>

<div class="container">
  <div class="row">
    <div class="col-md-4 col-md-offset-4">
      <div class="login-panel panel panel-default">
        <div class="panel-heading"><h3 class="panel-title"><f:message key="ss.login.welcome"/></h3></div>
        <div class="panel-body">
          <form role="form" name="mainForm" action="<c:url value="/j_spring_security_check"/>" method="post">
              <fieldset>
                  <div class="form-group">
                    <input class="form-control" placeholder="<f:message key="cm.user.username"/>" id="j_username" name="j_username" type="text" autofocus>
                  </div>
                  <div class="form-group">
                    <input class="form-control" placeholder="<f:message key="cm.user.password"/>" name="j_password" type="password" value="">
                  </div>
                <%--   <div class="checkbox">
                    <label>
                      <input id="remember_me" name="_spring_security_remember_me" type="checkbox"><f:message key="ss.login.rememberMe"/>
                    </label>
                  </div> --%>
                  <button class="btn btn-primary" type="submit" onclick="javascript:doLogin();"><f:message key="cm.login"/></button>
              </fieldset>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<div id="copyright"><f:message key="in.footer.copyright"/></div>
<script src="<c:url value="/statics/scripts/utils.js"/>"></script>
<%@ include file="/includes/validation.jsp"%>

<script>
function doLogin() {
    document.forms[0].submit();
}

function doRegister() {
    submitLink('<c:url value="/customer/register2.jsp"/>');
}
</script>
</body>
</html>