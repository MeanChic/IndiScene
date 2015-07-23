/* Artist registerForm */
var rooti;


// Jquery
$(function(){
	var root = $("#root").val();
	rooti = root;
});
	
function cancle(artist_id, muse_name){
	//alert(artist_id + ",,," + muse_name);
	var root = $("#root").val();
	
	var sendData= "artist_id=" + artist_id +"&muse_name=" + muse_name;
	var url = root + "/museCreate/museCancle.do?" + sendData;
	
	 $.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function (data){
			if(data == 1){
				/*$("."+muse_name+"> input").val("가입하기");
				$("."+muse_name+"> input").attr("onclick","signup('"+artist_id+"','"+muse_name+"')");
				$("#my").children("."+muse_name).remove();*/
				indimuse(artist_id);
			}
		}
	}); 
}

function outMember(muse_name, artist_id){
	var root = $("#root").val();
	var sendData= "muse_name=" + muse_name + "&artist_id=" + artist_id;
	var url = root + "/museCreate/outMember.do?" + sendData;
	
	//alert(url);
	 $.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function (data){
			if(data == "0"){
				alert("탈퇴되지 않았습니다.");
			}else{
				alert(artist_id+"회원이 탈되되었습니다.");
				$("#"+artist_id).remove();
			}
		}
	}); 
}

function inviteMember(muse_name, artist_id){
	var root = $("#root").val();
	var sendData= "muse_name=" + muse_name + "&artist_id=" + artist_id;
	var url = root + "/museCreate/inviteMember.do?" + sendData;
	
	//alert(url);
	 $.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function (data){
			if(data == "0"){
				alert("muse멤버로 수락할수 없습니다.");
			}else{
				alert("muse멤버로 수락되었습니다.");
				$("#"+artist_id).find("input").eq(0).remove();
				$("#"+artist_id).find("input").eq(0).val("강제탈퇴");
				$("#join").append($("#"+artist_id));
			}
		}
	});
}

function signup(artist_id, muse_name){
	//alert(artist_id + ",,," + muse_name);
	var root = $("#root").val();
	
	var sendData= "artist_id=" + artist_id +"&muse_name=" + muse_name;
	var url = root + "/museCreate/museSignup.do?" + sendData;
	
	 $.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function (data){
			/*//alert(data);
			$("."+muse_name+"> input").val("대기중/신청취소");
			$("."+muse_name+"> input").attr("onclick","cancle('"+artist_id+"','"+muse_name+"')");
			var a = $("#best>."+ muse_name).clone();
			$("#my").prepend(a);*/
			indimuse(artist_id);
		}
	}); 
}	

function indimuse(artist_id){
	//backpageStart();
	//alert(this.toString());
	if(artist_id != null){
			var sendData = "artist_id=" + artist_id;
			$.ajax({
				url:rooti+"/museCreate/musemain.do",
				data:sendData,
				type:"GET",
				dataType:"text",
				success:function(data){
					$("#centerContents").html(data);
					history.pushState({indiData:realData},"","/indiscene/Test01.jsp");//다음페이지에 히스토리 저장
				}
			})
	}else{
		//alert("없지롱");
	}	
}

function goinmuse(muse_name){
	if(muse_name != null){
			//alert(muse_name);
			var sendData = "muse_name=" + muse_name;
			$.ajax({
				url:rooti+"/museCreate/goin.do",
				data:sendData,
				type:"GET",
				dataType:"html",
				success:function(data){
					$("#centerContents").html(data);
					history.pushState({indiData:realData},"","/indiscene/Test01.jsp");//다음페이지에 히스토리 저장
				}
			})
	}else{
		//alert("없지롱");
	}	
}

function logupmuse(){
	
	$.ajax({
		url:rooti+"/museCreate/logup.do",
		type:"GET",
		dataType:"html",
		success:function(data){
			$("#centerContents").html(data);
			history.pushState({indiData:realData},"","/indiscene/Test01.jsp");//다음페이지에 히스토리 저장
		}
	})
}

function membermuse(muse_name,check){
	var sendData = "muse_name=" + muse_name + "&check=" + check;
	$.ajax({
		url:rooti+"/museCreate/museMember.do",
		data:sendData,
		type:"GET",
		dataType:"html",
		success:function(data){
			$("#centerContents").html(data);
			history.pushState({indiData:realData},"","/indiscene/Test01.jsp");//다음페이지에 히스토리 저장
		}
	})
}

function guestmuse(muse_name){
	var sendData = "muse_name=" + muse_name;
	$.ajax({
		url:rooti+"/museCreate/museMember.do",
		data:sendData,
		type:"GET",
		dataType:"html",
		success:function(data){
			$("#centerContents").html(data);
			history.pushState({indiData:realData},"","/indiscene/Test01.jsp");//다음페이지에 히스토리 저장
		}
	})
}

function guestboardmuse(muse_name){
	var sendData = "muse_name=" + muse_name;
	$.ajax({
		url:rooti+"/museGuest/guest.do",
		data:sendData,
		type:"GET",
		dataType:"html",
		success:function(data){
			$("#centerContents").html(data);
			history.pushState({indiData:realData},"","/indiscene/Test01.jsp");//다음페이지에 히스토리 저장
		}
	})
}

function deleteMuse(muse_name, artist_id){
	var sendData = "muse_name=" + muse_name + "&artist_id=" + artist_id;
	$.ajax({
		url:rooti+"/museGuest/deleteMuse.do",
		data:sendData,
		type:"GET",
		dataType:"html",
		success:function(data){
			$("#centerContents").html(data);
			history.pushState({indiData:realData},"","/indiscene/Test01.jsp");//다음페이지에 히스토리 저장
		}
	})
}

function perform(){
	//alert("OK");
	$("#centerContents").append("<div id='perform' class='hasPaddingContents'></div>")
	$("#perform").css("display","block");
	$("#perform").siblings().css("display","none");
	$.ajax({
		url:rooti+"/performBoard/write.do",
		type:"GET",
		dataType:"html",
		success:function(data){
			$("#centerContents").html(data);
			history.pushState({indiData:realData},"","/indiscene/Test01.jsp");//다음페이지에 히스토리 저장
		}
	})
}

function createMuse(){
	var dataSet = new FormData(document.getElementById("museMakeForm"));
	/*alert($("#file").val());
	if($("#file").val() == ""){
		$("#file").val(" ");
	}*/
	$.ajax({
		url:root + "/museCreate/logup.do",
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
			history.pushState({indiData:realData},"","/indiscene/Test01.jsp");//다음페이지에 히스토리 저장
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error); 
			//alert("OK");
		}
	})
}
