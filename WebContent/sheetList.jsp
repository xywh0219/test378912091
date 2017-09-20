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
<title>歌单界面</title>
 
</head>
<body >
 
<form action="sheet/sheetAction!saveSheet" method="post">
歌单id：<input type = "text" name="sheet.sno"><br>
歌单名： <input type = "text" name ="sheet.sname"><br>
用户id：<input type="text" name="sheet.user.uid"><br>
歌曲id：<input type="text" name="sheet.audio.aid"><br>
歌单风格：<input type="text" name="sheet.sstyle">
  <input type="submit" value="add">
 
 </form>
</body>
</html>