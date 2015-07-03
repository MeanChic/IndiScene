<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:set var="artist_id"  value="A"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="${root }/performBoard/write.do">시작해보자</a>
	<a href="${root}/performBoard/list.do"> 리스트 보기 </a>	


	
	<a href="${root}/museCreate/logup.do">muse개설</a>
	<a href="${root}/museCreate/musemain.do?artist_id=${artist_id}">musemain</a>
	
	
	<a href="${root}/museGuest/guest.do?muse_name=abc">guest</a>
	<span>
		
	</span>
	
	<span>
	
	</span>
	
	<span>
	
	</span>
</body>
</html>
