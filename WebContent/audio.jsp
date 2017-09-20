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
<title>播放</title>
 
</head>
<body>
<div id="all">
<div id="main">
	<div>
	<img  src="">
	</div>
	<div id =audioDiv>
	<audio id="myAudio" controls>
		<source src="audio/123.mp3" type="audio/mpeg" />
		<source src="audio/456.mp3" type="audio/mpeg" />
	</audio>
	</div>
</div>
<div id="controlBar">
	<input id="audioPlayer" type="button" value="开始播放"/>
	<input id="audioRange" type="range" width="150px" value="0" max="100"/>
	<input id="audioInfo" type="text" disabled style="width:70px"/>
	<input id="audioVoice" type="button" value="静音"/>
</div>
</div>

<script type="text/javascript">
	var myAudio=document.getElementById("myAudio");
	var audioPlayer=document.getElementById("audioPlayer");
	var audioNext=document.getElementById("audioNext");
	var audioRange=document.getElementById("audioRange");
	var audioVoice=document.getElementById("audioVoice");
	var audioInfo=document.getElementById("audioInfo");
	
	audioPlayer.onclick = function(){
		if(myAudio.paused){
			myAudio.play();
			audioPlayer.value="暂停播放";
		}else{
			myAudio.pause();
			audioPlayer.value="开始播放";
		}
	};
	myAudio.ontimeupdate = function(){
		var currentTime = Math.round(myAudio.currentTime*Math.pow(10,1))/Math.pow(10,1);
		var totalTime = Math.round(myAudio.duration*Math.pow(10,1))/Math.pow(10,1);
		audioInfo.value = currentTime+"/"+totalTime;
		audioRange.value = (currentTime/totalTime)*100;
		if(myAudio.ended){
			andioRange.value=0;
		}
	};
	audioRange.onmousedown = function(){
		myAudio.pause();
	};
	audioRange.onmouseup = function(){
		myAudio.currentTime = myAudio.duration*(audioRange.value/audioRange.max);
		myAudio.play();
	};
	audioVoice.onclick = function(){
		if(!myAudio.muted){
			audioVoice.value="取消静音";
			myAudio.muted = true;
		}else{
			audioVoice.value="静音";
			myAudio.muted = false;
		}
	};
</script>
</body>
</html>