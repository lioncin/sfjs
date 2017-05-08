<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>

<html lang="zh-CN">
<meta charset="utf-8"/>
<head>
<title>展览项目</title>
<#include "style.ftl">
<style type="text/css">
.font{ font-size:12pt; font-weight:normal;}
</style>
</head>

<body>
<div style="padding-left:70%;">项目编号: <u>&#xA0;&#xA0;${project.code}&#xA0;&#xA0;</u></div>
<div align="center"><h1>苏州市展览项目备案登记表</h1></div>
<div align="center">${year}年${month}月${day}日</div>
<div align="center" width="100%">
<div  style="padding-left:70%;">单位: 平方米 个 元</div>
<table width="90%" height="453" border="1" cellspacing="0" cellpadding="0" align="center"  style="border-collapse: collapse" bordercolor="#000000">
  <tr >
    <td class="font" colspan="2" rowspan="2" height="60">展览活动项目名称</td>
    <td class="font" colspan="3" height="30" align="left">&#xA0;中文: ${project.name}</td>
  </tr>
  <tr>
    <td class="font" colspan="3" height="30" align="left">&#xA0;英文(缩写): ${project.name_en}</td>
  </tr>
  <tr>
    <td class="font" colspan="2" height="30">举办地点</td>
    <td class="font" colspan="3" height="30" align="left">&#xA0;${project.location}</td>
  </tr>
  <tr>
    <td class="font" colspan="2" height="30">举办时间</td>  
    <td class="font" colspan="2" height="30" align="left">&#xA0;布展期: ${project.prepareFrom?string("yyyy-MM-dd")}至${project.prepareTo?string("yyyy-MM-dd")}</td>
    <td class="font" colspan="2" height="30" align="left">&#xA0;展出期: ${project.holdFrom?string("yyyy-MM-dd")}至${project.holdTo?string("yyyy-MM-dd")}</td>
  </tr>
  <tr>
    <td class="font" height="30" colspan="2">是否定期举办</td>
    <td class="font" colspan="1" height="30" align="left">&#xA0;<input type="checkbox" value="Y" checked="<#if project.isRegular == "N">checked</#if>" />否  <input type="checkbox" value="Y" checked="<#if project.isRegular == "Y">checked</#if>" />是 每年${project.annualTime} 届 </td>
    <td class="font" colspan="1" height="30">已举办届数</td>
    <td class="font" height="30" align="left">&#xA0;${project.holdTime}</td>
  </tr>
  <tr>
    <td class="font" colspan="2" height="30">是否取得国家注册商标</td>
    <td class="font" colspan="3" height="30" align="left">&#xA0;<#if project.hasNationalTM == "Y">是<#else>否</#if></td>
  </tr>
  <tr>
    <td class="font" colspan="2" height="30">是否获得国际性组织认证</td>
    <td class="font" colspan="3" height="30" align="left">&#xA0;<#if project.hasInterCert == "Y">是<#else>否</#if></td>
  </tr>
  <tr>
    <td class="font" colspan="2" height="30">展会层次</td>
    <td class="font" colspan="3" height="30" align="left">&#xA0;<input type="checkbox" value="Y" checked="<#if project.level == "N">checked</#if>" />国家级 &#xA0;&#xA0;&#xA0;<input type="checkbox" value="Y" checked="<#if project.level == "P">checked</#if>" />省级&#xA0;&#xA0;&#xA0;<input type="checkbox" value="Y" checked="<#if project.level == "C">checked</#if>" />地级</td>
  </tr>
  <tr>
    <td class="font" colspan="2" height="30">批准单位</td>
    <td class="font" colspan="3" height="30" align="left">&#xA0;${project.approver}</td>
  </tr>
  <tr>
    <td class="font" colspan="2" height="30">主办单位</td>
    <td class="font" colspan="3" height="30" align="left">&#xA0;${project.sponsor}</td>
  </tr>
  <tr>
    <td class="font" colspan="2" height="30">承办单位</td>
    <td class="font" colspan="3" height="30" align="left">&#xA0;${project.organizer}</td>
  </tr>
  <tr>
    <td class="font" colspan="3" height="30" align="left">&#xA0;预计展出面积: ${project.count_1} m<sup>2</sup></td>
    <td class="font" colspan="3" height="30" align="left">&#xA0;其中室内面积: ${project.count_2}</td>
  </tr>
  <tr>
    <td class="font" colspan="3" height="30" align="left">&#xA0;标准展位数量: ${project.count_3} 个</td>
    <td class="font" colspan="3" height="30" align="left">&#xA0;收费标准: ${project.feeScale}</td>
  </tr>
  <tr>
    <td class="font" width="111" height="30">是否附加会议</td>
    <td class="font" width="91" height="30" align="left">&#xA0;<input type="checkbox" value="Y" checked="<#if project.hasAddActivity == "Y">checked</#if>" />是 <input type="checkbox" value="Y" checked="<#if project.hasAddActivity == "N">checked</#if>" />否 </td>
    <td class="font" colspan="2" height="30" align="left">&#xA0;场次: ${project.addTime}</td>
    <td class="font" height="30" align="left">&#xA0;规模: ${project.addScale} 人</td>
  </tr>
  <tr>
    <td class="font" colspan="5" height="60" align="left" valign="top">&#xA0;主要展出内容: ${project.description}</td>
  </tr>
  <tr>
    <td class="font" height="30">报送单位</td>
    <td class="font" height="30" colspan="4" align="left">&#xA0;${project.submittedBy}</td>
  </tr>
  <tr>
    <td class="font" height="30">法人代表</td>
    <td class="font" height="30" colspan="4" align="left">&#xA0;${project.legalRep}</td>
  </tr>
  <tr>
    <td class="font" height="30">单位地址</td>
    <td class="font" height="30" colspan="4" align="left">&#xA0;${project.bizAddress}</td>
  </tr>
  <tr>
    <td class="font" height="30">单位电子邮箱</td>
    <td class="font" height="30" colspan="4" align="left">&#xA0;${project.bizEmail}</td>
  </tr>
  <tr>
    <td class="font" height="30">单位联系人</td>
    <td class="font" height="30" align="left">&#xA0;${project.bizContact}</td>
    <td class="font" height="30">联系电话</td>
    <td class="font" height="30" colspan="2" align="left">&#xA0;${project.bizPhone}</td>
  </tr>
  <tr>
    <td class="font" height="90">备案登记材料明细</td>
    <td class="font" height="90" colspan="4" align="left" valign="top">&#xA0;${project.documents}</td>
  </tr>
</table>
</div>
<div style="padding-left:70%;">报送单位盖章:</div>
</body>
</html>
