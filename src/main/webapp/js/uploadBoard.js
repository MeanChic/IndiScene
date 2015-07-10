function uploadWrite(root){
	$.ajax({
		url:root+"/uploadBoard/write.do",
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
	var dataSet = new FormData(document.getElementById("uploadWriteForm"));
	
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
	
}