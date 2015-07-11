<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:set var="artist_id" value="indiScene"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a style="margin:0 0 0 600px"href="javascript:uploadList('${root}','${pageNumber}')">리스트로 돌아가기</a>
	<div style="border:solid 1px black; width:700px; margin:100px 0 100px 20px ">
	<span>${pageNumber}</span><span>${board.register_date}</span>
	<div style="border:solid 1px black;float:left;"><img alt="" src="${boardDto.image_path}"></div>
	<div style="border:solid 1px black">${boardDto.subject}</div>
	<div style="border:solid 1px black; float:left"><audio controls src="${boardDto.file_path}"></audio></div>
	<div style="border:solid 1px black">${boardDto.artist_id}</div>
	<div style="border:solid 1px black; height:100px;">${boardDto.content}</div>
	${boardDto.d_day}<br/>
	${boardDto.count}<br/>
	
	</div>
</body>
</html>