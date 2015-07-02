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
	
	<form action="${root }/artist/update.do" method="GET">
		<table border="1" align="center" cellpadding="2" cellspacing="0">
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="artist_id" value="${artist_id}"/>
					<input type="submit" value="회원정보수정"/>
					<input type="button" value="회원탈퇴" OnClick="location.href='${root}/artist/delete.do'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>