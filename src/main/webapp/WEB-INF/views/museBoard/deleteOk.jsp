<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>	
	<div id="noticedeleteOk">
	<c:if test="${check>0 }">
		<script type="text/javascript">
			alert("삭제가 완료되었습니다.");
			/* location.href="${root}/notice/list.do?pageNumber=${pageNumber}"; */
			noticeList('${root}','${pageNumber}','${muse_name}');
		</script>
	</c:if>
	
	<c:if test="${check==0 }">
		<script type="text/javascript">
			alert("삭제가 실패되었습니다.");
			noticeList('${root}','${pageNumber}','${muse_name}');
		</script>
	</c:if>
	</div>
</body>
</html>