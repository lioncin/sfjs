<%@ include file="/includes/imports.jsp"%>

<%@ page import="com.sanyet.fireball.szcea.SzceaCst"%>

<head>
<title><c:choose><c:when test="${statistics.id > 0}"><f:message key="ce.statistics.exhibition.modify"/></c:when><c:otherwise><f:message key="ce.statistics.exhibition.create"/></c:otherwise></c:choose></title>
<%@ include file="/includes/styles.jsp"%>
</head>
<body>

<jsp:include page="/includes/header.jsp">
  <jsp:param name="leftMenuPath" value="/includes/_memberLeftbar.jsp"/>
</jsp:include>

<div class="row">
  <div class="col-md-12">
    <h3 class="page-header"><f:message key="ce.statistics.exhibition.info"/></h3>
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
      <div class="panel-heading"><f:message key="ce.statistics.exhibition.info"/></div>
      <div class="panel-body">
        <div class="dataTable_wrapper">
          <table class="table table-striped table-bordered table-hover" id="exhibitionTbl">
            <colgroup>
              <col width="4%"/>
              <col width="12%"/>
              <col width="12%"/>
              <col width="8%"/>
              <col width="12%"/>
              <col width="12%"/>
              <col width="9%"/>
              <col width="8%"/>
              <col width="7%"/>
              <col width="8%"/>
              <col width="8%"/>
            </colgroup>
            <tr>
              <th><f:message key="cm.sn"/></th>
              <th><f:message key="ce.statistics.exhibitionName"/></th>
              <th><f:message key="ce.statistics.location"/></th>
              <th><f:message key="ce.statistics.holdingTime"/></th>
              <th><f:message key="ce.statistics.sponsor"/></th>
              <th><f:message key="ce.statistics.organizer"/></th>
              <th><f:message key="ce.statistics.countTime"/><br />(<f:message key="ce.unit.individual"/>)</th>
              <th><f:message key="ce.statistics.area"/><br />(<f:message key="ce.unit.squareMeter"/>)</th>
              <th><f:message key="ce.statistics.visitorCount"/></th>
              <th><f:message key="ce.statistics.addConference"/><br />(<f:message key="ce.unit.field"/>)</th>
              <th><f:message key="cm.action"/></th>
            </tr>
            <c:if test="${not empty statDetails}">
            <c:forEach var="row" items="${statDetails}" varStatus="status">
            <tr>
              <td class="set"><label class="snLbl-exhibitionTbl">${status.index + 1}</label></td>
              <td class="txt"><input type="hidden" class="form-control m" name="activityName" maxlength="10" value="<c:out value="${row.activityName}"/>"/><span><c:out value="${row.activityName}"/></span></td>
              <td class="txt"><input type="hidden" class="form-control s" name="location" maxlength="5" value="<c:out value="${row.location}"/>"/><span><c:out value="${row.location}"/></span></td>
              <td class="txt"><input type="hidden" class="form-control s" name="holdFrom" maxlength="5" value="<c:out value="${row.holdFrom}"/>"/><span><f:date value="${row.holdFrom}"/></span></td>
              <td class="txt"><input type="hidden" class="form-control s" name="sponsor" maxlength="5" value="<c:out value="${row.sponsor}"/>"/><span><c:out value="${row.sponsor}"/></span></td>
              <td class="txt"><input type="hidden" class="form-control s" name="organizer" maxlength="5" value="<c:out value="${row.organizer}"/>"/><span><c:out value="${row.organizer}"/></span></td>
              <td class="txt"><input type="hidden" class="form-control s" name="countTime" maxlength="5" value="<c:out value="${row.countTime}"/>"/><span><c:out value="${row.countTime}"/></span></td>
              <td class="txt"><input type="hidden" class="form-control s" name="area" maxlength="5" value="<c:out value="${row.area}"/>"/><span><c:out value="${row.area}"/></span></td>
              <td class="txt"><input type="hidden" class="form-control s" name="visitorCount" maxlength="5" value="<c:out value="${row.visitorCount}"/>"/><span><c:out value="${row.visitorCount}"/></span></td>
              <td class="txt"><input type="hidden" class="form-control s" name="addConference" maxlength="5" value="<c:out value="${row.addConference}"/>"/><span><c:out value="${row.addConference}"/></span></td>
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
            <label class="col-md-2 control-label"><span class="required">*</span><f:message key="ce.statistics.exhibitionName"/>:</label>
            <div class="col-md-10">
              <input type="text" id="activityNameAdd" name="activityNameAdd" class="form-control l" value="${entity.activityName}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-2 control-label"><span class="required">*</span><f:message key="ce.statistics.location"/>:</label>
            <div class="col-md-10">
              <input type="text" id="locationAdd" name="locationAdd" class="form-control l" value="${entity.location}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-2 control-label"><span class="required">*</span><f:message key="ce.statistics.holdFrom"/>:</label>
            <div class="col-md-10">
              <input type="text" id="holdFromAdd" name="holdFromAdd" class="form-control cal" value="<f:date value="${entity.holdFrom}"/>"/>
            </div>
          </div>
          <%-- <div class="form-group">
            <label class="col-md-2 control-label"><f:message key="ce.statistics.holdTo"/>:</label>
            <div class="col-md-10">
              <input type="text" name="holdTo" class="form-control cal" value="<f:date value="${entity.holdTo}"/>"/>
            </div>
          </div> --%>
          <div class="form-group">
            <label class="col-md-2 control-label"><span class="required">*</span><f:message key="ce.statistics.sponsor"/>:</label>
            <div class="col-md-10">
              <input type="text" id="sponsorAdd" name="sponsorAdd" class="form-control l" value="${entity.sponsor}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-2 control-label"><span class="required">*</span><f:message key="ce.statistics.organizer"/>:</label>
            <div class="col-md-10">
              <input type="text" id="organizerAdd" name="organizerAdd" class="form-control l" value="${entity.organizer}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-2 control-label"><f:message key="ce.statistics.countTime"/>(<f:message key="ce.unit.individual"/>):</label>
            <div class="col-md-10">
              <input type="text" id="countTimeAdd" name="countTimeAdd" class="form-control s" value="${entity.countTime}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-2 control-label"><f:message key="ce.statistics.area"/>(<f:message key="ce.unit.squareMeter"/>):</label>
            <div class="col-md-10">
              <input type="text" id="areaAdd" name="areaAdd" class="form-control s" value="${entity.area}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-2 control-label"><f:message key="ce.statistics.professionalAudience"/>:</label>
            <div class="col-md-10">
              <input type="text" id="visitorCountAdd" name="visitorCountAdd" class="form-control s" value="${entity.visitorCount}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-2 control-label"><f:message key="ce.statistics.addConference"/>(<f:message key="ce.unit.field"/>):</label>
            <div class="col-md-10">
              <input type="text" id="addConferenceAdd" name="addConferenceAdd" class="form-control s" value="${entity.addConference}"/>
            </div>
          </div>
          <div class="action">
            <input type="hidden" id="modRowId">
            <button id="editButton" class="btn btn-default" type="button" onclick="javascript:editDone();" style="display:none"><f:message key="cm.ok"/></button>&nbsp;
            <button id="addButton" class="btn btn-default" type="button" onclick="javascript:addExhibition();"><f:message key="ce.add.exhibition"/></button>&nbsp;
          </div>
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
      $('#exhibitionTbl').parent('div:first').addClass('has-error');
      $('#exhibitionTbl').after('<span class="help-block fld-err"><f:message key="cr.offer.check.required"/></span>');
  }
  </c:if>
});

