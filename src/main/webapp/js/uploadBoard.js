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

function writeOk(root){
	$.ajax({
		url:root+"/uploadBoard/write.do",
		type:"post",
		dataType:"html",
		success:function(data){
			var realData = data.split("<body>");
			var realData = realData[1].split("</body>")[0];
			$("#centerContent").html(realData);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}