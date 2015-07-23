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
<div id="boardBasic">
	<h3>Indi's Music</h3>
	<div class="marketBoardX-location02 marketBoardInterval03">
		<input class="marketBoardAttribute01 btn btn-default pull-left" type="button" value="Put In" onclick="musicStorage('${root}','${artist_id}')"/>
		<a class="marketBoardAttribute01 btn btn-default" href="javascript:uploadWrite('${root}','0','1')">Write</a>
	</div>
	<c:set value="${currentPage}" var="currentPage"/>
	<div class="marketBoardAttribute02 marketBoardInterval03">
		<div class="form-controlBoard">
			<label class="boardlabelBlock marketBoardSize16 label-colorO marketBoardAttribute01">Board Number</label>
			<label class="boardlabelBlock marketBoardSize46 label-colorO marketBoardAttribute01">Subject</label>
			<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Date</label>
			<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Views</label>
			<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Like</label>
		</div>
		<!-- Indi'sMusic List -->
		<c:forEach var="list" items="${boardList}">
			<div class="form-controlBoard">
				<label class="boardlabelBlock marketBoardSize16 label-color marketBoardAttribute01">
					<input type="checkbox" class="musicCheckBox" value="${list.board_num}"/>
				</label>
				<label class="boardlabelBlock marketBoardSize46 label-color marketBoardAttribute01 marketBoardY-location02">
					<img src="${root}${list.image_path}" style="width:50px; height:50px;"/>
					<a class="label-color" href="javascript:uploadRead('${root}','${list.board_num}','${currentPage}')">${list.subject}</a>
				</label>
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
						<c:set var="endPage" value="${pageCount }"/>
					</c:if>
					<%----------------------------------------------------------%>
					<c:if test="${startPage>pageBlock }">
						<li><a aria-label="Previous" href="javascript:uploadList('${root }','${startPage-pageBlock}')"><span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<li><a href="javascript:uploadList('${root}','${i}')">${i}</a></li>
					</c:forEach>
					
					<c:if test="${endPage<pageCount }">
						<li><a aria-label="Next" href="javascript:uploadList('${root}','${startPage+pageBlock }')"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
				</c:if>
			</c:if>
		</ul>
	</nav>
</div>
</body>
</html>