function doSave() {
  submitForm('<c:url value="/organization/statistics/exhibition/save"/>');
}

function editTableRow(elem) {
  var tr = $(elem).parents('tr:first');
  $('#activityNameAdd').val($(tr).find("input[name='activityName']").val());
  $('#locationAdd').val($(tr).find("input[name='location']").val());
  $('#holdFromAdd').val($(tr).find("input[name='holdFrom']").val());
  $('#sponsorAdd').val($(tr).find("input[name='sponsor']").val());
  $('#organizerAdd').val($(tr).find("input[name='organizer']").val());
  $('#countTimeAdd').val($(tr).find("input[name='countTime']").val());
  $('#areaAdd').val($(tr).find("input[name='area']").val());
  $('#visitorCountAdd').val($(tr).find("input[name='visitorCount']").val());
  $('#addConferenceAdd').val($(tr).find("input[name='addConference']").val());
  
  $('#modRowId').val($('#exhibitionTbl tr').index(tr));
  $('#addButton').hide();
  $('#editButton').show();
}

function editDone() {
  var check_flg = check();
  if (check_flg) {
      return;
  }
  var trId = $("#modRowId").val();
  var tr = $('#exhibitionTbl tr').eq(trId);
  $(tr).find("input[name='activityName']").val($('#activityNameAdd').val());
  $(tr).find("input[name='location']").val($('#locationAdd').val());
  $(tr).find("input[name='holdFrom']").val($('#holdFromAdd').val());
  $(tr).find("input[name='sponsor']").val($('#sponsorAdd').val());
  $(tr).find("input[name='organizer']").val($('#organizerAdd').val());
  $(tr).find("input[name='countTime']").val($('#countTimeAdd').val());
  $(tr).find("input[name='area']").val($('#areaAdd').val());
  $(tr).find("input[name='visitorCount']").val($('#visitorCountAdd').val());
  $(tr).find("input[name='addConference']").val($('#addConferenceAdd').val());

  $(tr).find("input[name='activityName']").next('span').text($('#activityNameAdd').val());
  $(tr).find("input[name='location']").next('span').text($('#locationAdd').val());
  $(tr).find("input[name='holdFrom']").next('span').text($('#holdFromAdd').val());
  $(tr).find("input[name='sponsor']").next('span').text($('#sponsorAdd').val());
  $(tr).find("input[name='organizer']").next('span').text($('#organizerAdd').val());
  $(tr).find("input[name='countTime']").next('span').text($('#countTimeAdd').val());
  $(tr).find("input[name='area']").next('span').text($('#areaAdd').val());
  $(tr).find("input[name='visitorCount']").next('span').text($('#visitorCountAdd').val());
  $(tr).find("input[name='addConference']").next('span').text($('#addConferenceAdd').val());

  $('#editButton').hide();
  $('#addButton').show();
  clear();
}

