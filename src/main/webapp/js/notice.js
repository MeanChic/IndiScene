/*Notice javascript*/


	function noticeWrite(root){
		$.ajax({
			url:root+"/notice/write.do",
			/*data:sendData,*/
			type:"get",
			dataType:"html",
			success:function(data){
				//alert(data);
				var realData = data.split("<body>");
				var realData = realData[1].split("</body>")[0];
				//alert(realData);
				
				//alert(realData);
				$("#centerContents").html(realData);
				history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
			},
			error:function(xhr,status,error){
				alert(xhr+"\n"+status+"\n"+error);
			}
		}); 
	}

	function noticeWriteOk(root,pageNumber){
		var str =CKEDITOR.instances.content.getData();
		$("#content").val(str);
		var dataSet = new FormData(document.getElementById("NoticeWriteForm"));
		//alert("pageNumber:"+pageNumber)
 		//alert(CKEDITOR.instances.content.getData());
		dataSet.append("content",CKEDITOR.instances.content.getData());
		//$("#content").val(CKEDITOR.instances.content.getData());
		
		$.ajax({
			url:root+"/notice/write.do",
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
			},
			error:function(xhr,status,error){
				alert(xhr+"\n"+status+"\n"+error);
				alert("writeOk Error");
				
			} 	
		}); 
	}
	
	function noticeList(root,pageNumber){
	//if(pageNumber=="")pageNumber=1;
		$.ajax({
			url:root+"/notice/list.do?pageNumber="+pageNumber,
			type:"get",
			dataType:"html",
			success:function(data){
				//alert(data);
				var realData = data.split("<body>");
				var realData = realData[1].split("</body>")[0];
			//	alert(realData);
				$("#centerContents").html(realData);
				history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
			},
			error:function(xhr,status,error){
				alert(xhr+"\n"+status+"\n"+error);
			}
		}); 
	}	
		
	/*----------------read.jsp-----------------------*/

		function noticeRead(root,board_num,pageNumber){
		//alert(root);
		
			$.ajax({
				url:root+"/notice/read.do?board_num="+board_num+"&pageNumber="+pageNumber,
				type:"get",
				dataType:"html",
				success:function(data){
					//alert(data);
					var realData = data.split("<body>");
					var realData = realData[1].split("</body>")[0];
					//alert(realData);
					$("#centerContents").html(realData);
					history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
				},
				error:function(xhr,status,error){
					alert(xhr+"\n"+status+"\n"+error);
				}
			}); 
		}
		
		function noticeDeleteFun(root, board_num, pageNumber){
			$.ajax({
				url:root+"/notice/delete.do?board_num="+board_num+"&pageNumber="+pageNumber,
				type:"get",
				dataType:"html",
				success:function(data){
					//alert(data);
					var realData = data.split("<body>");
					var realData = realData[1].split("</body>")[0];
					//alert(realData);
					$("#centerContents").html(realData);
					history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
				},
				error:function(xhr,status,error){
					alert(xhr+"\n"+status+"\n"+error);
				}
			}); 
		}
		
		function noticeDeleteFunOk(root, board_num, pageNumber){
			var dataSet = new FormData(document.getElementById("deleteForm"));
			alert(root +","+board_num +","+ pageNumber);
			$.ajax({
				url:root+"/notice/delete.do",
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
					///$.getScript(root+"/js/notice.js");
								
				},
				error:function(xhr,status,error){
					alert(xhr+"\n"+status+"\n"+error);
				}
			}); 
			
		}
			
		function noticeUpdateFun(root, board_num, pageNumber){
			alert(root);
			
			$.ajax({
				url:root+"/notice/update.do?board_num="+board_num+"&pageNumber="+pageNumber,
				type:"get",
				dataType:"html",
				success:function(data){
					//alert(data);
					var realData = data.split("<body>");
					var realData = realData[1].split("</body>")[0];
					//alert(realData);
					$("#centerContents").html(realData);
					history.pushState({indiData:realData},"","/indiscene/KOSTA");//다음페이지에 히스토리 저장
				},
				error:function(xhr,status,error){
					alert(xhr+"\n"+status+"\n"+error);
				}
			}); 
		} 
		
		function noticeUpdateFunOk(root, board_num, pageNumber){
			alert("root:"+root);
	
			var str =CKEDITOR.instances.content.getData();
			$("#content").val(str);
			var dataSet = new FormData(document.getElementById("updateForm"));
			
			$.ajax({
				url:root+"/notice/update.do",
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
	