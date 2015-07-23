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
<div id="museBoardList">
	<h3>MuseBoard</h3>
	<input type="button" value="담기" onclick="museMusicStorage('${root}','${artist_id}','${muse_name}')"/>
	<a href="javascript:museWrite('${root}','0','1','${muse_name}')">글쓰기</a>
	<c:set value="${currentPage}" var="currentPage"/>
	<div class="marketBoardAttribute02 marketBoardInterval03">
		<div class="form-controlBoard">
			<label class="boardlabelBlock marketBoardSize4 label-colorO marketBoardAttribute01">
				<input type="checkbox" class="" autocomplete="off"/>
			</label>
			<label class="boardlabelBlock marketBoardSize46 label-colorO marketBoardAttribute01">Subject</label>
			<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Writer</label>
			<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Date</label>
			<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Views</label>
			<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Like</label>
		</div>
		<!-- MuseBoard List -->
		<c:forEach var="list" items="${boardList}">
			<div class="form-controlBoard">
				<label class="boardlabelBlock marketBoardSize4 label-color marketBoardAttribute01">
					<input type="checkbox" class="musicCheckBox" autocomplete="off" value="${list.board_num}"/>
				</label>
				<label class="boardlabelBlock marketBoardSize46 label-color marketBoardAttribute01 marketBoardY-location02">
					<img src="${root}${list.image_path}" style="width:50px; height:50px;"/>
					<a class="label-color" href="javascript:museRead('${root}','${list.board_num}','${currentPage}','${muse_name}')">${list.subject}</a>
				</label>
				<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01 marketBoardY-location02">${list.artist_id}</label>
				<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01"><fmt:formatDate value="${list.register_date }" pattern="yyyy.MM.dd"/></label>
				<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${list.count}</label>
				<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${list.board_like}</label>
				<%-- <audio controls src="${root}${list.file_path}"></audio> --%>
			</div>
		</c:forEach>
	</div>
	
	<c:if test="${count==0 }">
		<td align="center">게시판에 저장된 글이 없습니다.</td>
	</c:if>
	<!-- page Number -->
	<nav class="marketBoardX-location01">
		<ul class="pagination marketBoardAttribute01">	
			<c:if test="${count>0 }">
				<c:if test="${count>0 }">
					<c:set var="pageBlock" value="${5}"/>
					<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1 )}"/>
					
					<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
					<c:set var="startPage" value="${rs*pageBlock+1 }"/>
					<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
					
					<c:if test="${endPage> pageCount }">
						<c:set var="endPage" value="${pageCount}"/>
					</c:if>
					
					<c:if test="${startPage>pageBlock }">
						<li><a aria-label="Previous" href="javascript:museList('${root }','${startPage-pageBlock}','${muse_name}')"><span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<li><a href="javascript:museList('${root}','${i}','${muse_name}')">${i}</a></li>
					</c:forEach>
					
					<c:if test="${endPage<pageCount }">
						<li><a aria-label="Next" href="javascript:museList('${root }','${startPage+pageBlock}','${muse_name}')"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
				</c:if>
			</c:if>
		</ul>
	</nav>
</div>
</body>
</html>