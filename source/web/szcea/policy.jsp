<%@ include file="/szcea/includes/header.jsp"%>

<div id="home-bg">
    <div class="bg">
      <img src="<c:url value="/szcea/statics/images/bg-1.jpg"/>"/>
    </div>
    
</div>
<div id="wuyan">
    <div class="bg">
      <img src="<c:url value="/szcea/statics/images/dynamic.jpg"/>"/>
    </div>
</div><!-- wu yan background -->

<div id="policy">
    <div id="policy-container">
        <div class="about-content">
            <div class="about-list">
                <div class="about-item" type="11"><f:message key="ce.website.content.hzzc" /></div>
                <div class="about-item" type="12"><f:message key="ce.website.content.akfs" /></div>
                <div class="about-item" type="13"><f:message key="ce.website.content.ztyj" /></div>
                <div class="about-item" type="15"><f:message key="ce.website.content.yndt" /></div>
            </div>
        </div><!-- end of title -->

        <div id="content-container" class="content-dt">
            <div id="dongtai-c"></div>
        </div>

    </div>
</div><!-- end of content -->

<%@ include file="/szcea/includes/footer.jsp"%>

<script type="text/javascript">
var LIMIT = 10;

    $(function(){
        let type = parseInt(location.href.split('policy/')[1]);
        getDongtai(LIMIT,type);

        $('.about-item').each(function(){
            let t = $(this).attr('type');
            if(t==type){
                $(this).addClass('current');
                return false;
            }
        });

        $('.about-item').click(function(){
            $('.about-item').removeClass('hidden');
            $(this).addClass('current');
            let type = $(this).attr('type');
            getDongtai(LIMIT,type);
        });
    });

    function getDongtai(limit,type){
    var url = '<c:url value="/szcea/getPolicy" />';
        $.ajax({
            'url':url,
            'type':'POST',
            'data':{
                type:type,
                limit:limit
            },
            success:function(data,status){
                var d = data['data']['data'];
                if (d != null) {
                  showDongtai(d);
                }
            }
        });
    }

    function showDongtai(data){
        ids = [];
        var size = data.length;
        var _html = '';
        for(var i=0;i<size;i++){
            var d = data[i];
            ids.push(d['id']);
            _html += '<a class="dtitem" href="javascript:void(0)" onclick="content(' +d['id']+ ')">';
            if(i==0){
                _html += '<div class="cleft left">';
                var img = d['attachments'];
                if(img){
                  img = $('#path').val() + img[0]['path'];
                }else{
                  img = '<c:url value="/szcea/statics/images/default.png" />';
                }
                _html += '<img alt="" src="'+img+'" />';
                _html += '</div>';
            }else{
                _html += '<div class="cleft2 left">';
                var day = getDay(d['createdAt']);
                var mon = getMon(d['createdAt']);
                _html += '  <div class="day">'+day+'</div>';
                _html += '    <div class="line"></div>';
                _html += '  <div class="month">'+mon+'</div>';
                _html += '</div>';
            }
            if(i==0){
                _html += '  <div class="cright right">';
            }else{
                _html += '  <div class="cright2 right">';
            }
            _html += '      <div class="title">'+d['name']+'</div>';
            _html += '      <div class="c">'+d['content']+'</div>';
            _html += '  </div>';
            _html += '  <div class="cls"></div>';
            _html += '</a>';
        }
        $('#dongtai-c').html(_html);

        resetScreenSize();
    }

    function getDay(d){
        return d.substr(8,2);
    }

    function getMon(d){
        return d.substr(5,2) + '/' + d.substr(0,4);
    }

    function resetScreenSize(){
        var width = $('#dongtai-c').width();
        var w = $('#dongtai-c .cleft2').eq(1).width();
        $('.dtitem .cright2').width(width-w-50);
        $('.dtitem .cright').width(width-225-20);
    }

</script>