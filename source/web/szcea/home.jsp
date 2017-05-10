﻿<%@ include file="/szcea/includes/header.jsp"%>

        <div class="line">
          <div class="line-content">
            <div class="line-item line-top1">
              <div class="line-header">
                <div class="line-header-t">建设动态</div>
                <div class="line-header-more">更多>></div>
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
                <div class="line-header-t line-header-b-t">项目建设</div>
                <div class="line-header-more">更多>></div>
              </div>
              <div class="line-title">
                <div class="line-title-b">苏州服务外包学院</div>
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
                <div class="line-header-more">更多>></div>
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
                <div class="line-header-t line-header-b-t">制度建设</div>
                <div class="line-header-more">更多>></div>
              </div>
              <div class="line-list-date">
                <ul>
                  <c:if test="${not empty zdjs }">
                    <c:forEach var="row" items="${zdjs }">
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
                <div class="line-header-t line-header-b-t">督导通报</div>
                <div class="line-header-more">更多>></div>
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
                <div class="line-header-more">更多>></div>
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
                <div class="line-header-t line-header-b-t">政策法规</div>
                <div class="line-header-more">更多>></div>
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
                <div class="line-header-t line-header-b-t">资料下载</div>
                <div class="line-header-more">更多>></div>
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