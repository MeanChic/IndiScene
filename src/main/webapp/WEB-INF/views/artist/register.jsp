<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Artist</title>
<script type="text/javascript" src="${root}/js/artist.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/artist.css"/>
</head>
<body>
	<center>[Artist register]</center>
	<div>
		<form name="artistForm" action="${root}/artist/register.do" method="POST" onsubmit="return registerForm(this)">
			아티스트 아이디를 반환한다.
			<div>
				<label>Id</label>
				<input type="text" name="id"/>
				<input type="button" value="idCheck" onclick="idCheck(memberForm, '${root}')"/>
			</div><br/>
			아티스트 비밀번호를 입력받는다.
			<div>
				<label>Password</label>
				<input type="password" name="password"/>
				<label>Password Check</label>
				<input type="password" name="passwordCheck"/>
			</div><br/>
			아티스트 이름을 입력받는다.
			<div>
				<label>Name</label>
				<input type="text" name="name"/>
			</div><br/>
			아티스트 닉네임을 입력받는다.
			<div>
				<label>Nickname</label>
				<input type="text" name="nickName"/>
			</div><br/>
			아티스트 전화번호 입력받는다.
			<div>
				<label>Phone</label>
				<input type="text" name="phone"/>
			</div><br/>
			아티스트 우편번호를 입력받는다.
			<div>
				<label>Zipcode</label>
				<input type="text" name="zipcode"/>
				<input type="button" value="Zipcode" onclick="zipcodeCheck(memberForm,'${root}')"/>
			</div><br/>
			아티스트 주소를 입력받는다.
			<div>
				<label>Address</label>
				<input type="text" name="address"/>
			</div><br/>
			아티스트 생년월일을 입력받는다.
			<div>
				<label>Birth</label>
				<input type="hidden" name="birth"/>
				<select name="year">
					<option></option>
					<option value="2015">2015</option>
					<option value="2014">2014</option>
				</select>년&nbsp;
				<select name="month">
					<option></option>
					<option value="1">1</option>
					<option value="2">2</option>
				</select>월&nbsp;
				<select name="day">
					<option></option>
					<option value="1">1</option>
					<option value="2">2</option>
				</select>일&nbsp;
			</div><br/>
			아티스트의 사진경로를 입력받는다.
			<div>
				<label>Profile Image</label>
				<input type="text" name="picture"/>
				<input type="button" name="picturePath"/>
				<div>
					<img alt="" src="">
				</div>				
			</div><br/>
			아티스트 레벨을 설정 받는다.
			<div>
				<input type="submit" value="sign in"/>
			</div><br/>
		</form>
	</div>
</body>
</html>

