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
	//${boardList}
	
	<c:forEach var="list" items="${boardList}">
	${list.file_path}
		<li>
			<a href="${root}/performBoard/read.do?board_num=${list.board_num}&pageNumber=${currentPage}">
				<span><img src="${root}/resources/performResource/${list.file_path}" width="142" height="83"/></span><br/>
				<span>${list.subject}</span>
			</a>
			<a><span>${list.artist_id}</span></a>
		</li>
		
	</c:forEach>
</body>
</html>