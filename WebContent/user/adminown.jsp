<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s"  uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<html>
<head>
<style type = "text/css">
body{
	text-align:center;
	background:url(../images/lbg.jpg);
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
</style>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面</title>
</head>
<body>
<div style = "height:10%"></div>
<div id = "center">
<div>
<h1>管理中心</h1>
</div>
<div>
<a href = "user/userAction!searchUser" style = "color:#FFF">用户管理</a>
</div>
<div>
<a href = "audio/audioAction!searchAudioAll" style = "color:#FFF">歌曲管理</a>
</div>
<div>
<a href = "sheet/sheetAction!searchSheet" style = "color:#FFF">歌单管理</a>
</div>
<div>
<a href = "updown/uploadpage.jsp" style = "color:#FFF">上传文件</a>
</div>
<div>
<a href = "user/uLogin.jsp" style = "color:#FFF">返回登录</a>
</div>

</div>
</body>
</html>