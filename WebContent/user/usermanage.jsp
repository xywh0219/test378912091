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
<title>用户管理</title>
 <style type = "text/css">
body{
	text-align:center;
	background:url(images/lbg.jpg);
	font-size:24px;
}
} 
</style>
</head>
<body >
<div style = "height:10%"></div>
<div id = "center">
<div>
<a href = "user/adminown.jsp">返回</a>
<a href = "user/userAction!searchUser">用户管理</a>
<a href = "audio/audioAction!searchAudioAll">歌曲管理</a>
<a href = "sheet/sheetAction!searchSheet">歌单管理</a>
<br>
</div>
<div>
 <table border="1" style="margin:auto;">
 <tr>
 <td>用户id</td><td>用户名</td><td>密码</td><td>操作</td>
 </tr>
 <s:iterator value="listu" var="u" >
 <tr>
  <td><s:property value="#u.uid"/></td> 
  <td><s:property value="#u.uname"/></td> 
  <td><s:property value="#u.upwd"/></td>
  <td><a href="user/userAction!removeUser?user.uid=<s:property value='#u.uid'/>">删除</a></td>
  </tr>
 </s:iterator>
 </table>
 </div>
 <div>
在这里新增或修改新用户：
<form name = "form1" method="post" >
 用户id：<input type="text" name = "user.uid"><br>
  用户名：<input type="text" name = "user.uname"><br>
  密　码：<input type="text" name = "user.upwd"><br>
  <div align="center">
  <input type = "button" value = "新增" onclick = "add()">
  <input type = "button" value = "修改" onclick = "update()">
  </div>
</form>
</div>
</div>
</body>
<script type="text/javascript">
function add(){
	document.form1.action = "user/userAction!saveUser";
	document.form1.submit();
}
function update(){
	document.form1.action = "user/userAction!updateUser";
	document.form1.submit();
}
</script>
</html>