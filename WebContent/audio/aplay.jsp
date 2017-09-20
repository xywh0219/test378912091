<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s"  uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<link rel = "stylesheet" href="../css/styles.css" type="text/css"/>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>播放</title>

</head>
<style>
body{
	background:url(images/bg2.jpg)!important;
	opacity:.6;
}
#audioTime1{
	background-color:#000;
	opacity:.9;
	color:#c4c3c3;
	font-family: Microsoft Yahei,'\5b8b\4f53',Arial,Verdana;
    font-size: 13px;
    border:0px;
}
.content{
	opacity:.75;
	background:bule;
}
.lrccontent{
	margin-top:-20%
}

</style>
<body >
<audio class="music" id="myAudio" ontimeupdate = "myFunction(this)">
<s:iterator value="listn" var="n">
<source src="<s:property value='#n.aadd'/>">
</s:iterator>
</audio>
<div class = "navWrap">
	<div class = "nav">
		<ul class = "homeNav" style = "font-size:22px;color:#FFF">
			<li style = "width:150px">首页</li>
			<li style = "width:150px">我的歌单</li>
			<li style = "width:150px">歌单榜</li>
		</ul>
		<ul class = "secondMenu" id = "secondMenu" style = "display:none"></ul>
		<ul class = "subNav" style = "font-size:22px;color:#FFF">
			<li style = "width:75px">商城</li>
			<li style = "width:150px">意见反馈</li>
		</ul>
	</div>
</div>
<div class = "content" style = "hieght:422px";>
	<div class = "singerContent clearfix" style = "margin-top:15%";>
		<div class = "album fl">
			<div class = "albumImg">
			<img id = "audiopic" src = "<s:property value='#n.pic'/>"></div>			
		</div>
		<div class = "songContent fl">
			<div class = "songName clearfix">
				<span class = "audioName" id = "audioName1"><s:property value="#n.aname"/></span>
			</div>
			<div class = "songDetail clearfix">
				<span>歌手：</span><span class = "audioplayer"></span>
			</div>
			<div class = "songWordContent songWordContentM jspScrollable"
			style = "height:235px;padding:0px; width:460px;"tabindex = "0">
				<div id = "lrccontent" style = "width:460px;height:235px";><h1 style = "font-size:22px">暂无歌词</h1>
					<div class = "jspPane" style = "padding:0px; top:-102px;width:448px;">				
					</div>			
			</div>
		</div>
</div>
</div>
</div>
<!-- 播放条 -->
<div class="audio-module playerbg" id="audioModule">
	<div class="module-bg"></div>
	<div class="player-module">
<!--  模块左部分：上一首，播放，暂停，下一首  -->
        <div class="controls-left">
        	<a class="icon icon-playbar-prev" id="prev"></a>
        	<a class="icon icon-playbar-play" id="toggle" onclick="audioPlay()"></a>
       	 <a class="icon icon-playbar-next" id="next"></a>
        </div>
<!-- 模块中间部分：容器  -->
    <div class="controls-bar">
<!-- 模块中间部分：上半部分：歌曲信息 -->
    <div class="song-info">
<!-- 歌曲名 -->
    	<div class="like-song">
			<div class="controls-songName" title="">
             	<span class="songName" id="songName">歌曲名：<s:property value="#n.aname"/>--<s:property value = "#n.audioplayer"/></span>
    	</div>
    	<pre class="songName" id="songNameTemp">我的音乐地盘</pre>
    	</div>
<!-- 时长 -->
    	<div class="coding-duration">
         <span id = "audioTime"><input id="audioTime1" type="text" disabled style="width:70px"/></span>
    	</div>
	</div>
<!-- 模块中间部分：下半部分：播放控制条容器 -->
    <div class="bar" id="bar">
<!-- 播放进度背景（自适应） -->
    <div class="bg" id="progress_bg">
         <span class="icon icon-playbar-bgleft" id="bg_left"></span>
         <span class="bg-middle barBG" id="bg_middle"></span>
         <span class="icon icon-playbar-bgright" id="bg_right"></span>
    </div>
