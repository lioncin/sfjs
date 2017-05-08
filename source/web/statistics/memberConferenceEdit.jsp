<%@ include file="/includes/imports.jsp"%>

<%@ page import="com.sanyet.fireball.szcea.SzceaCst"%>

<head>
<title><c:choose><c:when test="${statistics.id > 0}"><f:message key="ce.statistics.conference.modify"/></c:when><c:otherwise><f:message key="ce.statistics.conference.create"/></c:otherwise></c:choose></title>
<%@ include file="/includes/styles.jsp"%>
</head>
<body>

<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_memberLeftbar.jsp"/>
</jsp:include>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="ce.statistics.conference.info"/></h3>
  </div>
</div>

<div id="createSuccess" class="alert alert-warning <c:if test="${empty existCheck || !existCheck}"><c:out value="hidden"/></c:if>">
    <a href="#" class="close" data-dismiss="alert">
    &times;
    </a>
    <f:message key="ce.create.warning.exist"/>
</div>

<div id="createSuccess" class="alert alert-success <c:if test="${empty createSuccess || !createSuccess}"><c:out value="hidden"/></c:if>">
    <a href="#" class="close" data-dismiss="alert">
    &times;
    </a>
    <f:message key="ce.create.success"/>
</div>

<form class="form-horizontal" role="form" name="mainForm" id="mainForm" action="" method="post">
<input type="hidden" name="id" value="${statistics.id}">

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="ce.statistics.head"/></div>
      <div class="panel-body">
        <div class="form-group">
          <label class="col-md-2 control-label"><f:message key="ce.statistics.stat.year"/>:</label>
          <c:choose>
          <c:when test="${statistics.id > 0}">
          <p class="form-control-static"><c:out value="${statistics.statYear}"/></p>
          </c:when>
          <c:otherwise>
          <% int defaultFromYear = SzceaCst.DEFAULT_FROM_YEAR; %>
          <div class="col-md-10"><ce:yearSelect name="statYear" css="form-control s" firstYear="<%=defaultFromYear %>" selectYear="${statYear}" /></div>
          </c:otherwise>
          </c:choose>
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label"><span class="required">*</span><f:message key="ce.statistics.filedBy"/>:</label>
            <div class="col-md-10"><input type="text" name="filedBy" class="form-control m" value="${statistics.filedBy}"/></div>
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label"><span class="required">*</span><f:message key="ce.statistics.phoneNo"/>:</label>
            <div class="col-md-10"><input type="text" name="phoneNo" class="form-control m" value="${statistics.phoneNo}"/></div>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading"><f:message key="ce.statistics.conference.info"/></div>
      <div class="panel-body">
        <div class="dataTable_wrapper">
          <table class="table table-striped table-bordered table-hover" id="conferenceTbl">
            <colgroup>
              <col width="5%"/>
              <col width="25%"/>
              <col width="25%"/>
              <col width="10%"/>
              <col width="5%"/>
              <col width="10%"/>
              <col width="10%"/>
              <col width="10%"/>
            </colgroup>
            <tr>
              <th><f:message key="cm.sn"/></th>
              <th><f:message key="ce.statistics.conferenceName"/></th>
              <th><f:message key="ce.statistics.sponsor"/></th>
              <th><f:message key="ce.statistics.conveningTime"/></th>
              <th><f:message key="ce.statistics.addTime"/></th>
              <th><f:message key="ce.statistics.visitorCount"/></th>
              <th><f:message key="ce.statistics.confType"/></th>
              <th><f:message key="cm.action"/></th>
            </tr>
            <c:if test="${not empty statDetails}">
            <c:forEach var="row" items="${statDetails}" varStatus="status">
            <tr>
              <td class="set"><label class="snLbl-conferenceTbl">${status.index + 1}</label></td>
              <td class="txt"><input type="hidden" class="form-control m" name="activityName" maxlength="10" value="<c:out value="${row.activityName}"/>"/><span><c:out value="${row.activityName}"/></span></td>
              <td class="txt"><input type="hidden" class="form-control s" name="sponsor" maxlength="5" value="<c:out value="${row.sponsor}"/>"/><span><c:out value="${row.sponsor}"/></span></td>
              <td class="txt"><input type="hidden" class="form-control s" name="holdFrom" maxlength="5" value="<c:out value="${row.holdFrom}"/>"/><span><f:date value="${row.holdFrom}"/></span></td>
              <td class="txt"><input type="hidden" class="form-control s" name="countTime" maxlength="5" value="<c:out value="${row.countTime}"/>"/><span><c:out value="${row.countTime}"/></span></td>
              <td class="txt"><input type="hidden" class="form-control s" name="visitorCount" maxlength="5" value="<c:out value="${row.visitorCount}"/>"/><span><c:out value="${row.visitorCount}"/></span></td>
              <td class="txt"><input type="hidden" class="form-control s" name="confType" maxlength="5" value="<c:out value="${row.confType}"/>"/><span><f:masterCode code="conference.type.${row.confType}"/></span></td>
              <td class="set">
              <a href="javascript:void(0);" onclick="javascript:editTableRow(this);" title="<f:message key="cm.edit"/>"><span class="glyphicon glyphicon-edit"></span></a>&nbsp;
              <a href="javascript:void(0);" onclick="javascript:deleteTableRow(this);" title="<f:message key="cm.delete"/>"><span class="glyphicon glyphicon-remove"></span></a>
              </td>
            </tr>
            </c:forEach>
            </c:if>
          </table>
        </div>
        <br /><br />
        <div id="activityDetails">
          <div class="form-group">
            <label class="col-md-2 control-label"><span class="required">*</span><f:message key="ce.statistics.conferenceName"/></label>
            <div class="col-md-10">
              <input type="text" id="activityNameAdd" name="activityNameAdd" class="form-control l" value="${entity.activityName}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-2 control-label"><span class="required">*</span><f:message key="ce.statistics.sponsor"/></label>
            <div class="col-md-10">
              <input type="text" id="sponsorAdd" name="sponsorAdd" class="form-control l" value="${entity.sponsor}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-2 control-label"><span class="required">*</span><f:message key="ce.statistics.conveningTime"/></label>
            <div class="col-md-10">
              <input type="text" id="holdFromAdd" name="holdFromAdd" class="form-control cal" value="${entity.holdFrom}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-2 control-label"><f:message key="ce.statistics.addTime"/></label>
            <div class="col-md-10">
              <input type="text" id="countTimeAdd" name="countTimeAdd" class="form-control s" value="${entity.countTime}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-2 control-label"><f:message key="ce.statistics.visitorCount"/></label>
            <div class="col-md-10">
              <input type="text" id="visitorCountAdd" name="visitorCountAdd" class="form-control s" value="${entity.visitorCount}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-2 control-label"><f:message key="ce.statistics.confType"/></label>
            <div class="col-md-10">
              <f:masterCode name="confTypeAdd" css="form-control m" category="conference.type" code="${entity.confType}"  />
            </div>
          </div>
          <div class="action">
            <input type="hidden" id="modRowId">
            <input type="hidden" id="modConfType">
            <button id="editButton" class="btn btn-default" type="button" onclick="javascript:editDone();" style="display:none"><f:message key="cm.ok"/></button>&nbsp;
            <button id="addButton" class="btn btn-default" type="button" onclick="javascript:addConference();"><f:message key="ce.add.conference"/></button>&nbsp;
          </div>
        </div>
      </div>
    </div>
    <div class="action">
      <button class="btn btn-default" type="button" onclick="javascript:doSave();"><f:message key="cm.save"/></button>&nbsp;
    </div>
  </div>
