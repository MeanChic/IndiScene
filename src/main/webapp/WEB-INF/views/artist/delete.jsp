<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/artist.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/artist.css"/>
</head>
<body>
	<form action="${root }/artist/delete.do" method="post">
		<table border="1" align="center" cellpadding="2" cellspacing="0">
			<tr>
				<td>회원ID</td>
				<td><input type="text" name="id"  value="${id }"/>
				<!-- value로 찍어준 id는 session에 담겨있는 id를 가져온 것이다. -->
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"/></td>				
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원탈퇴"/>
					<input type="reset" value="취소"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>