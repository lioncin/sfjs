<%@ include file="/includes/imports.jsp"%>

<head>
<title><f:message key="ce.statistics.exhibition.info"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>
<body>

<jsp:include page="/includes/header.jsp">
    <jsp:param name="leftMenuPath" value="/includes/_staffLeftbar.jsp"/>
</jsp:include>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="ce.statistics.exhibition.info"/></h3>
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
          <label class="col-md-2 control-label"><f:message key="ce.statistics.submittedBy"/>:</label>
          <div class="col-md-10"><p class="form-control-static"><c:out value="${entity.customer.companyName}"/></p></div>
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
      <div class="panel-heading"><f:message key="ce.statistics.exhibition.info"/></div>
      <div class="panel-body">
        <div class="dataTable_wrapper">
          <table class="table table-striped table-bordered table-hover" id="exhibitionTbl">
            <colgroup>
              <col width="5%"/>
              <col width="13%"/>
              <col width="13%"/>
              <col width="10%"/>
              <col width="13%"/>
              <col width="13%"/>
              <col width="9%"/>
              <col width="8%"/>
              <col width="8%"/>
              <col width="8%"/>
            </colgroup>
            <tr>
              <th><f:message key="cm.sn"/></th>
              <th><f:message key="ce.statistics.exhibitionName"/></th>
              <th><f:message key="ce.statistics.location"/></th>
              <th><f:message key="ce.statistics.holdingTime"/></th>
              <th><f:message key="ce.statistics.sponsor"/></th>
              <th><f:message key="ce.statistics.organizer"/></th>
              <th><f:message key="ce.statistics.countTime"/><br />(<f:message key="ce.unit.individual"/>)</th>
              <th><f:message key="ce.statistics.area"/><br />(<f:message key="ce.unit.squareMeter"/>)</th>
              <th><f:message key="ce.statistics.visitorCount"/></th>
              <th><f:message key="ce.statistics.addConference"/><br />(<f:message key="ce.unit.field"/>)</th>
            </tr>
            <c:if test="${not empty entity.statDetail}">
            <c:forEach var="row" items="${entity.statDetail}" varStatus="status">
            <tr>
              <td class="set">${status.index + 1}</td>
              <td class="txt"><p class="form-control-static"><c:out value="${row.activityName}"/></p></td>
              <td class="txt"><p class="form-control-static"><c:out value="${row.location}"/></p></td>
              <td class="txt"><p class="form-control-static"><c:out value="${row.holdFrom}"/></p></td>
              <td class="txt"><p class="form-control-static"><c:out value="${row.sponsor}"/></p></td>
              <td class="txt"><p class="form-control-static"><c:out value="${row.organizer}"/></p></td>
              <td class="txt"><p class="form-control-static"><c:out value="${row.countTime}"/></p></td>
              <td class="txt"><p class="form-control-static"><c:out value="${row.area}"/></p></td>
              <td class="txt"><p class="form-control-static"><c:out value="${row.visitorCount}"/></p></td>
              <td class="txt"><p class="form-control-static"><c:out value="${row.addConference}"/></p></td>
            </tr>
            </c:forEach>
            </c:if>
            <c:if test="${empty entity.statDetail}">
            <tr>
              <td colspan="10"><f:message key="cm.noRecordFound"/></td>
            </tr>
            </c:if>
          </table>
        </div>
      </div>
    </div>
    <button class="btn btn-default" type="button" onclick="javascript:doCancel();"><f:message key="cm.cancel"/></button>&nbsp;
    <button class="btn btn-default" type="button" onclick="javascript:saveAsPdf();"><f:message key="cm.saveAsPdf"/></button>
  </div>
</div>

</form>

<%@ include file="/includes/footer.jsp"%>

<script>
function doCancel() {
    submitLink('<c:url value="/statistics/exhibition/search"/>');
}

function saveAsPdf() {
  window.open('<c:url value="/statistics/saveAsPdf"/>?statisticsId=${entity.id}');
}
</script>
</body>
</html>