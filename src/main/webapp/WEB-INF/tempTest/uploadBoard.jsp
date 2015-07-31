<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${root }/resources/ckEditor/ckeditor.js"></script>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/uploadBoard.js"></script>	
</head>
<body onload="javascript:list('${root }','1')">
	<a href="javascript:uploadWrite('${root}')">글쓰기</a>
	<a href="javascript:uploadList('${root}',1)">리스트</a>
	<div id="centerContents"><h1>가나다라마바사아장차카타파하</h1></div>
</body>
</html>