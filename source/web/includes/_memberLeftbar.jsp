<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fireball.tld" prefix="f"%>

<li>
  <a href="javascript:clickLeftMenu('<c:url value="/organization"/>');"><i class="fa fa-users fa-fw"></i> <f:message key="lm.organization.info"/></a>
</li>

<li>
  <a href="#"><f:message key="lm.convention.exhibition.activity"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/activity/exhibition/create"/>');"><f:message key="lm.exhibition.report"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/activity/conference/create"/>');"><f:message key="lm.convention.report"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/activity/manage"/>');"><f:message key="lm.activity.search"/></a></li>
  </ul>
</li>

<li>
  <a href="#"><f:message key="lm.convention.exhibition.statistics"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/organization/statistics/exhibition/create"/>');"><f:message key="lm.exhibition.webReport"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/organization/statistics/exhibition/manage"/>');"><f:message key="lm.exhibition.statistics.search"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/organization/statistics/conference/create"/>');"><f:message key="lm.convention.webReport"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/organization/statistics/conference/manage"/>');"><f:message key="lm.convention.statistics.search"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/organization/statistics/conference/dataSheet"/>');"><f:message key="lm.convention.data.statistics"/></a></li>
  </ul>
</li>

<li>
  <a href="#"><f:message key="lm.news"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/news/create"/>');"><f:message key="lm.news.release"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/news/manage"/>');"><f:message key="lm.news.search"/></a></li>
  </ul>
</li>