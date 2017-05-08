<%@ include file="/szcea/includes/header.jsp"%>

<div id="home-bg">
    <div class="bg">
      <img src="<c:url value="/szcea/statics/images/bg-2.jpg"/>"/>
    </div>
    
</div>
<div id="wuyan">
    <div class="bg">
      <img src="<c:url value="/szcea/statics/images/dynamic.jpg"/>"/>
    </div>
</div><!-- wu yan background -->


<div id="dongtai">
    <div id="dongtai-container">
        <div class="about-list">
            <div class="about-item" type="1"><f:message key="ce.website.home.nav5" /></div>
            <div class="about-item" type="2"><f:message key="ce.website.content.zhrc" /></div>
            <div class="about-item" type="3"><f:message key="ce.website.content.hyrc" /></div>
            <div class="about-item current" type="4"><f:message key="ce.website.content.jqhd" /></div>
            <div class="cls"></div>
        </div>

        <div id="content-container" class="content-dt hidden">
            <div id="dongtai-c"></div>
            <div id="detail-c"></div>
        </div>

        <div id="calendar" class="content-dt hidden">
            <div class="calendar-container">
                <div class="title">
                    <div class="prev left"></div>
                    <div class="years left">
                        <div class="year"></div>
                    </div>
                    <div class="next left"></div>
                    <div class="cls"></div>
                </div>
                <div class="content">
                    <div class="week">
                        <div class="week-day left">日</div>
                        <div class="week-day left">一</div>
                        <div class="week-day left">二</div>
                        <div class="week-day left">三</div>
                        <div class="week-day left">四</div>
                        <div class="week-day left">五</div>
                        <div class="week-day left">六</div>
                        <div class="cls"></div>
                    </div>
                    <div class="cells"></div>
                    <div class="months">
                        <div class="month">1</div>
                        <div class="month">2</div>
                        <div class="month">3</div>
                        <div class="month">4</div>
                        <div class="month">5</div>
                        <div class="month">6</div>
                        <div class="month">7</div>
                        <div class="month">8</div>
                        <div class="month">9</div>
                        <div class="month">10</div>
                        <div class="month">11</div>
                        <div class="month">12</div>
                    </div>
                </div>
            </div>
        </div><!-- end of calendar -->

    </div>
</div><!-- end of content -->

<%@ include file="/szcea/includes/footer.jsp"%>
<script type="text/javascript">
var LIMIT = 5;

    $(function(){
        let index = location.href.split('dongtai/')[1];
        index = parseInt(index) - 1;
        showIndex(index);

        if(index == 1 || index == 2){
            $('.content-dt').eq(1).removeClass('hidden');
            $('.content-dt').eq(0).addClass('hidden');
            var year = new Date().getFullYear();
            var month = new Date().getMonth();
            showCells(year,month);
        }else{
            $('.content-dt').eq(0).removeClass('hidden');
            $('.content-dt').eq(1).addClass('hidden');
            getDongtai(LIMIT,(index+1));
        }

        $('.about-item').click(function(){
            let index = $(this).index('.about-item');
            showIndex(index);
            var type = parseInt($(this).attr('type'));
            if(type=="1" || type=="4"){
                $('.content-dt').eq(0).removeClass('hidden');
                $('.content-dt').eq(1).addClass('hidden');
                getDongtai(LIMIT,(index+1));
            }else{
                $('.content-dt').eq(1).removeClass('hidden');
                $('.content-dt').eq(0).addClass('hidden');
                var year = new Date().getFullYear();
                var month = new Date().getMonth();
                showCells(year,month);
            }
        });

        bindChangeDate();
    });

    function showIndex(index){
        $('.about-item').removeClass('current');
        $('.about-item').eq(index).addClass('current');
    }

    function showCells(year,month){
        var first_day = new Date(year,month,1).getDay();
        var days = new Date(year,(month+1),0).getDate();
        var _html = '';
        for(var i=0;i<first_day;i++){
            _html += '<div class="cell"></div>';
        }
        for(var j=1;j<=days;j++){
            _html += '<div class="cell bg">';
            _html += '  <div class="t">'+j+'</div>';
            _html += '  <div class="c"></div>';
            _html += '</div>';
        }
        _html += '<div class="cls"></div>';
        $('.cells').html(_html);
        showMonthActivity(year,month);
    }

    function showMonthActivity(year,month){
        $('.year').text(year);
        $('.months .month').eq(month).addClass('current');
        var activityType = '';
        if ($('.cnav-item.current').attr('type') == 2) {
          activityType = 'E';
        } else if ($('.cnav-item.current').attr('type') == 3) {
          activityType = 'C';
        }
        getData(year,month,activityType);
    }

    function getData(year,month,activityType){
        $.ajax({
            url: '<c:url value="/szcea/getActivitysInMonth"/>',
            type:'POST',
            data:{
                'year':year,
                'month':(month+1),
                'type':activityType
            },
            success:function(data,status){
                var d = data['data'];
                if (d != null && d['activitys'] != null) {
                  showCellsDetail(year,month,d['activitys']);
                }
            }
        });
    }

    function showCellsDetail(year,month,cd) {
      $(".cell").each(function (index, domEle) { 
            // domEle == this 
            var day = $(domEle).find(".t").text();
            var n = checkIn(year,month,day,cd);
            if(n.length){ //if in
              var _html = '<div class="tt">点击查看 日程安排</div>';
              _html += '<div class="details hidden">'+n.toString()+'</div>';
              _html += '<div class="b"></div>';
              $(domEle).find(".c").html(_html);
            }
          })

          bindCellEvents();
        }

    function checkIn(year,month,day,data){ //
        var size = data.length;
        var rst = [];
        for(var i=0;i<size;i++){
            var d = data[i];
            var holdFrom = d['holdFrom'];
            holdFrom = holdFrom.replace(/-/g,'/');
            holdFrom = new Date(holdFrom).getTime();
            var holdTo = d['holdTo'];
            holdTo = holdTo.replace(/-/g,'/');
            holdTo = new Date(holdTo).getTime();
            var t = new Date(year,month,day).getTime();
            if(t>=holdFrom && t<=holdTo){
                rst.push(d['name']);
            }
        }
        return rst;
    }

    function bindCellEvents(){
      $('.cell .c').click(function(){
            var d = $(this).find('.details');
            if(d){
              $(this).find('.details').removeClass('hidden');
            }
          });

          $('.cell .c').hover(function(){},function(){
            $(this).find('.details').addClass('hidden');
          });
        }

    function getDongtai(limit,type){
        var url = '<c:url value="/szcea/getDongtai" />';
        $.ajax({
            'url':url,
            'type':'POST',
            'data':{
                limit:limit,
                type:type
            },
            success:function(data,status){
                var d = data['data']['data'];
                if(typeof d != 'undefined'){
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

    function bindChangeDate(){
        $('.next').click(function(){
            $('.months .month').removeClass('current');
            var y = parseInt($('.year').text()) + 1;
            $('.year').text(y);
            showCells(y,0);
        });
        $('.prev').click(function(){
            $('.months .month').removeClass('current');
            var y = parseInt($('.year').text()) - 1;
            $('.year').text(y);
            showCells(y,0);
            });

            $('.months .month').click(function(){
            $('.months .month').removeClass('current');
            var y = parseInt($('.year').text());
            var m = parseInt($(this).text())-1;
            showCells(y,m);
        });
    }
</script>