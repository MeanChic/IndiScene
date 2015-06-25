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
	${check}
	${boardList}
	
	<c:forEach var="list" items="${boardList}">
	${list.file_path}
		<li>
			<a href="${root}/performBoard/read.do?board_num=${list.board_num}&pageNumber=${currentPage}">
			<c:if test="${list.file_path!=null}">
				<span><img src="${root}/${list.file_path}" width="142" height="83"/></span><br/>
			</c:if>
			<c:if test="${list.file_path==null}">
				<span><img src="${root}/resources/performResource/1435143705961_Koala.jpg" width="142" height="83"/></span><br/>
			</c:if>	
				<span>${list.subject}</span>
			</a>
			<a><span>${list.artist_id}</span></a>
		</li>
		
	</c:forEach>
</body>
</html>