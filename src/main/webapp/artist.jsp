<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Artist</title>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/artist.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/artist.css"/>
</head>
<body>
	<center>[Artist]</center>
	<!-- 
	<div>
		0.<a href="${root}/artist/test.do">[Test]</a><br/>
	</div>
	 -->
	<div>
		<c:choose>
			<c:when test="${artist_id ==null}">
				<b>Welcom to Indi Scene</b><br/>
				1.<a href="${root}/artist/register.do">[회원가입]</a><br/>
				2.<a href="${root}/artist/login.do">[로그인]</a><br/>
			</c:when>
			<c:otherwise>
				<b>Welcom to Indi Scene</b><br/>
				1.<a href="${root}/artist/update.do">[개인정보 수정]</a><br/>
				2.<a href="${root}/artist/logout.do">[로그아웃]</a><br/>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>

