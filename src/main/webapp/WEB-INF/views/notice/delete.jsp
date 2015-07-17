<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div id=noticeDelete>
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
					<input type="button" value="Delete" onclick="noticeDeleteFunOk('${root}','${board_num}','${ pageNumber}')"/>
					<input type="button" value="Cancel" onclick="noticeRead('${root}','${board_num}','${pageNumber }')"/>
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>