function check() {
  var zs = /^[0-9]*$/;
  var date = /^(\d{4})-(0\d{1}|1[0-2])-(0\d{1}|[12]\d{1}|3[01])$/;
  var activityNameAdd = $('#activityNameAdd').val();
  var locationAdd = $('#locationAdd').val();
  var holdFromAdd = $('#holdFromAdd').val();
  var sponsorAdd = $('#sponsorAdd').val();
  var organizerAdd = $('#organizerAdd').val();
  var countTimeAdd = $('#countTimeAdd').val();
  var areaAdd = $('#areaAdd').val();
  var visitorCountAdd = $('#visitorCountAdd').val();
  var addConferenceAdd = $('#addConferenceAdd').val();
  var check_flg = false;
  $('#activityDetails .has-error .fld-err').empty();
  $('#activityDetails .has-error').removeClass('has-error');
  if (isEmpty(activityNameAdd)) {
    $('#activityNameAdd').parent().addClass('has-error');
    $('#activityNameAdd').parent().append('<span class="help-block fld-err"><f:message key="cr.offer.check.required"/></span>');
    check_flg = true;
  }
  if (isEmpty(locationAdd)) {
    $('#locationAdd').parent().addClass('has-error');
    $('#locationAdd').parent().append('<span class="help-block fld-err"><f:message key="cr.offer.check.required"/></span>');
    check_flg = true;
  }
  if (!date.test(holdFromAdd)) {
    $('#holdFromAdd').parent().addClass('has-error');
    $('#holdFromAdd').parent().append('<span class="help-block fld-err"><f:message key="cm.val.date"/></span>');
    check_flg = true;
  }
  if (isEmpty(sponsorAdd)) {
    $('#sponsorAdd').parent().addClass('has-error');
    $('#sponsorAdd').parent().append('<span class="help-block fld-err"><f:message key="cr.offer.check.required"/></span>');
    check_flg = true;
  }
  if (isEmpty(organizerAdd)) {
    $('#organizerAdd').parent().addClass('has-error');
    $('#organizerAdd').parent().append('<span class="help-block fld-err"><f:message key="cr.offer.check.required"/></span>');
    check_flg = true;
  }
  if (!zs.test(countTimeAdd)) {
    $('#countTimeAdd').parent().addClass('has-error');
    $('#countTimeAdd').parent().append('<span class="help-block fld-err"><f:message key="cr.offer.check.number"/></span>');
    check_flg = true;
  }
  if (isNaN(areaAdd)) {
    $('#areaAdd').parent().addClass('has-error');
    $('#areaAdd').parent().append('<span class="help-block fld-err"><f:message key="cr.offer.check.number"/></span>');
    check_flg = true;
  }
  if (!zs.test(visitorCountAdd)) {
    $('#visitorCountAdd').parent().addClass('has-error');
    $('#visitorCountAdd').parent().append('<span class="help-block fld-err"><f:message key="cr.offer.check.number"/></span>');
    check_flg = true;
  }
  if (!zs.test(addConferenceAdd)) {
    $('#addConferenceAdd').parent().addClass('has-error');
    $('#addConferenceAdd').parent().append('<span class="help-block fld-err"><f:message key="cr.offer.check.number"/></span>');
    check_flg = true;
  }
  return check_flg;
}

