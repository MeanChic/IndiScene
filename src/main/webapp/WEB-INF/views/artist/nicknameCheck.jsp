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
<body class="minSize">
	<div class="duplicateWindow">
		<c:if test="${check==1 }">	
			<div class="form-controlArtist">
				<label class="form-inlineblock label-color">Nickname is already in use.</label>
				<div class="form-inlineblock">
					<form action="${root }/artist/nicknameCheck.do" method="GET">
						<input class="form-inlineblock form-controller220" type="text" name="artist_nickname"/>
						<input class="form-inlineblockButton form-controller220" type="submit" value="Duplicate Check"/>
					</form>
				</div>
			</div>
		</c:if>
		
		<c:if test="${check==0 }">
			<div class="form-controlArtist" align="center">
				<label class="form-inlineblock label-color">Can use Nickname.</label>
			</div>
		</c:if>
		
		<div class="form-controlArtist" align="center">
		<input class="btn btn-default" type="button" value="close"/>
			<script type="text/javascript">
				$(document).ready(function(){
					$("input[type='button']").click(function(){
						opener.artistForm.artist_nickname.value="${artist_nickname}";
						self.close();
					})
				})
			</script>
		</div>
	</div>
</body>
</html>