<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="freeBoardWriteOk">	
	<input type="hidden" id="root" value="${root }"/>
	<c:if test="${check>0 }">
		<script type="text/javascript">
			alert("글쓰기를 성공하였습니다.");
			/* location.href="${root}/freeBoard/list.do?page_num=${page_num}"; */
			freeBoardList('${root}','${pageNumber}');
		</script>
	</c:if>
	
	<c:if test="${check==0 }">
		<script type="text/javascript">
			var root = $("#root").val();
			alert("글쓰기를 실패하였습니다.");
			freeBoardL(root);
			/* location.href="${root}/freeBoard/write.do?page_num=${page_num}"; */
		</script>
	</c:if>
	</div>
</body>
</html>