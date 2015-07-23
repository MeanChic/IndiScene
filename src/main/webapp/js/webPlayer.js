/* 
		@name : Web Player
		@date : 2015-06-22
		@author : Kim Min Sic
		@description : Music Player in Web using javavscript 
*/
	var audio = document.createElement("audio");
	$(function(){
		/* 오디오 태그 생성을 통한  웹플레이어 준비*/
		var index = 1 ;
		audio.volume = 0.5;
		$(audio).attr("preload","auto");
		
		/* 음원 재생 끝날 시 다음 곡 재생 */
		$(audio).bind("ended",function(){
			index++;
			
			if(index==$(".audioList").length+1){
				index=1;
			}
			
			currentTime=0;
			$(audio).attr("src",$(".sourcePath:eq("+index+")").val());
		});
		
		/* 시간 진행에 따른 시간 재생 바 변경 */
		$(audio).bind("timeupdate",timeChange);
		
		/* 재생 리스트 추가 시 플레이 리스트에 추가. */
		/*$("#listBtn").click(function(){
			for(var i = 0 ; i < $("input[name='musicList']").length; i++){
			//	alert($("input[name='musicList']:eq("+i+")").prop("checked"));
				if($("input[name='musicList']:eq("+i+")").prop("checked")){	
					$("#audioList").append("<li>"+$("input[name='musicList']:eq("+i+")").next(".musicName").text()+"</li>");
					$("#audioList").append("<input type='hidden' class='musicPath' value='"+$("input[name='musicList']:eq("+i+")").val()+"'/>")
				}
					 alert($("input[name='musicList']:checked").next(".musicName").text()); 
			}
		});*/
		
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
				$(audio).attr("src",$(".sourcePath:eq("+index+")").val());
//				$("#play").attr("src","/indiscene/resources/stop.png");
//				$("#play > span").toggleClass("glyphicon glyphicon-pause");
				$("#play > span").attr("class","glyphicon glyphicon-pause");
			}else{
				$(audio).unbind("timeUpdate",timeChange);
				currentTime=audio.currentTime;
 				audio.pause(); 
// 				$("#play").attr("src","/indiscene/resources/play.png");
// 				$("#play > span").toggleClass("glyphicon glyphicon-play");
 				$("#play > span").attr("class","glyphicon glyphicon-play");
			}
		});
		
		/* 이전 곡 버튼 */
		$("#prev").click(function(){
			index--;
			currentTime=0;
			if(index<1){
				index = $(".audioList").length-1;
			}
			$(audio).attr("src",$(".audioList:eq("+index+")").val());
		});
		
		/* 다음 곡 버튼 */
		$("#next").click(function(){
			index++;
			currentTime=0;
			if(index == $(".audioList").length+1){
				index=1;
			}
			$(audio).attr("src",$(".sourcePath:eq("+index+")").val());
		});
		
		/* 음악 진행 바의 value 변경시 음원 재생시간 변경 */
	/*	$("#musicBar").bind("change",function(){
			audio.pause();
			$(audio).unbind("timeUpdate",timeChange);
			audio.currentTime=$(this).val();
			audio.play();
			$(audio).bind("timeUpdate",timeChange);
		});*/
		
		/* 음악 진행 바에 음악 길이 셋팅. */
		function setTime(duration){
	//		alert(duration);
			$("#musicBar").attr("max",duration);
			$("#musicBar").attr("min",0);
		}
		
		/* 볼륨 조절 바. */
		$("#volumeBar").bind("change",function(){
			audio.volume=$(this).val()*0.01;
//			$("#volumeText").text($(this).val());
		});
		
