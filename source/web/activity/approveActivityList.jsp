<%@ include file="/includes/imports.jsp"%>

<%@ page import="com.sanyet.fireball.szcea.entity.Activity"%>
<%@ page import="com.sanyet.fireball.base.entity.SearchResult"%>
<%@ page import="com.sanyet.fireball.base.entity.SearchParam"%>

<%
  SearchResult<Activity> result = (SearchResult<Activity>) ParamUtil.getRequestAttr(request, "l_searchResult");
  SearchParam param = (SearchParam) ParamUtil.getRequestAttr(request, "l_searchParam");
  Integer groupId = (Integer) ParamUtil.getSessionAttr(request, "groupId");
  String schName = null;
  String schParentName = null;
  List<Activity> rows = null;
  int pageNo = 1;
  String orderByColumn = "";
  String orderByType = "";
  if (result != null) {
      rows = result.getRows();
  }
  if (groupId == null) {
      groupId = 0;
  }
  if (param != null) {
      schName = StringUtil.cleanString((String) param.getFilter("schName"), "%");
      schParentName = StringUtil.cleanString((String) param.getFilter("schParentName"), "%");
      pageNo = param.getPageNo();
      if (!StringUtil.isEmpty(param.getOrderByColumn())) {
          orderByColumn = param.getOrderByColumn();
          orderByType = param.getOrderByType();
      }
  }
%>

<head>
<title><f:message key="cm.activity.management"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>

<body>
<%if(groupId == 103) {%>
<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_memberLeftbar.jsp"/>
</jsp:include>
<%} else { %>
<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_staffLeftbar.jsp"/>
</jsp:include>
<%} %>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="activity.name"/></h3>
  </div>
</div>

<form class="form-horizontal" name="mainForm" id="mainForm" action="<c:url value="approve"/>" method="post">
<input type="hidden" name="act" id="act"/>
<input type="hidden" name="roleId" value="1"/>
<input type="hidden" name="status" value="P"/>

<!-- CRUD -->
<input type="hidden" name="actionUrl" id="actionUrl" value="<c:url value="search"/>"/>
<input type="hidden" name="pageNo" id="pageNo" value="<%=pageNo%>"/>
<input type="hidden" name="orderByColumn" id="orderByColumn" value="<%=orderByColumn%>"/>
<input type="hidden" name="orderByType" id="orderByType" value="<%=orderByType%>"/>
<!-- /CRUD -->

<div class="row">
  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="cm.searchCriteria"/></div>
      <div class="panel-body">
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="activity.name"/></label>
          <div class="col-md-4"><input class="form-control m" type="text" name="schName" value="<%=StringUtil.getNonNull(schName)%>"/></div>
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
              <col width="25%"/>
              <col width="15%"/>
              <col width="12%"/>
            </colgroup>
            <tr>
              <th><input type="checkbox" id="allSelector" name="allSelector" onclick="javascript:checkAllSelectors();"/></th>
              <th><f:sortableHeader header="activity.name" column="NAME"/></th>
              <th><f:message key="activity.location"/></th>
              <th><f:message key="activity.type"/></th>
              <th><f:message key="activity.status"/></th>
              <th><f:message key="cm.action"/></th>
            </tr>
            <%
              if (rows != null && rows.size() > 0) {
                  for (Activity row : rows) {
                      int id = row.getId();
                      String type = null;
                      String status = null;
                      if (row.getType() != null) {
                          type = "activity.type." + row.getType();
                      }
                      if(row.getStatus() != null){
                          status = "activity.status." + row.getStatus();
                      }
            %>
            <tr>
              <td class="set"><input type="checkbox" name="selector" value="<%=id%>" onclick="javascript:updateAllSelector();"/></td>
              <td><a href="javascript:doView('<%=id%>');"><%=row.getName()%></a></td>
              <td><%=StringUtil.getNonEmpty(row.getLocation())%></td>
              <td><f:masterCode code="<%=type%>"/></td>
              <td><f:masterCode code="<%=status%>"/></td>
              <td class="set"><%if(groupId == 103) {%><a href="javascript:doEdit('<%=id%>');" title="<f:message key="cm.edit"/>"><span class="glyphicon glyphicon-edit"></span></a><%} %>&nbsp;<a href="javascript:doSingleDelete('<%=id%>');" title="<f:message key="cm.delete"/>"><span class="glyphicon glyphicon-remove"></span></a></td>
            </tr>
            <%
                  }
              } else {
            %>
            <tr>
              <td colspan="6"><f:message key="cm.noRecordFound"/></td>
            </tr>
            <%
              }
            %>
          </table>
        </div>
        <div class="row">
          <div class="col-md-6">
            <!-- <button class="btn btn-default" type="button" onclick="javascript:doCreate();"><f:message key="cm.create"/> --></button>&nbsp;<button class="btn btn-default" type="button" onclick="javascript:doDelete();"><f:message key="cm.delete"/></button>
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
    $('#status option:eq(0)').attr('selected','selected');
}
//---------------- /CRUD ----------------

function doEdit(id) {
    submitForm('<c:url value="/activity/edit"/>/' + id);
}

function doView(id) {
    submitForm('<c:url value="/activity/approveView"/>/' + id);
}

function doCreate() {
    submitLink('<c:url value="/activity/create"/>');
}

function doSingleDelete(id) {
    if (confirm('<f:message key="cm.confirm.delete"/>')) {
        submitForm('<c:url value="/activity/delete"/>?Id=' + id);
    }
}

function doDelete() {
    if ($('input[name="selector"]').is(':checked') && confirm('<f:message key="cm.confirm.delete"/>')) {
        submitForm('<c:url value="/activity/delete"/>');
    }
}
</script>
</body>
</html>