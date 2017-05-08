<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fireball.tld" prefix="f"%>

<%-- <li>
  <a href="#"><f:message key="cm.group"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/system/group/create"/>');"><f:message key="cm.create"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/system/group/manage"/>');"><f:message key="cm.manage"/></a></li>
  </ul>
</li>
<li>
  <a href="#"><f:message key="cm.role"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/system/role/create"/>');"><f:message key="cm.create"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/system/role/manage"/>');"><f:message key="cm.manage"/></a></li>
  </ul>
</li> --%>
<li>
  <a href="#"><f:message key="cm.user"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/system/user/create"/>');"><f:message key="cm.create"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/system/user/manage"/>');"><f:message key="cm.manage"/></a></li>
  </ul>
</li>
<li>
  <a href="javascript:clickLeftMenu('<c:url value="/system/config/manage"/>');"><f:message key="cm.config"/></a>
</li>
<%-- <li>
  <a href="javascript:clickLeftMenu('<c:url value="/system/access/manage"/>');"><f:message key="cm.access"/></a>
</li>
<li>
  <a href="#"><f:message key="cm.task"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/system/task/manage"/>');"><f:message key="ss.leftbar.myTask"/></a></li>
  </ul>
</li> --%>

