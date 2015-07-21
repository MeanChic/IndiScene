<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="button" value="담기" onclick="musicStorage('${root}','${artist_id}')"/>
	<c:set value="${currentPage}" var="currentPage"/>
	<c:forEach var="list" items="${boardList}">
		<div>
			<input type="checkbox" class="musicCheckBox" value="${list.board_num}"/>
			<img src="${root}${list.image_path}" style="width:50px; height:50px;"/>
			<a href="javascript:bestRead('${root}','${list.board_num}','${currentPage}')">${list.subject}</a>
			<%-- <audio controls src="${root}${list.file_path}"></audio> --%>
			<span> 게시일 : <fmt:formatDate value="${list.register_date}" pattern="yyyy-MM-dd"/></span>
			<span> 좋아요 : ${list.board_like}</span>
			<span> 베스트 날짜 : <fmt:formatDate value="${list.best_date}" pattern="yyyy-MM-dd hh:mm"/></span>
		</div>
	</c:forEach>
	<c:if test="${count==0 }">
		<td align="center">게시판에 저장된 글이 없습니다.</td>
	</c:if>
	<c:if test="${count>0 }">
	<center>
			<c:if test="${count>0 }">
				<c:set var="pageBlock" value="${10}"/>
				<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1 )}"/>
				
				<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
				<c:set var="startPage" value="${rs*pageBlock+1 }"/>
				<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
				
				<c:if test="${endPage> pageCount }">
					<c:set var="endPage" value="${pageCount }"/>
				</c:if>
				
				<c:if test="${startPage>pageBlock }">
					<%-- <a href="${root }/freeBoard/list.do?pageNumber=${startPage-pageBlock}">[이전]</a> --%> 
					<a href="javascript:bestList('${root }','${startPage-pageBlock}')">[이전]</a>	
				</c:if>
				
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href="javascript:bestList('${root}','${i}')">[${i}]</a>
				</c:forEach>
				
				<c:if test="${endPage<pageCount }">
					<%-- <a href="${root }/freeBoard/list.do?pageNumber=${startPage+pageBlock}">[다음]</a> --%>
					<a href="javascript:bestList('${root }','${startPage+pageBlock}')">[다음]</a>				
				</c:if>
			</c:if>
		</center>
	</c:if>
</body>
</html>