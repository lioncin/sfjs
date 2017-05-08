<%@ include file="/szcea/includes/header.jsp"%>

<div id="home-bg">
    <div class="bg">
      <img src="<c:url value="/szcea/statics/images/bg-8.jpg"/>"/>
    </div>
    
</div>
<div id="wuyan">
    <div class="bg">
      <img src="<c:url value="/szcea/statics/images/dynamic.jpg"/>"/>
    </div>
</div><!-- wu yan background -->

<div id="org">
    <div id="org-container">
        <div class="about-list">
            <div class="org-item" type="9"><f:message key="cm.conference.sponsor" /></div>
            <div class="org-item" type="14"><f:message key="cm.conference.organizer" /></div>
            <div class="cls"></div>
        </div>

        <div id="zhanlan"></div>
        <div class="more">
            <div class="t left"><f:message key="ce.website.dt.more" /></div>
            <div class="icon right"></div>
            <div class="cls"></div>
        </div>
    </div>
</div><!-- end of content -->

<%@ include file="/szcea/includes/footer.jsp"%>

<script type="text/javascript">
var LIMIT = 5;

    $(function(){
        let type = location.href.split('org/')[1];
        getOrgZhanlan(LIMIT,type);
        showType(type);

        $('.org-item').click(function(){
            var type = $(this).attr('type');
            showType(type);
            getOrgZhanlan(LIMIT,type);
        });
    });

    function showType(type){
        $('.org-item').removeClass('current');
        $('.org-item').each(function(){
            let t = $(this).attr('type');
            if(t == type){
                $(this).addClass('current');
            }
        });
    }

    function getOrgZhanlan(limit,type){
        var url = '<c:url value="/szcea/getOrg" />';
        $.ajax({
            'url':url,
            'type':'POST',
            'data':{
                type:9,
                limit:limit
            },
            success:function(data,status){
                var d = data['data']['data'];
                if (d) {
                    showOrgZhanlan2(d,type);
                }else{
                    $('#zhanlan').html('');
                }
            }
        });
    }

    function showOrgZhanlan2(data,type){
        let size = data.length;
        let _html = '<table class="org" cellpadding="0" cellspacing="0">';
        for(let i=1; i<=size; i++){
            let d = data[i-1];
            console.log(d);
            _html += '<tr>';
            if(i==1){
                if(type=='9'){
                    _html += '  <td width="10%">主办方</td>';
                }else{
                    _html += '  <td width="10%">承办方</td>';
                 }
            }else{
                _html += '  <td width="10%">&nbsp;</td>';
            }
            _html += '  <td width="10%">'+i+'</td>';
            _html += '  <td width="60%">'+d['name']+'</td>';
            _html += '  <td width="20%">'+d['tag']+'</td>';
            _html += '</tr>';
        }
        _html += '</table>';
        $('#zhanlan').html(_html);
    }

    function showOrgZhanlan(data){
  var size = data.length;
  var _html = '';
  var onerror = 'this.src="<c:url value="/szcea/statics/images/default-inis.png" />"';
  for(var i=0;i<size;i++){
    var d = data[i];

    _html += '<div id="convs">';
    _html += '  <li class="convs-i">';
    _html += '    <table class="title">';
    _html += '      <tr>';
    _html += '        <td><div class="icon"></div></td>';
    _html += '        <td><div class="text">' + d['name'] + '</div></td>';
    _html += '      </tr>';
    _html += '    </table>';
    _html += '  </li>';
    _html += '</div>';
    _html += '<div class="cls"></div>';
    if (d.attachments != null) {
      var sizeA = d.attachments.length;
      // max image 3
      if (sizeA > 3) {
        sizeA = 3;
      }
      for (var j=0; j < sizeA; j++) {
        var dA = d.attachments[j];
    _html += '<div class="convs-image">';
    _html += '<ul class="content">';
    _html += '  <li class="inis-i left">';
    _html += '    <img src="<f:download path="'+dA.path+'" />" onerror='+onerror+' />';
    _html += '    <div class="name">'+dA.description+'</div>';
    _html += '  </li>';
    _html += '</ul>';
    _html += '</div>';
      }
    }
    _html += '<div class="cls"></div>';
  }
  $('#zhanlan').html(_html);
}
</script>