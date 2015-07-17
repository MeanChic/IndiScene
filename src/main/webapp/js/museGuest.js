/* Artist registerForm */
var root;


// Jquery
$(function(){
	var rooti = $("#root").val();
	root = rooti;
});
	
function guestSend(){
	alert("OK");
	//form=$("form");
	var artist_id = $("form input[name = 'artist_id']").val();
	var muse_name = $("form input[name = 'muse_name']").val();
	var guest_content = $("form textarea[name = 'guest_content']").val();
	var root = $("#root").val();
	
	var sendData="artist_id="+artist_id+"&muse_name="+muse_name+"&guest_content="+guest_content;
	var form = document.getElementById("formtag");
	//alert(sendData);
	var url = root + "/museGuest/guest.do?";
	//alert(url);
	$.ajax({
		url: url,
		type:"post",
		data:sendData,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		dataType:"text",
		success:function(data){
			//alert(data);
			if(data == "1"){
				alert("입력완료");
				$("form textarea[name='guest_content']").val("");
				guestNext(muse_name,'1');
				//abc();
			}else{
				alert("아니되어");
			}
			
		},
		error:function(xhr, status, error){
			//xhr:XHMLHttpRequest, status 4 20, error
			var arr=new Array();
			arr.push("xhr:" + xhr);
			arr.push("status:" + status);
			arr.push("error: "+error);
			alert(arr);
		}
	});

}
/* function abc(){
	alert("하하");
} */
function guestNext(muse_name, pagenum){
	var root = $("#root").val(); 
	
	var sendData="muse_name="+muse_name+"&pagenum="+pagenum;
	//alert(sendData);
	var url = root + "/museGuest/guest.do?";
	//alert(url);
	$.ajax({
		url: url,
		type:"get",
		data:sendData,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		dataType:"text",
		success:function(data){
			$("#centerContents").html(data);
			//$("body").html(data);
		},
		error:function(xhr, status, error){
			//xhr:XHMLHttpRequest, status 4 20, error
			var arr=new Array();
			arr.push("xhr:" + xhr);
			arr.push("status:" + status);
			arr.push("error: "+error);
			alert(arr);
		}
	});
}

function guestUpdate(guest_num, guest_content){
	//alert("OK");
	$("#guestline").find("form").attr('style','display:none');
	$("#guestline").find(".con").attr('style','');
	$("#"+guest_num+">.con").attr('style','display:none');
	$("#"+guest_num+">form>textarea").val(guest_content);
	$("#"+guest_num+">form").attr('style','display:block');
}

function guestRemo(guest_num){
	$("#"+guest_num+">.con").attr('style','');
	$("#"+guest_num+"> form").attr('style','display:none');	
}

function guestUpcon(guest_num){
	//alert($("#"+guest_num).children("form").children("textarea").val());
	
	var root = $("#root").val(); 
	var pagenum = $("input[name='pagenum']").val();
	var muse_name = $("input[name='muse_name']").val();
	var sendData="guest_num="+guest_num+"&guest_content="+$("#"+guest_num).children("form").children("textarea").val();
	//alert(sendData);
	var url = root + "/museGuest/update.do?";
	//alert(url);
	$.ajax({
		url: url,
		type:"get",
		data:sendData,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		dataType:"text",
		success:function(data){
			//alert("OK");
			if(data == "0"){
				alert("수정되지 않았습니다.");
				guestRemo(guest_num);
			}else{
				alert("수정이 완료되었습니다.");
				guestRemo(guest_num);
				guestNext(muse_name, pagenum);
			}
		}
	});
}

function guestDel(guest_num){
	//alert(guest_num);
	var root = $("#root").val(); 
	var pagenum = $("input[name='pagenum']").val();
	var muse_name = $("input[name='muse_name']").val();
	var sendData="guest_num="+guest_num;
	//alert(sendData);
	var url = root + "/museGuest/delete.do?";
	//alert(url);
	$.ajax({
		url: url,
		type:"get",
		data:sendData,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		dataType:"text",
		success:function(data){
			//alert("OK");
			if(data == "0"){
				alert("삭제되지 않았습니다.");
				
			}else{
				alert("삭제가 완료되었습니다.");
				guestNext(muse_name, pagenum);
			}
		}
	});
}
