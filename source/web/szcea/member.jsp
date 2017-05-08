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

<div id="member">
    <div id="member-container">
        <div class="member-desc">
            <div class="avatar left">
                <img src="<f:download path="${path }" />" onerror='this.src="<c:url value="/szcea/statics/images/default-m.png" />"' />
            </div>
            <div class="detail left">
                <div class="name">${name }</div>
                <div class="time">${time }</div>
                <p class="desc">${desc }</p>
            </div>
            <div class="cls"></div>
        </div>
        <div class="more-member">
            <div class="title"><f:message key="ce.website.member.more" /></div>
            <div class="member-list"><ce:member size="6"/></div>
        </div>
    </div>
    
</div><!-- end of content -->

<%@ include file="/szcea/includes/footer.jsp"%>