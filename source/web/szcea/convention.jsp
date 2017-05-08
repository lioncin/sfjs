<%@ include file="/szcea/includes/header.jsp"%>

<div id="home-bg">
    <div class="bg">
      <img src="<c:url value="/szcea/statics/images/bg-9.jpg"/>"/>
    </div>
    
</div>
<div id="wuyan">
    <div class="bg">
      <img src="<c:url value="/szcea/statics/images/dynamic.jpg"/>"/>
    </div>
</div><!-- wu yan background -->

<div id="convention">
    <div id="convention-container">
        <div class="about-list">
            <div class="convention-item" data-type="16"><f:message key="ce.website.content.blzx" /></div>
            <div class="convention-item" data-type="17"><f:message key="ce.website.content.hzzx" /></div>
            <div class="convention-item" data-type="18"><f:message key="ce.website.content.zlzx" /></div>
            <div class="convention-item" data-type="19"><f:message key="ce.website.content.hyzx" /></div>
            <div class="convention-item" data-type="14"><f:message key="ce.website.content.hyjd" /></div>
            <div class="cls"></div>
        </div>

        <div id="changguan"></div>
    </div>
</div><!-- end of content -->

<%@ include file="/szcea/includes/footer.jsp"%>
<script type="text/javascript">
var LIMIT = 10;
    $(function(){
        var type = location.href.split('convention/')[1];
        getChangguan(LIMIT,type);

        showCurrent(type);

        $('.convention-item').click(function(){
            let type = $(this).attr('data-type');
            getChangguan(LIMIT, type);
            showCurrent(type);
        });
    });

    function showCurrent(type){
        $('.convention-item').removeClass('current');
        $('.convention-item').each(function(){
            var t = $(this).attr('data-type');
            if(t ==type){
                $(this).addClass('current');
                return false;
            }
        });
    }

    function getChangguan(limit,type){
      var url = '<c:url value="/szcea/getConvention" />';
      $.ajax({
        'url':url,
        'type':'POST',
        'data':{
          type:type,
          limit:limit
        },
        success:function(data,status){
          var d = data['data']['data'];
          if (d) {
            showChangguan(d);
          }
        }
      });
    }

    function showChangguan(data){
      ids = [];
      var size = data.length;
      var _html = '';
      var onerror = 'this.src="<c:url value="/szcea/statics/images/default-inis.png" />"';
      for(var i=0;i<size;i++){
        var d = data[i];
        ids.push(d.id);
        
        _html += '<div id="convs">';
        _html += '  <li class="convs-i">';
        _html += '    <table class="title">';
        _html += '      <tr>';
        _html += '        <td><div class="icon"></div></td>';
        _html += '        <td><div class="text"><a href="javascript:void(0)" onclick="content(' +d.id+ ')" style="color:#000000">' + d['name'] + '</a></div></td>';
        _html += '      </tr>';
        _html += '    </table>';
        _html += '  </li>';
        _html += '</div>';
        _html += '<div class="cls"></div>';
        if (d.attachments != null) {
          var sizeA = d.attachments.length;
          // max image 1
          if (sizeA > 1) {
            sizeA = 1;
          }
          for (var j=0; j < sizeA; j++) {
            var dA = d.attachments[j];
        _html += '<div class="convs-image">';
        _html += '<ul class="content">';
        // change style
        _html += '  <li class="inis-i" style="margin:0 auto;">';
    //     _html += '  <a href="<c:url value="/szcea/content/" />'+d.id+'">';
        _html += '  <a href="javascript:void(0)" onclick="content(' +d.id+ ')" >';
        _html += '    <img src="<f:download path="'+dA.path+'" />" onerror='+onerror+' />';
        //_html += '    <div class="name">'+dA.description+'</div>';
        _html += '  </a>';
        _html += '  </li>';
        _html += '</ul>';
        _html += '</div>';
          }
        }
        _html += '<div class="cls"></div>';
      }
      $('#changguan').html(_html);
    }
</script>