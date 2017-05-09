<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fireball.tld" prefix="f"%>


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