</div>

</form>

<%@ include file="/includes/footer.jsp"%>

<%@ include file="/includes/validation.jsp"%>
<script src="<c:url value="/statics/scripts/dynamic-table.js"/>"></script>
<script>
$(document).ready(function() {
  $('input.cal').datepicker({dateFormat: 'yy-mm-dd', changeYear: true}, $.datepicker.regional['zh-CN']);

  <c:if test="${not empty validator.errors}">
      if ($("input[name='activityName']").length <= 0) {
          $('#conferenceTbl').parent('div:first').addClass('has-error');
          $('#conferenceTbl').after('<span class="help-block fld-err"><f:message key="cr.offer.check.required"/></span>');
      }
  </c:if>
});

function doSave() {
  submitForm('<c:url value="/organization/statistics/conference/save"/>');
}

function editTableRow(elem) {
  var tr = $(elem).parents('tr:first');
  $('#activityNameAdd').val($(tr).find("input[name='activityName']").val());
  $('#sponsorAdd').val($(tr).find("input[name='sponsor']").val());
  $('#holdFromAdd').val($(tr).find("input[name='holdFrom']").val());
  $('#countTimeAdd').val($(tr).find("input[name='countTime']").val());
  $('#visitorCountAdd').val($(tr).find("input[name='visitorCount']").val());
  $('#confTypeAdd').val($(tr).find("input[name='confType']").val());
  
  $('#modRowId').val($('#conferenceTbl tr').index(tr));
  $('#modConfType').val($(tr).find("input[name='confType']").next('span').text());
  $('#addButton').hide();
  $('#editButton').show();
}

