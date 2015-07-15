/**
 * 
 */
var root=null;
function enterPlaceBoard(requestRoot,pageNumber){
	root=requestRoot;
	//alert(pageNumber);
	sendData="?pageNumber="+ ((pageNumber==null || pageNumber=="") ? 1 : pageNumber);
	$.ajax({
		url:root +"/placeBoard/enterBoard.do"+sendData,
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


function placeBoardDelete(board_num,pageNumber,artist_id){
	//alert(pageNumber);
	sendData="?pageNumber="+pageNumber +"&board_num="+board_num+"&artist_id="+artist_id;
	//alert(pageNumber+","+board_num+","+artist_id);
	$.ajax({
		url:root +"/placeBoard/delete.do"+sendData,
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

function placeBoardDeleteOk(){
	var dataSet = new FormData(document.getElementById("marketBoardDeleteForm"));
	//alert(CKEDITOR.instances.content.getData());
	//alert(dataSet);
	$.ajax({
		url:root +"/placeBoard/delete.do",
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

function placeBoardWrite(){
	$.ajax({
		url:root + "/placeBoard/write.do",
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


function placeBoardWriteOk(){
	var dataSet = new FormData(document.getElementById("marketBoardWriteForm"));
	//alert(CKEDITOR.instances.content.getData());
	dataSet.append("content",CKEDITOR.instances.content.getData());
	$.ajax({
		url:root + "/placeBoard/write.do",
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

function placeBoardRead(board_num,pageNumber){
	var sendData="?board_num="+board_num+"&pageNumber="+pageNumber;
	$.ajax({
		url:root + "/placeBoard/read.do"+sendData,
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

function placeBoardUpdate(board_num,pageNumber){
	var sendData="?board_num="+board_num+"&pageNumber="+pageNumber;
	$.ajax({
		url:root + "/placeBoard/update.do"+sendData,
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


function placeBoardUpdateOk(){
	var dataSet = new FormData(document.getElementById("marketBoardUpdateForm"));
	//alert(CKEDITOR.instances.content.getData());
	//alert(dataSet);
	$.ajax({
		url:root +"/placeBoard/update.do",
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


	
	