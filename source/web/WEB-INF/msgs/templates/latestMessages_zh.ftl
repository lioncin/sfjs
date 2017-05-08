<ul class="dropdown-menu dropdown-messages">
<#if messages??>
<#list messages as message>
<li>
  <a href="javascript:clickTopMenu('/system/message/view/${message.id}');">
	<div>
	  <strong>${message.fromUserId}</strong>
	  <span class="pull-right text-muted">
		<em>${message.createdAt}</em>
	  </span>
	</div>
	<div>${message.subject}</div>
  </a>
</li>
</#list>
</#if>
<li class="divider"></li>
<li>
  <a class="text-center" href="javascript:clickTopMenu('/system/message/manage');">
    <strong>Read All Messages</strong>
    <i class="fa fa-angle-right"></i>
  </a>
</li>
</ul>
