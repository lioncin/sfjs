<%@ page import="java.util.HashMap"%>
<%@ page import="com.sanyet.fireball.szcea.entity.ConferenceDataSheet" %>
<%@ page import="com.sanyet.fireball.szcea.SzceaCst"%>
<%@ include file="/includes/imports.jsp"%>

<head>
<title><f:message key="ce.statistics.data"/></title>
<%@ include file="/includes/styles.jsp"%>
</head>
<body>
<%
HashMap<String,ConferenceDataSheet> conferenceDatas =(HashMap<String,ConferenceDataSheet>) request.getAttribute("entity");
ConferenceDataSheet iData = conferenceDatas.get("I") != null ? conferenceDatas.get("I") : new ConferenceDataSheet();
ConferenceDataSheet nData = conferenceDatas.get("N") != null ? conferenceDatas.get("N") : new ConferenceDataSheet();
ConferenceDataSheet pData = conferenceDatas.get("P") != null ? conferenceDatas.get("P") : new ConferenceDataSheet();
ConferenceDataSheet cData = conferenceDatas.get("C") != null ? conferenceDatas.get("C") : new ConferenceDataSheet();
ConferenceDataSheet tData = conferenceDatas.get("TOTAL") != null ? conferenceDatas.get("TOTAL") : new ConferenceDataSheet();
%>
<jsp:include page="/includes/header.jsp">
    <jsp:param name="leftMenuPath" value="/includes/_staffLeftbar.jsp"/>
</jsp:include>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="ce.statistics.data"/></h3>
  </div>
</div>

<div id="paraCheck" class="alert alert-info" style="display:none">
    <a href="javascript:closeAlert();" class="close">
    &times;
    </a>
    <f:message key="ce.check.statistics.data.get.pdf"/>
</div>

