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
<title>歌曲管理</title>
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
<a href = "updown/uploadpage.jsp">上传文件</a>
<table border = "1" style="margin:auto;">
<tr>
 <td>歌曲id</td><td>歌曲名字</td><td>歌曲风格</td><td>分享人</td>
 </tr>
 <s:iterator value="lista" var="a" >
 <tr>
  <td><s:property value="#a.aid"/></td>
  <td><s:property value="#a.aname"/></td>
  <td><s:property value="#a.astyle"/></td>
  <td><s:property value="#a.afrom"/></td>
  <td><a href="audio/audioAction!removeAudio?audio.aid=<s:property value='#a.aid'/>">删除</a></td>
 </tr>
 </s:iterator>
 </table>
 <hr>
 请输入新增或修改的歌曲id、歌曲名和歌曲地址、歌曲风格、分享人和歌手：
 <div id = "form">
<form name = "form2" method="post" >
歌曲的ID:<input type="text" name = "audio.aid"><br>
歌曲名字: <input type="text" name = "audio.aname"><br>
歌曲地址: <input type="text" name = "audio.aadd"><br>
歌曲风格: <select name = "audio.astyle">
 <option value = "流行">流行</option>
 <option value = "摇滚">摇滚</option>
 <option value = "古典">古典</option>
 <option value = "古风">古风</option>
 <option value = "民族">民族</option>
 <option value = "说唱">说唱</option>
 <option value = "拉丁">拉丁</option>
 <option value = "经典老歌">经典老歌</option>
 <option value = "其他">其他</option>
 </select><br>
分享人ID: <input type = "text" name = "audio.afrom"><br>
歌手名字:<input type = "text" name = "audio.audioplayer"><br>
<div align="center">
  <input type = "button" value = "新增" onclick = "add()" >
  <input type = "button" value = "修改" onclick = "update()">
  </div>
</form>
</div>
</div>
</body>
<script type="text/javascript">
function add(){
	document.form2.action = "audio/audioAction!saveAudio";
	document.form2.submit();
}
function update(){
	document.form2.action = "audio/audioAction!updateAudio";
	document.form2.submit();
}
</script>
</html>