<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<title>Momentio - single page html template by GraphBerry.com</title>
	<!-- Load google font -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link href='http://fonts.googleapis.com/css?family=Questrial' rel='stylesheet' type='text/css'>
	<!-- Load styles -->
	<link href="${root}/css/bootstrap.css" rel="stylesheet">
	<link href="${root}/css/style.css" rel="stylesheet">
	<link href="${root}/css/icons.css" rel="stylesheet">
	<link href="${root}/css/colorbox.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${root}/css/artist.css"/>
	
	<!-- Load javascrips libraries-->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="${root}/js/jquery.bxslider.js"></script>
	<script src="${root}/js/jquery.easypiechart.js"></script>
	<script src="${root}/js/jquery.colorbox.js"></script>
	<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${root}/js/artist.js"></script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
</head>
<body>
<div id="RegisterForm">
	<form name="artistForm" class="controlArtistForm" onsubmit="return registerForm(this)">
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Id</label>
		    <div class="form-inlineblock">
				<input class="form-inlineblock form-controllerler" type="hidden" name="artist_id" value="${artist.artist_id}"/>
				<input class="form-inlineblock form-controllerler" type="text" name="artist_idView" value="${artist.artist_id}" disabled="disabled"/>
			</div>
		</div>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Password</label>
		    <div class="form-inlineblock">
				<input class="form-inlineblock form-controllerler" type="password" name="artist_password"/>
				<input class="form-inlineblock form-controllerler" type="password" name="passwordCheck"/>
			</div>
		</div>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Name</label>
		    <div class="form-inlineblock">
				<input class="form-inlineblock form-controllerler" type="text" name="artist_name" value="${artist.artist_name}"/>
			</div>
		</div>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Nickname</label>
		    <div class="form-inlineblock">
				<input class="form-inlineblock form-controllerler" type="text" name="artist_nickname" value="${artist.artist_nickname}"/>
				<input class="form-inlineblock form-controllerler" type="button" value="Duplicate Check" onclick="nicknameCheck(artistForm, '${root}')"/>
			</div>
		</div>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Phone</label>
			<div class="form-inlineblock">
				<input class="form-inlineblock form-controllerler" type="text" name="artist_phone" value="${artist.artist_phone}"/>
			</div>
		</div>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Zipcode</label>
			<div class="form-inlineblock">
				<input class="form-inlineblock form-controllerler" type="text" name="artist_zipcode" value="${artist.artist_zipcode}"/>
				<input class="form-inlineblock form-controllerler" type="button" value="Zipcode" onclick="zipcodeCheck(artistForm,'${root}')"/>
			</div>
		</div>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Address</label>
			<div class="form-inlineblock">
				<input class="form-inlineblock form-controllerler" type="text" name="artist_address" value="${artist.artist_address}"/>
			</div>
		</div>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Birth</label>
			<div class="form-inlineblock">
				<input class="form-inlineblock form-controllerler" type="date" name="artist_birth"/>
			</div>
		</div>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color">Profile Image</label>
			<div class="form-inlineblock">
				<input class="form-inlineblock form-controllerler" type="file" name="artist_picture" value="${artist.artist_picture}"/>
			</div>
		</div>
		<div class="form-controlArtist" style="margin-top:35px;">
			<input type="hidden" name="artist_level" value="${artist.artist_level}"/>
    		<div class="form-inlineblock button-control">
				<input type="submit" class="btn btn-default" value="submit" name="updateOk"/>
				<input type="button" class="btn btn-default" value="cancel"/>
			</div>
		</div>
	</form>
</div>
</body>
</html>

