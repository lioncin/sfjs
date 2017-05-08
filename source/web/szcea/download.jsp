<%@ include file="/szcea/includes/header.jsp"%>

<div id="home-bg">
    <div class="bg">
      <img src="<c:url value="/szcea/statics/images/bg-11.jpg"/>"/>
    </div>
    
</div>
<div id="wuyan">
    <div class="bg">
      <img src="<c:url value="/szcea/statics/images/dynamic.jpg"/>"/>
    </div>
</div><!-- wu yan background -->

<div id="download">
    <div id="download-container">
      <ul class="download-lists">
        <c:if test="${not empty content }">
          <c:forEach var="row" items="${content }">
              <li>${row.content }</li>
          </c:forEach>
         </c:if>
      </ul>
       
    </div>
</div><!-- end of content -->

<%@ include file="/szcea/includes/footer.jsp"%>