/*		$("#prevMoment").click(function(){
			audio.currentTime= audio.currentTime-10;
		});
		
		$("#nextMoment").click(function(){
			audio.currentTime= audio.currentTime+10;
		});*/
	});
	
	function timeChange(){
		//alert("now playing"); 
//		$("#musicBar").val(audio.currentTime);
		$("#musicBar").css("width",(audio.currentTime/audio.duration)*100+"%");
//		document.getElementById("demo").innerHTML = audio.currentTime + "<br/>" + $("#musicBar").attr("max");
	//	document.getElementById("buffer").innerHTML="버퍼링된 구역 : " + audio.buffered.end(0)+"<br/>탐색가능구역 : " +audio.seekable.end(0)+"<br/>"+audio.seekable.length;
	}
	
	// 이후 Music Player 관한 함수는 BestBoardController를 호출한다.
	function musicStorage(root,artist_id){
		var musicL = "";
		$(".musicCheckBox:checked").each(function (){
			musicL=musicL+$(this).val()+",";
		});
		
		if(musicL==""){
			alert("곡을 선택해 주세요");
			return;
		}
		
		$.ajax({
			url:root+"/webPlayer/musicListAppend.do?artist_id="+artist_id+"&musicList="+musicL,
			type:"get",
			dataType:"text",
			success:function(data){
				var gettedMusicList = data.split("<end>");
				alert(gettedMusicList[0]);
				
				for(var i =1; i<gettedMusicList.length-1; i++){
					var gettedMusicInfo = gettedMusicList[i].split("<cut>");
//					alert(gettedMusicList[i]);
					var audioListDiv = $("#audioListDiv").clone();
					$(audioListDiv).attr("class","audioList");
					$(audioListDiv).find(".musicSubject").text(gettedMusicInfo[0]);
					$(audioListDiv).find(".artistName").text(gettedMusicInfo[1]);
					$(audioListDiv).find(".sourcePath").val(root+gettedMusicInfo[2]);
					$(audioListDiv).find(".musicBoardNum").val(gettedMusicInfo[4]);
					$(audioListDiv).css("display","block");
					$(audioListDiv).appendTo($("#audioList"));
				}
				
				$(".musicClick").click(function(){
//					alert($(this).children(".sourcePath").val());
					$(audio).attr("src",$(this).children(".sourcePath").val());
				});
				$(".listDelete").click(function(){
//					alert(root+"\n"+artist_id+"\n"+$(this).prev().children(".musicBoardNum").val());
					$(this).parents("div.audioList").remove();
					$.ajax({
						url:root+"/webPlayer/musicListDelete.do?artist_id="+artist_id+"&boardNum="+$(this).prev().children(".musicBoardNum").val(),
						type:"get",
						dataType:"text",
						success:function(data){
							alert(data);
						},
						error:function(xhr,status,error){
							alert(xhr+"\n"+status+"\n"+error);
						}
					}); 
				});;
			},
			error:function(xhr,status,error){
				alert(xhr+"\n"+status+"\n"+error);
			}
		}); 
	}

	function getMusicList(root,artist_id){
		$.ajax({
			url:root+"/webPlayer/getMusicList.do?artist_id="+artist_id,
			type:"get",
			dataType:"text",
			success:function(data){
//				alert(data);
				var gettedMusicList = data.split("<end>");
				for(var i =0; i<gettedMusicList.length-1; i++){
					var gettedMusicInfo = gettedMusicList[i].split("<cut>");
//					alert(gettedMusicList[i]);
					var audioListDiv = $("#audioListDiv").clone();
					$(audioListDiv).attr("class","audioList");
					$(audioListDiv).find(".musicSubject").text(gettedMusicInfo[0]);
					$(audioListDiv).find(".artistName").text(gettedMusicInfo[1]);
					$(audioListDiv).find(".sourcePath").val(root+gettedMusicInfo[2]);
					$(audioListDiv).find(".musicBoardNum").val(gettedMusicInfo[4]);
					$(audioListDiv).css("display","block");
					$(audioListDiv).appendTo($("#audioList"));
				}
				$(".musicClick").click(function(){
//					alert($(this).children(".sourcePath").val());
					$(audio).attr("src",$(this).children(".sourcePath").val());
				});
				$(".listDelete").click(function(){
//					alert(root+"\n"+artist_id+"\n"+$(this).prev().children(".musicBoardNum").val());
					$(this).parents("div.audioList").remove();
					$.ajax({
						url:root+"/webPlayer/musicListDelete.do?artist_id="+artist_id+"&boardNum="+$(this).prev().children(".musicBoardNum").val(),
						type:"get",
						dataType:"text",
						success:function(data){
							alert(data);
						},
						error:function(xhr,status,error){
							alert(xhr+"\n"+status+"\n"+error);
						}
					}); 
				});;
			},
			error:function(xhr,status,error){
				alert(xhr+"\n"+status+"\n"+error);
			}
		}); 
	}
