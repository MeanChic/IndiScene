/**
 * 
 */
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


function searchFreeBoard(root,pageNumber,folderName,searchWord,searchType){
	folderName=folderName.split("views/");
	folderName=folderName[1].split("/");
	//alert(folderName[0]);
	if(searchWord==null){
		var dataSet = new FormData(document.getElementById("searchForm"));
		var searchWord=$("#searchForm #searchWord").val();
		var searchType=$("#searchType").val();
	}
	
	//alert(searchWord);
	//alert(searchType);
	sendData="?pageNumber="+pageNumber+"&searchType=" +searchType + "&searchWord="+searchWord+"&folderName="+folderName[0];
	$.ajax({
		url:root +"/freeBoard/list.do"+sendData,
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

function searchMain(root,pageNumber,searchWord,searchType){

	//alert(folderName[0]);
	if(searchWord==null){
		var searchWord=$("#MainSearchWord").val();
	}
	
	//alert(searchWord);
	//alert(searchType);
	sendData="?pageNumber="+pageNumber+"&searchType=" +searchType + "&searchWord="+searchWord+"&folderName=uploadBoard";
	$.ajax({
		url:root +"/uploadBoard/list.do"+sendData,
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







