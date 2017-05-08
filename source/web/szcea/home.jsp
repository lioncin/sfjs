<%@ include file="/szcea/includes/header.jsp"%>

<div id="home-bg">
    <div class="bg">
      <img src="<c:url value="/szcea/statics/images/main-bg.jpg"/>"/>
    </div>
    
</div>
<div id="wuyan">
    <div class="bg">
      <img src="<c:url value="/szcea/statics/images/dynamic.jpg"/>"/>
    </div>
</div><!-- wu yan background -->

<div id="home">
    <div class="dynamic-container">
      <div class="dynamic-title">
        <div class="line"></div>
        <div class="dynamic-title-img"><img src="<c:url value="/szcea/statics/images/dynamic-title.png"/>"></div>
        <div class="line"></div>
      </div>

      <div class="dynamic-content">
        <div class="dynamic-left">
          <c:forEach var="row" items="${exhibitionDynamics}">
            <img class="hidden" src="<f:download path="${row.attachments[0].path }" />" />
          </c:forEach>
        </div>
        <div class="dynamic-right">
          <div class="news-more"><f:message key="ce.website.member.more" /></div>
          <div class="news-content">
            <div class="news-list">
              <c:forEach var="row" items="${exhibitionDynamics}">
                <a class="news-line" href="<c:url value="/szcea/content/" />${row.id}">
                  <div class="news-spot">.</div>
                  <div class="news-title"><c:out value="${row.name}"/></div>
                  <div class="news-date"><f:date value="${row.createdAt}"/></div>
                </a>
              </c:forEach>
              <div class="cls"></div>
            </div>
          </div>
        </div>
      </div>

      <div class="dynamic-title">
          <div class="line"></div>
          <div class="dynamic-title-img"><img src="<c:url value="/szcea/statics/images/special.png"/>"></div>
          <div class="line"></div>
        </div>
        <div class="dynamic-container">
          <div class="dynamic-content">
            <div class="special-content" onclick="location.href='<c:url value="/szcea/content/" />110'">
              <img src="<c:url value="/szcea/statics/images/special-content.png"/>">
            </div>
          </div>
        </div>

        <div class="dynamic-title">
          <div class="line"></div>
          <div class="dynamic-title-img">
            <img src="<c:url value="/szcea/statics/images/wonderful.png"/>">
          </div>
          <div class="line"></div>
        </div>

        <div class="wonderful-container">
          <div class="wonderful-content">
            <div class="wonderful-list">
              <c:if test="${not empty jingcaiContent }">
                <c:forEach var="row" items="${jingcaiContent }">
                  <a class="wonderful-item" href="<c:url value="/szcea/content/" />${row.id}">
                    <img src="<f:download path="${row.attachments[0].path }" />" />
                  </a>
                </c:forEach>
              </c:if>

              <div class="cls"></div>
            </div>
          </div>
        </div><!-- 精彩瞬间 -->

        <div class="su-container">
          <div class="su-img"></div>
          <div class="su-left left">
            <img class="flower" src="<c:url value="/szcea/statics/images/flower.png"/>">
            <div class="content">
              <div class="su-title">
                <div class="su-title-img">
                  <img src="<c:url value="/szcea/statics/images/flower-1.png"/>">
                </div>
                <div class="en">Exhibition Preview</div>
              </div>
              <div class="su-mid">
                <div class="local current" type="25"><f:message key="ce.website.Trailer.bshz" /></div>
                <div class="m">|</div>
                <div class="other" type="26"><f:message key="ce.website.Trailer.wdhz" /></div>
                <div class="cls"></div>
              </div>
              <div class="su-content"></div>
            </div>
          </div>
          <div class="su-left right">
            <img class="flower" src="<c:url value="/szcea/statics/images/flower.png"/>">
            <div class="content">
              <div class="su-title">
                <div class="su-title-img">
                  <img src="<c:url value="/szcea/statics/images/flower-2.png"/>">
                </div>
                <div class="en">Service</div>
              </div>
              <div class="su-service">
                <a href="<c:url value="/szcea/service/29" />" class="btn">品牌展会</a>
                <a href="<c:url value="/szcea/service/30" />" class="btn">院校机构</a>
                <a href="<c:url value="/szcea/service/31" />" class="btn">礼仪翻译</a>
                <a href="<c:url value="/szcea/service/32" />" class="btn">搭建公司</a>
                <a href="<c:url value="/szcea/service/33" />" class="btn">广告</a>
                <a href="<c:url value="/szcea/service/34" />" class="btn">物流</a>
                <a href="<c:url value="/szcea/service/35" />" class="btn">酒店</a>
                <a href="<c:url value="/szcea/service/36" />" class="btn">旅游</a>
                <div class="cls"></div>
              </div>
            </div>
          </div>
          <div class="cls"></div>
        </div><!-- 会展服务 -->

        <div class="dynamic-title">
          <div class="line"></div>
          <div class="dynamic-title-img">
            <img src="<c:url value="/szcea/statics/images/member.png"/>">
          </div>
          <div class="line"></div>
        </div><!-- 会员天地 -->

        <div class="dynamic-container">
          <div class="dynamic-content">
            <div class="member-list">
              <ce:member size="6"/>
            </div>
          </div>
        </div><!-- 会员天地 -->

        <div class="dynamic-title">
          <div class="line"></div>
          <div class="dynamic-title-img">
            <img src="<c:url value="/szcea/statics/images/site.png"/>">
          </div>
          <div class="line"></div>
        </div><!-- 场馆介绍 -->


        <div class="bottom-container">
          <div class="dynamic-container">
            <div class="dynamic-content">
              <div class="site-list">
                <div class="sites">
                  <c:if test="${not empty nevueImgs }">
                    <c:forEach var="rows" items="${nevueImgs }">
                      <a class="site-item" href="<c:url value="/szcea/content/" />${rows.id}">
                        <div class="site-item-img"><img src="<f:download path="${rows.attachments[0].path }" />" /></div>
                        <div class="site-item-title">${rows.name }</div>
                      </a>
                    </c:forEach>
                  </c:if>
                </div>
              </div>
            </div>
          </div>
        </div><!-- 场馆介绍 -->
    </div>
