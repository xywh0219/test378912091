<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s"  uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的地盘</title>

</head>
<body>

<s:iterator value="listu" var="u" >
会员<s:property value = "#u.uname"/>，欢迎回来。
</s:iterator>
<br>
<table>
<tr>
<td>歌单名</td><td>歌单风格</td><td>创建人</td>
</tr>
<s:iterator value="lists" var="s" >
<tr>
 <td><s:property value="#s.sname"/></td>
 <td><s:property value="#s.sstyle"/></td>
 <td><s:property value="#s.fname"/></td>
 <td><a href="sheet/sheetAction!removeSheet?sheet.sid=<s:property value='#s.sid'/>">删除</a></td>
 <td><a href="sheet/sheetAction!openSheet?sheet.sno=<s:property value='#s.sno'/>">打开</a></td>
 </tr>
</s:iterator>
</table>

</body>
</html>