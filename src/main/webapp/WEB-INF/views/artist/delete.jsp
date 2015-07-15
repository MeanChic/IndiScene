<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
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
	<div id="deleteForm">
		<form action="${root }/artist/delete.do" method="post" onsubmit="return deleteCheck(this)">
			<div class="form-controlArtist">
				<label class="form-inlineblock label-color">ID</label>
			    <div class="form-inlineblock">
					<input class="form-inlineblock form-controller" name="artist_idView"  value="${artist_id}" disabled="disabled"/>
					<input type="hidden" name="artist_id"  value="${artist_id}"/>
				</div>
			</div>
			<div class="form-controlArtist">
				<label class="form-inlineblock label-color">Password</label>
			    <div class="form-inlineblock">
					<input class="form-inlineblock form-controller" type="password" name="artist_password"/>
				</div>
			</div>
			<div class="form-controlArtist">
	    		<div class="form-inlineblock button-control">
					<input type="submit" class="btn btn-default size-control1" style="width:49%;" value="회원탈퇴"/>
					<input type="reset" class="btn btn-default size-control1" style="width:49%;" value="취소"/>
				</div>
			</div>
		</form>
	</div>
</body>
</html>