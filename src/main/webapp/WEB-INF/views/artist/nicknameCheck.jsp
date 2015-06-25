<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/artist.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/artist.css"/>
</head>
<body>
	<c:if test="${check==1 }">	
		<div align="center">
			NickName is already in use.
			<form action="${root }/artist/nicknameCheck.do" method="post">
				<input type="text" name="nickname"/>
				<input type="submit" value="확인"/>
			</form>
		</div>
	</c:if>
	
	<c:if test="${check==0 }">
		<div align="center">
			Can use NickName.
		</div>
	</c:if>
	<br/>
	
	<script type="text/javascript">
		opener.artistForm.nickname.value="${nickname}";
	</script>
	
	<div align="center">
		<a href="javascript:self.close()">닫기</a>
	</div>
</body>
</html>