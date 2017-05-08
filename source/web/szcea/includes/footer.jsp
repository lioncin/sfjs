<div class="cls"></div>

<div id="footer">
    <div id="footer-container">
        <div class="links pb">
            <f:message key="ce.website.home.footer"/>
            <f:links tag="FRIEND" openNewWindow="true"/>
            <div class="cls"></div>
        </div>
        <div class="copyright pb">
            <f:message key="ce.website.home.copyright"/>
            &nbsp;${website.icp}
            <br>
            <f:message key="ce.website.home.tel"/> ${website.telephone} | <f:message key="ce.website.home.fax"/> ${website.fax} | <f:message key="ce.website.home.address"/> ${website.address}<br>
            <f:message key="support.software"/></div>
    </div>
</div><!-- end of footer -->

</body>
<script src="<c:url value="/szcea/statics/scripts/jquery.min.js"/>"></script>
<script src="<c:url value="/statics/scripts/utils.js"/>"></script>
<script type="text/javascript">
    var APP_PATH = '${pageContext.request.contextPath}';

    $('.menu').hover(function(){
        var sublinks = $(this).find('.sublinks');
        if(sublinks && sublinks.hasClass('hidden')){
            sublinks.removeClass('hidden');
        }
    },function(){
        var sublinks = $(this).find('.sublinks');
        if(sublinks && !sublinks.hasClass('hidden')){
            sublinks.addClass('hidden');
        }
    });

    //预加载所有的新闻图片，然后显示第一张
    $('.dynamic-left img').eq(0).removeClass('hidden');

    var h = $('.dynamic-left').height();
    $('.dynamic-right').height(h);

</script>
</html>