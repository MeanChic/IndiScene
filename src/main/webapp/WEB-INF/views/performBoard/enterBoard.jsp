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
	<div id="enterBoard">
	
<h2 id="tabs-examples">Example tabs</h2>
  <p>Add quick, dynamic tab functionality to transition through panes of local content, even via dropdown menus. <strong>Nested tabs are not supported.</strong></p>
  <div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">
    <ul id="myTabs" class="nav nav-tabs" role="tablist">
      <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Home</a></li>
      <li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">Profile</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
      <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledBy="home-tab">
        <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
      </div>
      <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledBy="profile-tab">
        <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
      </div>
    </div>
  </div>
<script type="text/javascript">
$('#myTabs a:first').click(function(e){
	  e.preventDefault();
	  $('#home').tab('show');
})
$('#myTabs a:last').click(function(e){
	  e.preventDefault();
	  $('#profile').tab('show');
})
</script>
	
		<input type="button" value="글쓰기 " onclick="javascript:performBoardWrite()"/>
	
		<c:forEach  items="${list }" varStatus="s">								<!-- mav에 넘어오는 리스트 갯수만큼 돌린다 이름확인  -->
		<c:set var="market" value="${requestScope.list[s.index]}" /> 			<!-- 넘어오는 리스트 갯수만큼 돌린다 리스트 S번째 List 객체화 한다. -->
		<c:set var="image" value="${requestScope.mainImageList[s.index]}" /> 	<!-- list 갯수와 동일하게 mav에 넣어져서 오는 s번째 mainImage 객체화한다  -->

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
		<!-- 페이지 번호 -->

		<c:if test="${count>0 }">
		${count }
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
				<a href="javascript:enterPerformBoard('${root}','${startPage-pageBlock }')">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<a href="javascript:enterPerformBoard('${root}','${i}')">[${i }]</a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<a href="javascript:enterPerformBoard('${root}','${startPage+pageBlock }')">[다음]</a>
			</c:if>
		</c:if>
	</div>
</body>
</html>