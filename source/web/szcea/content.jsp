<%@ include file="/szcea/includes/header.jsp"%>

<div id="home-bg">
    <div class="bg">
      <img src="<c:url value="/szcea/statics/images/bg-6.jpg"/>"/>
    </div>
    
</div>
<div id="wuyan">
    <div class="bg">
      <img src="<c:url value="/szcea/statics/images/dynamic.jpg"/>"/>
    </div>
</div><!-- wu yan background -->

<div id="content">
    <div id="content-container">
        <div class="title">${content.name }</div>
        <c:if test="${not empty changguans }">
            <div class="attachement">
                <c:forEach var="row" items="${changguans }">
                    <img class="atta-item" src="<f:download path="${row.path }" />" />
                </c:forEach>
            </div>
        </c:if>

        <p class="ct">${content.content }</p>

        <c:if test="${not empty attachments }">
            <div class="attachement">
                <div class="title"><f:message key="ce.website.attachment"/></div>
                <c:forEach var="row" items="${attachments }">
                    <a class="atta-item" href="<f:download path="${row.path }" />">${row.name }</a>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${not empty jingcais }">
            <div class="attachement">
                <c:forEach var="row" items="${jingcais }">
                    <img class="atta-item" src="<f:download path="${row.path }" />" />
                </c:forEach>
            </div>
        </c:if>
        
    </div>
</div><!-- end of content -->

<%@ include file="/szcea/includes/footer.jsp"%>