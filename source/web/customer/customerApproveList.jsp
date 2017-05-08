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
    <h3 class="page-header"><f:message key="lm.member.manage"/></h3>
  </div>
</div>

<form class="form-horizontal" role="form" name="mainForm" id="mainForm" action="<c:url value="/member/search"/>" method="post">
<input type="hidden" name="act" id="act">
<input type="hidden" name="roleId" value="1">

<!-- CRUD -->
<input type="hidden" name="actionUrl" id="actionUrl" value="<c:url value="/customer/search"/>">
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
          <label class="col-md-2 control-label"><f:message key="cm.customer.companyName"/></label>
          <div class="col-md-4"><input class="form-control" name="schName" value="${l_searchParam.filters['schName']}"></div>
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
              <col width="8%"/>
              <col width="20%"/>
              <col width="20%"/>
              <col width="20%"/>
              <col width="20%"/>
              <col width="12%"/>
            </colgroup>
            <tr>
              <th><input type="checkbox" id="allSelector" name="allSelector" onclick="javascript:checkAllSelectors();"/></th>
              <th><f:sortableHeader header="cm.customer.organizationName" column="COMPANY_NAME"/></th>
              <th><f:message key="cm.customer.status"/></th>
              <th><f:message key="cm.customer.contactFullname"/></th>
              <th><f:message key="cm.customer.contactMobile"/></th>
              <th><f:message key="cm.action"/></th>
            </tr>
            <c:if test="${not empty l_searchResult.rows}">
            <c:forEach var="row" items="${l_searchResult.rows}">
            <tr>
              <td class="set"><input type="checkbox" name="selector" value="${row.id}" onclick="javascript:updateAllSelector();"/></td>
              <td><a href="javascript:doView('${row.id}');"><c:out value="${row.companyName}"/></a></td>
              <td><f:masterCode code="customer.status.${row.status}"/></td>
              <td><c:out value="${row.contact}"/></td>
              <td><c:out value="${row.phone}"/></td>
              <td class="set"><a href="javascript:changeStatus('${row.id}');" title="<f:message key="examine.approve.result.y"/>"><span class="glyphicon glyphicon-ok"></span></a></td>
            </tr>
            </c:forEach>
            </c:if>
            <c:if test="${empty l_searchResult.rows}">
            <tr>
              <td colspan="6"><f:message key="cm.noRecordFound"/></td>
            </tr>
            </c:if>
          </table>
        </div>
        <div class="row">
          <div class="col-md-6">
          </div>
          <div class="col-md-6 text-right">
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
    $('input[name="schName"]').val('');
}
//---------------- /CRUD ----------------

function doView(id) {
    submitForm('<c:url value="/member/view"/>/' + id + '?from=approve');
}

function changeStatus(id) {
    if (confirm('<f:message key="examine.approve.affirm"/>')) {
        submitForm('<c:url value="/member/status"/>?id=' + id + '&result=Y&from=approve');
    }
}
</script>
</body>
</html>