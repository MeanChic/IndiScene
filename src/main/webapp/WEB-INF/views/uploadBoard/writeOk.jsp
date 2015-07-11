<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<c:set var="root" value="${pageContext.request.contextPath }"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${check>0 }">
		<script type="text/javascript">
			alert("글쓰기를 성공하였습니다.");
			uploadList('${root}','1');
		</script>
	</c:if>
	
	<c:if test="${check==0 }">
		<script type="text/javascript">
			alert("글쓰기를 실패하였습니다.");
			location.href="${root}/freeBoard/write.do?page_num=${page_num}";
		</script>
	</c:if>
</body>
</html>