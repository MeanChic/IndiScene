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
	<c:if test="${check>0 }">
		<script type="text/javascript">
			alert("Complete sign up.");
			//location.href="${root}/member/register.do";
			$(location).attr("href","${root}/artist.jsp");	//jquery
		</script>
	</c:if>
	
	<c:if test="${check==0 }">
		<script type="text/javascript">
			alert("Fail sign up");
			//location.href="${root}/member/register.do";
			$(location).attr("href","${root}/artist/register.do");	//jquery
		</script>
	</c:if>
</body>
</html>