function editDone() {
  var check_flg = check();
  if (check_flg) {
      return;
  }
  var trId = $("#modRowId").val();
  var tr = $('#conferenceTbl tr').eq(trId);
  $(tr).find("input[name='activityName']").val($('#activityNameAdd').val());
  $(tr).find("input[name='sponsor']").val($('#sponsorAdd').val());
  $(tr).find("input[name='holdFrom']").val($('#holdFromAdd').val());
  $(tr).find("input[name='countTime']").val($('#countTimeAdd').val());
  $(tr).find("input[name='visitorCount']").val($('#visitorCountAdd').val());
  $(tr).find("input[name='confType']").val($('#confTypeAdd').val());

  $(tr).find("input[name='activityName']").next('span').text($('#activityNameAdd').val());
  $(tr).find("input[name='sponsor']").next('span').text($('#sponsorAdd').val());
  $(tr).find("input[name='holdFrom']").next('span').text($('#holdFromAdd').val());
  $(tr).find("input[name='countTime']").next('span').text($('#countTimeAdd').val());
  $(tr).find("input[name='visitorCount']").next('span').text($('#visitorCountAdd').val());
  $(tr).find("input[name='confType']").next('span').text($("#confTypeAdd").find("option:selected").text());

  $('#editButton').hide();
  $('#addButton').show();
  clear();
}

function check() {
  var zs = /^[0-9]*$/;
  var date = /^(\d{4})-(0\d{1}|1[0-2])-(0\d{1}|[12]\d{1}|3[01])$/;
  var activityNameAdd = $('#activityNameAdd').val();
  var sponsorAdd = $('#sponsorAdd').val();
  var holdFromAdd = $('#holdFromAdd').val();
  var countTimeAdd = $('#countTimeAdd').val();
  var visitorCountAdd = $('#visitorCountAdd').val();
  var confTypeAdd = $('#confTypeAdd').val();
  var check_flg = false;
  $('#activityDetails .has-error .fld-err').empty();
  $('#activityDetails .has-error').removeClass('has-error');
  if (isEmpty(activityNameAdd)) {
    $('#activityNameAdd').parent().addClass('has-error');
    $('#activityNameAdd').parent().append('<span class="help-block fld-err"><f:message key="cr.offer.check.required"/></span>');
    check_flg = true;
  }
  if (isEmpty(sponsorAdd)) {
    $('#sponsorAdd').parent().addClass('has-error');
    $('#sponsorAdd').parent().append('<span class="help-block fld-err"><f:message key="cr.offer.check.required"/></span>');
    check_flg = true;
  }
  if (!date.test(holdFromAdd)) {
    $('#holdFromAdd').parent().addClass('has-error');
    $('#holdFromAdd').parent().append('<span class="help-block fld-err"><f:message key="cm.val.date"/></span>');
    check_flg = true;
  }
  if (!zs.test(countTimeAdd)) {
    $('#countTimeAdd').parent().addClass('has-error');
    $('#countTimeAdd').parent().append('<span class="help-block fld-err"><f:message key="cr.offer.check.number"/></span>');
    check_flg = true;
  }
  if (!zs.test(visitorCountAdd)) {
    $('#visitorCountAdd').parent().addClass('has-error');
    $('#visitorCountAdd').parent().append('<span class="help-block fld-err"><f:message key="cr.offer.check.number"/></span>');
    check_flg = true;
  }
  return check_flg;
}

