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
	<a href="${root}/artist.jsp">artist page</a><br/><br/>
	
	<form action="${root }/artist/login.do" method="post">
		<table border="1" align="center" cellpadding="2" cellspacing="0">
			<tr>
				<td>ID</td>
				<td><input type="text" name="artist_id"/></td>
			</tr>
			
			<tr>
				<td>Password</td>
				<td><input type="password" name="artist_password" /></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input class="ui-button" type="submit" value="확인"/>
					<input class="ui-button" type="reset" value="취소"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>