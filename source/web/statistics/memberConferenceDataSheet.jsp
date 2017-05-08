<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.sanyet.fireball.szcea.entity.Statistics" %>
<%@ page import="com.sanyet.fireball.szcea.entity.ConferenceDataSheet" %>
<%@ page import="com.sanyet.fireball.szcea.SzceaCst"%>
<%@ page import="com.sanyet.fireball.base.util.StringUtil" %>

<%@ include file="/includes/imports.jsp"%>

<head>
<title><f:message key="lm.convention.data.statistics"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>
<body>
<%
HashMap<String, ConferenceDataSheet> conferenceDatas = new HashMap<String, ConferenceDataSheet>();
if (request.getAttribute("entity") != null) {
    conferenceDatas = (HashMap<String, ConferenceDataSheet>) request.getAttribute("entity");
}
ConferenceDataSheet iData = conferenceDatas.get("I") != null ? conferenceDatas.get("I") : new ConferenceDataSheet();
ConferenceDataSheet nData = conferenceDatas.get("N") != null ? conferenceDatas.get("N") : new ConferenceDataSheet();
ConferenceDataSheet pData = conferenceDatas.get("P") != null ? conferenceDatas.get("P") : new ConferenceDataSheet();
ConferenceDataSheet cData = conferenceDatas.get("C") != null ? conferenceDatas.get("C") : new ConferenceDataSheet();
ConferenceDataSheet tData = conferenceDatas.get("TOTAL") != null ? conferenceDatas.get("TOTAL") : new ConferenceDataSheet();
%>
<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_memberLeftbar.jsp"/>
</jsp:include>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="ce.statistics.data"/></h3>
  </div>
</div>