function addConference() {
    var check_flg = check();
    if (check_flg) {
        return;
    }

    var activityNameAdd = $('#activityNameAdd').val();
    var sponsorAdd = $('#sponsorAdd').val();
    var holdFromAdd = $('#holdFromAdd').val();
    var countTimeAdd = $('#countTimeAdd').val();
    var visitorCountAdd = $('#visitorCountAdd').val();
    var confTypeAdd = $('#confTypeAdd').val();
  
    var tds = [];
    var td = {};
    var fields = [];
    var field = {};
    td.type = 'sn';
    td.css = 'set';
    tds[0] = td;

    td = {};
    td.type = 'meta';
    td.css = 'txt';
    td.text = '<span>' + activityNameAdd + '</span>';
    fields = [];
    field = {};
    field.name = 'activityName';
    field.value = activityNameAdd;
    fields[0] = field;
    td.fields = fields;
    tds[1] = td;

    td = {};
    td.type = 'meta';
    td.css = 'txt';
    td.text = '<span>' + sponsorAdd + '</span>';
    fields = [];
    field = {};
    field.name = 'sponsor';
    field.value = sponsorAdd;
    fields[0] = field;
    td.fields = fields;
    tds[2] = td;
    
    td = {};
    td.type = 'meta';
    td.css = 'txt';
    td.text = '<span>' + holdFromAdd + '</span>';
    fields = [];
    field = {};
    field.name = 'holdFrom';
    field.value = holdFromAdd;
    fields[0] = field;
    td.fields = fields;
    tds[3] = td;
    
    td = {};
    td.type = 'meta';
    td.css = 'txt';
    td.text = '<span>' + countTimeAdd + '</span>';
    fields = [];
    field = {};
    field.name = 'countTime';
    field.value = countTimeAdd;
    fields[0] = field;
    td.fields = fields;
    tds[4] = td;
    
    td = {};
    td.type = 'meta';
    td.css = 'txt';
    td.text = '<span>' + visitorCountAdd + '</span>';
    fields = [];
    field = {};
    field.name = 'visitorCount';
    field.value = visitorCountAdd;
    fields[0] = field;
    td.fields = fields;
    tds[5] = td;
    
    td = {};
    td.type = 'meta';
    td.css = 'txt';
    td.text = '<span>' + $("#confTypeAdd").find("option:selected").text() + '</span>';
    fields = [];
    field = {};
    field.name = 'confType';
    field.value = confTypeAdd;
    fields[0] = field;
    td.fields = fields;
    tds[6] = td;

    td = {};
    td.type = 'act';
    td.css = 'set';
    td.text = '<a href="javascript:void(0);" onclick="javascript:editTableRow(this);" title="<f:message key="cm.edit"/>"><span class="glyphicon glyphicon-edit"></span></a>&nbsp;';
    td.text += '<a href="javascript:void(0);" onclick="javascript:deleteTableRow(this);" title="<f:message key="cm.delete"/>"><span class="glyphicon glyphicon-remove"></span></a>'
    tds[7] = td;
    
    addTableRow('conferenceTbl', tds, -1);

    $('#conferenceTbl').parent('div:first').removeClass('has-error');
    $('#conferenceTbl').next('.fld-err').empty();
    refreshRowNo('conferenceTbl');
    clear();
}

function clear(){
  //reset adding fields
  $('#activityNameAdd').val('');
  $('#sponsorAdd').val('');
  $('#holdFromAdd').val('');
  $('#countTimeAdd').val('');
  $('#visitorCountAdd').val('');
}
</script>
</body>
</html>