<!-- 播放进度条（自适应） -->
    <div class="progress-bar" id="progress_bar">
         <span class="icon icon-playbar-progressleft" id="progress_left"></span>
         <div class="progress-middle" id="progress_middle">
              <span class="progress barProgress" id="progress"></span>
         </div>
    </div>
<!-- 播放定位头（自适应） -->
    	<div class="drag-playhead" id="drag_playhead">
         	<span class="icon icon-playbar-playhead" id="playhead"></span>
    	</div>
	</div>
    </div>
<!-- 模块右部分：容器 -->
    <div class="controls-right">
<!-- 模块右部分： 音量控制面板 -->
         <div class="mode-volume-list">
<!-- 音量开关控制按钮 -->
              <div class="volume-icon" id="volume">
                   <span class="icon icon-playbar-maxvox" id="volume_icon"></span>
              </div>
<!-- 音量控制面板 -->
              <div class="volume-panel" id="volume_panel">
                   <div class="volume-control" id="volume_control">
                        <span class="icon icon-playbar-progressbottom" id="volume_bottom"></span>
                        <div class="volume-bar" id="volume_bar">
                             <span class="volume-progress volumeProgress" id="volume_progress"></span>
                        </div>
                   <div class="volume-head" id="volume_head">
                        <span class="icon icon-playbar-volumehead" id="volumehead"></span>
                   </div>
               	   </div>
               </div>
               <div class="play_tips">已添加到播放列表</div>
<!-- 播放模式 -->
        			<a class="icon icon-playbar-cycle" id="mode"></a>
                        <div class="mode-panel" id="mode_panel">
                            <ul>
                                <li>
                                    <a class="loop mode-selected" id="loop" href="javascript:;" hidefocus="true">
                                        <span class="icon icon-playbar-cycle active" id="loop_icon"></span>
                                        <span class="loop-name" id="loop_name">列表循环</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="single " id="single" href="javascript:;" hidefocus="true">
                                        <span class="icon  icon-playbar-singlecycle " id="single_icon"></span>
                                        <span class="single-name" id="single_name">单曲循环</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="random" id="random" href="javascript:;" hidefocus="true">
                                        <span class="icon icon-playbar-randomcycle" id="random_icon"></span>
                                        <span class="random-name" id="random_name">随机播放</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
<!-- 下载 -->
                        <a href="javascript:;" class="icon icon-playbar-download" id="pb_download" ></a>
<!-- 分享 -->
                            <a href="javascript:;" class="icon icon-playbar-share" id="pb_share"></a>

                            <a class="icon list" id="list">
                                <span class="list-count" id="list_count"></span>
                            </a>
                    </div>
                </div>
                <div class="mod-playlist" id="mod-playlist" data-hide="true">
                    <div class="song-box">
                        <div class="box-header">   
                            <div class="title">播放队列/<span></span></div>
                            <div class="action-box fr">
                                <span class="icon list-menu-icon-del clear" title="清空"></span>
                                <span class="line"></span>
                                <span class="icon list-menu-icon-close closePlayList" id = "listclose" title="关闭播放队列"></span>
                            </div>
                        </div>
                        <div id="musicbox" class="musicbox ">
                            <div class="songjsAction jspScrollable" tabindex="0" style = "overflow: hidden; padding:0px; width:470px;">
                               <div class = "jspContainer" style="width:470px;height:360px;">
                              		<div class = "jspPane" style="top:0px;width:458px;">
                              			<div class = "musiclist" id = "playbylist">
                              			<s:iterator value="listn" var="n" status = "sta">
                              				<li>
                              					<div class = "musiclist-item clearfix" id ="playone<s:property value = "#sta.index+1"/>">
                              						<span class = "musiclist-number"><s:property value = "#sta.index+1"/></span>
                              						<div class = "musiclist-name">
                              							<span class = "musiclist-songname-txt" title="歌曲名" id = "playonename<s:property value = "#sta.index+1"/>"><s:property value="#n.aname"/></span>
                              							<span id = "hidesrc<s:property value = "#sta.index+1"/>" style = "display:none"><s:property value="#n.aadd"/></span>
                              							<span id = "hidelrc<s:property value = "#sta.index+1"/>" style = "display:none"><s:property value="#n.lrc"/></span>
                              							<span id = "hidepic<s:property value = "#sta.index+1"/>" style = "display:none"><s:property value="#n.pic"/></span>
                              							<div class = "mod-list-menu">
                              								<a href = "" class = "icon list-menu-item icon-playbar-download list-action-down" title = "下载">
                              									<i class = "icon list-menu-down"></i>
                              									<span class = "icon_txt">下载</span>
                              								</a>
                              								<a href = "" class = "icon list-menu-item icon-playbar-share list-action-share" title = "分享">
                              									<i class = "icon list-menu-icon-share"></i>
                              									<span class = "icon_txt">分享</span>
                              								</a>
                              								<a href = "" class = "icon list-menu-item list-menu-icon-del list-action-del" title = "删除歌曲">
                              									<i class = "icon list-menu-icon-add"></i>
                              									<span class = "icon_txt">删除</span>
                              								</a>
                              								
                              							</div>
                              						</div>
                              						<div class = "musiclist-artist" title="歌手" id = "playoneer<s:property value = "#sta.index+1"/>"><s:property value="#n.audioplayer"/></div>
                              						<div class = "musiclist-time"></div>
                              						
                              					</div>
                              				</li>
                              				</s:iterator>
                              			</div>                              		
                              		</div>                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>           
        </div>
    </div>


