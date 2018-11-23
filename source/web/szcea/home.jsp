<%@ include file="/szcea/includes/header.jsp"%>

        <div class="line">
          <div class="line-content">
            <div class="line-item line-top1">
              <div class="line-header">
                <div class="line-header-t">建设动态</div>
                <a class="line-header-more" href="<c:url value="/szcea/detail" />/2">更多>></a>
              </div>
              <div class="line-banner">
                <div id="carousel-example-generic2" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                      <li data-target="#carousel-example-generic2" data-slide-to="0" class="active"></li>
                      <li data-target="#carousel-example-generic2" data-slide-to="1"></li>
                      <li data-target="#carousel-example-generic2" data-slide-to="2"></li>
                    </ol>

                  <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img class="line-banner-img" src="<c:url value="/szcea/statics/images/line-banner.jpg"/>"/>
                    </div>
                    <div class="item">
                        <img class="line-banner-img" src="<c:url value="/szcea/statics/images/line-banner.jpg"/>"/>
                    </div>
                    <div class="item">
                        <img class="line-banner-img" src="<c:url value="/szcea/statics/images/line-banner.jpg"/>"/>
                    </div>
                  </div>
                </div>
              </div>
              <div class="line-list">
                <ul>
                  <c:if test="${not empty jsdt }">
                    <c:forEach var="row" items="${jsdt }">
                      <li>
                        <a class="wonderful-item" href="<c:url value="/szcea/content/" />${row.id}">${row.name}</a>
                      </li>
                    </c:forEach>
                  </c:if>
                </ul>
              </div>
            </div>
            <div class="line-item line-top2">
              <div class="line-header-b">
                <div class="line-header-t line-header-b-t">通知公告</div>
                <a class="line-header-more" href="<c:url value="/szcea/detail" />/3">更多>></a>
              </div>
              <div class="line-list-date">
                <ul>
                  <c:if test="${not empty xmjs }">
                    <c:forEach var="row" items="${xmjs }">
                      <li>
                        <a class="wonderful-item" href="<c:url value="/szcea/content/" />${row.id}">${row.name}</a>
                        <span><f:date value="${row.createdAt}"/></span>
                      </li>
                    </c:forEach>
                  </c:if>
                </ul>
              </div>
            </div>
            <div class="line-item line-top3">
              <div class="line-header">
                <div class="line-header-t">师资队伍</div>
                <a class="line-header-more" href="<c:url value="/szcea/detail" />/4">更多>></a>
              </div>
              <div class="line-list">
                <ul>
                  <c:if test="${not empty szdw }">
                    <c:forEach var="row" items="${szdw }">
                      <li>
                        <a class="wonderful-item" href="<c:url value="/szcea/content/" />${row.id}">${row.name}</a>
                        <span><f:date value="${row.createdAt}"/></span>
                      </li>
                    </c:forEach>
                  </c:if>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <div class="line">
          <div class="line-content line-mid">
            <div class="line-item line-top2 line-mid1">
              <div class="line-header-b">
                <div class="line-header-t line-header-b-t">工作简报</div>
                <a class="line-header-more" href="<c:url value="/szcea/detail" />/12">更多>></a>
              </div>
              <div class="line-list-date">
                <ul>
                  <c:if test="${not empty gzjb }">
                    <c:forEach var="row" items="${gzjb }">
                      <li>
                        <a class="wonderful-item" href="<c:url value="/szcea/content/" />${row.id}">${row.name}</a>
                        <span><f:date value="${row.createdAt}"/></span>
                      </li>
                    </c:forEach>
                  </c:if>
                </ul>
              </div>
            </div>
            <div class="line-item line-top2 line-mid2">
              <div class="line-header-b">
                <div class="line-header-t line-header-b-t">特色项目建设</div>
                <a class="line-header-more" href="<c:url value="/szcea/detail" />/6">更多>></a>
              </div>
              <div class="line-list-date">
                <ul>
                  <c:if test="${not empty ddtb }">
                    <c:forEach var="row" items="${ddtb }">
                      <li>
                        <a class="wonderful-item" href="<c:url value="/szcea/content/" />${row.id}">${row.name}</a>
                        <span><f:date value="${row.createdAt}"/></span>
                      </li>
                    </c:forEach>
                  </c:if>
                </ul>
              </div>
            </div>
            <div class="line-item line-top3 line-mid3">
              <div class="line-header">
                <div class="line-header-t">校企合作</div>
                <a class="line-header-more" href="<c:url value="/szcea/detail" />/7">更多>></a>
              </div>
              <div class="line-list">
                <ul>
                  <c:if test="${not empty xqhz }">
                    <c:forEach var="row" items="${xqhz }">
                      <li>
                        <a class="wonderful-item" href="<c:url value="/szcea/content/" />${row.id}">${row.name}</a>
                        <span><f:date value="${row.createdAt}"/></span>
                      </li>
                    </c:forEach>
                  </c:if>
                </ul>
              </div>
            </div>
          </div>
        </div>


        <div class="line">
          <div class="line-content line-mid">
            <div class="line-item line-top2 line-mid1">
              <div class="line-header-b">
                <div class="line-header-t line-header-b-t">校重点专业建设</div>
                <a class="line-header-more" href="<c:url value="/szcea/detail" />/8">更多>></a>
              </div>
              <div class="line-list-date">
                <ul>
                  <c:if test="${not empty zcfg }">
                    <c:forEach var="row" items="${zcfg }">
                      <li>
                        <a class="wonderful-item" href="<c:url value="/szcea/content/" />${row.id}">${row.name}</a>
                        <span><f:date value="${row.createdAt}"/></span>
                      </li>
                    </c:forEach>
                  </c:if>
                </ul>
              </div>
            </div>
            <div class="line-item line-top2 line-mid2">
              <div class="line-header-b">
                <div class="line-header-t line-header-b-t">示范风采</div>
                <a class="line-header-more" href="<c:url value="/szcea/detail" />/9">更多>></a>
              </div>
              <div class="line-list-date">
                <ul>
                  <c:if test="${not empty zlxz }">
                    <c:forEach var="row" items="${zlxz }">
                      <li>
                        <a class="wonderful-item" href="<c:url value="/szcea/content/" />${row.id}">${row.name}</a>
                        <span><f:date value="${row.createdAt}"/></span>
                      </li>
                    </c:forEach>
                  </c:if>

                </ul>
              </div>
            </div>
          </div>
        </div>
<%@ include file="/szcea/includes/footer.jsp"%>