<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fireball.tld" prefix="f"%>

<input type="hidden" name="pageNo" id="pageNo" value="${l_searchParam.pageNo}"/>
<input type="hidden" name="orderByColumn" id="orderByColumn" value="${l_searchParam.pageNo}"/>
<input type="hidden" name="orderByType" id="orderByType" value="${l_searchParam.pageNo}"/>
<input type="hidden" name="isMultiSelect" id="isMultiSelect" value="${isMultiSelect}"/>
<input type="hidden" name="callback" id="callback" value="${callback}"/>

<div class="modal" id="catalogModal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><f:message key="ct.catalogBrowser.title"/></h4>
      </div>
      <div class="modal-body">
      <form class="form-inline" role="form">
        <div class="form-group">
          <label><f:message key="cm.catalog.name"/></label>
          <input class="form-control" name="schName" value="${entity.name}">
        </div>
        <button type="submit" class="btn btn-default" onclick="javascript:doSearch();"><f:message key="cm.search"/></button>

        <div class="sep"></div>

        <table class="table table-striped table-bordered table-hover">
          <colgroup>
            <c:if test="${isMultiSelect}">
            <col width="10%"/>
            <col width="30%"/>
            <col width="30%"/>
            <col width="30%"/>
            </c:if>
            <c:if test="${not isMultiSelect}">
            <col width="30%"/>
            <col width="30%"/>
            <col width="40%"/>
            </c:if>
          </colgroup>
          <tr>
            <c:if test="${isMultiSelect}">
            <th></th>
            </c:if>
            <th><f:sortableHeader header="cm.catalog.name" column="NAME"/></th>
            <th><f:message key="cm.catalog.parent"/></th>
            <th><f:message key="cm.description"/></th>
          </tr>
          <c:if test="${not empty l_searchResult.rows}">
          <c:forEach var="row" items="${l_searchResult.rows}">
          <tr>
            <c:if test="${isMultiSelect}">
            <td class="set"><input type="checkbox" name="selector" value="${row.id}"/></td>
            </c:if>
            <td><a href="javascript:doCatalogSelect('${row.id}', '${row.name}');"><c:out value="${row.name}"/></a></td>
            <td><c:out value="${row.parent.name}"/></td>
            <td><c:out value="${row.description}"/></td>
          </tr>
          </c:forEach>
          </c:if>
          <c:if test="${empty l_searchResult.rows}">
          <tr>
            <c:if test="${isMultiSelect}">
            <td colspan="4"><f:message key="cm.noRecordFound"/></td>
            </c:if>
            <c:if test="${not isMultiSelect}">
            <td colspan="3"><f:message key="cm.noRecordFound"/></td>
            </c:if>
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
        <button type="button" class="btn btn-primary" onclick="javascript:doCatalogMultiSelect();"><f:message key="cm.ok"/></button>
      </div>
    </div>
  </div>
</div>

<script>
function doSearch() {
    var opts = {'url': '<c:url value="/content/catalog/search"/>',
                'data': {'isBrowser': true,
                          'isMultiSelect': $('#isMultiSelect').val(),
                          'callback': $('#callback').val(),
                          'schName': $('#schName').val(),
                          'pageNo': $('#pageNo').val(),
                          'orderByColumn': $('#orderByColumn').val(),
                          'orderByType': $('#orderByType').val()}};
    $('#catalogModal').modal('hide');
    $('#catalogModal').remove();
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

function doCatalogSelect(id, fullname) {
    $('#catalogModal').modal('hide');
    callFunc('${callback}', id, fullname);
}

function doCatalogMultiSelect() {
    var ids = '';
    var names = '';
    $('input[name="selector"]:checked').each(function() {
        ids = ids + ',' + $(this).val();
        names = names + ',' + $(this).parent().next('td').html();
    });

    if (ids.indexOf(',') != -1) {
        ids = ids.substring(1);
    }
    if (names.indexOf(',') != -1) {
        names = names.substring(1);
    }

    $('#catalogModal').modal('hide');
    callFunc('${callback}', ids, names);
}
</script>