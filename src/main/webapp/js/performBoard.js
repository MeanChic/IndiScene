/**
 * 
 */
var root=null;

function performMap(){
	//alert(form+", "+root);
	var url=root+"/performBoard/map.do";
	window.open(url,"","width=500, height=500");
}

function performZipcodeCheck(root){
	//alert(form+", "+root);
	var url=root+"/performBoard/zipcode.do";
	window.open(url,"","width=500, height=500");
}

function performPlace(root){
	//root=requestRoot;
	//alert("OK");
	
	//sendData="?pageNumber="+ ((pageNumber==null || pageNumber=="") ? 1 : pageNumber);
	$.ajax({
		url:root +"/perform/enter.do",
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
			//alert(realData);
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
			$.getScript(root+"/js/jquery-ui.js");
			$('.main-nav').toggleClass('nav-expanded');
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}

function performSendAddress(zipcode, sido, gugun, dong, ri, bldg, bunji){
	var address=sido+" "+gugun+" "+dong+" "+ri+" "+bldg+" "+bunji;
	//alert(zipcode+"\n"+address);
	//opener.registerForm.artist_zipcode.value=zipcode;
	//opener.registerForm.artist_address.value=address;
	//self.close();
	
	//alert($(opener.document).find("input[name='zipcode']").length);
	/*$(opener.document).find("input[name='zipcode']").val(zipcode);
	$(opener.document).find("input[name='zipcode']").attr("value",zipcode);
	$(opener.document).find("input[name='zipcode']").text(zipcode);*/
	$(opener.document).find("input[name='zipcode1']").val(address);
	
	$(opener.document).find("input[name='zipcode']").val(address);
	self.close();
}

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
			$.getScript(root+"/js/jquery-ui.js");
			history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
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
			history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
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
			history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
			$.getScript(root+"/js/jquery.MultiFile.js");
			$.getScript(root+"/js/jquery.js");
			$.getScript(root+"/js/jquery-ui.js");
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	})
	
}


function performBoardWriteOk(){
	//alert("OK");
	$("input[name = 'address']").val($("input[name = 'zipcode1']").val() + "" + $("input[name = 'address']").val());
	
	//alert($("input[name = 'address']").val());
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
			$.getScript(root+"/js/jquery-ui.js");
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error); 
			//alert("OK");
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
			
			$("#centerContents").html(realData);
			$.getScript(root+"/js/jquery-ui.js");
			history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
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
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
			$.getScript(root+"/js/jquery-ui.js");
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	})
}


function performBoardUpdateOk(){
	$("input[name = 'address']").val($("input[name = 'zipcode1']").val() + "" + $("input[name = 'address']").val());
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
			$.getScript(root+"/js/jquery-ui.js");
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
	
}


	
	
