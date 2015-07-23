/**
 * 
 */
function museWrite(root,boardNum,pageNumber,museName){
	$.ajax({
		url:root+"/museBoard/write.do?muse_name="+museName+"&boardNum="+boardNum+"&pageNumer="+pageNumber,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
		//	alert(realData);
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"","/indiscene/Test01.jsp");//다음페이지에 히스토리 저장
			$.getScript(root+"/js/recorderjs/recorderInit.js");
			$.getScript(root+"/js/recorderjs/recorder.js");
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	}); 
}

function museWriteOk(root){
	var str =CKEDITOR.instances.content.getData();
//	dataSet.append("content", str);
	$("#content").val(str);
	var dataSet = new FormData(document.getElementById("museWriteForm"));
//	alert($("#content").val());
	
	$.ajax({
		url:root+"/museBoard/write.do",
		type:"post",
		dataType:"html",
		data:dataSet,
		contentType:false,
		processData:false,
		success:function(data){
			var realData = data.split("<body>");
			var realData = realData[1].split("</body>")[0];
			$("#centerContents").html(realData);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}

/*function record(artist_id,root){
	if($("#recordButton > img").attr("src")==root+"/resources/museBoard/Mic.jpg"){
		$("#recordButton > img").attr("src",root+"/resources/museBoard/Mic2.jpg");
		recorderSetting();
		$("#recordBox").css("display","inline");
	}else{
		$("#recordButton > img").attr("src",root+"/resources/museBoard/Mic.jpg");
		$("#recordBox").css("display","none");
	}
}*/

function museList(root,pageNumber,museName){
	$.ajax({
		url:root+"/museBoard/list.do?muse_name="+museName+"&pageNumber="+pageNumber,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
		//	alert(realData);
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"","/indiscene/Test01.jsp");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	}); 
}

function museRead(root,boardNum,currentPage,museName){
	$.ajax({
		url:root+"/museBoard/read.do?boardNum="+boardNum+"&pageNumber="+currentPage+"&muse_name="+museName,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
		//	alert(realData);
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"","/indiscene/Test01.jsp");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	}); 
}

function museUpdate(root, boardNum, currentPage,museName){
	$.ajax({
		url:root+"/museBoard/update.do?boardNum="+boardNum+"&pageNumber="+currentPage+"&muse_name="+museName,
		type:"get",
		dataType:"html",
		success:function(data){
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"","/indiscene/Test01.jsp");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}

function museUpdateOk(root){
	var str =CKEDITOR.instances.content.getData();
//	dataSet.append("content", str);
	$("#content").val(str);
	var dataSet = new FormData(document.getElementById("museWriteForm"));
//	alert($("#content").val());
//	alert(CKEDITOR.instances.content);
	$.ajax({
		url:root+"/museBoard/update.do",
		type:"post",
		dataType:"html",
		data:dataSet,
		contentType:false,
		processData:false,
		success:function(data){
			var realData = data.split("<body>");
			var realData = realData[1].split("</body>")[0];
			$("#centerContents").html(realData);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}

function museDelete(root,boardNum,currentPage,museName){
	$.ajax({
		url:root+"/museBoard/delete.do?boardNum="+boardNum+"&pageNumber="+currentPage+"&muse_name="+muse_name,
		type:"get",
		dataType:"html",
		success:function(data){
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"","/indiscene/Test01.jsp");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}

function museDeleteOk(root){
	var dataSet = new FormData(document.getElementById("deleteForm"));
//	alert($("#content").val());
//	alert(CKEDITOR.instances.content);
	$.ajax({
		url:root+"/uploadBoard/delete.do",
		type:"post",
		dataType:"html",
		data:dataSet,
		contentType:false,
		processData:false,
		success:function(data){
			var realData = data.split("<body>");
			var realData = realData[1].split("</body>")[0];
			$("#centerContents").html(realData);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}

function prepareCollabo(){
	var audio1=document.createElement("audio");
	var audio2=document.createElement("audio");
	var audio1Can = false;
	var audio2Can = false;
	
	audio1.src=$("#originalMusicPath").val();
	
	$("#prevListen").click(function(){
		audio2.src=$("#mergeFile").val();
	});
	
	audio1.onloadeddata=function(){
		audio1Can=true;
//		alert(audio1Can);
	}
	
	audio2.onloadeddata=function(){
		audio2Can=true;
		$("#syncControl").css("display","block");
//		alert(audio2Can);
	}
	
	$("#playCollabo").click(function(){
//		audio1.volume=0.5;
		audio2.volume=0.5;

//		audio1.load();
		audio2.load();
		
		if(audio1Can && audio2Can){
//			audio1.play();
			audio2.play();
		}else{
			alert("음원이 아직 준비가 되지 않았습니다. 잠시후 다시 버튼을 눌러주세요");
		}
	});
	
	$("#originalVolumeUp").click(function(){
		if(audio1.volume!=1){
			audio1.volume=audio1.volume+0.1;
		}
	});
	$("#originalVolumeDown").click(function(){
		if(audio1.volume!=0){
			audio1.volume=audio1.volume-0.1;
		}
	});
	
	$("#extraVolumeUp").click(function(){
		if(audio2.volume!=1){
			audio2.volume=audio2.volume+0.1;
		}
	});
	$("#extraVolumeDown").click(function(){
		if(audio2.volume!=0){
			audio2.volume=audio2.volume-0.1;
		}
	});
	$("#syncController").bind("change",function(){
		var sync=$("#syncController").val();
		var prevSync= $("#syncSave").val();
		
		if(prevSync>=0){
			audio2.currentTime=audio2.currentTime-prevSync;
		}else{
			audio1.currentTime=audio1.currentTime+prevSync;
		}
		
		if(sync>=0){
			audio2.currentTime= audio2.currentTime+sync;
		}else{
			audio1.currentTime= audio1.currentTime-sync;
		}
		
		$("#syncSave").val(sync);
	});
	$("#syncAdopt").click(function(){
		var data = new FormData(document.getElementById("museWriteForm"));
		alert("콜라보를 진행합니다. 다음 메시지까지 기다려주세요.")
	    $.ajax({
	        url: $("#root").val()+'/museBoard/collaboAdopt.do',
	        type: "post",
	        dataType: "text",
	        data: data,
	        // cache: false,
	        processData: false,
	        contentType: false,
	        success: function(data, textStatus, jqXHR) {
//		            alert(data);
	        	$("#mergeFile").val($("#root").val()+data);
	        	alert("콜라보가 완료되었습니다.");
	        }, error: function(jqXHR, textStatus, errorThrown) {
	        	
	        },
	    });
	});
	
	var audioPlaying=false;
	$("#recordToggleImg").click(function(){
		if(audioPlaying){
			audio1.pause();
			audio1.currentTime=0;
			audioPlaying=false;
		}else{
			audio1.play();
			audioPlaying=true;
		}
	});
}

function museCollabo(root, boardNum,pageNumber,museName){
	$.ajax({
		url:root+"/museBoard/collabo.do?boardNum="+boardNum+"&pageNumber="+pageNumber+"&muse_name="+museName,
		type:"get",
		dataType:"html",
		success:function(data){
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
			$("#centerContents").html(realData);
			$.getScript(root+"/js/recorderjs/recorderInit.js");
			$.getScript(root+"/js/recorderjs/recorder.js");
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}

function museCollaboOk(root, boardNum,pageNumber){
	var str =CKEDITOR.instances.content.getData();
	$("#content").val(str);
	var dataSet = new FormData(document.getElementById("museWriteForm"));
	
	$.ajax({
        url: $("#root").val()+'/museBoard/collabo.do',
        type: "post",
        dataType: "html",
        data: dataSet,
        // cache: false,
        processData: false,
        contentType: false,
        success: function(data, textStatus, jqXHR) {
	       	var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
			$("#centerContents").html(realData);
        }, error: function(jqXHR, textStatus, errorThrown) {
        	
        },
    });
}
/*
function museLike(root,boardNum,artist_id){
	$.ajax({
		url:root+"/museBoard/like.do?boardNum="+boardNum+"&artist_id="+artist_id,
		type:"get",
		dataType:"text",
		success:function(data){
			alert(data);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}
*/

function museMusicStorage(root,artist_id,muse_name){
	var musicL = "";
	$(".musicCheckBox:checked").each(function (){
		musicL=musicL+$(this).val()+",";
	});
	
	$.ajax({
		url:root+"/webPlayer/musicListAppend.do?artist_id="+artist_id+"&muse_name="+muse_name+"&musicList="+musicL,
		type:"get",
		dataType:"text",
		success:function(data){
			var gettedMusicList = data.split("<end>");
			alert(gettedMusicList[0]);
			
			for(var i =1; i<gettedMusicList.length-1; i++){
				var gettedMusicInfo = gettedMusicList[i].split("<cut>");
//				alert(gettedMusicList[i]);
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
				alert($(this).children(".sourcePath").val());
				$(audio).attr("src",$(this).children(".sourcePath").val());
			});
			$(".listDelete").click(function(){
//				alert(root+"\n"+artist_id+"\n"+$(this).prev().children(".musicBoardNum").val());
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

function museToUpload(root,board_num,artist_id,muse_name){
	$.ajax({
		url:root+"/museBoard/museToUpload.do?boardNum="+boardNum+"&artist_id="+artist_id+"&muse_name="+muse_name,
		type:"get",
		dataType:"text",
		success:function(data){
			/*var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
			$("#centerContents").html(realData);*/
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}