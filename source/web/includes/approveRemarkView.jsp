<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fireball.tld" prefix="f"%>

<div class="form-group">
  <label class="col-md-2 control-label"><f:message key="examine.approve.result"/></label>
  <div class="col-md-10">
    <p class="form-control-static">
    <%if("A".equals(entity.getStatus())) {%>
    <f:message key="examine.approve.result.y"/>
    <%} else {%>
    <f:message key="examine.approve.result.n"/>
    <%} %>
    </p>
  </div>
</div>
<div class="form-group">
  <label class="col-md-2 control-label"><f:message key="examine.approve.remark"/></label>
  <div class="col-md-10">
    <p class="form-control-static"><%=StringUtil.getNonEmpty(entity.getRemarks())%></p>
  </div>
</div>