<form class="form-horizontal" role="form" name="mainForm" id="mainForm" action="" method="post">

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="ce.statistics.data"/></div>
      <div class="panel-body">
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="ce.statistics.submittedBy"/></label>
          <div class="col-md-4">
            <p class="form-control-static">
              <span id="organizationName">${organizationName}</span>&nbsp;
              <input type="hidden" id="submittedBy" name="submittedBy" value="${l_searchParam.filters['schSubmittedBy']}">
              <c:if test="${not empty l_searchParam.filters['schSubmittedBy']}">
                <a href="javascript:removeOrganization();"><span class="glyphicon glyphicon-remove"></span></a>
              </c:if>
              <c:if test="${empty l_searchParam.filters['schSubmittedBy']}">
                <a href="javascript:showOrganizationPopup();"><span class="fa fa-search"></span></a>
              </c:if>
            </p>
          </div>
          <label class="col-md-2 control-label"><f:message key="ce.statistics.stat.year"/></label>
          <% int defaultFromYear = SzceaCst.DEFAULT_FROM_YEAR; %>
          <div class="col-md-4"><ce:yearSelect name="statYear" css="form-control s" firstYear="<%=defaultFromYear%>" selectYear="${l_searchParam.filters['schStatYear']}" /></div>
        </div>
        <table class="table table-striped table-bordered table-hover">
          <colgroup>
            <col width="10%"/>
            <col width="9%"/>
            <col width="9%"/>
            <col width="9%"/>
            <col width="9%"/>
            <col width="9%"/>
            <col width="9%"/>
            <col width="9%"/>
            <col width="9%"/>
            <col width="9%"/>
            <col width="9%"/>
          </colgroup>
          <tr>
            <th rowspan="2" style="vertical-align:middle"><f:message key="ce.statistics.data.category"/></th>
            <th colspan="2"><f:message key="ce.statistics.data.type.government"/></th>
            <th colspan="2"><f:message key="ce.statistics.data.type.organization"/></th>
            <th colspan="2"><f:message key="ce.statistics.data.type.business"/></th>
            <th colspan="2"><f:message key="ce.statistics.data.type.other"/></th>
            <th colspan="2"><f:message key="ce.statistics.data.subtotal"/></th>
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
            <td class="set"><%=iData.getgTime()%></td>
            <td class="set"><%=iData.getgVisitorCount()%></td>
            <td class="set"><%=iData.getoTime()%></td>
            <td class="set"><%=iData.getoVisitorCount()%></td>
            <td class="set"><%=iData.getbTime()%></td>
            <td class="set"><%=iData.getbVisitorCount()%></td>
            <td class="set"><%=iData.getzTime()%></td>
            <td class="set"><%=iData.getzVisitorCount()%></td>
            <td class="set"><%=iData.getSubtotalTime()%></td>
            <td class="set"><%=iData.getSubtotalVisitorCount()%></td>
          </tr>
          <tr>
            <th><f:message key="ce.statistics.data.level.national"/></th>
            <td class="set"><%=nData.getgTime()%></td>
            <td class="set"><%=nData.getgVisitorCount()%></td>
            <td class="set"><%=nData.getoTime()%></td>
            <td class="set"><%=nData.getoVisitorCount()%></td>
            <td class="set"><%=nData.getbTime()%></td>
            <td class="set"><%=nData.getbVisitorCount()%></td>
            <td class="set"><%=nData.getzTime()%></td>
            <td class="set"><%=nData.getzVisitorCount()%></td>
            <td class="set"><%=nData.getSubtotalTime()%></td>
            <td class="set"><%=nData.getSubtotalVisitorCount()%></td>
          </tr>
          <tr>
            <th><f:message key="ce.statistics.data.level.provincial"/></th>
            <td class="set"><%=pData.getgTime()%></td>
            <td class="set"><%=pData.getgVisitorCount()%></td>
            <td class="set"><%=pData.getoTime()%></td>
            <td class="set"><%=pData.getoVisitorCount()%></td>
            <td class="set"><%=pData.getbTime()%></td>
            <td class="set"><%=pData.getbVisitorCount()%></td>
            <td class="set"><%=pData.getzTime()%></td>
            <td class="set"><%=pData.getzVisitorCount()%></td>
            <td class="set"><%=pData.getSubtotalTime()%></td>
            <td class="set"><%=pData.getSubtotalVisitorCount()%></td>
          </tr>
          <tr>
            <th><f:message key="ce.statistics.data.level.city"/></th>
            <td class="set"><%=cData.getgTime()%></td>
            <td class="set"><%=cData.getgVisitorCount()%></td>
            <td class="set"><%=cData.getoTime()%></td>
            <td class="set"><%=cData.getoVisitorCount()%></td>
            <td class="set"><%=cData.getbTime()%></td>
            <td class="set"><%=cData.getbVisitorCount()%></td>
            <td class="set"><%=cData.getzTime()%></td>
            <td class="set"><%=cData.getzVisitorCount()%></td>
            <td class="set"><%=cData.getSubtotalTime()%></td>
            <td class="set"><%=cData.getSubtotalVisitorCount()%></td>
          </tr>
          <tr>
            <th><f:message key="ce.statistics.data.total"/></th>
            <td class="set"><%=tData.getgTime()%></td>
            <td class="set"><%=tData.getgVisitorCount()%></td>
            <td class="set"><%=tData.getoTime()%></td>
            <td class="set"><%=tData.getoVisitorCount()%></td>
            <td class="set"><%=tData.getbTime()%></td>
            <td class="set"><%=tData.getbVisitorCount()%></td>
            <td class="set"><%=tData.getzTime()%></td>
            <td class="set"><%=tData.getzVisitorCount()%></td>
            <td class="set"><%=tData.getSubtotalTime()%></td>
            <td class="set"><%=tData.getSubtotalVisitorCount()%></td>
          </tr>
        </table>
        <button class="btn btn-default" type="button" onclick="javascript:saveAsPdf();"><f:message key="cm.saveAsPdf"/></button>
      </div>
    </div>
  </div>
</div>

</form>

<%@ include file="/includes/footer.jsp"%>

<script>
$(document).ready(function() {
  $('#statYear').change( function() {
    search();
  });
});

function search() {
  var statYear = $('#statYear option:selected').val();
  var submittedBy = $('#submittedBy').val();
  var organizationName = $('#organizationName').text();
  submitLink('<c:url value="/statistics/conference/dataSheet"/>?statYear=' + statYear + '&submittedBy=' + submittedBy + '&organizationName=' + organizationName);
}

function showOrganizationPopup() {
  var crst = '${crStatus}';
  var opts = {'url': '<c:url value="/member/search"/>', 'data': {'isBrowser': true, 'isMultiSelect': false, 'crStatus': crst, 'callback': 'updateSelectedOrganization'}, 'refresh': true};
  showPopupDialog(opts);
}

function updateSelectedOrganization(id, name) {
  if (parseInt(id) > 0) {
    $('#submittedBy').val(id);
    $('#organizationName').html(name);
    search();
  }
}

function removeOrganization() {
  $('#submittedBy').val('');
  $('#organizationName').html('');
  search();
}

function saveAsPdf() {
  var statYear = $('#statYear option:selected').val();
  var submittedBy = $('#submittedBy').val();
  if (isEmpty(statYear) || isEmpty(submittedBy)) {
    $('#paraCheck').show();
  } else {
    window.open('<c:url value="/statistics/conference/saveDataSheetAsPdf"/>?statYear=' + statYear + '&submittedBy=' + submittedBy);
  }
}

function closeAlert() {
  $('#paraCheck').hide();
}
</script>
</body>
</html>