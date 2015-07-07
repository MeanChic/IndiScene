<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/artist.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/artist.css"/>
</head>
<body>
	<div id="updateLogin">
		<table border="1" align="center" cellpadding="2" cellspacing="0">
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="artist_id" value="${artist_id}"/>
					<button name="update">회원정보수정</button>
					<button name="delete">회원탈퇴</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>