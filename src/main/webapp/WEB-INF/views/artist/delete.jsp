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
	<div id="deleteForm">
	<h3>Secession</h3>
		<form class="controlArtistForm" action="${root }/artist/delete.do" method="post" onsubmit="return deleteCheck(this)">
			<div class="form-controlArtist">
				<label class="form-inlineblock label-color">ID</label>
			    <div class="form-inlineblock">
					<input class="form-inlineblock form-controller320" name="artist_idView"  value="${artist_id}" disabled="disabled"/>
					<input type="hidden" name="artist_id"  value="${artist_id}"/>
				</div>
			</div>
			<div class="form-controlArtist">
				<label class="form-inlineblock label-color">Password</label>
			    <div class="form-inlineblock">
					<input class="form-inlineblock form-controller320" type="password" name="artist_password"/>
				</div>
			</div>
			<div class="form-controlArtist" style="">
	    		<div class="marginCenter marketBoardX-location01">
					<input type="submit" class="btn btn-default marketBoardAttribute01" value="Byebye"/>
					<input type="button" class="btn btn-default marketBoardAttribute01" value="Cancel"/>
				</div>
			</div>
		</form>
	</div>
</body>
</html>