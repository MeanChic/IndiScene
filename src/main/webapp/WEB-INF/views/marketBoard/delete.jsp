<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${root}/css/marketBoard1.css" rel="stylesheet">
</head>
<body>
<div id="marketBoardDelete">

<c:set var="root" value="${pageContext.request.contextPath }"/>
	<form method="post" id="marketBoardDeleteForm" action="javascript:marketBoardDeleteOk()">
		<input type="hidden" name="board_num" value="${board_num}"/>
		<input type="hidden" name="pageNumber" value="${pageNumber}"/>
		<input type="hidden" name="artist_id" value="${artist_id }"/>
<!-- 		<table border="1" width="300" cellpadding="2" cellspacing="0" align="center">
 -->
 		<div class="marketBoardDeleteOuter" align="center" >
 			<div class="marketBoardDeleteInner">
 			<p>
				<span>	사용자 확인을 위해 </br>
				계정 비밀번호 입력해주세요.</span>
				<br/>
				<span id="DeletefontStyle">Password&nbsp;:
				<input type="password" name="password" size="8" maxlength="12"/>
				
				</span>
				
			</p>
			
			<p>
				<span>
					<a href="javascript:marketBoardDeleteOk()" style="color:#D43F3A; font-size:1.5em; font-family:Helvetica;">Delete</a>
					<span class="Delimiter" style="font-size:1.5em;">/</span>
					<a href="javascript:enterMarketBoard('${root}','${pageNumber}')" style="color:#36b823; font-size:1.5em; font-family:Helvetica;">L i s t</a>
					<!-- <input type="submit" value="글삭제" style="color:#D43F3A;" class="marketBoardDeleteSubmit"/> -->
					<%--<input type="button" value="목록보기" onclick="javascript:enterMarketBoard('${root}','${pageNumber}')">--%>				
					</span>

			</p>
			</div>
		</div>
	</form>
</div>
</body>
</html>