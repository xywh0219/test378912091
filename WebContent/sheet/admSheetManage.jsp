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
<title>歌单管理</title>
<style type = "text/css">
body{
	text-align:center;
	background:url(images/lbg.jpg);
	font-size:24px;
}
#center {  
    max-width:1140px;  
    min-width:960px;  
    margin:0pt auto;   
}  
#center {  
  width:910px;  
  min-width:800px;  
} 
#form{
	margin-left:30%;
	text-align:left;
}  
</style>
</head>
<body >
<div style = "height:10%"></div>
<div id = "center">
<a href = "user/adminown.jsp">返回</a>
<a href = "user/userAction!searchUser">用户管理</a>
<a href = "audio/audioAction!searchAudioAll">歌曲管理</a>
<a href = "sheet/sheetAction!searchSheet">歌单管理</a>
<br>
<table border = "1" style="margin:auto;">
<tr>
 <td>歌单id</td><td>歌单名</td><td>歌单风格</td><td>用户id</td><td>歌曲id</td>
 </tr>
 <s:iterator value="lists" var="s" >
 <tr>
  <td><s:property value="#s.sno"/></td>
  <td><s:property value="#s.sname"/></td> 
  <td><s:property value="#s.sstyle"/></td>
  <td><s:property value="#s.user.uid"/></td>
  <td><s:property value="#s.audio.aid"/></td>
  <td><a href="sheet/sheetAction!removeSheet?sheet.sid=<s:property value='#s.sid'/>">删除</a></td>
  <td><a href="audio/audioAction!playAudio?audio.aid=<s:property value='#s.audio.aid'/>">播放</a></td>
  </tr>
 </s:iterator>
</table>
<hr>
请输入新增或修改的歌单id、歌曲id、歌单名和歌单风格：
<div id = "form">
<form name = "form3" method="post" >
歌单的ID：<input type = "text" name ="sheet.sno"><br>
 歌曲的ID：<input type = "text" name = "sheet.audio.aid"><br>
  歌单名称：<input type="text" name = "sheet.sname"><br>
  歌单风格：<input type="text" name = "sheet.sstyle"><br>
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
	document.form3.action = "sheet/sheetAction!saveSheet";
	document.form3.submit();
}
function update(){
	document.form3.action = "sheet/sheetAction!updateSheet";
	document.form3.submit();
}
</script>
</html>