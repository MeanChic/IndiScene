function uploadWrite(root,boardNum,pageNumber){
	$.ajax({
		url:root+"/uploadBoard/write.do?boardNum="+boardNum+"&pageNumer="+pageNumber,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
		//	alert(realData);
			$("#centerContents").html(realData);
			$.getScript(root+"/js/recorderjs/recorderInit.js");
			$.getScript(root+"/js/recorderjs/recorder.js");
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	}); 
}

function uploadWriteOk(root){
	var str =CKEDITOR.instances.content.getData();
//	dataSet.append("content", str);
	$("#content").val(str);
	var dataSet = new FormData(document.getElementById("uploadWriteForm"));
//	alert($("#content").val());
	
	$.ajax({
		url:root+"/uploadBoard/write.do",
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

function record(artist_id,root){
	if($("#recordButton > img").attr("src")==root+"/resources/uploadBoard/Mic.jpg"){
		$("#recordButton > img").attr("src",root+"/resources/uploadBoard/Mic2.jpg");
		recorderSetting();
		$("#recordBox").css("display","inline");
	}else{
		$("#recordButton > img").attr("src",root+"/resources/uploadBoard/Mic.jpg");
		$("#recordBox").css("display","none");
	}
}

function uploadList(root,pageNumber){
	$.ajax({
		url:root+"/uploadBoard/list.do?pageNumber="+pageNumber,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
		//	alert(realData);
			$("#centerContents").html(realData);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	}); 
}

function uploadRead(root,boardNum,currentPage){
	$.ajax({
		url:root+"/uploadBoard/read.do?boardNum="+boardNum+"&pageNumber="+currentPage,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
		//	alert(realData);
			$("#centerContents").html(realData);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	}); 
}

function uploadUpdate(root, boardNum, currentPage){
	$.ajax({
		url:root+"/uploadBoard/update.do?boardNum="+boardNum+"&pageNumber="+currentPage,
		type:"get",
		dataType:"html",
		success:function(data){
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
			$("#centerContents").html(realData);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}

function uploadUpdateOk(root){
	var str =CKEDITOR.instances.content.getData();
//	dataSet.append("content", str);
	$("#content").val(str);
	var dataSet = new FormData(document.getElementById("uploadWriteForm"));
//	alert($("#content").val());
//	alert(CKEDITOR.instances.content);
	$.ajax({
		url:root+"/uploadBoard/update.do",
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

function uploadDelete(root,boardNum,currentPage){
	if(confirm("삭제하겠습니까?")){
		$.ajax({
			url:root+"/uploadBoard/delete.do?boardNum="+boardNum+"&pageNumber="+currentPage,
			type:"get",
			dataType:"html",
			success:function(data){
				var realData = data.split("<body>");
				realData = realData[1].split("</body>")[0];
				$("#centerContents").html(realData);
			},
			error:function(xhr,status,error){
				alert(xhr+"\n"+status+"\n"+error);
			}
		});
	}
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
		var data = new FormData(document.getElementById("uploadWriteForm"));
		alert("콜라보를 진행합니다. 다음 메시지까지 기다려주세요.")
	    $.ajax({
	        url: $("#root").val()+'/uploadBoard/collaboAdopt.do',
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

function uploadCollabo(root, boardNum,pageNumber){
	$.ajax({
		url:root+"/uploadBoard/collabo.do?boardNum="+boardNum+"&pageNumber="+pageNumber,
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

function uploadCollaboOk(root, boardNum,pageNumber){
	var str =CKEDITOR.instances.content.getData();
//	dataSet.append("content", str);
	$("#content").val(str);
	var data = new FormData(document.getElementById("uploadWriteForm"));

	$.ajax({
        url: $("#root").val()+'/uploadBoard/collaboAdopt.do',
        type: "post",
        dataType: "text",
        data: data,
        // cache: false,
        processData: false,
        contentType: false,
        success: function(data, textStatus, jqXHR) {
//	            alert(data);
        	$("#mergeFile").val($("#root").val()+data);
        }, error: function(jqXHR, textStatus, errorThrown) {
        	
        },
    });
}

function test(){
//	alert($("#coverImage").val()=="");
	alert($("#uploadPath").val()=="");
}