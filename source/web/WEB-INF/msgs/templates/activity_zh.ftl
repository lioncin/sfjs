您好 ${username},<br/>
感谢您的活动报备。<br/>

--------------------------------<br/>
<#if status == "Y">
我们很高兴地通知您,您的活动报备已通过,详情如下:<br/>
审批结果:通过<br/>
审批意见:${remarks}<br/>
<#else>
我们很遗憾地通知您,您的活动报备未通过,详情如下:<br/>
审批结果:拒绝<br/>
审批意见:${remarks}<br/>
</#if>
--------------------------------
