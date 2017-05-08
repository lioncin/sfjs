<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>

<html lang="zh-CN">
<meta charset="utf-8"/>
<head>
<title>会议数据报表</title>
<#include "style.ftl">
<style type="text/css">
@page{size: A4 landscape;}
.bt{text-align:center; font-size:16pt;}
td{ text-align:center; font-size:12pt;}
table{ empty-cells: show;}
table td{ height:1cm;}
.cls{ clear:both;}
.com{ float:left; font-size:12pt;}
.time{ float:right; font-size:12pt;}
#content{ width:100%;}
#content .content-container{ width:90%; margin:0 auto;}
#tbl{ width:100%; margin-bottom:16px;}
#content .content-container .footer{ width:100%;}
#content .content-container .footer .name{ float:left; font-size:12pt;}
#content .content-container .footer .tel{ float:right; font-size:12pt;}
</style>
</head>
<body>
<br />
<br />
<div class="bt">苏州市${statYear}年度会议项目统计表（一）</div>
<br />
<br />
<div id="content">
  <div class="content-container">
    <div class="title">
      <div class="com">单位：${company_name}</div>
      <div class="time">填报日期：${year}年${month}月${day}日</div>
      <div class="cls"></div>
    </div>
    <table width="100%" id="tbl" border="1" cellpadding="0" cellspacing="0" bordercolor="#FF0000" style="border-collapse:collapse;">
        <tr>
          <td>序号</td>
          <td>会议名称</td>
          <td>主办单位</td>
          <td>召开时间</td>
          <td>场次</td>
          <td>参会人数</td>
          <td>会议类别</td>
        </tr>
        <#if project.statDetail??>
        <#list project.statDetail as row>
        <tr>
          <td>${row_index + 1}</td>
          <td>${row.activityName}</td>
          <td>${row.sponsor}</td>
          <td>${row.holdFrom}</td>
          <td>${row.countTime}</td>
          <td>${row.visitorCount}</td>
          <td><#switch row.confType><#case "G">政府类<#break><#case "O">社团类<#break><#case "B">企业类<#break><#case "Z">其他类<#break></#switch></td>
        </tr>
        </#list>
        </#if>
    </table>
    <div class="footer">
      <div class="name">填报人：${name}</div>
      <div class="tel">联系电话：${tel}</div>
    </div>
  </div>
</div>
</body>
</html>