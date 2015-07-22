<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="button" value="내가올린" onclick="myUploadMusic('${root}','${artist_id}','1')"/>
<input type="button" value="좋아요" onclick="myLikeMusic('${root}','${artist_id}','1')"/>
<input type="button" value="내곡과 콜라보" onclick="myCollaboMusic('${root}','${artist_id}','1')"/>
	<c:forEach var="list" items="${boardList}">
		<div>
			<input type="checkbox" class="musicCheckBox" value="${list.board_num}"/>
			<img src="${root}${list.image_path}" style="width:50px; height:50px;"/>
			
			<c:if test="${list.muse_name == null}">
				<a href="javascript:uploadRead('${root}','${list.board_num}','1')">${list.subject}</a>
			</c:if>
			
			<c:if test="${list.muse_name != null}">
				<a href="javascript:museRead('${root}','${list.board_num}','1','${muse_name}')">${list.subject}</a>
			</c:if>
			<%-- <audio controls src="${root}${list.file_path}"></audio> --%>
			<span><fmt:formatDate value="${list.register_date}" pattern="yyyy-MM-dd"/></span>
			<span>${list.board_like}</span>
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
					<a href="javascript:myLikeMusic('${root }','${artist_id}','${startPage-pageBlock}')">[이전]</a>	
				</c:if>
				
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href="javascript:myLikeMusic('${root }','${artist_id}','${i}')">[${i}]</a>
				</c:forEach>
				
				<c:if test="${endPage<pageCount }">
					<%-- <a href="${root }/freeBoard/list.do?pageNumber=${startPage+pageBlock}">[다음]</a> --%>
					<a href="javascript:myLikeMusic('${root }','${artist_id}','${startPage+pageBlock}')">[다음]</a>				
				</c:if>
			</c:if>
		</center>
	</c:if>
</body>
</html>