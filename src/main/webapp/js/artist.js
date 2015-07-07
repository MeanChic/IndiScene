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
	var value=confirm("really?");
	
	if(value==true){
		location.href=url;
	}else{
		alert("fail");
	}
}

function zipcodeCheck(form, root){
	//alert(form+", "+root);
	var url=root+"/artist/zipcode.do";
	window.open(url,"","width=500, height=500");
}

function sendAddress(zipcode, sido, gugun, dong, ri, bldg, bunji){
	var address=sido+gugun+dong+ri+bldg+bunji;
	//alert(zipcode+"\n"+address);
	//opener.registerForm.artist_zipcode.value=zipcode;
	//opener.registerForm.artist_address.value=address;
	//self.close();
	
	//alert($(opener.document).find("input[name='zipcode']").length);
	$(opener.document).find("input[name='artist_zipcode']").val(zipcode);
	$(opener.document).find("input[name='artist_zipcode']").attr("value",zipcode);
	$(opener.document).find("input[name='artist_zipcode']").text(zipcode);
	$(opener.document).find("input[name='artist_address']").val(address);
	self.close();
}

// Jquery
$(document).ready(function(){
	var root = $("#root").val();
	
	$("#accordion").accordion();
	$("#accordion").css("width","500px");
	$("#artist > button").button();
	
	$("input[name='artist_id']").attr("placeholder", "5자 이상 20자 이하로 쓰세요.");
	$("input[name='artist_password']").attr("placeholder", "5자 이상 20자 이하로 쓰세요.");
	$("input[name='artist_name']").attr("placeholder", "3자 이상 30자 이하로 만드세요.");
	$("input[name='artist_nickname']").attr("placeholder", "3자 이상 30자 이하로 만드세요.");
	$("input[name='artist_phone']").attr("placeholder", "예)000-1111-2222");
	$("input[name='artist_zipcode']").attr("placeholder", "집 주소를 입력하세요.");
	$("input[name='artist_address']").attr("placeholder", "상세주소를 입력하세요.");
	$("input[name='artist_picture']").attr("placeholder", "Profile사진을 설정해주세요.");
	
	$("input[name='artist_birth']").datepicker();
	
	$(this).attr("value","");
	
	$("input[type='file']").click(function(){
		if(window.File && window.FileList && window.FileReader)
	    {
	        var filesInput = this;
	        filesInput.addEventListener("change", function(event){
	            var files = event.target.files; //FileList object
	            var output = document.getElementById("result");
	            
	             for(var i = 0; i< files.length; i++)
	            {
	                var file = files[i];
	                 if(!file.type.match('image'))
	                   continue;	               
	                var picReader = new FileReader();		                
	                picReader.addEventListener("load",function(event){		                    
	                    var picFile = event.target;		                    
	                    var div = document.createElement("div");		                    
	                    div.innerHTML = "<img name='img' class='thumbnail' src='" + picFile.result + "'" +"title='" + picFile.name + "'/>";
	                    output.insertBefore(div,null);            
	           		});
	                 picReader.readAsDataURL(file); 
	            }                                   
	        });
	    }
	    else
	    {
	        console.log("Your browser does not support File API");
	    }
	});
	
	$("button[name='register']").click(function(){
		if($("#artistRegister").val()==undefined){
			$("#centerContents").append("<div id='artistRegister' class='hasPaddingContents'></div>")
			$("#artistRegister").css("display","block");
			$("#artistRegister").siblings().css("display","none");
			$.ajax({
				url:root+"/artist/register.do",
				type:"GET",
				dataType:"html",
				success:function(data){
					//alert(data);	//Test
					$("#artistRegister").append(data);
				}
			})
		}else{
			$("#artistRegister").css("display","block");
			$("#artistRegister").siblings().css("display","none");
		}
	})
	
	$("input[name='registerOk']").click(function(){
		var sendData="artist_id="+$("input[name='artist_id']").val()+"&artist_password="+$("input[name='artist_password']").val()+"&artist_name="+$("input[name='artist_name']").val()+"&artist_nickname="+$("input[name='artist_nickname']").val()+"&artist_phone="+$("input[name='artist_phone']").val()+"&artist_zipcode="+$("input[name='artist_zipcode']").val()+"&artist_address="+$("input[name='artist_address']").val()+"&artist_birth="+$("input[name='artist_birth']").val()+"&artist_picture="+$("input[name='artist_picture']").val();
		$.ajax({
			data:sendData,
			url:root+"/artist/register.do",
			type:"POST",
			dataType:"json",
			success:function(data){
				/* 회원가입 완료 */
			}
		})
	})
	
	$("button[name='login']").click(function(){
		location.href=root+"/artist/login.do";
	})
	
	$("button[name='updatelogin']").click(function(){
		if($("#artistUpdateLogin").val()==undefined){
			$("#centerContents").append("<div id='artistUpdateLogin' class='hasPaddingContents'></div>")
			$("#artistUpdateLogin").css("display","block");
			$("#artistUpdateLogin").siblings().css("display","none");
			$.ajax({
				url:root+"/artist/updatelogin.do",
				type:"GET",
				dataType:"html",
				success:function(data){
					//alert(data);	//Test
					$("#artistUpdateLogin").append(data);
				}
			})
		}else{
			$("#artistUpdateLogin").css("display","block");
			$("#artistUpdateLogin").siblings().css("display","none");
		}
	})
	
	$("button[name='logout']").click(function(){
		location.href=root+"/artist/logout.do";
	})
	
	$("button[name='update']").click(function(){
		var artist_id=$("input[name='artist_id']").val();
		var sendData="?artist_id="+artist_id;
		
		if($("#artistUpdate").val()==undefined){
			$("#centerContents").append("<div id='artistUpdate' class='hasPaddingContents'></div>")
			$("#artistUpdate").css("display","block");
			$("#artistUpdate").siblings().css("display","none");
			$.ajax({
				url:root+"/artist/update.do"+sendData,
				type:"GET",
				dataType:"html",
				success:function(data){
					//alert(data);	//Test
					$("#artistUpdate").append(data);
				}
			})
		}else{
			$("#artistUpdate").css("display","block");
			$("#artistUpdate").siblings().css("display","none");
		}
	})
	
	$("input[name='updateOk']").click(function(){
		var sendData="artist_id="+$("input[name='artist_id']").val()+"&artist_password="+$("input[name='artist_password']").val()+"&artist_name="+$("input[name='artist_name']").val()+"&artist_nickname="+$("input[name='artist_nickname']").val()+"&artist_phone="+$("input[name='artist_phone']").val()+"&artist_zipcode="+$("input[name='artist_zipcode']").val()+"&artist_address="+$("input[name='artist_address']").val()+"&artist_birth="+$("input[name='artist_birth']").val()+"&artist_picture="+$("input[name='artist_picture']").val()+"&artist_level="+$("input[name='artist_level']").val();
		$.ajax({
			data:sendData,
			url:root+"/artist/update.do",
			type:"POST",
			dataType:"json",
			success:function(data){
				/* 개인정보 수정 완료 */
			}
		})
	})
	
	$("button[name='delete']").click(function(){
		location.href=root+"/artist/delete.do";
	})
})


