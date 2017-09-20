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
<title>摘星</title>
    <link rel="stylesheet" href="css/tabris.css">
    <link rel="stylesheet" href="css/lib.css">

<style>

*,  *:before,  *:after { box-sizing: border-box; margin: 0; padding: 0; }
.container { 
	text-align: center; 
}
section { 
	width: 30%; 
	display: inline-block; 
	text-align: center; 
	min-height: 215px; 
	vertical-align: top; 
	margin: 1%; 
	background: #080915; 
	border-radius: 5px; 
	box-shadow: 0px 0px 30px 1px #103136 inset; 
}
.loader { 
	position: absolute; 
	width: 60px; 
	height: 60px; 
	border-radius: 50%; 
	margin: 75px; 
	display: inline-block; 
	vertical-align: middle; 
}
.loader-star { 
	position: absolute; 
	top: calc(50% - 12px); 
}



.loader-14 .loader-star { 
	position: absolute; 
	top: calc(50% - 12px); 
	left: calc(50% - 12px); 
}
.star-small { 
	-webkit-animation: star-small-pulse 1s ease-in-out alternate infinite; 
	animation: star-small-pulse 1s ease-in-out alternate infinite; 
}
.loader-14 .star-big { 
	-webkit-animation: star-big-pulse 2s -0.2s ease-in-out infinite; 
	animation: star-big-pulse 2s -0.2s ease-in-out infinite; 
}
 
 @-webkit-keyframes star-small-pulse {
 0% {
 -webkit-transform: scale(1);
 transform: scale(1);
}
 100% {
 -webkit-transform: scale(2);
 transform: scale(2);
}
}
 @keyframes star-small-pulse {
 0% {
 -webkit-transform: scale(1);
 transform: scale(1);
}
 100% {
 -webkit-transform: scale(2);
 transform: scale(2);
}
}
 @-webkit-keyframes star-big-pulse {
 0% {
 -webkit-transform: scale(0);
 transform: scale(0);
 opacity: 1;
}
 100% {
 -webkit-transform: scale(5);
 transform: scale(5);
 opacity: 0;
}
}
 @keyframes star-big-pulse {
 0% {
 -webkit-transform: scale(0);
 transform: scale(0);
 opacity: 1;
}
 100% {
 -webkit-transform: scale(5);
 transform: scale(5);
 opacity: 0;
}
}

#loader1{
	margin-left:-40%;
	margin-top:10%;
}
#loader2{
	margin-left:15%;
	margin-top:10%;
}
#loader3{
	margin-left:-25%;
	margin-top:30%;
}
#loader4{
	margin-left:30%;
	margin-top:30%;
}
#menu{
	width:300px;
	color:#FFF;
	font-size:36px;
	font-family:STHupo;
}
#sheet1,#sheet2,#sheet3,#sheet4{
	display:none;
	width:300px;
	color:#FFF;	
}
</style>

</head>
<body>

<s:iterator value="listu" var="u" >
会员<span id = "username"><s:property value = "#u.uname"/></span>，欢迎回来。
</s:iterator>

<div class="bg0 pa">
        <div class="bg1"></div>
    </div>
    <div class="hx-box pa">
        <ul class="pr">
            <li class="hx-k1 pa0">
                <span></span>
            </li>
            <li class="hx-k2 pa0">
                <span></span>
            </li>
            <li class="hx-k3 pa0">
                <span></span>
            </li>
        </ul>
    </div>
