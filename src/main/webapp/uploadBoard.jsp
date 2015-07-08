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
</head>
<body>
	<script type="text/javascript" src="${root}/js/uploadBoard.js"></script>
	<a href="javascript:write('${root}')">글쓰기</a>
	<div id="centerContents"></div>
</body>
</html>