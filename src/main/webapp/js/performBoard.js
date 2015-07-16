/**
 * 
 */
var root=null;

function enterPerformBoard(requestRoot,pageNumber){
	root=requestRoot;
	//alert("OK");
	sendData="?pageNumber="+ ((pageNumber==null || pageNumber=="") ? 1 : pageNumber);
	$.ajax({
		url:root +"/performBoard/enterBoard.do"+sendData,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
			//alert(realData);
			$("#centerContents").html(realData);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
	
}


function performBoardDelete(board_num,pageNumber,artist_id){
	//alert(pageNumber);
	sendData="?pageNumber="+pageNumber +"&board_num="+board_num+"&artist_id="+artist_id;
	//alert(pageNumber+","+board_num+","+artist_id);
	$.ajax({
		url:root +"/performBoard/delete.do"+sendData,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
			//alert(realData);
			$("#centerContents").html(realData);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
	
}

function performBoardDeleteOk(){
	var dataSet = new FormData(document.getElementById("marketBoardDeleteForm"));
	//alert(CKEDITOR.instances.content.getData());
	//alert(dataSet);
	$.ajax({
		url:root +"/performBoard/delete.do",
		type:"post",
		dataType:"html",
		data:dataSet,
		contentType:false,
		processData:false,
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
			//alert(realData);
			$("#centerContents").html(realData);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
	
}

function performBoardWrite(){
	$.ajax({
		url:root + "/performBoard/write.do",
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData=data.split("<body>");
			realData=realData[1].split("</body>")[0];
			//alert(realData);
			$("#centerContents").html(realData)
			$.getScript(root+"/js/jquery.MultiFile.js");
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	})
	
}


function performBoardWriteOk(){
	var dataSet = new FormData(document.getElementById("marketBoardWriteForm"));
	//alert(CKEDITOR.instances.content.getData());
	dataSet.append("content",CKEDITOR.instances.content.getData());
	$.ajax({
		url:root + "/performBoard/write.do",
		type:"post",
		dataType:"html",
		data:dataSet,
		contentType:false,
		processData:false,
		success:function(data){
			//alert(data);
			var realData=data.split("<body>");
			realData=realData[1].split("</body>")[0];
			//alert(realData);
			$("#centerContents").html(realData)
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error); 
		
		}
	})
}

function performBoardRead(board_num,pageNumber){
	var sendData="?board_num="+board_num+"&pageNumber="+pageNumber;
	$.ajax({
		url:root + "/performBoard/read.do"+sendData,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData=data.split("<body>");
			realData=realData[1].split("</body>")[0];
			//alert(realData);
			
			$("#centerContents").html(realData)
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	})
}

function performBoardUpdate(board_num,pageNumber){
	var sendData="?board_num="+board_num+"&pageNumber="+pageNumber;
	$.ajax({
		url:root + "/performBoard/update.do"+sendData,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData=data.split("<body>");
			realData=realData[1].split("</body>")[0];
			//alert(realData);
			$("#centerContents").html(realData)
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	})
}


function performBoardUpdateOk(){
	var dataSet = new FormData(document.getElementById("marketBoardUpdateForm"));
	//alert(CKEDITOR.instances.content.getData());
	//alert(dataSet);
	$.ajax({
		url:root +"/performBoard/update.do",
		type:"post",
		dataType:"html",
		data:dataSet,
		contentType:false,
		processData:false,
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
			//alert(realData);
			$("#centerContents").html(realData);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
	
}


	
	
