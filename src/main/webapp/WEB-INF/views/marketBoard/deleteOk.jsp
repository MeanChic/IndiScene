<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${board_num }
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<c:if test="${check==1}">
		<script type="text/javascript">
			alert("삭제되었습니다. 리스트로 이동합니다.");
			location.href="javascript:enterMarketBoard('${root}','${pageNumber}')";
		</script>
	</c:if>
	<c:if test="${check == 2}">
		<script type="text/javascript">
			alert("비밀번호가 틀립니다. 기존글로 이동합니다.");
			location.href="javascript:marketBoardRead('${board_num}','${pageNumber}')";
		</script>
	</c:if>
	
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("삭제오류");
			location.href="javascript:marketBoardRead('${board_num}','${pageNumber}')";
		</script>
	</c:if>

</body>
</html>