<!--<script type="text/javascript" src = "js/test.js"></script>-->
<script src = "js/jquery-1.7.2.js"></script>
<script src = "js/jquery.fireworks.js" type="text/javascript"></script>
<script type="text/javascript">
	var myAudio = document.getElementById("myAudio");
    var toggle = document.getElementById("toggle");
    var audioTime1 = document.getElementById("audioTime1");
    var changetime = document.getElementsByTagName("change-time");
    var alltime = document.getElementsByTagName("all-time");
    var playhead = document.getElementById("playhead");
	var progress = document.getElementById("progress");
	var drag_playhead = document.getElementById("drag_playhead");
	var volume_icon = document.getElementById("volume_icon");
	var lrccontent = document.getElementById("lrccontent");

//播放及控制按钮变化
function audioPlay(){
    if (null != myAudio) {
        myAudio.paused ? (myAudio.play(), toggle.className = "icon icon-playbar-pause") : (myAudio.pause(), toggle.className = "icon icon-playbar-play");
    }
};
//播放进度显示
function myFunction(event){
		var currentTime = Math.round(myAudio.currentTime*Math.pow(10,1))/Math.pow(10,1);
		var totalTime = Math.round(myAudio.duration*Math.pow(10,1))/Math.pow(10,1);
		audioTime1.value = currentTime+"/"+totalTime;
		playhead.style.marginLeft = (currentTime/totalTime)*100 + "%";
		progress.style.width = (currentTime/totalTime)*100 + "%";
		
		
		lrccontent.style.marginTop = "-" + (currentTime/totalTime)*300 + "%";
		
		if(myAudio.ended){
			playhead.value=0;
			toggle.className = "icon icon-playbar-play";
		}
};
//拖动进度条改变播放进度
drag_playhead.onmousedown = function(){
	myAudio.pause();
};
drag_playhead.onmouseup = function(e){
	var totalTime = Math.round(myAudio.duration*Math.pow(10,1))/Math.pow(10,1);
	var laststr = e.clientX;
	myAudio.currentTime = ((laststr-"750")/"370")*totalTime;
	toggle.className = "icon icon-playbar-pause";
	myAudio.play();
};
//音量-静音
volume_icon.onclick = function(){
	if(!myAudio.muted){
		volume_icon.className = "icon icon-playbar-maxvox icon-playbar-silence";
		myAudio.muted = true;
	}else{
		volume_icon.className = "icon icon-playbar-maxvox";
		myAudio.muted = false;
	}
};
//音量控制条(未实现)
var volume_panel = document.getElementById("volume_panel");
volume_panel.onmouseover = function(){
	volume_panel.style.display = block;
};
//歌单
var list = document.getElementById("list");
var modplaylist = document.getElementById("mod-playlist");
var flag = 0;
list.onclick = function(){
	if(flag == 0){
	modplaylist.style = "bottom:80px";
	flag = 1;
	}else{
		modplaylist.style = "bottom:-410px";
		flag = 0;
	}
};
var listclose = document.getElementById("listclose");
listclose.onclick = function(){
	modplaylist.style = "bottom:-410px";
	flag = 0;
};
//点击歌单歌曲播放
var playbylist = document.getElementById("playbylist");
playbylist.onclick = function(e){
	var ypoint = e.clientY;
	flag = Math.floor((ypoint-450)/50);
	console.log(flag);
	myAudio.pause();
	document.getElementById("myAudio").src = document.getElementById("hidesrc"+flag).innerHTML;
	console.log(document.getElementById("hidesrc"+flag).innerHTML);
	toggle.className = "icon icon-playbar-pause";
	document.getElementById("songName").innerHTML = "歌曲名：" + document.getElementById("playonename"+flag).innerHTML + "--" + document.getElementById("playoneer"+flag).innerHTML;
	document.getElementById("audioName1").innerHTML = document.getElementById("playonename"+flag).innerHTML;
	
	document.getElementById("audiopic").src = document.getElementById("hidepic"+flag).innerHTML;
	var lrcsrc = document.getElementById("hidelrc"+flag).innerHTML;
	$.ajax({
		url:lrcsrc,
		dataType:'text',
		success: function(data){
			var data = parseLyric(data);
		}
	});	
	
	myAudio.play();
};
//上一曲
//利用了歌单的flag，待优化
var prev = document.getElementById("prev");
prev.onclick = function(){
	myAudio.pause();
	flag = flag - 1;
	console.log(document.getElementById("hidesrc"+flag).innerHTML);
	document.getElementById("myAudio").src = document.getElementById("hidesrc"+flag).innerHTML;
	toggle.className = "icon icon-playbar-pause";
	document.getElementById("songName").innerHTML = "歌曲名：" + document.getElementById("playonename"+flag).innerHTML + "--" + document.getElementById("playoneer"+flag).innerHTML;
	document.getElementById("audioName1").innerHTML = document.getElementById("playonename"+flag).innerHTML;
	
	document.getElementById("audiopic").src = document.getElementById("hidepic"+flag).innerHTML;
	var lrcsrc = document.getElementById("hidelrc"+flag).innerHTML;
	$.ajax({
		url:lrcsrc,
		dataType:'text',
		success: function(data){
			var data = parseLyric(data);
		}
	});	
	
	myAudio.play();
};


