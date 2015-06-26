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
	<c:if test="${check==1 }">	
		<div align="center">
			ID is already in use.
			<form action="${root }/artist/idCheck.do" method="GET">
				<input type="text" name="artist_id"/>
				<input type="submit" value="Duplicate Check"/>
			</form>
		</div>
	</c:if>
	
	<c:if test="${check==0 }">
		<div align="center">
			Can use ID.
		</div>
	</c:if>
	<br/>
	
	<script type="text/javascript">
		opener.artistForm.id.value="${id}";
	</script>
	
	<div align="center">
	<input type="button" value="close"/>
		<script type="text/javascript">
			$(document).ready(function(){
				$("input[type='button']").click(function(){
					self.close();
				})
			})
		</script>
	</div>
</body>
</html>



