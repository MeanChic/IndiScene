<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 삭제</title>
</head>
<body>
	<form id="deleteForm" method="post">
		<input type="hidden" name="board_num" value="${board_num}"/>
		<input type="hidden" name="pageNumber" value="${pageNumber}"/>
		<table border="1" width="300" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td align="center" bgcolor="D1DBDB">
				정말 삭제하시겠습니까? 
				</td>
			</tr>
			
			<tr>
			</tr>
			
			<tr>
				<td align="center">
					<input type="button" value="글삭제" onclick="deleteFunOk('${root}','${board_num}','${ pageNumber}')"/>
					<input type="button" value="취소" onclick="read('${root}','${board_num}','${pageNumber }')"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>