//下一曲
var next = document.getElementById("next");
next.onclick = function(){
	myAudio.pause();
	flag = flag + 1;
	document.getElementById("myAudio").src = document.getElementById("hidesrc"+flag).innerHTML;
	toggle.className = "icon icon-playbar-pause";
	document.getElementById("songName").innerHTML = "歌曲名：" + document.getElementById("playonename"+flag).innerHTML + "--" + document.getElementById("playoneer"+flag).innerHTML;
	document.getElementById("audioName1").innerHTML = document.getElementById("playonename"+flag).innerHTML;
	
	document.getElementById("audiopic").src = document.getElementById("hidepic"+flag).innerHTML;
	var lrcsrc = document.getElementById("hidelrc"+flag).innerHTML;
	$.ajax({
		url:lrcsrc,
		dataType:'text',
		success: function(data){
			var data = parseLyric(data);
		}
	});	
	
	myAudio.play();
};
//歌词
$(function(){
	var lrcstart = document.getElementById("hidelrc1").innerHTML;
	console.log(lrcstart);
	if(lrcstart == ""){
	}else{
	$.ajax({
		url:lrcstart,
		dataType:'text',
		success: function(data){
			var data = parseLyric(data);
		}
	});
  }
});
function parseLyric(data) {
	var reg = /\[\d*:\d*((\.|\:)\d*)*\]/g;
	lyric = data.replace(reg,'<br>');
	document.getElementById("lrccontent").innerHTML = lyric;
};

$('.content').fireworks({
	sound : false,
	opacity:0.9,
});
</script>
<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>

</body>

</html>