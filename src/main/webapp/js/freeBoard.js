/*FreeBoard*/


	function write(root){
		//var sendData="board_num=0"
		$.ajax({
			url:root+"/freeBoard/write.do",
			/*data:sendData,*/
			type:"get",
			dataType:"html",
			success:function(data){
				//alert(data);
				var realData = data.split("<body>");
				var realData = realData[1].split("</body>")[0];
				//alert(realData);
				/*$.getScript(root+"/resources/ckEditor/ckeditor.js");
				$.getScript(root+"/js/jquery.MultiFile.js");
				$.getScript(root+"/js/jquery.js");*/
				
				//alert(realData);
				$("#centerContents").html(realData);
			},
			error:function(xhr,status,error){
				alert(xhr+"\n"+status+"\n"+error);
			}
		}); 
	}

	function writeOk(root,pageNumber){
		var dataSet = new FormData(document.getElementById("FreeBoardWriteForm"));
		
	/*	
 		alert(CKEDITOR.instances.content1);
		dataSet.append("content",CKEDITOR.instances.content1);
		alert("textInput:"+textInput);
		
 	*/
	/* 수정전	*/	
		dataSet.append("pageNumber",pageNumber);
		dataSet.append("content",$("#textInput").val());
		
		//alert("여기는 writeOk입니다.");
		$.ajax({
			url:root+"/freeBoard/write.do",
			type:"post",
			contentType:false,
			data:dataSet,
			dataType:"html",
			processData:false,
			success:function(data){
				//alert(data);
				//alert(data);
				var realData = data.split("<body>");
				var realData = realData[1].split("</body>")[0];
				//alert(realData);
				$("#centerContents").html(realData);
				
			},
			error:function(xhr,status,error){
				alert(xhr+"\n"+status+"\n"+error);
			}
		}); 
	}
	
	function list(root,pageNumber){
	//	if(pageNumber=="")pageNumber=1;
		$.ajax({
			url:root+"/freeBoard/list.do?pageNumber="+pageNumber,
			type:"get",
			dataType:"html",
			success:function(data){
				//alert(data);
				var realData = data.split("<body>");
				var realData = realData[1].split("</body>")[0];
			//	alert(realData);
				$("#centerContents").html(realData);
			},
			error:function(xhr,status,error){
				alert(xhr+"\n"+status+"\n"+error);
			}
		}); 
	}	
		
	
		function read(root,pageNumber,board_num){
		//alert(root);
		
			$.ajax({
				url:root+"/freeBoard/read.do?board_num="+board_num+"&pageNumber="+pageNumber,
				type:"get",
				dataType:"html",
				success:function(data){
					//alert(data);
					var realData = data.split("<body>");
					var realData = realData[1].split("</body>")[0];
					//alert(realData);
					$("#centerContents").html(realData);
				},
				error:function(xhr,status,error){
					alert(xhr+"\n"+status+"\n"+error);
				}
			}); 
		}
/*----------------read.jsp-----------------------*/
		
		function deleteFun(root, board_num, pageNumber){
			$.ajax({
				url:root+"/freeBoard/delete.do",
				type:"post",
				dataType:"html",
				success:function(data){
					//alert(data);
					var realData = data.split("<body>");
					var realData = realData[1].split("</body>")[0];
					//alert(realData);
					$("#centerContents").html(realData);
				},
				error:function(xhr,status,error){
					alert(xhr+"\n"+status+"\n"+error);
				}
			}); 
		}
		function deleteFunOk(root, board_num, pageNumber){
			$.ajax({
				url:root+"/freeBoard/delete.do",
				type:"post",
				dataType:"html",
				success:function(data){
					//alert(data);
					var realData = data.split("<body>");
					var realData = realData[1].split("</body>")[0];
					//alert(realData);
					$("#centerContents").html(realData);
					$.getScript(root+"/js/freeBoard.js");

				},
				error:function(xhr,status,error){
					alert(xhr+"\n"+status+"\n"+error);
				}
			}); 
		}
			
		function updateFun(root, pageNumber, board_num){
			alert(root);
			
			$.ajax({
				url:root+"/freeBoard/update.do?board_num="+board_num+"&pageNumber="+pageNumber,
				type:"get",
				dataType:"html",
				success:function(data){
					//alert(data);
					var realData = data.split("<body>");
					var realData = realData[1].split("</body>")[0];
					//alert(realData);
					$("#centerContents").html(realData);
				},
				error:function(xhr,status,error){
					alert(xhr+"\n"+status+"\n"+error);
				}
			}); 
		} 
		
		function updateFunOk(root, pageNumber, board_num){
		
			var sendData=new FormData(document.getElementById("updateForm"));
			$.ajax({
				url:root+"/freeBoard/update.do?board_num="+board_num+"&pageNumber="+pageNumber,
				data:sendData,
				type:"post",
				contentType:false,
				dataType:"html",
				processData:false,
				success:function(data){
					alert(data);
					var realData = data.split("<body>");
					var realData = realData[1].split("</body>")[0];
					//alert(realData);
					$("#centerContents").html(realData);

				},
				error:function(xhr,status,error){
					alert(xhr+"\n"+status+"\n"+error);
				}
			}); 
		} 
	