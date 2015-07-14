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
