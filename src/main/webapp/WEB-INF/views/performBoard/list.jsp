<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link type="text/css" href="${root}/css/jquery-ui.css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
</head>
<body>
	<input type="hidden" id="root" value="${root}"/>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("글쓰기를 성공하였습니다.")
			location.href=$("#root").val() + "/performBoard/list.do";
		</script>
	</c:if>
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("글쓰기가 실패하였습니다.")
			location.href=$("#root").val() + "/performBoard/write.do";
		</script>
	</c:if>
	
	<c:forEach var="list" items="${boardList}">
	
		<li>
			<a href="${root}/performBoard/read.do?board_num=${list.board_num}&pageNumber=${currentPage}">
			<c:if test="${list.file_path!=null}">
				<span><img src="${root}/${list.file_path}" width="142" height="83"/></span><br/>
			</c:if>
			<c:if test="${list.file_path==null}">
				<span><img src="${root}/resources/performResource/Koala.jpg" width="142" height="83"/></span><br/>
			</c:if>	
				<span>${list.subject}</span>
			</a>
			<a><span>${list.artist_id}</span></a>
		</li>
		
	</c:forEach>
</body>
</html>