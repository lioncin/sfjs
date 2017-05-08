<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fireball.tld" prefix="f"%>

<div class="form-group">
  <label class="col-md-2 control-label"><span class="required">*</span><f:message key="examine.approve.result"/></label>
  <div class="col-md-10">
    <label class="radio-inline"><input name="result" type="radio" value="Y" checked="checked"/><f:message key="examine.approve.result.y"/></label>
    <label class="radio-inline"><input name="result" type="radio" value="N" /><f:message key="examine.approve.result.n"/></label>
  </div>
</div>
<div class="form-group">
  <label class="col-md-2 control-label"><f:message key="examine.approve.remark"/></label>
  <div class="col-md-10">
    <textarea name="remarks" rows="5" cols="50" class="form-control" ></textarea>
  </div>
</div>