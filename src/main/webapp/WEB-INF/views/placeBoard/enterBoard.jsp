<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="org.springframework.web.servlet.ModelAndView" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div id="placeEnterBoard">
	<h3>Place Board</h3>
	<div class="marketBoardX-location02">
		<input class="marketBoardAttribute01 btn btn-default" type="button" value="Write " onclick="javascript:placeBoardWrite()"/>
	</div>
	<div class="row marketBoardInterval02">
		<c:forEach  items="${list }" varStatus="s">								<!-- mav에 넘어오는 리스트 갯수만큼 돌린다 이름확인  -->
			<c:set var="market" value="${requestScope.list[s.index]}" /> 			<!-- 넘어오는 리스트 갯수만큼 돌린다 리스트 S번째 List 객체화 한다. -->
			<c:set var="image" value="${requestScope.mainImageList[s.index]}" /> 	<!-- list 갯수와 동일하게 mav에 넣어져서 오는 s번째 mainImage 객체화한다  -->
			
			<div class="col-sm-6 col-md-4 marketBoardheight01 marketBoardInterval01 instants01">
				<div class="thumbnail">
					<div class="disp">
						<a href="javascript:placeBoardRead('${market.board_num}','1')">
							<img class="marketBoardSize03 marketBoardImageSize" src="${image}" />
						</a>
						<div class="caption">
							<h4>${market.subject }</h4>
							<p>${market.board_num} : <fmt:formatDate value="${market.register_date }" type="date"/></p>
							<div class="marketBoardX-location02">
								<p class="marketBoardAttribute01">Writer : ${market.artist_id}</p>
							</div>
						</div>
					</div>
				</div>
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
				<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0?0:1) }"/>	
					
					<%-- 시작 페이지 번호 --%>
				<fmt:parseNumber var="rs" value="${((pageNumber-1)/pageBlock) }" integerOnly="true"/>	<%--((pageNumber-1)/pageBlock)의 결과값을 int로 형변환하기위해 parseNumber를 사용  --%>
				<c:set var="startPage" value="${rs*pageBlock+1 }"/>	
					
					<%-- 끝 페이지 번호 --%>
				<c:set var="endPage" value="${startPage+pageBlock-1 }"/>	
				<c:if test="${endPage > pageCount }">
					<c:set var="endPage" value="${pageCount }"/>
				</c:if>
				<%------------------------------------------------------------------ --%>
				<c:if test="${startPage>pageBlock }">
					<li><a aria-label="Previous" href="javascript:enterPlaceBoard('${root}','${startPage-pageBlock }')"><span aria-hidden="true">&laquo;</span></a></li>
				</c:if>
				
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<li><a href="javascript:enterPlaceBoard('${root}','${i}')">${i}</a></li>
				</c:forEach>
				
				<c:if test="${endPage<pageCount }">
					<li><a aria-label="Next" href="javascript:enterPlaceBoard('${root}','${startPage+pageBlock }')"><span aria-hidden="true">&raquo;</span></a></li>
				</c:if>
			</c:if>
		</ul>
	</nav>
</div>
</body>
</html>