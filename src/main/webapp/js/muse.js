/* Artist registerForm */
var rooti;


// Jquery
$(function(){
	var root = $("#root").val();
	rooti = root;
});
	
	

function indimuse(artist_id){
	//backpageStart();
	alert(this.toString());
	if(artist_id != null){
			var sendData = "artist_id=" + artist_id;
			$.ajax({
				url:rooti+"/museCreate/musemain.do",
				data:sendData,
				type:"GET",
				dataType:"text",
				success:function(data){
					$("#centerContents").html(data);
					$('.main-nav').toggleClass('nav-expanded');
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
		}
	})
}

function perform(){
	alert("OK");
	$("#centerContents").append("<div id='perform' class='hasPaddingContents'></div>")
	$("#perform").css("display","block");
	$("#perform").siblings().css("display","none");
	$.ajax({
		url:rooti+"/performBoard/write.do",
		type:"GET",
		dataType:"html",
		success:function(data){
			$("#centerContents").html(data);
		}
	})
}
