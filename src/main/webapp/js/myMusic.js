/**
 * 
 */

function myUploadMusic(root,artist_id,pageNumber){
	$.ajax({
		url:root+"/myMusic/uploadMusic.do?artist_id="+artist_id+"&pageNumber="+pageNumber,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
		//	alert(realData);
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"","/indiscene/KOSTA");
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	}); 
}

function myLikeMusic(root,artist_id,pageNumber){
	$.ajax({
		url:root+"/myMusic/likeMusic.do?artist_id="+artist_id+"&pageNumber="+pageNumber,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
		//	alert(realData);
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"","/indiscene/KOSTA");
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	}); 
}

function myCollaboMusic(root,artist_id,pageNumber){
	$.ajax({
		url:root+"/myMusic/collaboMusic.do?artist_id="+artist_id+"&pageNumber="+pageNumber,
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			realData = realData[1].split("</body>")[0];
		//	alert(realData);
			$("#centerContents").html(realData);
			history.pushState({indiData:realData},"","/indiscene/KOSTA");
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	}); 
}