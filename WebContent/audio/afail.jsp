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
<title>登录失败</title>

</head>
<style>
body{
	background:url(images/lbg.jpg);
}
#all{
	"margin:auto;
	width:80%;
	text-align:center"
}
</style>
<body>
<div style = "height:20%"></div>
<div id = "all"style = "margin:auto;width:80%;text-align:center">
 <div><img src = "images/fail.gif"></div>
 <div><h1>出错啦!</h1></div>
 <div><h1>点击<a href = "javascript:history.go(-1)">此处</a>返回上一页，</h1></div>
 <div><h1>或者3秒后自动跳转</h1></div>
</div>
</body>
<script type="text/javascript">
function go()
{
	window.history.go(-1);
	}
	setTimeout("go()",3000);
</script>
</html>