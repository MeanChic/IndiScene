/* Artist registerForm */
function registerForm(form){
	/* ID */
	if($("input[name='artist_id']").val()==""){
		alert("Please, Enter ID");
		$("input[name='artist_id']").focus();
		return false;
	}
	if($("input[name='artist_id']").val().length > 20 || $("input[name='artist_id']").val().length < 5){
		alert("ID is too long or too short. Character length of ID is good when between 5 and 20.");
		$("input[name='artist_id']").focus();
		return false;
	}
	
	/* Password */
	if($("input[name='artist_password']").val()==""){
		alert("Please, Enter password");
		$("input[name='artist_password']").focus();
		return false;
	}
	if($("input[name='artist_password']").val().length > 20 || $("input[name='artist_password']").val().length < 5){
		alert("Password is too long or too short. Character length of Password is good when between 5 and 20.");
		$("input[name='artist_password']").focus();
		return false;
	}
	if($("input[name='artist_password']").val()!=$("input[name='passwordCheck']").val()){
		alert("Check the password and password is different");
		$("input[name='passwordCheck']").focus();
		return false;
	}
	/* Name */
	if($("input[name='artist_name']").val()==""){
		alert("Please, Enter your name");
		$("input[name='artist_name']").focus();
		return false;
	}
	if($("input[name='artist_name']").val().length > 30 || $("input[name='artist_name']").val().length < 3){
		alert("Name is too long or too short. Character length of Name is good when between 3 and 30.");
		$("input[name='artist_name']").focus();
		return false;
	}
	
	/* Nickname */
	if($("input[name='artist_nickname']").val()==""){
		alert("Please, Enter Nickname");
		$("input[name='artist_nickname']").focus();
		return false;
	}
	if($("input[name='artist_nickname']").val().length > 30 || $("input[name='artist_nickname']").val().length < 3){
		alert("Nickname is too long or too short. Character length of Nickname is good when between 3 and 30.");
		$("input[name='artist_nickname']").focus();
		return false;
	}
	
	/* Phone */
	if($("input[name='artist_phone']").val()==""){
		alert("Please, Enter phone");
		$("input[name='artist_phone']").focus();
		return false;
	}
	
	/* Zipcode */
	if($("input[name='artist_zipcode']").val()==""){
		alert("Please, Enter Zipcode");
		$("input[name='artist_zipcode']").focus();
		return false;
	}
	
	/* Address */
	if($("input[name='artist_address']").val()==""){
		alert("Please, Enter Address");
		$("input[name='artist_address']").focus();
		return false;
	}
	
	/* Birth */
	if($("input[name='artist_birth']").val()==""){
		alert("Please, Enter Birth");
		$("input[name='artist_birth']").focus();
		return false;
	}
	/* Profile Image */
}

function idCheck(artistForm, root){
	if($("input[name='artist_id']").val()==""){
		alert("Please, Enter ID");
		$("input[name='artist_id']").focus();
		return false;
	}
	var url=root+"/artist/idCheck.do?artist_id="+artistForm.artist_id.value;
	window.open(url,"","width=250, height=150");
}	

function nicknameCheck(artistForm, root){
	if($("input[name='artist_nickname']").val()==""){
		alert("Please, Enter Nickname");
		$("input[name='artist_nickname']").focus();
		return false;
	}
	var url=root+"/artist/nicknameCheck.do?artist_nickname="+artistForm.artist_nickname.value;
	window.open(url,"","width=250, height=150");
}

function deleteCheck(deleteForm, root){	
	var url=root+"/artist/deleteOk.do?artist_id="+deleteForm.artist_id.value;
	//프로젝트명은 변할 수 있으니까 직접 치지말고 delete.jsp로부터 프로젝트명을 받아와서 주소에 담아주자.
	//alert(url);
	
	var value=confirm("really?");
	
	if(value==true){
		location.href=url;
	}else{
		alert("fail");
	}
	//name이란 변수의 값을 가지고 갈 땐 어떻게 해야 할까요?
}

function zipcodeCheck(form, root){
	//alert(form+", "+root);
	var url=root+"/artist/zipcode.do";
	window.open(url,"","width=500, height=500");
}

function sendAddress(zipcode, sido, gugun, dong, ri, bunji){
	//일반 javascript
/*	var address=sido+gugun+dong+ri+bunji;
	//alert(zipcode+"\n"+address);
	opener.memberForm.zipcode.value=zipcode;
	opener.memberForm.address.value=address;
	self.close();*/
	
	//jquery
	//alert("sendAddress 왓당.");
	var address=sido+gugun+dong+ri+bunji;
	//alert(address);
	
	//alert($(opener.document).find("input[name='zipcode']").length);
	$(opener.document).find("input[name='zipcode']").val(zipcode);
	//$(opener.document).find("input[name='zipcode']").attr("value",zipcode);
	//$(opener.document).find("input[name='zipcode']").text(zipcode);
	$(opener.document).find("input[name='address']").val(address);
	self.close();
}

// Jquery
$(document).ready(function(){
	$("input[name='artist_id']").attr("placeholder", "5자 이상 20자 이하로 쓰세요.");
	$("input[name='artist_password']").attr("placeholder", "5자 이상 20자 이하로 쓰세요.");
	$("input[name='artist_name']").attr("placeholder", "3자 이상 30자 이하로 만드세요.");
	$("input[name='artist_nickname']").attr("placeholder", "3자 이상 30자 이하로 만드세요.");
	$("input[name='artist_phone']").attr("placeholder", "예)000-1111-2222");
	$("input[name='artist_zipcode']").attr("placeholder", "집 주소를 입력하세요.");
	$("input[name='artist_address']").attr("placeholder", "상세주소를 입력하세요.");
	$("input[name='artist_picture']").attr("placeholder", "Profile사진을 설정해주세요.");
	
	$(this).attr("value","");
})




