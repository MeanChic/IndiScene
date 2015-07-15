<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="marketBoardDelete">
${board_num} ${pageNumber} ${artist_id }
<c:set var="root" value="${pageContext.request.contextPath }"/>
	<form method="post" id="marketBoardDeleteForm()" action="javascript:marketBoardDeleteOk()">
		<input type="hidden" name="board_num" value="${board_num}"/>
		<input type="hidden" name="pageNumber" value="${pageNumber}"/>
		<input type="hidden" name="artist_id" value="${artist_id }"/>
		<table border="1" width="300" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td align="center" bgcolor="D1DBDB">
					계정 비밀번호 입력해주세요.
				</td>
			</tr>
			
			<tr>
				<td align="center">비밀번호
					<input type="password" name="password" size="8" maxlength="12"/>
				</td>
			</tr>
			
			<tr>
				<td align="center">
					<input type="submit" value="글삭제"/>
					<input type="button" value="목록보기" onclick="javascript:enterMarketBoard('${root}','${pageNumber}')">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>