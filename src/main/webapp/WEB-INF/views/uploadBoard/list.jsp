<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set value="${currentPage}" var="currentPage"/>
	<c:forEach var="list" items="${boardList}">
		<div>
			<input type="checkbox" value="${list.board_num}"/>
			<img src="${root}${list.image_path}" style="width:50px; height:50px;"/>
			<a href="javascript:uploadRead('${root}','${list.board_num}','${currentPage}')">${list.subject}</a>
			<audio controls src="${root}${list.file_path}"></audio>
		</div>
	</c:forEach>
</body>
</html>