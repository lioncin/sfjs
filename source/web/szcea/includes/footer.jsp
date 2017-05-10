<div class="footer">
            <div class="footer-top-bg">
            <div class="footer-top">
              友情链接 ：
              <f:links tag="FRIEND" openNewWindow="true"/>
              <div class="cls"></div>
            </div>
            </div>
            <div class="footer-content-bg">
            <div class="footer-content">
              <div class="footer-address">
                <div class="footer-tel">
                  中国·新加坡苏州工业园区若水路99号  电话：0512-62932151 传真：0512-62932000
                </div>
                <div class="footer-tel">
                  示范建设办公室电话：0512-62932151 传真：0512-62932000
                </div>
                <div class="footer-tel">
                  2008-2017 © 苏州工业园区服务外包职业学院 版权所有 - 苏ICP备10020871号
                </div>
              </div>
              <div class="footer-weixin">
                  <img src="<c:url value="/szcea/statics/images/siso.jpg"/>"/>
                  <div class="footer-weixin-title">扫一扫，关注我们</div>
              </div>
            </div>
             </div>
        </div>
      </div>
    </div>
  </div>

  <script src="<c:url value="/szcea/statics/scripts/jquery.min.js"/>"></script>
  <script src="<c:url value="/szcea/statics/scripts/a.js"/>"></script>
  <script src="<c:url value="/szcea/statics/scripts/b.js"/>"></script>
</body>
</html>

<script type="text/javascript">
  var data = [
    {amount : 11},
    {amount : 22},
    {amount : 33},
    {amount : 44},
    {amount : undefined}
  ]
  var data_map = data.map(function(e){
    if (e.amount == undefined) {
      e.amount = 0;
    }else{
      return e.amount;
    }

  })
  var sum = data.reduce(function(a,c) {
    console.log(c.amount);
    return a + c.amount;
  },0);
</script>