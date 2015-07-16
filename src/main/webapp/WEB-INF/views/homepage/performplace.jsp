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
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
</head>
<body>
	=======================performBoard=================================
	<div>

	<c:forEach  items="${performList }" varStatus="s">								<!-- mav에 넘어오는 리스트 갯수만큼 돌린다 이름확인  -->
		<c:set var="market" value="${requestScope.performList[s.index]}" /> 			<!-- 넘어오는 리스트 갯수만큼 돌린다 리스트 S번째 List 객체화 한다. -->
		<c:set var="image" value="${requestScope.performImageList[s.index]}" /> 	<!-- list 갯수와 동일하게 mav에 넣어져서 오는 s번째 mainImage 객체화한다  -->

			<div class="form_style" style="height:130px;">
				<div class="disp" style="border-width:1px;">
					<a href="javascript:performBoardRead('${market.board_num}','${pageNumber}')"><img style="height:75px; width:100px" src="${image}" /><br>${market.subject }<br/></a>
					<fmt:formatDate value="${market.register_date }" type="date"/> &nbsp;&nbsp;
				</div>
				<div class="disp-content">
				</div>
			</div>
			<br/>
		</c:forEach>
		<a href="javascript:enterPerformBoard('${root}')">더보기</a>
		</div>
		=======================placeBoard=================================
		<div>
		<c:forEach  items="${placeList }" varStatus="s">								<!-- mav에 넘어오는 리스트 갯수만큼 돌린다 이름확인  -->
		<c:set var="market" value="${requestScope.placeList[s.index]}" /> 			<!-- 넘어오는 리스트 갯수만큼 돌린다 리스트 S번째 List 객체화 한다. -->
		<c:set var="image" value="${requestScope.placeImageList[s.index]}" /> 	<!-- list 갯수와 동일하게 mav에 넣어져서 오는 s번째 mainImage 객체화한다  -->

			<div class="form_style" style="height:130px;">
				<div class="disp" style="border-width:1px;">
					<a href="javascript:performBoardRead('${market.board_num}','${pageNumber}')"><img style="height:75px; width:100px" src="${image}" /><br>${market.subject }<br/></a>
					<fmt:formatDate value="${market.register_date }" type="date"/> &nbsp;&nbsp;
				</div>
				<div class="disp-content">
				</div>
			</div>
			<br/>
		</c:forEach>
		<a href="javascript:enterPlaceBoard('${root}')">더보기</a>
		</div>
</body>
</html>