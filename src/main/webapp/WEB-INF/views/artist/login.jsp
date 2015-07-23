<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="utf-8">
	<script type="text/javascript" src="${root}/js/artist.js"></script>
</head>
<body>
<div id="artistLoginForm">
	<form id="artistLoginForm2" action="${root }/artist/login.do" method="post">
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color" style="font-size:1.5em;">ID</label>
		    <div class="form-inlineblock">
				<input class="form-inlineblock form-controller220" type="text" name="artist_id" style="font-size:1.1em;"/>
			</div>
		</div>
		<br/>
		<div class="form-controlArtist">
			<label class="form-inlineblock label-color" style="font-size:1.5em;">Password</label>
		    <div class="form-inlineblock">
				<input class="form-inlineblock form-controller220" type="password" name="artist_password" style="font-size:1.1em;"/>
			</div>
		</div>
		<div class="form-controlArtist">
    		<div class="form-inlineblock button-control">
				<input type="button" onclick="artistLogIn('${root}')" class="btn btn-default size-control1" style="width:49%;" value="submit"/>
				<input type="reset" class="btn btn-default size-control1" style="width:49%;" value="cancel"/>
			</div>
		</div>
	</form>
</div>
</body>
</html>