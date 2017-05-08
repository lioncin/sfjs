<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fireball.tld" prefix="f"%>

<li>
  <a href="#"><f:message key="cm.catalog"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/content/catalog/create"/>');"><f:message key="cm.create"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/content/catalog/manage"/>');"><f:message key="cm.manage"/></a></li>
  </ul>
</li>

<li>
  <a href="#"><f:message key="cm.content"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/content/create"/>');"><f:message key="cm.create"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/content/manage"/>');"><f:message key="cm.manage"/></a></li>
  </ul>
</li>

<li>
  <a href="#"><f:message key="cm.link"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/content/link/create"/>');"><f:message key="cm.create"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/content/link/manage"/>');"><f:message key="cm.manage"/></a></li>
  </ul>
</li>

<%-- <li>
  <a href="#"><f:message key="cm.form"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/content/form/create"/>');"><f:message key="cm.create"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/content/form/manage"/>');"><f:message key="cm.manage"/></a></li>
  </ul>
</li> --%>

<%-- <li>
  <a href="#"><f:message key="cm.survey"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/content/survey/create"/>');"><f:message key="cm.create"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/content/survey/manage"/>');"><f:message key="cm.manage"/></a></li>
  </ul>
</li> --%>

<li>
  <a href="#"><f:message key="cm.website"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/content/website/setting"/>');"><f:message key="ct.leftbar.website.setting"/></a></li>
  </ul>
</li>

<li>
  <a href="javascript:clickLeftMenu('<c:url value="/content/attachment/manage"/>');"><f:message key="cm.attachment"/><span class="fa arrow"></span></a>
  <%-- <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/content/attachment/manage"/>');"><f:message key="ct.leftbar.attachment.view"/></a></li>
  </ul> --%>
</li>
