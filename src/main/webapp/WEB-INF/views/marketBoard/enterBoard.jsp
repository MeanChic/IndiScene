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
<title>enter MarketBoard</title>

</head>
<body>

		<input type="button" value="글쓰기 " onclick="location.href='${root}/marketBoard/write.do'"/>
	
		<c:forEach  items="${list }" varStatus="s">
		<c:set var="market" value="${requestScope.list[s.count - 1]}" /> 
		<c:set var="image" value="${requestScope.mainImageList[s.count - 1]}" /> 

			<div class="form_style" style="height:130px;">
				<div class="disp" style="border-width:1px;">
					<a href="${root }/marketBoard/read.do?board_num=${market.board_num}&pageNumber=${pageNumber}"><img style="height:75px; width:100px" src="${image}" /><br>${market.subject }<br/></a>
					<fmt:formatDate value="${market.register_date }" type="date"/> &nbsp;&nbsp;
				</div>
				<div class="disp-content">
				</div>
			</div>
			<br/>
		</c:forEach>
		<!-- 페이지 번호 -->

		<c:if test="${count>0 }">
		
				<%-- 한 페이지에서 이동가능한 페이지 개수 [1][2][3]...[10] --%> 
			<c:set var="pageBlock" value="${3 }"/>	
				
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
				<a href="${root }/marketBoard/enterBoard.do?pageNumber=${startPage-pageBlock }">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<a href="${root }/marketBoard/enterBoard.do?pageNumber=${i}">[${i }]</a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<a href="${root }/marketBoard/enterBoard.do?pageNumber=${startPage+pageBlock }">[다음]</a>
			</c:if>
		</c:if>

</body>
</html>