<%@ include file="/includes/imports.jsp"%>

<head>
<title><f:message key="ce.statistics.conference.info"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>
<body>

<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_memberLeftbar.jsp"/>
</jsp:include>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="ce.statistics.conference.info"/></h3>
  </div>
</div>

<form class="form-horizontal" role="form" name="mainForm" id="mainForm" action="" method="post">

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="ce.statistics.head"/></div>
      <div class="panel-body">
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="ce.statistics.stat.year"/>:</label>
          <div class="col-md-10"><p class="form-control-static"><c:out value="${entity.statYear}"/></p></div>
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label"><f:message key="ce.statistics.filedBy"/>:</label>
            <div class="col-md-10"><p class="form-control-static"><c:out value="${entity.filedBy}"/></p></div>
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label"><f:message key="ce.statistics.phoneNo"/>:</label>
            <div class="col-md-10"><p class="form-control-static"><c:out value="${entity.phoneNo}"/></p></div>
        </div>
        <%@ include file="/includes/audit.jsp"%>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="ce.statistics.conference.info"/></div>
      <div class="panel-body">
        <div class="dataTable_wrapper">
          <table class="table table-striped table-bordered table-hover" id="conferenceTbl">
            <colgroup>
              <col width="5%"/>
              <col width="25%"/>
              <col width="25%"/>
              <col width="15%"/>
              <col width="5%"/>
              <col width="10%"/>
              <col width="15%"/>
            </colgroup>
            <tr>
              <th><f:message key="cm.sn"/></th>
              <th><f:message key="ce.statistics.conferenceName"/></th>
              <th><f:message key="ce.statistics.sponsor"/></th>
              <th><f:message key="ce.statistics.conveningTime"/></th>
              <th><f:message key="ce.statistics.addTime"/></th>
              <th><f:message key="ce.statistics.visitorCount"/></th>
              <th><f:message key="ce.statistics.confType"/></th>
            </tr>
            <c:if test="${not empty entity.statDetail}">
            <c:forEach var="row" items="${entity.statDetail}" varStatus="status">
            <tr>
              <td class="set">${status.index + 1}</td>
              <td class="txt"><p class="form-control-static"><c:out value="${row.activityName}"/></p></td>
              <td class="txt"><p class="form-control-static"><c:out value="${row.sponsor}"/></p></td>
              <td class="txt"><p class="form-control-static"><c:out value="${row.holdFrom}"/></p></td>
              <td class="txt"><p class="form-control-static"><c:out value="${row.countTime}"/></p></td>
              <td class="txt"><p class="form-control-static"><c:out value="${row.visitorCount}"/></p></td>
              <td class="txt"><p class="form-control-static"><f:masterCode code="conference.type.${row.confType}"/></p></td>
            </tr>
            </c:forEach>
            </c:if>
            <c:if test="${empty entity.statDetail}">
            <tr>
              <td colspan="7"><f:message key="cm.noRecordFound"/></td>
            </tr>
            </c:if>
          </table>
        </div>
      </div>
    </div>
    <button class="btn btn-default" type="button" onclick="javascript:doEdit();"><f:message key="cm.edit"/></button>&nbsp;
    <button class="btn btn-default" type="button" onclick="javascript:doDelete();"><f:message key="cm.delete"/></button>&nbsp;
    <button class="btn btn-default" type="button" onclick="javascript:doCancel();"><f:message key="cm.cancel"/></button>&nbsp;
  </div>
</div>

</form>

<%@ include file="/includes/footer.jsp"%>

<script>
function doEdit() {
    submitForm('<c:url value="/organization/statistics/conference/edit"/>/' + '${entity.id}');
}
function doDelete() {
    if (confirm('<f:message key="cm.confirm.delete"/>')) {
      submitForm('<c:url value="/organization/statistics/delete"/>/?id=${entity.id}&fromView=conference');
    }
}
function doCancel() {
    submitLink('<c:url value="/organization/statistics/conference/search"/>');
}
</script>
</body>
</html>