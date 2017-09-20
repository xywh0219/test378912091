<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传文件</title>
</head>
<style>
body{
	background:url(images/lbg.jpg);
	opacity:.6;
	font-size:24px;
}
</style>
<body>
<div style = "height:10%"></div>
<a href = "user/adminown.jsp">返回</a>
<a href = "user/userAction!searchUser">用户管理</a>
<a href = "audio/audioAction!searchAudioAll">歌曲管理</a>
<a href = "sheet/sheetAction!searchSheet">歌单管理</a>
<br>
上传歌曲
<form name = "" method = "post" action="" enctype = "multipart/form-data">
<table id = "table1">
<tr><td>歌曲id：</td><td><input type = "text" name = "audio.audioid" size = "34"></td></tr>
<tr><td>歌曲名字：</td><td><input type = "text" name = "audio.audioname" size = "34"></td></tr>
<tr><td>演唱者：</td><td><input type = "text" name = "audio.audioplayer" size = "34"></td></tr>
<tr><td>歌曲风格：</td><td><input type = "text" name = "audio.audiostyle" size = "34"></td></tr>
<tr><td>分享人：</td><td><input type = "text" name = "audio.audiofrom" size = "34"></td></tr>
<tr><td>歌曲文件：</td><td><input type="file" name="aio" size="34"></td></tr>
<tr><td></td><td><input type="submit" value="上传" name="B1" /> &nbsp; 
				 <input type="reset" value="重置" name="B2" /></td></tr>
</table>
</form>
<hr>
上传歌词
<form name = "form2" method = "post" action="" enctype = "multipart/form-data">
<table id = "table2">
<tr><td>歌曲id：</td><td><input type = "text" name = "audioid"></td></tr>
<tr><td>歌词文件：</td><td><input type = "file" name = "lrc" size = "34"></td></tr>
</table>
</form>
<hr>
上传图片
<form name="form" method="post" action="picture/pictureAction" enctype="multipart/form-data">
<table width="100%" id="table3">
<tr><td style = "width:80px">歌曲id：</td><td><input type="text" name="picture.paid" size="34"></td></tr>
<tr><td style = "width:80px">分享人：</td><td><input type="text" name="picture.pfrom" size="34"></td></tr>
<tr><td style = "width:80px">歌曲名称：</td><td><input type="text" name="picture.pname" size="34"/></td></tr>
<tr><td style = "width:80px">歌曲图片：</td><td><input type="file" name="pic" size="34"></td></tr>
<tr><td></td><td><input type="submit" value="上传" name="B1" /> &nbsp; 
				 <input type="reset" value="重置" name="B2" /></td></tr>
</table>
</form>
</body>
</html>