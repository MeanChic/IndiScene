<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div id="boardBasic">
	<h3>Notice</h3>
	<div class="marketBoardX-location02 marketBoardInterval03">
		<a class="marketBoardAttribute01 btn btn-default" href="javascript:noticeWrite('${root }')">Notice Write</a>
	</div>
	
	<c:if test="${count==0 }">
		<div class="form-controlMarket">
			<label class="label-color">게시판에 저장된 글이 없습니다.</label>
		</div>
	</c:if>
	
	<c:if test="${count>0 }">
		<div class="marketBoardAttribute02 marketBoardInterval03">
			<div class="form-controlBoard">
				<label class="boardlabelBlock marketBoardSize16 label-colorO marketBoardAttribute01">Board Number</label>
				<label class="boardlabelBlock marketBoardSize58 label-colorO marketBoardAttribute01">Subject</label>
				<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Date</label>
				<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Views</label>
			</div>
		<!-- Notice List -->
			<c:forEach var="notice" items="${noticeList }">
				<div class="form-controlBoard">
					<label class="boardlabelBlock marketBoardSize16 label-color marketBoardAttribute01">${notice.board_num }</label>
					<label class="boardlabelBlock marketBoardSize58 label-color marketBoardAttribute01 marketBoardY-location02">
						<a class="label-color" href="javascript:noticeRead('${root }','${notice.board_num }','${currentPage }')">${notice.subject }</a> 
					</label>
					<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01"><fmt:formatDate value="${notice.register_date }" type="date"/></label>
					<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${notice.count }</label>
				</div>
			</c:forEach>
		</div>
		
			<!-- 페이지 번호 -->
		<nav class="marketBoardX-location01">
			<ul class="pagination marketBoardAttribute01">
				<c:if test="${count>0 }">
					<%-- 한 페이지에서 이동가능한 페이지 개수 [1][2][3]...[10] --%> 
					<c:set var="pageBlock" value="${5}"/>	
					<%-- 총페이지 번호 --%>
					<c:set var="pageCount" value="${count/noticeSize+(count%noticeSize==0?0:1) }"/>	
						
					<%-- 시작 페이지 번호 --%>
					<fmt:parseNumber var="rs" value="${((pageNumber-1)/pageBlock) }" integerOnly="true"/>	<%--((pageNumber-1)/pageBlock)의 결과값을 int로 형변환하기위해 parseNumber를 사용  --%>
					<c:set var="startPage" value="${rs*pageBlock+1 }"/>	
						
					<%-- 끝 페이지 번호 --%>
					<c:set var="endPage" value="${startPage+pageBlock-1 }"/>	
					<c:if test="${endPage > pageCount }">
						<c:set var="endPage" value="${pageCount }"/>
					</c:if>
					<%----------------------------------------------------------%>
					<c:if test="${startPage>pageBlock }">
						<li><a aria-label="Previous" href="javascript:noticeList('${root}','${startPage-pageBlock }')"><span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<li><a href="javascript:noticeList('${root}','${i}')">${i}</a></li>
					</c:forEach>
					
					<c:if test="${endPage<pageCount }">
						<li><a aria-label="Next" href="javascript:noticeList('${root}','${startPage+pageBlock }')"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
				</c:if>
			</ul>
		</nav>
	</c:if>
</div>
</body>
</html>