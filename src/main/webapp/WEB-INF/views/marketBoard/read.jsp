<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<c:set var="root" value="${pageContext.request.contextPath }" />

	<table border="1" width="510" cellpadding="2" cellspacing="0"
		align="center">
		<tr>
			<td align="center" height="20" width="125">글번호</td>
			<td align="center" height="20" width="125">${marketBoard.board_num }</td>

			<td align="center" height="20" width="125">조회수</td>
			<td align="center" height="20" width="125">${marketBoard.count }</td>
		</tr>

		<tr>
			<td align="center" height="20" width="125">작성자</td>
			<td align="center" height="20" width="125">${marketBoard.artist_id}</td>

			<td align="center" height="20" width="125">작성일</td>
			<td align="center" height="20" width="125">
			<fmt:formatDate
					value="${marketBoard.register_date}" type="date" /></td>
		</tr>

		<tr>
			<td align="center" height="200" width="125">글내용</td>
			<td valign="top" height="200" colspan="3">${marketBoard.content }</td>
		</tr>
		<c:if test="${marketBoard.file_name !=null }">
			<tr>
				<td align="center" height="20" width="125">파일명</td>
				<td colspan="3">
					<a href="${root}/marketBoard/download.do?board_num=${marketBoard.board_num}">${marketBoard.file_name}</a>
				</td>
			</tr>
		</c:if>

		<tr>
			<td height="30" colspan="4" align="center"><input type="button"
				value="글수정"
				onclick="location.href='${root}/marketBoard/update.do?board_num=${marketBoard.board_num}&pageNumber=${pageNumber}'" />
				<input type="button" value="글삭제"
				onclick="delFun('${root}','${marketBoard.board_num}','${pageNumber}')" />
				<input type="button" value="글목록"
				onclick="location.href='${root}/marketBoard/enterBoard.do?pageNumber=${pageNumber}'" />
			</td>
		</tr>
	</table>
</body>
</html>