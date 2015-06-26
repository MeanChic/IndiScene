<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<a href="${root}/test.do">테스트</a>
	
	<h3>게시판</h3>
	
	<a href="${root }/notice/write.do">공지사항쓰기</a> 
	<br/>
	<a href="${root }/notice/list.do">공지사항 목록보기</a>
	
</body>
</html>