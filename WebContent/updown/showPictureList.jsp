<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
 <%
 String  path=request.getContextPath();
 String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <base href="<%=basePath%>">
 <meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>歌曲封面-管理</title>
		<link rel="stylesheet" type="text/css" href="css/style_admin.css">
</head>
<body>
<table width="1024px"  >
	<tr>				 
		<td align="center" class="altbg1">
			<b>歌曲id</b>
		</td>
		<td align="center" class="altbg1">
			<b>分享人</b>
		</td>				 
		<td align="center" class="altbg1">
			<b>歌曲名称</b>
		</td>	
		<td align="center" class="altbg1">
			<b>歌曲图片</b>
		</td>			
		<td align="center" class="altbg1">
			<b>操作</b>
		</td>
				 
	</tr>
<s:iterator value="pictureList" var="picture" status="st">
	<tr>			 
		<td align="center">
		  <s:property value="#picture.paid"/>
		</td>
		<td align="center">
			 <s:property value="#picture.pfrom"/>
		</td>
				 
		<td align="center">
			 <s:property value="#picture.pname"/>
		</td>
		<td align="center">
		<a href="picture/download?picFileName=<s:property value='#picture.picture'/>"><img src="upload/<s:property value='#picture.picture'/>" height="50" width="80"/></a>
				</td>				
		<td align="center">
			 <a href="picture/download?picFileName=<s:property value='#picture.picture'/>">下载</a>				 		</td>
	</tr>
</s:iterator>
			 
</table>
</body>
</html>
  