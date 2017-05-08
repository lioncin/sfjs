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
td{ text-align:center; word-break:break-all; font-size:12pt;}
table{ empty-cells: show;}
table td{ height:1cm;}
.cls{ clear:both;}
.com{ float:left; font-size:12pt;}
.time{ float:right; font-size:12pt;}
#content{ width:100%;}
#content .content-container{ width:90%; margin:0 auto;}
#tbl{ width:100%; margin-bottom:15px;}
#content .content-container .footer{ width:100%;}
#content .content-container .footer .name{ float:left; font-size:12pt;}
#content .content-container .footer .tel{ float:right; font-size:12pt;}
</style>
</head>
<body>
<div class="bt">苏州市${statYear}年度展会统计表</div>
<br />
<div id="content">
  <div class="content-container">
    <div class="title">
      <div class="com">单位：${company_name}</div>
      <div class="time">填报时间：${year}年${month}月${day}日</div>
      <div class="cls"></div>
    </div>
    <table width="100%" id="tbl" border="1" cellpadding="0" cellspacing="0" bordercolor="#FF0000" style="border-collapse:collapse;">
        <colgroup>
          <col width="5%"/>
          <col width="14%"/>
          <col width="10%"/>
          <col width="10%"/>
          <col width="14%"/>
          <col width="14%"/>
          <col width="9%"/>
          <col width="8%"/>
          <col width="8%"/>
          <col width="8%"/>
        </colgroup>
        <tr>
          <td>序号</td>
          <td>展会名称</td>
          <td>举办地点</td>
          <td>举办时间</td>
          <td>主办单位</td>
          <td>承办单位</td>
          <td>实际展位数<br />(个)</td>
          <td>展会面积<br />(平方米)</td>
          <td>专业观众人数</td>
          <td>附加会议<br />(场)</td>
        </tr>
        <#if project.statDetail??>
        <#list project.statDetail as row>
        <tr>
          <td>${row_index + 1}</td>
          <td>${row.activityName}</td>
          <td>${row.location}</td>
          <td>${row.holdFrom}</td>
          <td>${row.sponsor}</td>
          <td>${row.organizer}</td>
          <td>${row.countTime}</td>
          <td>${row.area}</td>
          <td>${row.visitorCount}</td>
          <td>${row.addConference}</td>
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