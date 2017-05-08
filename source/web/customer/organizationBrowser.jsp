<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fireball.tld" prefix="f"%>

<input type="hidden" name="pageNo" id="pageNo" value="${l_searchParam.pageNo}"/>
<input type="hidden" name="orderByColumn" id="orderByColumn" value="${l_searchParam.pageNo}"/>
<input type="hidden" name="orderByType" id="orderByType" value="${l_searchParam.pageNo}"/>

<div class="modal" id="organizationModal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><f:message key="ce.organizationBrowser.title"/></h4>
      </div>
      <div class="modal-body">
      <form class="form-inline" role="form">
        <div class="form-group">
          <label><f:message key="cm.customer.organizationName"/></label>
          <input class="form-control" id="schName" name="schName" value="${l_searchParam.filters['schName']}">
        </div>
        <button type="submit" class="btn btn-default" onclick="javascript:doSearch();"><f:message key="cm.search"/></button>

        <div class="sep"></div>

        <table class="table table-striped table-bordered table-hover">
          <colgroup>
            <col width="70%"/>
            <col width="30%"/>
          </colgroup>
          <tr>
            <th><f:message key="cm.customer.organizationName"/></th>
            <th><f:message key="cm.customer.contactFullname"/></th>
          </tr>
          <c:if test="${not empty l_searchResult.rows}">
          <c:forEach var="row" items="${l_searchResult.rows}">
          <tr>
            <td><a href="javascript:doSelect('${row.id}', '${row.companyName}');"><c:out value="${row.companyName}"/></a></td>
            <td><c:out value="${row.contact}"/></td>
          </tr>
          </c:forEach>
          </c:if>
          <c:if test="${empty l_searchResult.rows}">
          <tr>
            <td colspan="2"><f:message key="cm.noRecordFound"/></td>
          </tr>
          </c:if>
        </table>

        <div class="col-sm-12 text-right" style="padding-right:0;">
          <f:pagination/>
        </div>

        <div class="cls"></div>
      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><f:message key="cm.close"/></button>
      </div>
    </div>
  </div>
</div>

<script>
function doSearch() {
	var crst = "${l_searchParam.filters['crStatus']}";
    var opts = {'url': '<c:url value="/member/search"/>',
                'data': {'isBrowser': true,
                          'schName': $('#schName').val(),
                          'pageNo': $('#pageNo').val(),
                          'orderByColumn': $('#orderByColumn').val(),
                          'orderByType': $('#orderByType').val(),
                          'crStatus': crst,
                          'callback': '${callback}'}};
    $('#organizationModal').modal('hide');
    $('#organizationModal').remove();
    showPopupDialog(opts);
}

function doSort(column, type) {
    $('#orderByColumn').val(column);
    $('#orderByType').val(type);

    doSearch();
}

function changePage(pageNo) {
    $('#pageNo').val(pageNo);

    doSearch();
}

function doSelect(id, fullname) {
    $('#organizationModal').modal('hide');
    callFunc('${callback}', id, fullname);
}
</script>