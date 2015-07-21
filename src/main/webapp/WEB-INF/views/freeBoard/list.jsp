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
<div id="freeBoardList">
	<h3>FreeBoard</h3>
	<div class="marketBoardX-location02 marketBoardInterval03">
		<a class="marketBoardAttribute01 btn btn-default" href="javascript:freeBoardWrite('${root }')">FreeBoard Write</a>
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
				<label class="boardlabelBlock marketBoardSize46 label-colorO marketBoardAttribute01">Subject</label>
				<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Writer</label>
				<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Date</label>
				<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Views</label>
			</div>
			<!-- freeBoard List -->
			<c:forEach var="freeBoard" items="${freeBoardList }">
				<div class="form-controlBoard">
					<label class="boardlabelBlock marketBoardSize16 label-color marketBoardAttribute01">${freeBoard.board_num }</label>
					<label class="boardlabelBlock marketBoardSize46 label-color marketBoardAttribute01 marketBoardY-location02">
						<c:if test="${freeBoard.seq_level>0 }">
							<c:forEach begin="0" end="${freeBoard.seq_level }" step="1">
							</c:forEach>
						</c:if>
						<a class="label-color" href="javascript:freeBoardRead('${root }','${freeBoard.board_num }','${currentPage }')">${freeBoard.subject }</a>
					</label>
					<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${freeBoard.artist_id }</label>
					<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01"><fmt:formatDate value="${freeBoard.register_date }" type="date"/></label>
					<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${freeBoard.count }</label>
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
					<c:set var="pageCount" value="${count/freeBoardSize+(count%freeBoardSize==0 ? 0:1 )}"/>
					
					<%-- 시작 페이지 번호 --%>
					<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
					<c:set var="startPage" value="${rs*pageBlock+1 }"/>
					
					<%-- 끝 페이지 번호 --%>
					<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
					<c:if test="${endPage> pageCount }">
						<c:set var="endPage" value="${pageCount }"/>
					</c:if>
					<%----------------------------------------------------------%>
					<c:if test="${startPage>pageBlock }">
						<c:choose>
							<c:when test="${requestScope.searchWord == '' }">
								<li><a aria-label="Previous" href="javascript:freeBoardList('${root}','${startPage-pageBlock }')"><span aria-hidden="true">&laquo;</span></a></li>
							</c:when>
							<c:otherwise>
								<li><a aria-label="Previous" href="javascript:searchFreeBoard('${root}','${startPage-pageBlock }','${requestScope.searchWord}','${requestScope.searchType}')"><span aria-hidden="true">&laquo;</span></a></li>
							</c:otherwise>
						</c:choose>
					</c:if>
					
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:choose>
							<c:when test="${requestScople.searchWord == '' }">
								<li><a href="javascript:freeBoardList('${root}','${i}')">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="javascript:searchFreeBoard('${root}','${i}','${requestScope.searchWord}','${requestScope.searchType}')">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:if test="${endPage<pageCount }">
						<c:choose>
							<c:when test="${requestScope.searchWord == '' }">
								<li><a aria-label="Next" href="javascript:freeBoardList('${root}','${startPage+pageBlock }')"><span aria-hidden="true">&raquo;</span></a></li>
							</c:when>
							<c:otherwise>
								<li><a aria-label="Previous" href="javascript:searchFreeBoard('${root}','${startPage+pageBlock }','${requestScope.searchWord}','${requestScope.searchType}')"><span aria-hidden="true">&laquo;</span></a></li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:if>
			</ul>
		</nav>
	</c:if>
	
	<!-- 검색 작업창 시작 --------------------------------------------------->
	<div> 
		<form id="searchForm" name="searchForm" method="get" action="javascript:searchFreeBoard('${root}','1','${pageContext.request.servletPath }');">
	<!--   페이징작업을위한 GET방식 -->     
	<input type="hidden" name="searchflag" value="true"/> <!-- 검색글 요청시 플래그값을 true로 넘김 -->
              <table id="">
                    <tr class="searchBox">
                         <td class="">
                               <select id="searchType" name="searchType">
									  <option value="total">전체</option>	                              			
                                      <option value="artist_id">글쓴이</option>
                                      <option value="subject">제목</option>
                                      <option value="content">내용</option>
                               </select>
                         </td>
                         <td class="">
                               <input type="text"  id="searchWord" name="searchWord">
                         </td>
                         <td class="searchBtn">
                               <input type="submit" id="searchBtn" value="submit"></input>
                         </td>
                    </tr>
             </table>
        </form>
	
	</div>
</div>
</body>
</html>
