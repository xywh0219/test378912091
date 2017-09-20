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
 
</head>
<body >
 
<form action="user/userAction!saveUser" method="post">
  用户名：<input type="text" name="user.uname"><br>
  密　码：<input type="text" name="user.upwd">
  <input type="submit" value="注册">
  <input type="reset" value = "重置">
 
 </form>
</body>
</html>