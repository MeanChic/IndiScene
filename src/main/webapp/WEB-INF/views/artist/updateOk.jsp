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
		<script type="text/javascript">
			alert("Update succeess.");
			location.href="${root}/artist.jsp";
			//$(location).attr("href","${root}/member/main.do");
		</script>
	</c:if>
	
	<c:if test="${check==0 }">
		<script type="text/javascript">
			alert("fail update.");
			location.href="${root}/artist/update.do";
			//$(location).attr("href","${root}/member/update.do");
		</script>
	</c:if>
</body>
</html>