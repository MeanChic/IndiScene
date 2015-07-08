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
			$("#centerContents").html(realData);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	}); 
}

function writeOk(root){
	$.ajax({
		url:root+"/uploadBoard/write.do",
		type:"post",
		dataType:"html",
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
	if($("#recordButton img").attr("src")==root+"/resources/uploadBoard/Mic.jpg"){
		$("#recordButton img").attr("src",root+"/resources/uploadBoard/Mic2.jpg");
		recorderSetting();
	}else{
		$("#recordButton img").attr("src",root+"/resources/uploadBoard/Mic.jpg");
	}
}