</div><!-- end of content -->

<%@ include file="/szcea/includes/footer.jsp"%>

<script type="text/javascript">
var LIMIT = 8;

$(function(){
  $('.site-list').hover(function(){
    clearInterval(_tid);
  }, function(){
    beginRoll();
  });

  $('a.news-line').hover(function(){
    var index = $(this).index('a.news-line');
    $('.dynamic-left img').addClass('hidden');
    $('.dynamic-left img').eq(index).removeClass('hidden');
  },function(){});

  $('.su-mid .local').click(function(){
    if(!$(this).hasClass('current')){
      $(this).addClass('current');
      $(this).parent().find('.other').removeClass('current');
      var type = $(this).attr('type');
      getYuGao(LIMIT,type);
    }
  });

  $('.su-mid .other').click(function(){
    if(!$(this).hasClass('current')){
      $(this).addClass('current');
      $(this).parent().find('.local').removeClass('current');
      var type = $(this).attr('type');
      getYuGao(LIMIT,type);
    }
  });

  getYuGao(LIMIT,25);

  getYuGao(LIMIT,27);

  initImgs();

  resizeScreen();

});

function initImgs(){
  var w = $('.site-list').width() / 3 - 30;
  $('.site-item').width(w);
  var size = $('.site-item').size();
  $('.sites').width((w+30) * size);

  beginRoll();
}

var imgIndex = 0;
function beginRoll(){
  var size = $('a.site-item').size();
  var left = parseInt($('.site-list .sites').css('left').split('px')[0]);
  $('.site-list .sites').css('left',left);
  _tid = setInterval(function(){
    left -= 2;
    if(left < -1 * $('.site-item').width() * (size - 3)){
      var node = $('.site-item').eq(imgIndex).prop("outerHTML");
      $('.site-list .sites').append(node);
      imgIndex++;

      var _w = $('.site-list .sites').width() + imgIndex * $('.site-item').width();
      $('.site-list .sites').width(_w);
    }
    $('.site-list .sites').css('left', left + 'px');
  }, 100);
}

function getYuGao(limit,type){
  var url = '<c:url value="/szcea/getYuGao" />';
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
        showYuGao(d,type);
      }
      
    }
  });
}

function showYuGao(data,type){
  var size = data.length;
  var _html = '';
  for(var i=0;i<size;i++){
      var d = data[i];
      _html += '<a class="service-i" href="<c:url value="/szcea/content/" />/' +d['id']+ '">' + d['name'] + '</a>';
  }
  if(type=='25' || type=='26'){
    $('.su-left .su-content').eq(0).html(_html);
  }else{
    $('.su-left .su-content').eq(1).html(_html);
  }
}

function resizeScreen(){
  var h = $('#home').width() * 0.8 * 0.45;
  $('.su-left .content').height(h);
}

</script>