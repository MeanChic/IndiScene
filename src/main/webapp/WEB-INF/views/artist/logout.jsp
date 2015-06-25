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
	<!-- 로그아웃은 그냥 session에 담겨있는 id와 Level을 지워주면 끝! -->
	<c:remove var="id" scope="session"/>	<!-- session안에서 다 지워 줄 것이다/ -->
	<c:remove var="level" scope="session"/>
	
	<script type="text/javascript">
		alert("Logout success.");
		/* location.href="${root}/member/login.do"; */
		$(location).attr("href","${root}/artist.jsp");
	</script>
</body>
</html>