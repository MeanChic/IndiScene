<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<%-- <c:set var="artist_id" value="indi"/> --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a style="margin:0 0 0 600px"href="javascript:museList('${root}','${pageNumber}','${muse_name}')">리스트로 돌아가기</a>
	<div style="border:solid 1px black; width:700px; margin:100px 0 100px 20px ">
	<span>${pageNumber}</span><span>${boardDto.register_date}</span>
	<div style="border:solid 1px black;"><img alt="" src="${root}${boardDto.image_path}" style="width:100px; height:100px;"></div>
	<div style="border:solid 1px black">${boardDto.subject}</div>
	<div style="border:solid 1px black;"><audio controls src="${root}${boardDto.file_path}"></audio></div>
	<div style="border:solid 1px black">${boardDto.artist_id}</div>
	<div style="border:solid 1px black; height:100px;">${boardDto.content}</div>
<br/>
	${boardDto.count}<br/>
	<%-- <a href="javascript:uploadLike('${root}','${board_num}','${artist_id}')"><img src="${root}/resources/uploadBoard/social-media-like-button.jpg" style="width:50px;height:50px;"/></a>; --%>
	
	<div style="margin:0 0 0 400px">
	<c:if test="${boardDto.artist_id == artist_id }">
	<input type="button" value="수정" onclick="museUpdate('${root}','${board_num}','${pageNumber}','${muse_name}')"/>
	<input type="button" value="삭제" onclick="museDelete('${root}','${board_num}','${pageNumber}','${muse_name}')"/>
	<input type="button" value="Indi's Music 업로드" onclick="museToUpload('${root}','${board_num}','${artist_id}','${muse_name}')"/>
	</c:if>
	<input type="button" value="콜라보" onclick="museCollabo('${root}','${board_num}','${pageNumber}','${muse_name}')"/>
	</div>
	
	</div>
</body>
</html>