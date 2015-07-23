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
<div id="performanceInfo">
	<h3>Performance Info</h3>
	<div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">
	<!-- Nav tabs -->
		<ul id="performPlaceTab" class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#performBoardList" id="perform-tab" aria-controls="performBoard" role="tab" data-toggle="tab">PerformBoard</a></li>
			<li role="presentation"><a href="#placeBoardList" id="place-tab" aria-controls="placeBoard" role="tab" data-toggle="tab">PlaceBoard</a></li>
		</ul>
	<!-- Tab panes -->
	    <div id="performPlaceTabContent" class="tab-content">
		<!-- performBoard -->
			<div role="tabpanel" class="row tab-pane fade in active" id="performBoardList" aria-labelledby="perform-tab">
				<div class="marketBoardX-location02">
					<input class="marketBoardAttribute01 btn btn-default" type="button" value="Write " onclick="javascript:performBoardWrite()"/>
				</div>
				<c:forEach  items="${performList }" varStatus="s">								<!-- mav에 넘어오는 리스트 갯수만큼 돌린다 이름확인  -->
					<c:set var="market" value="${requestScope.performList[s.index]}" /> 		<!-- 넘어오는 리스트 갯수만큼 돌린다 리스트 S번째 List 객체화 한다. -->
					<c:set var="image" value="${requestScope.performImageList[s.index]}" /> 	<!-- list 갯수와 동일하게 mav에 넣어져서 오는 s번째 mainImage 객체화한다  -->
					
					<div class="col-sm-6 col-md-4 marketBoardheight01 marketBoardInterval01 instants01">
						<div class="thumbnail">
							<div class="disp">
								<a href="javascript:performBoardRead('${market.board_num}','1')">
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
				<a class="marketBoardInterval02 marginLR10 pull-right btn btn-default" href="javascript:enterPerformBoard('${root}')">More PerformanceBoard</a>
			</div>
			
		<!-- placeBoard -->
			<div role="tabpanel" class="row tab-pane fade" id="placeBoardList" aria-labelledby="place-tab">
				<div class="marketBoardX-location02">
					<input class="marketBoardAttribute01 btn btn-default" type="button" value="Write " onclick="javascript:placeBoardWrite()"/>
				</div>
				<c:forEach  items="${placeList }" varStatus="s">								<!-- mav에 넘어오는 리스트 갯수만큼 돌린다 이름확인  -->
					<c:set var="market" value="${requestScope.placeList[s.index]}" /> 			<!-- 넘어오는 리스트 갯수만큼 돌린다 리스트 S번째 List 객체화 한다. -->
					<c:set var="image" value="${requestScope.placeImageList[s.index]}" /> 	<!-- list 갯수와 동일하게 mav에 넣어져서 오는 s번째 mainImage 객체화한다  -->

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
				<a class="marketBoardInterval02 marginLR10 pull-right btn btn-default" href="javascript:enterPlaceBoard('${root}')">More PerformanceBoard</a>
			</div>
		</div>
	</div>
<script type="text/javascript">
$('#performPlaceTab a:first').click(function (e) {
	  e.preventDefault()
	  $("#performBoardList").tab('show')
})
$('#performPlaceTab a:last').click(function (e) {
	  e.preventDefault()
	  $("#placeBoardList").tab('show')
})
</script>
</div>
</body>
</html>