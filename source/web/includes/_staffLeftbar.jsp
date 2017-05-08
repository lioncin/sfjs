<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fireball.tld" prefix="f"%>

<li>
  <a href="#"><f:message key="lm.member.manage"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/member/approve"/>');"><f:message key="lm.member.examine.approve"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/member/manage"/>');"><f:message key="lm.member.search"/></a></li>
  </ul>
</li>

<li>
  <a href="#"><f:message key="lm.convention.exhibition.activity"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/activity/approve"/>');"><f:message key="lm.webReport.examine.approve"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/activity/manage"/>');"><f:message key="lm.activity.search"/></a></li>
  </ul>
</li>

<li>
  <a href="#"><f:message key="lm.convention.exhibition.statistics"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/statistics/exhibition/manage"/>');"><f:message key="lm.exhibition.statistics.search"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/statistics/conference/manage"/>');"><f:message key="lm.convention.statistics.search"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/statistics/conference/dataSheet"/>');"><f:message key="lm.convention.data.statistics"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/statistics/send"/>');"><f:message key="lm.send.statistics.message"/></a></li>
  </ul>
</li>

<li>
  <a href="#"><f:message key="lm.member.news"/><span class="fa arrow"></span></a>
  <ul class="nav nav-second-level">
    <li><a href="javascript:clickLeftMenu('<c:url value="/news/approve"/>');"><f:message key="lm.member.news.examine.approve"/></a></li>
    <li><a href="javascript:clickLeftMenu('<c:url value="/news/manage"/>');"><f:message key="lm.member.news.search"/></a></li>
  </ul>
</li>

<li>
  <a href="javascript:clickLeftMenu('<c:url value="/complaint/manage"/>');"><f:message key="ce.advice.send"/></a>
</li>