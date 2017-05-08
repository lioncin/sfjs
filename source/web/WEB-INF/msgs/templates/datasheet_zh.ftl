<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>

<html lang="zh-CN">
<meta charset="utf-8"/>
<head>
<title>会议数据报表</title>
<#include "style.ftl">
<style type="text/css">
@page{size: A4 landscape;}
.bt{text-align:center; font-size:14pt;}
td{ text-align:center;}
table{ empty-cells: show;}
table td{ height:1cm;}
.cls{ clear:both; font-size:12pt;}
.com{ float:left; font-size:12pt;}
.time{ float:right;}
#content{ width:100%;}
#content .content-container{ width:90%; margin:0 auto;}
#tbl{ width:100%; margin-bottom:15px;}
#content .content-container .footer{ width:100%;}
#content .content-container .footer .name{ float:left; font-size:12pt;}
#content .content-container .footer .tel{ float:right; font-size:12pt;}
</style>
</head>
<body>
<div class="bt">苏州市${statYear}年度会议数据统计表(二)</div>
<div id="content">
  <div class="content-container">
    <div class="title">
      <div class="com">单位：${company_name}</div>
      <div class="time">填报时间：${year}年${month}月${day}日</div>
      <div class="cls"></div>
    </div>
    <table width="100%" id="tbl" border="1" cellpadding="0" cellspacing="0" bordercolor="#FF0000" style="border-collapse:collapse;">
      <tbody>
        <tr>
          <td rowspan="2">分类</td>
          <td colspan="2">政府类会议</td>
          <td colspan="2">社团(协会)类会议</td>
          <td colspan="2">企业类会议</td>
          <td colspan="2">其他类会议</td>
          <td colspan="2">小计</td>
          <td>备注</td>
        </tr>
        <tr>
          <td>场次</td>
          <td>人数</td>
          <td>场次</td>
          <td>人数</td>
          <td>场次</td>
          <td>人数</td>
          <td>场次</td>
          <td>人数</td>
          <td>场次</td>
          <td>人数</td>
          <td>&#xA0;</td>
        </tr>
        <tr>
          <td>国际性会议</td>
          <td>${iData.gTime}</td>
          <td>${iData.gVisitorCount}</td>
          <td>${iData.oTime}</td>
          <td>${iData.oVisitorCount}</td>
          <td>${iData.bTime}</td>
          <td>${iData.bVisitorCount}</td>
          <td>${iData.zTime}</td>
          <td>${iData.zVisitorCount}</td>
          <td>${iData.subtotalTime}</td>
          <td>${iData.subtotalVisitorCount}</td>
          <td>&#xA0;</td>
        </tr>
        <tr><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td></tr>
        <tr>
          <td>全国性会议</td>
          <td>${nData.gTime}</td>
          <td>${nData.gVisitorCount}</td>
          <td>${nData.oTime}</td>
          <td>${nData.oVisitorCount}</td>
          <td>${nData.bTime}</td>
          <td>${nData.bVisitorCount}</td>
          <td>${nData.zTime}</td>
          <td>${nData.zVisitorCount}</td>
          <td>${nData.subtotalTime}</td>
          <td>${nData.subtotalVisitorCount}</td>
          <td>&#xA0;</td>
        </tr>
        <tr><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td></tr>
        <tr>
          <td>省级会议</td>
          <td>${pData.gTime}</td>
          <td>${pData.gVisitorCount}</td>
          <td>${pData.oTime}</td>
          <td>${pData.oVisitorCount}</td>
          <td>${pData.bTime}</td>
          <td>${pData.bVisitorCount}</td>
          <td>${pData.zTime}</td>
          <td>${pData.zVisitorCount}</td>
          <td>${pData.subtotalTime}</td>
          <td>${pData.subtotalVisitorCount}</td>
          <td>&#xA0;</td>
        </tr>
        <tr><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td></tr>
        <tr>
          <td>市级会议</td>
          <td>${cData.gTime}</td>
          <td>${cData.gVisitorCount}</td>
          <td>${cData.oTime}</td>
          <td>${cData.oVisitorCount}</td>
          <td>${cData.bTime}</td>
          <td>${cData.bVisitorCount}</td>
          <td>${cData.zTime}</td>
          <td>${cData.zVisitorCount}</td>
          <td>${cData.subtotalTime}</td>
          <td>${cData.subtotalVisitorCount}</td>
          <td>&#xA0;</td>
        </tr>
        <tr><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td><td>&#xA0;</td></tr>
        <tr>
          <td>合计</td>
          <td>${tData.gTime}</td>
          <td>${tData.gVisitorCount}</td>
          <td>${tData.oTime}</td>
          <td>${tData.oVisitorCount}</td>
          <td>${tData.bTime}</td>
          <td>${tData.bVisitorCount}</td>
          <td>${tData.zTime}</td>
          <td>${tData.zVisitorCount}</td>
          <td>${tData.subtotalTime}</td>
          <td>${tData.subtotalVisitorCount}</td>
          <td>&#xA0;</td>
        </tr>
      </tbody>
    </table>
    <div class="footer">
      <div class="name">填报人：${name}</div>
      <div class="tel">联系电话：${tel}</div>
    </div>
  </div>
</div>
</body>
</html>