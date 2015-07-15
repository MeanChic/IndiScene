<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<%-- <c:set var="artist_id"  value="indi"/> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/performBoard.js"></script>
<script type="text/javascript" src="${root}/js/placeBoard.js"></script>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script src="${root }/js/jquery.MultiFile.js" type="text/javascript" ></script>
<script src="${root }/resources/ckEditor/ckeditor.js"></script>

<script src="${root }/resources/xhr/xhr.js" type="text/javascript" ></script>
<script src="${root }/js/reply.js" type="text/javascript" ></script>
</head>
<body>
	<a href="${root }/performBoard/write.do">시작해보자</a>
	<a href="${root}/performBoard/list.do"> 리스트 보기 </a>	

	<a href="${root}/museCreate/logup.do">muse개설</a>
	<a href="${root}/museCreate/musemain.do?artist_id=${artist_id}">musemain</a>
	
	<a href="${root}/museGuest/guest.do?muse_name=abc">guest</a><br/>
	<span>
	<a href="${root}/placeBoard/enterBoard.do">PlaceBoard</a>	
	</span>
	
	<span>
	
	</span>
	
	<span>
	
	</span>
	<a href="javascript:enterPerformBoard('${root}')">거래게시판 들어가기 (ajax적용 O)</a>
	<br/>
	<a href="javascript:enterPlaceBoard('${root}')">플레이스 보드 들어가기 (ajax적용 O)</a>
	<div id="centerContents"><h1>center</h1></div>
</body>
</html>
