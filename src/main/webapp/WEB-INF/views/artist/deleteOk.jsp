<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/artist.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/artist.css"/>
</head>
<body>
	<c:if test="${check>0 }">
		<c:remove var="id" scope="session"/>
		<c:remove var="memberLevel" scope="session"/>
		
		<script type="text/javascript">
			alert("Thanks you. See you soon");
			//location.href="${root}/artist/main.do";
			$(location).attr("href","${root}/artist.jsp");
		</script>
	</c:if>
	
	<c:if test="${check==0 }">
		<script type="text/javascript">
			alert("Fail secede.");
			$(location).attr("href","${root}/artist/delete.do");
		</script>
	</c:if>
</body>
</html>