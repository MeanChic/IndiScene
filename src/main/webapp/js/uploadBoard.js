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
			history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
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
	if(validValueCheck("uploadWriteForm")==-1){
		return ;
	}
	
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

function record(){
	var recordImgVar = document.getElementById("recordToggleImg");
	
	toggleRecording(recordImgVar);
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
			history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
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
			history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
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
			history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
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
	if(validValueCheck("uploadWriteForm")==-1){
		return ;
	}
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
	$.ajax({
		url:root+"/uploadBoard/delete.do?boardNum="+boardNum+"&pageNumber="+currentPage,
		type:"get",
		dataType:"html",
		success:function(data){
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}

function uploadDeleteOk(root){
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

function prepareUploadCollabo(){
	var audio1=document.createElement("audio");
	var audio2=document.createElement("audio");
	var audio1Can = false;
	var audio2Can = false;
	
	audio1.src=$("#originalMusicPath").val();
	
	$("#prevCollaboListen").click(function(){
		$("#prevAudio").src=$("#mergeFile").val();
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
		$("input[name='genre_code']").val(0);
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
	        	$("#prevCollaboListen").css("display","inline-block");
		        $("#prevCollaboListen").val(10);
		        $("#prevCollaboListen").attr("disabled","disabled");
		        collaboTimer();
		         
		        $("#prevCollaboListen").click(function(){
		        	$("#Recordbars").css("display","block");
		        });
	        }, error: function(jqXHR, textStatus, errorThrown) {
	        	
	        },
	    });
	});
	
	var audioPlaying=false;
	$("#recordButton").click(function(){
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
	
function collaboTimer(){
	setTimeout(function(){
		$("#prevCollaboListen").val($("#prevCollaboListen").val()-1);
		if($("#prevCollaboListen").val()>0) collaboTimer();
		if($("#prevCollaboListen").val()==0){
			$("#prevCollaboListen").val("Beforehand Listening");
			$("#prevCollaboListen").removeAttr("disabled");
		}
	},1000);
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
			history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}

function uploadCollaboOk(root, boardNum,pageNumber){
	var str =CKEDITOR.instances.content.getData();
	$("#content").val(str);
	var dataSet = new FormData(document.getElementById("uploadWriteForm"));
	if(validValueCheck("uploadWriteForm")==-1){
		return ;
	}
	$.ajax({
        url: $("#root").val()+'/uploadBoard/collabo.do',
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

function uploadLike(root,boardNum,artist_id){
	$.ajax({
		url:root+"/uploadBoard/like.do?boardNum="+boardNum+"&artist_id="+artist_id,
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

function bestList(root,pageNumber){
	$.ajax({
		url:root+"/bestBoard/list.do?pageNumber="+pageNumber,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
		//	alert(realData);
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	}); 
}

function bestRead(root,boardNum,currentPage){
	$.ajax({
		url:root+"/bestBoard/read.do?boardNum="+boardNum+"&pageNumber="+currentPage,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
		//	alert(realData);
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	}); 	
}

function brandNewList(root,pageNumber){
	$.ajax({
		url:root+"/brandNewBoard/list.do?pageNumber="+pageNumber,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
		//	alert(realData);
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	}); 
}

function brandNewRead(root,boardNum,currentPage){
	$.ajax({
		url:root+"/brandNewBoard/read.do?boardNum="+boardNum+"&pageNumber="+currentPage,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
		//	alert(realData);
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	}); 	
}

function validValueCheck(formId){
//	alert($("#"+formId).children("input[name='coverImage']").val());
	var valueCheckSubject = $("#"+formId).find("input[name='subject']").val();
	var valueCheckImage = $("#"+formId).find("input[name='coverImage']").val();
	var valueCheckMusic = $("#"+formId).find("input[name='musicFile']").val();
	var valueCheckRecord = $("#"+formId).find("input[id='uploadPath']").val();
	var valueCheckGenre = null;
	for(var i = 0;i< $("#"+formId).find("input[name='genre']").length; i++){
		if($("#"+formId).find("input[name='genre']").eq(i).prop("checked")){
			valueCheckGenre = $("#"+formId).find("input[name='genre']").eq(i).val();
			$("input[name='genre_code']").val(valueCheckGenre);
		}
	}
	var valueCheckContent= $("#"+formId).find("textarea[name='content']").val();
	var valueCheckMerge=$("#"+formId).find("input[id='mergeFile']").val();
//	alert(valueCheckMerge);
	
	if(valueCheckSubject == ""){
		alert("제목을 입력해주세요");
		return -1;
	}else if (valueCheckMusic =="" && valueCheckRecord ==""){
		alert("음악을 올려주세요");
		return -1;
	}else if(valueCheckGenre ==null){
		alert("장르를 입력해주세요");
		return -1;
	}else if(valueCheckContent ==""){
		alert("내용을 입력해주세요");
		return -1;
	}else if(valueCheckMerge != undefined && valueCheckMerge ==""){
		alert("콜라보레이션을 해주십시오");
		return -1;
	}
	
	return 1;
}

function showAttribute(obj){
	 try{
		 var objData= '';
		 
		 for(var attr in obj){
			 if(typeof(obj[attr])== 'string' || typeof(obj[attr])=='number'){
				 objData = objData+'Attr Name : ' +attr + ', Value : ' +obj[attr] + ', Type : ' + typeof(obj[attr])+'\n';
			 }else{
				 objData=objData+ 'Attr Name : ' + attr+ ', Type : ' + typeof(obj[attr])+'\n';
			 }
		 }
		 
		 alert(objData);
	 }catch(e){
		 alert(e.message);
	 }
}

$("#prevListen").bind("click",function(){
	$("#prevAudio").attr("src",$("#uploadPath").val());
}); 