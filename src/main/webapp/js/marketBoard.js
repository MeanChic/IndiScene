/**
 * 
 */
var root=null;
function enterMarketBoard(requestRoot,pageNumber){
	root=requestRoot;
	//alert("ok");
	sendData="?pageNumber="+ ((pageNumber==null || pageNumber=="") ? 1 : pageNumber);
	$.ajax({
		url:root +"/marketBoard/enterBoard.do"+sendData,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
			//alert(realData);
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"제목","/");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}

function searchMarketBoard(requestRoot,pageNumber,folderName,searchWord,searchType){
	folderName=folderName.split("views/");
	folderName=folderName[1].split("/");
	//alert(folderName[0]);
	root=requestRoot;
	if(searchWord==null){ //[1][2]같이 페이지별 이동을 누를 때 말고 리스트 하단에 '검색' 버튼을 직접적으로 누를때 (매개변수가 없으므로 여기서 뽑아낸다)
		var dataSet = new FormData(document.getElementById("searchForm"));
		var searchWord=$("#searchForm #searchWord").val();
		var searchType=$("#searchType").val();
	}
	//alert(searchWord);
	//alert(searchType);
	sendData="?pageNumber="+ ((pageNumber==null || pageNumber=="") ? 1 : pageNumber)+"&searchType=" +searchType + "&searchWord="+searchWord+ "&folderName="+folderName[0] ;
	$.ajax({
		url:root +"/marketBoard/enterBoard.do"+sendData,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
			//alert(realData);
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"제목","/");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}


function marketBoardDelete(board_num,pageNumber,artist_id){
	//alert(pageNumber);
	sendData="?pageNumber="+pageNumber +"&board_num="+board_num+"&artist_id="+artist_id;
	//alert(pageNumber+","+board_num+","+artist_id);
	$.ajax({
		url:root +"/marketBoard/delete.do"+sendData,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
			//alert(realData);
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"제목","/");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
	
}

function marketBoardDeleteOk(root,board_num,pageNumber){
	var dataSet = new FormData(document.getElementById("marketBoardDeleteForm"));
	//alert(CKEDITOR.instances.content.getData());
	alert(dataSet);
	$.ajax({
		url:root +"/marketBoard/delete.do",
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

function marketBoardWrite(){
	$.ajax({
		url:root + "/marketBoard/write.do",
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData=data.split("<body>");
			realData=realData[1].split("</body>")[0];
			//alert(realData);
			$("#centerContents").html(realData)
			$.getScript(root+"/js/jquery.MultiFile.js");
			history.pushState({indiData:realData},"제목","/");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	})
	
}


function marketBoardWriteOk(){
	var dataSet = new FormData(document.getElementById("marketBoardWriteForm"));
	alert(CKEDITOR.instances.content.getData());
	dataSet.append("content",CKEDITOR.instances.content.getData());
	$.ajax({
		url:root + "/marketBoard/write.do",
		type:"post",
		dataType:"html",
		data:dataSet,
		contentType:false,
		processData:false,
		success:function(data){
			alert(data);
			var realData=data.split("<body>");
			realData=realData[1].split("</body>")[0];
			alert(realData);
			$("#centerContents").html(realData)
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error); 
		
		}
	})
}

function marketBoardRead(board_num,pageNumber){
	var sendData="?board_num="+board_num+"&pageNumber="+pageNumber;
	$.ajax({
		url:root + "/marketBoard/read.do"+sendData,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData=data.split("<body>");
			realData=realData[1].split("</body>")[0];
			//alert(realData);
			$("#centerContents").html(realData)
			history.pushState({indiData:realData},"제목","/");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	})
}

function marketBoardUpdate(board_num,pageNumber){
	var sendData="?board_num="+board_num+"&pageNumber="+pageNumber;
	$.ajax({
		url:root + "/marketBoard/update.do"+sendData,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData=data.split("<body>");
			realData=realData[1].split("</body>")[0];
			//alert(realData);
			$("#centerContents").html(realData)
			history.pushState({indiData:realData},"제목","/");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	})
}


function marketBoardUpdateOk(){
	alert("sldfjsldkfj");
	var dataSet = new FormData(document.getElementById("marketBoardUpdateForm"));
	//var writer1=dataSet.writer.value;
	//alert($("textarea").val());
	//alert(CKEDITOR.instances.content.getData());
	//alert(dataSet);
	$.ajax({
		url:root +"/marketBoard/update.do",
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

