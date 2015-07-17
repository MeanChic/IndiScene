<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 목록보기</title>
</head>
<body>
<div id="boardBasic">
	<h3>Notice</h3>
	<div class="marketBoardX-location02">
		<a class="marketBoardAttribute01 btn btn-default" href="javascript:write('${root }')">Notice Write</a>
	</div>
		<br/>
		
		<c:if test="${count==0 }">
					<td align="center">게시판에 저장된 글이 없습니다.</td>
		</c:if>
		<c:if test="${count>0 }">
			<div class="form-controlMarket">
				<label class="marketBoardSize18 label-color marketBoardAttribute01">Board Number</label>
				<label class="marketBoardSize30 label-color marketBoardAttribute01">Subject</label>
				<label class="marketBoardSize18 label-color marketBoardAttribute01">Date</label>
				<label class="marketBoardSize18 label-color marketBoardAttribute01">Views</label>
			</div>
		<!-- Notice List -->
		<c:forEach var="notice" items="${noticeList }">
			<div class="form-controlMarket">
				<label class="marketBoardSize18 label-color marketBoardAttribute01">${notice.board_num }</label>
				<label class="marketBoardSize30 label-color marketBoardAttribute01">
					<c:if test="${notice.seq_level>0 }">
						<c:forEach begin="0" end="${freeBoard.seq_level }" step="1">
						</c:forEach>
						<a href="javascript:read('${root }','${notice.board_num }','${currentPage }')">${notice.subject }</a> 
					</c:if>
				</label>
				<label class="marketBoardSize18 label-color marketBoardAttribute01"><fmt:formatDate value="${notice.register_date }" type="date"/></label>
				<label class="marketBoardSize18 label-color marketBoardAttribute01">${notice.count }</label>
			</div>
		</c:forEach>
		<!-- 페이지 번호 -->
		<nav class="marketBoardX-location01">
			<ul class="pagination marketBoardAttribute01">
				<c:if test="${count>0 }">
					<%-- 한 페이지에서 이동가능한 페이지 개수 [1][2][3]...[10] --%> 
					<c:set var="pageBlock" value="${5}"/>	
					<%-- 총페이지 번호 --%>
					<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0?0:1) }"/>	
						
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
						<li><a aria-label="Previous" href="javascript:list('${root}','${startPage-pageBlock }')"><span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<li><a href="javascript:list('${root}','${i}')">${i}</a></li>
					</c:forEach>
					
					<c:if test="${endPage<pageCount }">
						<li><a aria-label="Next" href="javascript:list('${root}','${startPage+pageBlock }')"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
				</c:if>
			</ul>
		</nav>
	</c:if>
</div>
</body>
</html>