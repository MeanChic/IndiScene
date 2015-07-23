<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div id="bestBoard">
	<h2>Best Music</h2>
	<div class="marketBoardX-location02 marketBoardInterval04">
		<input class="marketBoardAttribute01 btn btn-default pull-left" type="button" value="Put In" onclick="musicStorage('${root}','${artist_id}')"/>
		<a class="marketBoardAttribute01 btn btn-default" href="javascript:uploadWrite('${root}','0','1')">Write</a>
	</div>
	<c:set value="${currentPage}" var="currentPage"/>
	<c:forEach  items="${boardList}" varStatus="s">
		<c:set var="market" value="${requestScope.boardList[s.index]}" /> 
		${[s.index]}
	</c:forEach>
	<div class="marketBoardAttribute02 marketBoardInterval03">
		<div id="bestRank1">
			<img class="bestRank1" src="" alt="">
			<div class="bestInfoblock">1st</div>
		</div>
		<div id="bestRank2">
			<img class="bestRank2" src="" alt="">
			<div class="bestInfoblock">2nd</div>
		</div>
		<div id="bestRank3">
			<img class="bestRank3" src="" alt="">
			<div class="bestInfoblock">3rd</div>
		</div>
	</div>
	
	<div class="marketBoardAttribute02 marketBoardInterval03">
		<div class="form-controlBoard">
			<label class="boardlabelBlock marketBoardSize4 label-colorO marketBoardAttribute01">
				<input type="checkbox" id="checkAll" class="" autocomplete="off"/>
				<script type="text/javascript">
					$("#checkAll").click(function(){
						if(!$("#checkAll").prop("checked")){
							$(".musicCheckBox").each(function(){
								$(this).prop("checked","true");
							});
						}else{
							if($(".musicCheckBox:checked").length == $(".musicCheckBox").length){
								$(".musicCheckBox").each(function(){
									$(this).prop("checked","false");
								});
							}
						}
					});
				</script>
			</label>
			<label class="boardlabelBlock marketBoardSize46 label-colorO marketBoardAttribute01">Subject</label>
			<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Writer</label>
			<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">BestDate</label>
			<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Views</label>
			<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Like</label>
		</div>
		<!-- Best Music List -->
		<c:forEach var="list" items="${boardList}">
			<div class="form-controlBoard">
				<label class="boardlabelBlock marketBoardSize4 label-color marketBoardAttribute01">
					<input type="checkbox" class="musicCheckBox" autocomplete="off" value="${list.board_num}"/>
				</label>
				<label class="boardlabelBlock marketBoardSize46 label-color marketBoardAttribute01 marketBoardY-location02">
					<img src="${root}${list.image_path}" style="width:50px; height:50px;"/>
					<a class="label-color" href="javascript:uploadRead('${root}','${list.board_num}','${currentPage}')">${list.subject}</a>
				</label>
				<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01 marketBoardY-location02">${list.artist_id}</label>
				<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01"><fmt:formatDate value="${list.best_date}" pattern="yyyy-MM-dd hh:mm"/></label>
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
						<li><a aria-label="Previous" href="javascript:bestList('${root }','${startPage-pageBlock}')"><span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<li><a href="javascript:bestList('${root}','${i}')">${i}</a></li>
					</c:forEach>
					
					<c:if test="${endPage<pageCount }">
						<li><a aria-label="Next" href="javascript:bestList('${root}','${startPage+pageBlock }')"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
				</c:if>
			</c:if>
		</ul>
	</nav>
</div>
</body>
</html>