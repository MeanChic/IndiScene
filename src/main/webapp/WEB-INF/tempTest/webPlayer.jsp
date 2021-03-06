<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript">
/* 
		@name : Web Player
		@date : 2015-06-22
		@author : Kim Min Sic
		@description : Music Player in Web using javavscript 
*/
	var audio = document.createElement("audio");
	$(function(){
		/* 오디오 태그 생성을 통한  웹플레이어 준비*/
		var index = 0 ;
		audio.volume = 0.5;
		$(audio).attr("preload","auto");
		
		/* 음원 재생 끝날 시 다음 곡 재생 */
		$(audio).bind("ended",function(){
			index++;
			
			if(index==$(".musicPath").length){
				index=0;
			}
			
			currentTime=0;
			$(audio).attr("src",$(".musicPath:eq("+index+")").val());
		});
		
		/* 시간 진행에 따른 시간 재생 바 변경 */
		$(audio).bind("timeupdate",timeChange);
		
		/* 재생 리스트 추가 시 플레이 리스트에 추가. */
		$("#listBtn").click(function(){
			for(var i = 0 ; i < $("input[name='musicList']").length; i++){
			//	alert($("input[name='musicList']:eq("+i+")").prop("checked"));
				if($("input[name='musicList']:eq("+i+")").prop("checked")){	
					$("#audioList").append("<li>"+$("input[name='musicList']:eq("+i+")").next(".musicName").text()+"</li>");
					$("#audioList").append("<input type='hidden' class='musicPath' value='"+$("input[name='musicList']:eq("+i+")").val()+"'/>")
				}
					/* alert($("input[name='musicList']:checked").next(".musicName").text()); */
			}
		});
		
		var currentTime = 0;		// 음원 재생시간 초기화
		var duration =0;			// 음원 총 길이
		
		/* 음원 준비 완료 시 설정 */
		audio.addEventListener("loadeddata", function() {
		    duration= audio.duration;
		    setTime(duration);
		    if(currentTime!=0){
				audio.currentTime=currentTime;
		//		alert(audio.currentTime);
				audio.play();
			}else{
				audio.play();
			}
		});
		
		/* 재생 버튼 눌렀을 시 이벤트. */
		$("#play").click(function(){
			/* alert($(".musicPath:eq(0)").val()); */
			if(audio.paused == true){
				$(audio).bind("timeUpdate",timeChange);
				$(audio).attr("src",$(".musicPath:eq("+index+")").val());
			}else{
				$(audio).unbind("timeUpdate",timeChange);
				currentTime=audio.currentTime;
 				audio.pause(); 
			}
		});
		
		/* 이전 곡 버튼 */
		$("#prev").click(function(){
			index--;
			currentTime=0;
			if(index<0){
				index = $(".musicPath").length-1;
			}
			$(audio).attr("src",$(".musicPath:eq("+index+")").val());
		});
		
		/* 다음 곡 버튼 */
		$("#next").click(function(){
			index++;
			currentTime=0;
			if(index == $(".musicPath").length){
				index=0;
			}
			$(audio).attr("src",$(".musicPath:eq("+index+")").val());
		});
		
		/* 음악 진행 바의 value 변경시 음원 재생시간 변경 */
		$("#musicBar").bind("change",function(){
			audio.pause();
			$(audio).unbind("timeUpdate",timeChange);
			audio.currentTime=$(this).val();
			audio.play();
			$(audio).bind("timeUpdate",timeChange);
		});
		
		/* 음악 진행 바에 음악 길이 셋팅. */
		function setTime(duration){
	//		alert(duration);
			$("#musicBar").attr("max",duration);
			$("#musicBar").attr("min",0);
		}
		
		/* 볼륨 조절 바. */
		$("#volumeBar").bind("change",function(){
			audio.volume=$(this).val()*0.01;
			$("#volumeText").text($(this).val());
		});
		
		$("#prevMoment").click(function(){
			audio.currentTime= audio.currentTime-10;
		});
		
		$("#nextMoment").click(function(){
			audio.currentTime= audio.currentTime+10;
		});
	});
	
	function timeChange(){
		//alert("now playing"); 
		$("#musicBar").val(audio.currentTime);
		document.getElementById("demo").innerHTML = audio.currentTime + "<br/>" + $("#musicBar").attr("max");
		document.getElementById("buffer").innerHTML="버퍼링된 구역 : " + audio.buffered.end(0)+"<br/>탐색가능구역 : " +audio.seekable.end(0)+"<br/>"+audio.seekable.length;
	}
	
	function write(root){
		$.ajax({
			url:root+"/uploadBoard/write.do",
			type:"get",
			dataType:"html",
			success:function(data){
				//alert(data);
				var realData = data.split("<body>");
				var realData = realData[1].split("</body>")[0];
				alert(realData);
				$("#centerContent").html(realData);
			},
			error:function(xhr,status,error){
				alert(xhr+"\n"+status+"\n"+error);
			}
		}); 
	}
</script>
</head>
<body>
	<div id="audioPlayer">
		
	</div>
	
	<input type="checkbox" name="musicList" value="${root}/resources/musicResource/Gift.mp3"><label class="musicName">박효신-Gift</label>
	<input type="checkbox" name="musicList" value="${root}/resources/musicResource/Love Ballad.mp3"><label class="musicName">브라운아이드소울 - Love Ballad</label>
	<input type="checkbox" name="musicList" value="${root}/resources/musicResource/Rush.mp3"><label class="musicName">리쌍-Rush</label>
	<input type="checkbox" name="musicList" value="${root}/resources/musicResource/ar2.wav"><label class="musicName">김건모-잠못드는밤비는내리고</label>
	<input type="checkbox" name="musicList" value="${root}/resources/musicResource/ar3.wav"><label class="musicName">김건모-잠못드는밤비는내리고2</label>
	<input type="button" id="listBtn" value="추가하기"/>
	<br/>
	<input type="button" id="prev" value="prev"/>
	<input type="button" id="play" value="Play/Pause"/>
	<input type="button" id="next" value="next"/>
	<br/>
	<input id="prevMoment" type="button" value="-10초"/>
	<input id="musicBar" type="range" max="" min="0" step="1" value="0" style="width:300px;"/>
	<input id="nextMoment" type="button" value="+10초"/>
	<input id="volumeBar" type="range" max="100" min="0" step="1" value="50"/>
	<span id="volumeText"></span>
	<div id="demo"></div>
	<ul id="audioList">
		
	</ul>
	
	<br/>
	<div id="buffer"></div>
	
	
	<a href="javascript:write('${root}')">글쓰기</a>
	<div id="centerContent"></div>
</body>
</html>