<div class = "container">
  <section>
    <div class="loader loader-14" id = "loader1">
    <div id = "sheet1">
    <span id = "menu1">我的歌单</span>
    <s:iterator value="lists" var="s" >
    <li>
    	<div id ="sheet">
    		<span><s:property value="#s.sname"/>--<s:property value="#s.sstyle"/></span>
    		<span><a href="sheet/sheetAction!openSheet?sheet.sno=<s:property value='#s.sno'/>">打开</a></span>
    	</div>
    </li>
    </s:iterator>
    </div>
      <svg class="loader-star star-small" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="46.344px" height="46.692px" viewBox="0 0 46.344 46.692" xml:space="preserve">
            <polygon fill="#C4C400" points="23.172,0 17.728,17.8 0,17.8 14.386,28.894 8.942,46.692 23.172,35.68 37.478,46.692 33.54,29.97 46.344,17.8 28.612,17.8  "></polygon>
         </svg>
      <svg class="loader-star star-big" id = "star1" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="46.344px" height="46.692px" viewBox="0 0 46.344 46.692" xml:space="preserve">
            <polygon fill="#E1E100" points="23.172,0 17.728,17.8 0,17.8 14.386,28.894 8.942,46.692 23.172,35.68 37.478,46.692 33.54,29.97 46.344,17.8 28.612,17.8  "></polygon>
         </svg>
    </div>
    <div class="loader loader-15" id = "loader2">
     <div id = "sheet2">
      <span id = "menu2">巨星榜</span>
     </div>
      <svg class="loader-star star-small" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="46.344px" height="46.692px" viewBox="0 0 46.344 46.692" xml:space="preserve">
            <polygon fill="#95CACA" points="23.172,0 17.728,17.8 0,17.8 14.386,28.894 8.942,46.692 23.172,35.68 37.478,46.692 33.54,29.97 46.344,17.8 28.612,17.8  "></polygon>
         </svg>
      <svg class="loader-star star-big" version="1.1" id = "star2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="46.344px" height="46.692px" viewBox="0 0 46.344 46.692" xml:space="preserve">
            <polygon fill="#A3D1D1" points="23.172,0 17.728,17.8 0,17.8 14.386,28.894 8.942,46.692 23.172,35.68 37.478,46.692 33.54,29.97 46.344,17.8 28.612,17.8  "></polygon>
         </svg>
    </div>
    <div class="loader loader-16" id = "loader3">
    <div id = "sheet3">
     <span id = "menu3">今日推荐</span>
     <s:iterator value="listall" var="al" >
       <li>
    	<div>
    		<span><s:property value="#al.aname"/>--<s:property value="#al.astyle"/></span>
    		<span><a href="audio/audioAction!playAudio?audio.aid=<s:property value='#al.aid'/>">播放</a></span>
    	</div>
       </li>
    </s:iterator>
    </div>
      <svg class="loader-star star-small" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="46.344px" height="46.692px" viewBox="0 0 46.344 46.692" xml:space="preserve">
            <polygon fill="#FF9224" points="23.172,0 17.728,17.8 0,17.8 14.386,28.894 8.942,46.692 23.172,35.68 37.478,46.692 33.54,29.97 46.344,17.8 28.612,17.8  "></polygon>
         </svg>
      <svg class="loader-star star-big" version="1.1" id = "star3" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="46.344px" height="46.692px" viewBox="0 0 46.344 46.692" xml:space="preserve">
            <polygon fill="#FFA042" points="23.172,0 17.728,17.8 0,17.8 14.386,28.894 8.942,46.692 23.172,35.68 37.478,46.692 33.54,29.97 46.344,17.8 28.612,17.8  "></polygon>
         </svg>
    </div>
    <div class="loader loader-17" id = "loader4">
     <div id = "sheet4">
      <span id = "menu4">歌单榜</span>
      <s:iterator value="listsall" var="sa" >
       <li>
    	<div>
    		<span><s:property value="#sa.sname"/>--<s:property value="#sa.sstyle"/></span>
    		<span><a href="sheet/sheetAction!openSheet?sheet.sno=<s:property value='#sa.sno'/>">打开</a></span>
    	</div>
       </li>
    </s:iterator>
     </div>
      <svg class="loader-star star-small" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="46.344px" height="46.692px" viewBox="0 0 46.344 46.692" xml:space="preserve">
            <polygon fill="#8600FF" points="23.172,0 17.728,17.8 0,17.8 14.386,28.894 8.942,46.692 23.172,35.68 37.478,46.692 33.54,29.97 46.344,17.8 28.612,17.8  "></polygon>
         </svg>
      <svg class="loader-star star-big" version="1.1" id = "star4" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="46.344px" height="46.692px" viewBox="0 0 46.344 46.692" xml:space="preserve">
            <polygon fill="#921AFF" points="23.172,0 17.728,17.8 0,17.8 14.386,28.894 8.942,46.692 23.172,35.68 37.478,46.692 33.54,29.97 46.344,17.8 28.612,17.8  "></polygon>
         </svg>
    </div>
  </section>
</div>

</body>
<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
<script type="text/javascript">
var star1 = document.getElementById("star1");
var menu1 = document.getElementById("menu1");
var sheet1 = document.getElementById("sheet1");
star1.onmouseover = function(){
	sheet1.style = "display:block";
};
var star2 = document.getElementById("star2");
var menu2 = document.getElementById("menu2");
star2.onmouseover = function(){
	sheet2.style = "display:block";
}
var star3 = document.getElementById("star3");
var menu3 = document.getElementById("menu3");
star3.onmouseover = function(){
	sheet3.style = "display:block";
}
var star4 = document.getElementById("star4");
var menu4 = document.getElementById("menu4");
star4.onmouseover = function(){
	sheet4.style = "display:block";
}
</script>
</html>