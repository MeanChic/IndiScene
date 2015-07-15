/*FreeBoard javascript*/


	function write(root){
		
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
 		alert(CKEDITOR.instances.content.getData());
 		//$("#contentFreeBoard").val(CKEDITOR.instances.content.getData());
		dataSet.append("content",CKEDITOR.instances.content.getData());  //content에서  contentFreeBoard로 바꿈
		
	/* 수정전		
		dataSet.append("pageNumber",pageNumber);
		dataSet.append("content",$("#textInput").val());
		*/
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
	
	function freeBoardList(root,pageNumber){
	//if(pageNumber=="")pageNumber=1;
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
		
	/*----------------read.jsp-----------------------*/

		function freeBoardRead(root,board_num,pageNumber){
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
		
		function deleteFun(root, board_num, pageNumber){
			$.ajax({
				url:root+"/freeBoard/delete.do?board_num="+board_num+"&pageNumber="+pageNumber,
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
		function deleteFunOk(root, board_num, pageNumber){
			var dataSet = new FormData(document.getElementById("deleteForm"));
		$.ajax({
				url:root+"/freeBoard/delete.do",
				type:"post",
				contentType:false,
				data:dataSet,
				dataType:"html",
				processData:false,
				success:function(data){
					//alert(data);
					var realData = data.split("<body>");
					var realData = realData[1].split("</body>")[0];
					//alert(realData);
					$("#centerContents").html(realData);
					///$.getScript(root+"/js/freeBoard.js");

				},
				error:function(xhr,status,error){
					alert(xhr+"\n"+status+"\n"+error);
				}
			}); 
		}
			
		function updateFun(root, board_num, pageNumber){
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
		
		function updateFunOk(root, board_num, pageNumber){
			alert("이건 업데이트 OK");
			
//			alert(dataSet.content);
		//	dataSet.append("content",CKEDITOR.instances.content.getData());
			$("#contentFreeBoard").val(CKEDITOR.instances.content.getData());
			var dataSet = new FormData(document.getElementById("updateForm"));

			$.ajax({
				url:root+"/freeBoard/update.do",
				data:dataSet,
				type:"post",
				dataType:"html",
				processData:false,
				contentType:false,
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
	