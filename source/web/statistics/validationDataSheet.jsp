<script type="text/javascript">
$(document).ready(function() {
    _loadServerSideErrors();
});

function _loadServerSideErrors() {
<c:if test="${not empty validator}">
  <c:if test="${not empty validator.errors}">
    <c:forEach var="error" items="${validator.errors}">
      redInput('<c:out value="${error.name}"/>', '<c:out value="${error.value}" escapeXml="false"/>');
    </c:forEach>
    showErrMsg();
  </c:if>
</c:if>
}

function redInput(fld, val) {
  var elem = $('[name="' + fld + '"]');
  elem.val(val);
  $(elem).parents('div:first').addClass('has-error');
}
function showErrMsg() {
  $("#err_msg").html('<span class="help-block"><f:message key="ce.organization.data.check"/></span>');
}
</script>