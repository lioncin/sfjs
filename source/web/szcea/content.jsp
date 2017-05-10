<%@ include file="/szcea/includes/header.jsp"%>

        <div class="line">
          <div class="line-content line-nav">

            <div class="line-item line-nav-left">
              <div class="line-title">
                <div class="line-title-b line-nav-t">建设动态</div>
              </div>
              <div class="line-nav-list">
                <ul>
                  <c:forEach var="row" items="${jsdt }">
                    <li>
                      <a class="wonderful-item" href="<c:url value="/szcea/content/" />${row.id}">${row.name}</a>
                    </li>
                  </c:forEach>
                </ul>
              </div>

              <div class="line-title">
                <div class="line-title-b line-nav-t">项目建设</div>
              </div>
              <div class="line-nav-list">
                <ul>
                  <c:forEach var="row" items="${xmjs }">
                    <li>
                      <a class="wonderful-item" href="<c:url value="/szcea/content/" />${row.id}">${row.name}</a>
                    </li>
                  </c:forEach>
                </ul>
              </div>

              <div class="line-title">
                <div class="line-title-b line-nav-t">师资队伍</div>
              </div>
              <div class="line-nav-list">
                <ul>
                  <c:forEach var="row" items="${szdw }">
                    <li>
                      <a class="wonderful-item" href="<c:url value="/szcea/content/" />${row.id}">${row.name}</a>
                    </li>
                  </c:forEach>
                </ul>
              </div>
            </div>

            <div class="line-item line-nav-content">
              <div class="line-title">
                <div class="line-title-b line-nav-t">${content.name }</div>
              </div>
              <div class="line-nav-content-b">
                ${content.content }
              </div>
            </div>
          </div>
        </div>

<%@ include file="/szcea/includes/footer.jsp"%>