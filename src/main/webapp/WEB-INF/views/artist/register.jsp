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
	<form name="artistForm" class="form-inline" onsubmit="return registerForm(this)">
		<div class="form-group artist_size">
			<label class="col-sm-2 control-label">Id</label>
		    <div class="artist_input">
				<input class="form-control" type="text" name="artist_id"/>
				<input class="form-control" type="button" value="Duplicate Check" onclick="return idCheck(artistForm, '${root}')"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Password</label>
		    <div class="artist_input">
				<input class="form-control" type="password" name="artist_password"/>
				<input class="form-control" type="password" name="passwordCheck"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Name</label>
		    <div class="artist_input">
				<input class="form-control" type="text" name="artist_name"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Nickname</label>
		    <div class="artist_input">
				<input class="form-control" type="text" name="artist_nickname"/>
				<input class="form-control" type="button" value="Duplicate Check" onclick="nicknameCheck(artistForm, '${root}')"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Phone</label>
			<div class="artist_input">
				<input class="form-control" type="text" name="artist_phone"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Zipcode</label>
			<div class="artist_input">
				<input class="form-control" type="text" name="artist_zipcode"/>
				<input class="form-control" type="button" value="Zipcode" onclick="zipcodeCheck(artistForm,'${root}')"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Address</label>
			<div class="artist_input">
				<input class="form-control" type="text" name="artist_address"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Birth</label>
			<div class="artist_input">
				<input class="form-control" type="date" name="artist_birth"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Profile Image</label>
			<div class="artist_input">
				<input class="form-control" type="file" name="artist_picture"/>
			</div>
		</div>
		<div class="registerOkButton form-group">
    		<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" name="registerOk" class="btn btn-default" value="Sign up"/>
			</div>
		</div>
	</form>
</div>
</body>
</html>
