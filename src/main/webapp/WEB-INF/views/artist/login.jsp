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
	<form id="artistLoginForm" action="${root }/artist/login.do" method="post">
		<table border="1" align="center" cellpadding="2" cellspacing="0">
			<tr>
				<td>ID</td>
				<td><input type="text" name="artist_id"/></td>
			</tr>
			
			<tr>
				<td>Password</td>
				<td><input type="password" name="artist_password" /></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input class="ui-button" type="submit" value="확인"/>
					<input class="ui-button" type="reset" value="취소"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>