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
<title>登录界面</title>
<link rel = "stylesheet" href = "css/loginstyle.css">
<style type = "text/css">
body{
	text-align:center;
}
#guest{
	font-size:20px;
}
</style>
</head>
<body >
<h1>我的音乐地盘<br>于星空之下</h1>
<div class = "main-agileinfo" id = "center">
<h2>开启音乐之旅</h2>
<form action="user/userAction!loginUser" method="post">
  <input type="text" name="user.uname" class = "name" placeholder="用户名"><br>
  <input type="password" name="user.upwd" class = "password" placeholder="密码"><br>
  <input type="submit" value="登录">
  <a href = "guemain.jsp"><span id = "guest">游客登录</span></a>
 </form>
 </div>
</body>
<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
</html>