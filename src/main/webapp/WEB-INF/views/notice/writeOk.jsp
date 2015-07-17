<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
${root}, ${pageNumber}
	<div id="noticeWriteOk">
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<c:if test="${check>0 }">
		<script type="text/javascript">
			alert("글쓰기를 성공하였습니다.");
			noticeList('${root}','${pageNumber}');
			/* 	location.href="${root}/notice/list.do?page_num=${page_num}"; */
		</script>
	</c:if>
	
	<c:if test="${check==0 }">
		<script type="text/javascript">
			var root = $("#root").val();
			alert("글쓰기를 실패하였습니다.");
			noticeList(root);
/* 		location.href="${root}/notice/write.do?page_num=${page_num}";
 */		</script>
	</c:if>
	</div>
</body>
</html>