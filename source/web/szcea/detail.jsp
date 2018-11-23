<%@ include file="/szcea/includes/header.jsp"%>

        <div class="line">
          <div class="line-content line-nav">

            <div class="line-item line-nav-left">
            <div id="right">
                    <div class="right-item">
                        <div class='tt'>
                            <div class="icon"></div>
                            <div class="title">通知公告</div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="right-item">
                        <div class="tt">
                            <div class="icon"></div>
                            <div class="title">重点专业建设</div>
                            <div class="clear"></div>
                        </div>
                        <div class="zhuanye">
                            <div class="icon"></div>
                            <div class="text">软件技术专业建设</div>
                            <div class="clear"></div>
                        </div>
                        <div class="zhuanye">
                            <div class="icon"></div>
                            <div class="text">商务管理专业建设</div>
                            <div class="clear"></div>
                        </div>
                        <div class="zhuanye">
                            <div class="icon"></div>
                            <div class="text">生物技术与应用专业建设</div>
                            <div class="clear"></div>
                        </div>
                        <div class="zhuanye">
                            <div class="icon"></div>
                            <div class="text">动漫设计与制作专业建设</div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="right-item">
                        <div class="tt">
                            <div class="icon"></div>
                            <div class="title">办学体制与校企合作建设</div>
                            <div class="clear"></div>
                        </div>
                        <div class="zhuanye">
                            <div class="icon"></div>
                            <div class="text">办学体制机制建设</div>
                            <div class="clear"></div>
                        </div>
                        <div class="zhuanye">
                            <div class="icon"></div>
                            <div class="text">校企合作建设</div>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="line-item line-nav-content">
              <div class="line-title">
                <div class="line-title-b line-nav-t"></div>
              </div>
              <div class="line-nav-content-b">

                <c:if test="${not empty contents }">
                  <c:forEach var="row" items="${contents }">
                    <li>
                      <a class="wonderful-item" href="<c:url value="/szcea/content/" />${row.id}">${row.name}</a>
                      <span><f:date value="${row.createdAt}"/></span>
                    </li>
                  </c:forEach>
                </c:if>

              </div>
            </div>
          </div>
        </div>

<%@ include file="/szcea/includes/footer.jsp"%>
<script type="text/javascript">
var index = 0;
index = parseInt(location.href.split('detail/')[1]);
var t = ['','','建设动态','项目建设','师资队伍','制度建设','督导通报','校企合作','政策法规','资料下载','重点专业建设','特色项目建设','工作简报','示范风采'];
$('.line-title-b.line-nav-t').eq(3).text(t[index]);
</script>