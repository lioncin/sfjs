<%@ include file="/includes/imports.jsp"%>

<%@ page import="com.sanyet.fireball.szcea.SzceaCst"%>

<head>
<title><f:message key="ce.statistics.exhibition.manage"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>

<body>
<jsp:include page="/includes/header.jsp">
    <jsp:param name="leftMenuPath" value="/includes/_staffLeftbar.jsp"/>
</jsp:include>
<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="ce.statistics.exhibition.manage"/></h3>
  </div>
</div>

<form class="form-horizontal" role="form" name="mainForm" id="mainForm" action="<c:url value="/statistics/exhibition/search"/>" method="post">
<input type="hidden" name="act" id="act">

<!-- CRUD -->
<input type="hidden" name="actionUrl" id="actionUrl" value="">
<input type="hidden" name="pageNo" id="pageNo" value="${l_searchParam.pageNo}"/>
<input type="hidden" name="orderByColumn" id="orderByColumn" value="${l_searchParam.orderByColumn}">
<input type="hidden" name="orderByType" id="orderByType" value="${l_searchParam.orderByType}">
<!-- /CRUD -->

<div class="row">
  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="cm.searchCriteria"/></div>
      <div class="panel-body">
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="ce.statistics.stat.year"/></label>
          <% int defaultFromYear = SzceaCst.DEFAULT_FROM_YEAR; %>
          <div class="col-md-4"><ce:yearSelect name="schStatYear" css="form-control s" firstYear="<%=defaultFromYear %>" firstOption="--" selectYear="${l_searchParam.filters['schStatYear']}"/></div>
          <label class="col-md-2 control-label"><f:message key="ce.statistics.submittedBy"/></label>
          <div class="col-md-4"><input class="form-control" name="submittedBy" value="${l_searchParam.filters['submittedBy']}"></div>
        </div>
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="ce.statistics.filedBy"/></label>
          <div class="col-md-4"><input class="form-control" name="schFiledBy" value="${l_searchParam.filters['schFiledBy']}"></div>
        </div>
        <button class="btn btn-default" type="button" onclick="javascript:doSearch();"><f:message key="cm.search"/></button>&nbsp;<button class="btn btn-default" type="button" onclick="javascript:doClear();"><f:message key="cm.clear"/></button>
      </div>
    </div>
  </div>
</div>

<div class="row">
  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="cm.searchResults"/></div>
      <div class="panel-body">
        <div class="dataTable_wrapper">
          <table class="table table-striped table-bordered table-hover">
            <colgroup>
              <col width="15%"/>
              <col width="50%"/>
              <col width="25%"/>
              <col width="10%"/>
            </colgroup>
            <tr>
              <th><f:message key="ce.statistics.stat.year"/></th>
              <th><f:message key="ce.statistics.submittedBy"/></th>
              <th><f:message key="ce.statistics.filedBy"/></th>
              <th><f:message key="cm.action"/></th>
            </tr>
            <c:if test="${not empty l_searchResult.rows}">
            <c:forEach var="row" items="${l_searchResult.rows}" varStatus="status">
            <tr>
              <td><a href="javascript:doView('${row.id}');"><c:out value="${row.statYear}"/></a></td>
              <td><c:out value="${row.customer.companyName}"/></td>
              <td><c:out value="${row.filedBy}"/></td>
              <td><button class="btn btn-default" type="button" onclick="javascript:saveAsPdf(${row.id});"><f:message key="cm.saveAsPdf"/></button></td>
            </tr>
            </c:forEach>
            </c:if>
            <c:if test="${empty l_searchResult.rows}">
            <tr>
              <td colspan="3"><f:message key="cm.noRecordFound"/></td>
            </tr>
            </c:if>
          </table>
        </div>
        <div class="row">
          <div class="col-md-12 text-right">
            <f:pagination/>
          </div>
        </div>
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

//---------------- CRUD ----------------
function doSearch() {
  submitAction('search');
}

function doSort(column, type) {
  $('input[name="orderByColumn"]').val(column);
  $('input[name="orderByType"]').val(type);
  submitAction('sort');
}

function changePage(pageNo) {
  $('input[name="pageNo"]').val(pageNo);
  submitAction('paging');
}

function doClear() {
  $('#schStatYear').val('');
  $('input[name="submittedBy"]').val('');
  $('input[name="schFiledBy"]').val('');
}
//---------------- /CRUD ----------------

function doView(id) {
  submitForm('<c:url value="/statistics/exhibition/view"/>/' + id);
}

function saveAsPdf(id) {
  window.open('<c:url value="/statistics/saveAsPdf"/>?statisticsId=' + id);
}
</script>
</body>
</html>