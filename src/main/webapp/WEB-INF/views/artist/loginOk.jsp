<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/artist.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/artist.css"/>
</head>
<body>
	<c:choose>
		<c:when test="${artist_level !=null}">
		<!-- session에 setAttribute하는 것 -> c:set의 scope속성을 사용해서 session에 데이터를 담는다.-->
			<c:set var="artist_id" value="${artist_id }" scope="session"/>
			<c:set var="artist_level" value="${artist_level }" scope="session"/>
			
			<script type="text/javascript">
				alert("Login Success.");
				location.href="${root}/artist.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("You were entered the wrong information.");
				location.href="${root}/artist/login.do";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>