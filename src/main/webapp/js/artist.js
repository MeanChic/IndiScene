/* Artist registerForm */
function registerForm(){
	/* ID */
	if(form.id.value==null){
		alert("Please, Enter ID");
		form.id.focus();
		return false;
	}
	/* Password */
	if(form.password.value==null){
		alert("Please, Enter password");
		form.password.focus();
		return false;
	}
	if(form.password.value!=form.passwordCheck.value){
		alert("Check the password and password is different");
		form.passwordCheck.focus();
		return false();
	}
	/* Name */
	if(form.name.value==null){
		alert("Please, Enter your name");
		form.name.focus();
		return false;
	}
	/* Nickname */
	if(form.nickName.value==null){
		alert("Please, Enter Nickname");
		form.nickName.focus();
		return false;
	}
	/* Phone */
	if(form.phone.value==null){
		alert("Please, Enter phone");
		form.phone.focus();
		return false;
	}
	/* Zipcode */
	if(form.zipcode.value==null){
		alert("Please, Enter Zipcode");
		form.zipcode.focus();
		return false;
	}
	/* Address */
	if(form.address.value==null){
		alert("Please, Enter Address");
		form.address.focus();
		return false;
	}
	/* Birth */
	if(form.birth.value==null){
		alert("Please, Enter Birth");
		form.birth.focus();
		return false;
	}
	/* Profile Image */
	for(var i=0;i<form.interestValue.length;i++){
		if(form.interestValue[i].checked==true){
			str+=form.interestValue[i].value+",";
			check=true;
		}
	}
	/* Artist Level */
	if(form.level.value==null){
		
	}
}