function addExhibition() {
    var check_flg = check();
    if (check_flg) {
        return;
    }

    var activityNameAdd = $('#activityNameAdd').val();
    var locationAdd = $('#locationAdd').val();
    var holdFromAdd = $('#holdFromAdd').val();
    var sponsorAdd = $('#sponsorAdd').val();
    var organizerAdd =  $('#organizerAdd').val();
    var countTimeAdd =  $('#countTimeAdd').val();
    var areaAdd =  $('#areaAdd').val();
    var visitorCountAdd = $('#visitorCountAdd').val();
    var addConferenceAdd = $('#addConferenceAdd').val();
    
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
    td.text = '<span>' + locationAdd + '</span>';
    fields = [];
    field = {};
    field.name = 'location';
    field.value = locationAdd;
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
    td.text = '<span>' + sponsorAdd + '</span>';
    fields = [];
    field = {};
    field.name = 'sponsor';
    field.value = sponsorAdd;
    fields[0] = field;
    td.fields = fields;
    tds[4] = td;
    
    td = {};
    td.type = 'meta';
    td.css = 'txt';
    td.text = '<span>' + organizerAdd + '</span>';
    fields = [];
    field = {};
    field.name = 'organizer';
    field.value = organizerAdd;
    fields[0] = field;
    td.fields = fields;
    tds[5] = td;
    
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
    tds[6] = td;
    
    td = {};
    td.type = 'meta';
    td.css = 'txt';
    td.text = '<span>' + areaAdd + '</span>';
    fields = [];
    field = {};
    field.name = 'area';
    field.value = areaAdd;
    fields[0] = field;
    td.fields = fields;
    tds[7] = td;
    
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
    tds[8] = td;
    
    td = {};
    td.type = 'meta';
    td.css = 'txt';
    td.text = '<span>' + addConferenceAdd + '</span>';
    fields = [];
    field = {};
    field.name = 'addConference';
    field.value = addConferenceAdd;
    fields[0] = field;
    td.fields = fields;
    tds[9] = td;

    td = {};
    td.type = 'act';
    td.css = 'set';
    td.text = '<a href="javascript:void(0);" onclick="javascript:editTableRow(this);" title="<f:message key="cm.edit"/>"><span class="glyphicon glyphicon-edit"></span></a>&nbsp;';
    td.text += '<a href="javascript:void(0);" onclick="javascript:deleteTableRow(this);" title="<f:message key="cm.delete"/>"><span class="glyphicon glyphicon-remove"></span></a>'
    tds[10] = td;
    
    addTableRow('exhibitionTbl', tds, -1);

    $('#exhibitionTbl').parent('div:first').removeClass('has-error');
    $('#exhibitionTbl').next('.fld-err').empty();
    refreshRowNo('exhibitionTbl');
    clear();
}

function clear(){
  //reset adding fields
  $('#activityNameAdd').val('');
  $('#locationAdd').val('');
  $('#holdFromAdd').val('');
  $('#sponsorAdd').val('');
  $('#organizerAdd').val('');
  $('#countTimeAdd').val('');
  $('#areaAdd').val('');
  $('#visitorCountAdd').val('');
  $('#addConferenceAdd').val('');
}
</script>
</body>
</html>