<form class="form-horizontal" role="form" name="mainForm" id="mainForm" action="" method="post">
<input type="hidden" name="statConferenceId" value="${statistics.id}">

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="ce.statistics.data"/></div>
      <div class="panel-body">
        <div id="err_msg" class="has-error"></div>
        <div class="form-group">
          <label class="col-md-2 col-md-offset-8 control-label"><f:message key="ce.statistics.stat.year"/></label>
          <% int defaultFromYear = SzceaCst.DEFAULT_FROM_YEAR; %>
          <div class="col-md-2"><ce:yearSelect name="statYear" css="form-control s" firstYear="<%=defaultFromYear %>" selectYear="${statYear}" /></div>
        </div>
        <div class="form-group">
            <div class="col-md-9"><f:message key="ce.organization"/>: <c:out value="${customer.companyName}"/> (<f:message key="ce.organization.stamp"/>)</div>
            <div class="col-md-3">
                <f:message key="ce.organization.write.date"/>:&nbsp;
            <c:if test="${empty statistics}">
            <% 
            Calendar calendar = Calendar.getInstance();
            int currentYear = calendar.get(Calendar.YEAR);
            int currentMonth = calendar.get(Calendar.MONTH);
            int currentDay = calendar.get(Calendar.DAY_OF_MONTH);
            %>
                <%=currentYear%>&nbsp;<f:message key="ce.organization.write.date.year"/>
                <%=currentMonth%>&nbsp;<f:message key="ce.organization.write.date.month"/>
                <%=currentDay%>&nbsp;<f:message key="ce.organization.write.date.day"/>
            </c:if>
            <c:if test="${not empty statistics}">
                <%
                Statistics statistics = (Statistics) request.getAttribute("statistics");
                String updateAt = DateUtil.formatDate(statistics.getUpdatedAt());
                String[] updateYMD = updateAt.split("-");
                %>
                <%=updateYMD[0] %>&nbsp;<f:message key="ce.organization.write.date.year"/>
                <%=updateYMD[1]%>&nbsp;<f:message key="ce.organization.write.date.month"/>
                <%=updateYMD[2]%>&nbsp;<f:message key="ce.organization.write.date.day"/>
            </c:if>
            </div>
        </div>
        <div class="form-group col-md-12">
        <table class="table table-striped table-bordered table-hover">
          <colgroup>
            <col width="10%"/>
            <col width="8%"/>
            <col width="8%"/>
            <col width="8%"/>
            <col width="8%"/>
            <col width="8%"/>
            <col width="8%"/>
            <col width="8%"/>
            <col width="8%"/>
            <col width="8%"/>
            <col width="8%"/>
            <col width="10%"/>
          </colgroup>
          <tr>
            <th rowspan="2" style="vertical-align:middle"><f:message key="ce.statistics.data.category"/></th>
            <th colspan="2"><f:message key="ce.statistics.data.type.government"/></th>
            <th colspan="2"><f:message key="ce.statistics.data.type.organization"/></th>
            <th colspan="2"><f:message key="ce.statistics.data.type.business"/></th>
            <th colspan="2"><f:message key="ce.statistics.data.type.other"/></th>
            <th colspan="2"><f:message key="ce.statistics.data.subtotal"/></th>
            <th rowspan="2" style="vertical-align:middle"><f:message key="ce.statistics.data.remark"/></th>
          </tr>
          <tr>
            <th><f:message key="ce.statistics.data.addTime"/></th>
            <th><f:message key="ce.statistics.data.peopleCount"/></th>
            <th><f:message key="ce.statistics.data.addTime"/></th>
            <th><f:message key="ce.statistics.data.peopleCount"/></th>
            <th><f:message key="ce.statistics.data.addTime"/></th>
            <th><f:message key="ce.statistics.data.peopleCount"/></th>
            <th><f:message key="ce.statistics.data.addTime"/></th>
            <th><f:message key="ce.statistics.data.peopleCount"/></th>
            <th><f:message key="ce.statistics.data.addTime"/></th>
            <th><f:message key="ce.statistics.data.peopleCount"/></th>
          </tr>
          <tr>
            <th><f:message key="ce.statistics.data.level.international"/></th>
            <td class="set"><div><input type="text" name="iGT" class="form-control vs" value="<%=iData.getgTime()%>"/></div></td>
            <td class="set"><div><input type="text" name="iGV" class="form-control vs" value="<%=iData.getgVisitorCount()%>"/></div></td>
            <td class="set"><div><input type="text" name="iOT" class="form-control vs" value="<%=iData.getoTime()%>"/></div></td>
            <td class="set"><div><input type="text" name="iOV" class="form-control vs" value="<%=iData.getoVisitorCount()%>"/></div></td>
            <td class="set"><div><input type="text" name="iBT" class="form-control vs" value="<%=iData.getbTime()%>"/></div></td>
            <td class="set"><div><input type="text" name="iBV" class="form-control vs" value="<%=iData.getbVisitorCount()%>"/></div></td>
            <td class="set"><div><input type="text" name="iZT" class="form-control vs" value="<%=iData.getzTime()%>"/></div></td>
            <td class="set"><div><input type="text" name="iZV" class="form-control vs" value="<%=iData.getzVisitorCount()%>"/></div></td>
            <td class="set"><div><%=iData.getSubtotalTime()%></div></td>
            <td class="set"><div><%=iData.getSubtotalVisitorCount()%></div></td>
            <td class="set"><div><input type="text" name="iR" class="form-control s" value="<%=StringUtil.isNotEmpty(iData.getRemarks())?iData.getRemarks():""%>"/></div></td>
          </tr>
          <tr>
            <th><f:message key="ce.statistics.data.level.national"/></th>
            <td class="set"><div><input type="text" name="nGT" class="form-control vs" value="<%=nData.getgTime()%>"/></div></td>
            <td class="set"><div><input type="text" name="nGV" class="form-control vs" value="<%=nData.getgVisitorCount()%>"/></div></td>
            <td class="set"><div><input type="text" name="nOT" class="form-control vs" value="<%=nData.getoTime()%>"/></div></td>
            <td class="set"><div><input type="text" name="nOV" class="form-control vs" value="<%=nData.getoVisitorCount()%>"/></div></td>
            <td class="set"><div><input type="text" name="nBT" class="form-control vs" value="<%=nData.getbTime()%>"/></div></td>
            <td class="set"><div><input type="text" name="nBV" class="form-control vs" value="<%=nData.getbVisitorCount()%>"/></div></td>
            <td class="set"><div><input type="text" name="nZT" class="form-control vs" value="<%=nData.getzTime()%>"/></div></td>
            <td class="set"><div><input type="text" name="nZV" class="form-control vs" value="<%=nData.getzVisitorCount()%>"/></div></td>
            <td class="set"><div><%=nData.getSubtotalTime()%></div></td>
            <td class="set"><div><%=nData.getSubtotalVisitorCount()%></div></td>
            <td class="set"><div><input type="text" name="nR" class="form-control s" value="<%=StringUtil.isNotEmpty(nData.getRemarks())?nData.getRemarks():""%>"/></div></td>
          </tr>
          <tr>
            <th><f:message key="ce.statistics.data.level.provincial"/></th>
            <td class="set"><div><input type="text" name="pGT" class="form-control vs" value="<%=pData.getgTime()%>"/></div></td>
            <td class="set"><div><input type="text" name="pGV" class="form-control vs" value="<%=pData.getgVisitorCount()%>"/></div></td>
            <td class="set"><div><input type="text" name="pOT" class="form-control vs" value="<%=pData.getoTime()%>"/></div></td>
            <td class="set"><div><input type="text" name="pOV" class="form-control vs" value="<%=pData.getoVisitorCount()%>"/></div></td>
            <td class="set"><div><input type="text" name="pBT" class="form-control vs" value="<%=pData.getbTime()%>"/></div></td>
            <td class="set"><div><input type="text" name="pBV" class="form-control vs" value="<%=pData.getbVisitorCount()%>"/></div></td>
            <td class="set"><div><input type="text" name="pZT" class="form-control vs" value="<%=pData.getzTime()%>"/></div></td>
            <td class="set"><div><input type="text" name="pZV" class="form-control vs" value="<%=pData.getzVisitorCount()%>"/></div></td>
            <td class="set"><div><%=pData.getSubtotalTime()%></div></td>
            <td class="set"><div><%=pData.getSubtotalVisitorCount()%></div></td>
            <td class="set"><div><input type="text" name="pR" class="form-control s" value="<%=StringUtil.isNotEmpty(pData.getRemarks())?pData.getRemarks():""%>"/></div></td>
          </tr>
          <tr>
            <th><f:message key="ce.statistics.data.level.city"/></th>
            <td class="set"><div><input type="text" name="cGT" class="form-control vs" value="<%=cData.getgTime()%>"/></div></td>
            <td class="set"><div><input type="text" name="cGV" class="form-control vs" value="<%=cData.getgVisitorCount()%>"/></div></td>
            <td class="set"><div><input type="text" name="cOT" class="form-control vs" value="<%=cData.getoTime()%>"/></div></td>
            <td class="set"><div><input type="text" name="cOV" class="form-control vs" value="<%=cData.getoVisitorCount()%>"/></div></td>
            <td class="set"><div><input type="text" name="cBT" class="form-control vs" value="<%=cData.getbTime()%>"/></div></td>
            <td class="set"><div><input type="text" name="cBV" class="form-control vs" value="<%=cData.getbVisitorCount()%>"/></div></td>
            <td class="set"><div><input type="text" name="cZT" class="form-control vs" value="<%=cData.getzTime()%>"/></div></td>
            <td class="set"><div><input type="text" name="cZV" class="form-control vs" value="<%=cData.getzVisitorCount()%>"/></div></td>
            <td class="set"><div><%=cData.getSubtotalTime()%></div></td>
            <td class="set"><div><%=cData.getSubtotalVisitorCount()%></div></td>
            <td class="set"><div><input type="text" name="cR" class="form-control s" value="<%=StringUtil.isNotEmpty(cData.getRemarks())?cData.getRemarks():""%>"/></div></td>
          </tr>
          <tr>
            <th><f:message key="ce.statistics.data.total"/></th>
            <td class="set"><div><%=tData.getgTime()%></div></td>
            <td class="set"><div><%=tData.getgVisitorCount()%></div></td>
            <td class="set"><div><%=tData.getoTime()%></div></td>
            <td class="set"><div><%=tData.getoVisitorCount()%></div></td>
            <td class="set"><div><%=tData.getbTime()%></div></td>
            <td class="set"><div><%=tData.getbVisitorCount()%></div></td>
            <td class="set"><div><%=tData.getzTime()%></div></td>
            <td class="set"><div><%=tData.getzVisitorCount()%></div></td>
            <td class="set"><div><%=tData.getSubtotalTime()%></div></td>
            <td class="set"><div><%=tData.getSubtotalVisitorCount()%></div></td>
            <td class="set"></td>
          </tr>
        </table>
        </div>
        <div class="form-group">
            <label class="col-md-1 control-label"><span class="required">*</span><f:message key="ce.statistics.filedBy"/>:</label>
            <div class="col-md-6"><input type="text" name="filedBy" class="form-control m" value="${statistics.filedBy}"/></div>
            <label class="col-md-2 control-label"><span class="required">*</span><f:message key="ce.statistics.phoneNo"/>:</label>
            <div class="col-md-3"><input type="text" name="phoneNo" class="form-control m" value="${statistics.phoneNo}"/></div>
        </div>
        <div class="action">
          <c:choose>
          <c:when test="${empty statistics}">
          <button class="btn btn-default" type="button" onclick="javascript:doSave();"><f:message key="cm.save"/></button>&nbsp;
          </c:when>
          <c:otherwise>
          <button class="btn btn-default" type="button" onclick="javascript:doSave();"><f:message key="ce.organization.modify"/></button>&nbsp;
          <span style="font-size:0.8em; color:#ff7500"><f:message key="ce.organization.write.has"/></span>
          </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
  </div>
</div>

</form>

<%@ include file="/includes/footer.jsp"%>

<%@ include file="/statistics/validationDataSheet.jsp"%>
<script>
$(document).ready(function() {
    $('#statYear').change( function() {
      var statYear = $('#statYear option:selected').val();
      submitLink('<c:url value="/organization/statistics/conference/dataSheet"/>?statYear=' + statYear);
    });
});
function doSave() {
    if (confirm('${empty statistics}' == 'true' ? '<f:message key="ce.organization.write.affirm"/>' : '<f:message key="ce.organization.modify.affirm"/>')) {
        submitForm('<c:url value="/organization/statistics/conference/dataSheet/save"/>');
    }
}
</script>
</body>
</html>