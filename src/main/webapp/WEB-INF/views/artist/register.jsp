<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<script type="text/javascript" src="${root}/js/artist.js"></script>
</head>
<body>
<div id="RegisterForm">
	<form name="artistForm" class="controlArtistForm" onsubmit="return registerForm(this)">
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Id</label>
		    <div class="form-inlineblock">
				<input id="artist_id" class="form-inlineblock form-controller320" type="text" name="artist_id"/>
				<input class="form-inlineblockButton form-controller220" type="button" value="Duplicate Check" onclick="return idCheck(artistForm, '${root}')"/>
			</div>
		</div>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Password</label>
		    <div class="form-inlineblock">
				<input class="form-inlineblock form-controller320" type="password" name="artist_password"/>
				<input class="form-inlineblock form-controller320" type="password" name="passwordCheck"/>
			</div>
		</div>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Name</label>
		    <div class="form-inlineblock">
				<input class="form-inlineblock form-controller320" type="text" name="artist_name"/>
			</div>
		</div>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Nickname</label>
		    <div class="form-inlineblock">
				<input class="form-inlineblock form-controller320" type="text" name="artist_nickname"/>
				<input class="form-inlineblockButton form-controller220" type="button" value="Duplicate Check" onclick="nicknameCheck(artistForm, '${root}')"/>
			</div>
		</div>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Phone</label>
			<div class="form-inlineblock">
				<input class="form-inlineblock form-controller320" type="text" name="artist_phone"/>
			</div>
		</div>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Zipcode</label>
			<div class="form-inlineblock">
				<input class="form-inlineblock form-controller320" type="text" name="artist_zipcode"/>
				<input class="form-inlineblockButton form-controller220" type="button" value="Zipcode" onclick="zipcodeCheck(artistForm,'${root}')"/>
			</div>
		</div>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Address</label>
			<div class="form-inlineblock">
				<input id="artist_address" class="form-inlineblock form-controller320" type="text" name="artist_address"/>
			</div>
		</div>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Birth</label>
			<div class="form-inlineblock">
				<input class="form-inlineblock form-controller320" type="date" name="artist_birth"/>
			</div>
		</div>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Profile Image</label>
			<div class="form-inlineblock">
				<input class="form-inlineblock form-controller320" type="file" name="artist_picture"/>
			</div>
		</div>
		<div class="form-controlArtist" style="margin-top:35px;">
    		<div>
				<input type="submit" name="registerOk" class="btn btn-default marginCenter" value="Sign up"/>
			</div>
		</div>
	</form>
</div>
</body>
</html>
