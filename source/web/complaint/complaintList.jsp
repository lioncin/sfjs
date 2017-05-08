<%@ include file="/includes/imports.jsp"%>

<%@ page import="com.sanyet.fireball.base.entity.SearchResult"%>
<%@ page import="com.sanyet.fireball.base.entity.SearchParam"%>
<%@ page import="com.sanyet.fireball.base.entity.Comment"%>

<%
  SearchResult<Comment> result = (SearchResult<Comment>) ParamUtil.getRequestAttr(request, "l_searchResult");
  SearchParam param = (SearchParam) ParamUtil.getRequestAttr(request, "l_searchParam");
  String schName = null;
  String schPhone = null;
  List<Comment> rows = null;
  if (result != null) {
      rows = result.getRows();
  }
  if (param != null) {
      schName = StringUtil.cleanString((String) param.getFilter("schName"), "%");
      schPhone = StringUtil.cleanString((String) param.getFilter("schPhone"), "%");
  }
%>

<head>
<title><f:message key="ce.advice.manage"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>

<body>
<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_staffLeftbar.jsp"/>
</jsp:include>

<form class="form-horizontal" name="mainForm" id="mainForm" action="<c:url value="/complaint/search"/>" method="post">
<input type="hidden" name="act" id="act"/>
<input type="hidden" name="roleId" value="1"/>

<input type="hidden" name="actionUrl" id="actionUrl" value="<c:url value="/content/search"/>"/>
<input type="hidden" name="pageNo" id="pageNo"/>
<input type="hidden" name="orderByColumn" id="orderByColumn"/>
<input type="hidden" name="orderByType" id="orderByType"/>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="ce.advice.manage"/></h3>
  </div>
</div>

<div class="row">
  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="cm.searchCriteria"/></div>
      <div class="panel-body">
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="ce.advice.name"/></label>
          <div class="col-md-4"><input class="form-control" name="schName" value="<%=StringUtil.getNonNull(schName)%>"></div>
          <label class="col-md-2 control-label"><f:message key="ce.advice.phone"/></label>
          <div class="col-md-4"><input class="form-control" name="schPhone" value="<%=StringUtil.getNonNull(schPhone)%>"></div>
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
          <table class="table table-striped table-bordered table-hover" id="dataTables-example">
            <colgroup>
              <col width="8%"/>
              <col width="20%"/>
              <col width="20%"/>
              <col width="25%"/>
              <col width="12%"/>
            </colgroup>
            <tr>
              <th><input type="checkbox" id="allSelector" name="allSelector" onclick="javascript:checkAllSelectors();"/></th>
              <th><f:message key="ce.advice.name"/><%-- <f:sortableHeader header="ce.advice.name" column="AUTHOR_NMAE"/> --%></th>
              <th><f:message key="ce.advice.phone"/></th>
              <th><f:message key="ce.advice.send"/></th>
              <th><f:message key="cm.action"/></th>
            </tr>
            <%
            if (rows != null && rows.size() > 0) {
                for (Comment row : rows) {
                    int id = row.getId();
                    String catalogName = null;
                    String status = null;
                    String authorName = "";
            %>
            <tr>
              <td class="set"><input type="checkbox" name="selector" value="<%=id%>" onclick="javascript:updateAllSelector();"/></td>
              <td><a href="javascript:doView('<%=id%>');"><%=row.getAuthorName()%></a></td>
              <td><%=StringUtil.getNonEmpty(row.getAuthorMobile())%></td>
              <td><%=StringUtil.getNonEmpty(row.getContent())%></td>
              <td class="set"><%-- <a href="javascript:doEdit('<%=id%>');" title="<f:message key="cm.edit"/>"><span class="glyphicon glyphicon-edit"></span></a>&nbsp; --%><a href="javascript:doSingleDelete('<%=id%>');" title="<f:message key="cm.delete"/>"><span class="glyphicon glyphicon-remove"></span></a></td>
            </tr>
            <%
                }
              } else {
            %>
            <tr>
              <td colspan="5"><f:message key="cm.noRecordFound"/></td>
            </tr>
            <%
              }
            %>
          </table>
        </div>
        <div class="row">
          <div class="col-md-6">
            <button class="btn btn-default" type="button" onclick="javascript:doDelete();"><f:message key="cm.delete"/></button>
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

//---------------- CRUD - START ----------------
function doSearch() {
    submitAction('search');
}

function doClear() {
    $('input[name="schName"]').val('');
    $('input[name="schPhone"]').val('');
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
//---------------- CRUD - END ----------------

function doEdit(id) {
    submitForm('<c:url value="/news/edit/"/>' + id);
}

function doView(id) {
    submitForm('<c:url value="/complaint/view/"/>' + id);
}

function doCreate() {
    submitLink('<c:url value="/news/create"/>');
}

function doSingleDelete(id) {
    if (confirm('<f:message key="cm.confirm.delete"/>')) {
        submitForm('<c:url value="/complaint/delete"/>?id=' + id);
    }
}

function doDelete() {
    if ($('input[name="selector"]').is(':checked') && confirm('<f:message key="cm.confirm.delete"/>')) {
        submitForm('<c:url value="/complaint/delete"/>');
    }
}
</script>
</body>
</html>