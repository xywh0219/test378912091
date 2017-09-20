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
<title>歌曲列表</title>
 
</head>
<body >
 
<form action="audio/audioAction!saveAudio" method="post" >
  歌曲名字：<input type="text" name="audio.aname"><br/>
  歌曲地址：<input type="text" name="audio.aadd"><br/>
  歌曲风格：<input type="text" name="audio.astyle"><br/>
  分享人：<input type="text" name="audio.afrom"><br/>
  <input type="submit" value="add">
 
 </form>
</body>
</html>