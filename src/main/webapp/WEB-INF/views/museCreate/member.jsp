<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%-- <c:set var="artist_id"  value="indi"/> --%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="${root}/css/jquery-ui.css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>

</head>
<body>
	${muse_name}
	<input type="hidden" id="muse_name" name="muse_name" value="${muse_name}"/>
	<input type="hidden" id="artist_id" value="${artist_id}" name="artist_id"/>
	<input type="hidden" id="root" value="${root}"/>
	
	<c:if test="${check != 0 }">
	<div id="join">
	<c:forEach var="join" items="${joinMember }">
		<c:if test="${join.ARTIST_ID == artist_id}">
			<div id="${join.ARTIST_ID}" >
				${join.ARTIST_ID} , ${join.MUSE_YN}, ${join.MUSE_NAME}
				<input type="button" value="뮤즈 삭제하기" onclick="outMember('${muse_name}','${join.ARTIST_ID}')">
			</div>
			==============================================================
		</c:if>
		<c:if test="${join.ARTIST_ID != artist_id}">
		<div id="${join.ARTIST_ID}" >
			${join.ARTIST_ID} , ${join.MUSE_YN}, ${join.MUSE_NAME}
			<input type="button" value="강제탈퇴" onclick="outMember('${muse_name}','${join.ARTIST_ID}')">
		</div>
		</c:if>
	</c:forEach>
	</div>
	===================================================
	<c:forEach var="non" items="${nonMember }">
		<div id="${non.ARTIST_ID}" >
			${non.ARTIST_ID} , ${non.MUSE_YN}, ${non.MUSE_NAME}
			<input type="button" value="수락" onclick="inviteMember('${muse_name}','${non.ARTIST_ID}')">
			<input type="button" value="거부" onclick="outMember('${muse_name}','${non.ARTIST_ID}')">
		</div>
	</c:forEach>
	</c:if>
	
	<c:if test="${check == 0}">
	<c:forEach var="join" items="${joinMember }">
		<c:if test="${join.ARTIST_ID != artist_id}">
		<div>
			${join.ARTIST_ID} , ${join.MUSE_YN}, ${join.MUSE_NAME}
		</div>
		</c:if>
	</c:forEach>
	</c:if>
</body>
</html>