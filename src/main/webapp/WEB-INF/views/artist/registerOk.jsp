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
		<c:when test="${check !=null}">
			<script type="text/javascript">
				alert("Success create an account.");
				location.href="${root}/Template.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("Fail sign up.");
				location.href="${root}/Template.jsp";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>