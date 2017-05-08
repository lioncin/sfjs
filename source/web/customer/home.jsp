<%@ include file="/includes/imports.jsp"%>

<%
  // java codes
  //String lang = request.getParameter("locale");
%>

<head>
<title><f:message key="hm.home.title"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>

<body>

<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_memberLeftbar.jsp"/>
</jsp:include>

<div class="row">
  <div class="col-lg-12">
    <h3 class="page-header">Blank</h3>
  </div>
</div>

<%@ include file="/includes/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
});
</script>
</body>
</html>