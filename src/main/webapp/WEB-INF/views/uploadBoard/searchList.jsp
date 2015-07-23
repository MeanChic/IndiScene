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
<div id="uploadSearchList">
	<h3>Search result</h3>
	<c:set value="${currentPage}" var="currentPage"/>
	<div class="row bs-example bs-example-tabs" data-example-id="togglable-tabs">
	<!-------------- Nav tabs ---------------->
		<ul id="SearchResultTab" class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#totalSearchResult" id="totalSearch-tab" aria-controls="totalSearch" role="tab" data-toggle="tab">Total Result</a></li>
			<li role="presentation"><a href="#artistSearchResult" id="artistSearch-tab" aria-controls="artistSearch" role="tab" data-toggle="tab">Artist Result</a></li>
			<li role="presentation"><a href="#subjectSearchResult" id="subjectSearch-tab" aria-controls="subjectSearch" role="tab" data-toggle="tab">Subject Result</a></li>
		</ul>
	<!-------------- Tab panes ---------------->
	    <div id="performPlaceTabContent" class="tab-content">
		<!-- --------------------------------- Total Search Result Start ----------------------------------- -->
			<div role="tabpanel" class="tab-pane fade in active" id="totalSearchResult" aria-labelledby="totalSearch-tab">
				<div class="marketBoardX-location02 marketBoardInterval03 marketBoardAttribute01">
					<input type="button" class="marketBoardAttribute01 btn btn-default pull-left marginLR15" value="Put In" onclick="musicStorage('${root}','${artist_id}')"/>
				</div>
			<c:set var="countTotalSearch" value="${countArtistSearch+countSubjectSearch}"/>
			<h4>통합 검색결과 (${countTotalSearch})건</h4>
			<div id="artistSearch">
				<h4>아티스트 검색결과 (${countArtistSearch})건</h4>
				<div class="marketBoardAttribute02 marketBoardInterval03">
					<div class="form-controlBoard">
						<label class="boardlabelBlock marketBoardSize4 label-colorO marketBoardAttribute01">
							<input type="checkbox" class="" autocomplete="off"/>
						</label>
						<label class="boardlabelBlock marketBoardSize46 label-colorO marketBoardAttribute01">Subject</label>
						<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Writer</label>
						<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Date</label>
						<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Views</label>
						<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Like</label>
					</div>
					<!-- Indi'sMusic List -->
					<c:forEach var="list" items="${searchArtistList}">
						<div class="form-controlBoard">
							<label class="boardlabelBlock marketBoardSize4 label-color marketBoardAttribute01">
								<input type="checkbox" class="musicCheckBox" autocomplete="off"/>
							</label>
							<label class="boardlabelBlock marketBoardSize46 label-color marketBoardAttribute01 marketBoardY-location02">
								<img src="${root}${list.image_path}" style="width:50px; height:50px;"/>
								<a class="label-color" href="javascript:uploadRead('${root}','${list.board_num}','${currentPage}')">${list.subject}</a>
							</label>
							<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01 marketBoardY-location02">${list.artist_id}</label>
							<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01"><fmt:formatDate value="${list.register_date }" pattern="yyyy.MM.dd"/></label>
							<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${list.count}</label>
							<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${list.board_like}</label>
							<%-- <audio controls src="${root}${list.file_path}"></audio> --%>
						</div>
					</c:forEach>
				</div>
				
				<c:if test="${countArtistSearch==0 }">
					<div align="center">해당 아티스트 명으로 검색된 결과가 없습니다.</div>
				</c:if>
			
				<c:if test="${countArtistSearch>0 }">
					<c:choose>
						<c:when test="${searchType==null}">
							<a href="">더보기</a>
						</c:when>
						<c:otherwise>
					<!-- page Number -->
							<nav class="marketBoardX-location01">
								<ul class="pagination marketBoardAttribute01">
									<c:if test="${countArtistSearch>0 }">
										<c:set var="pageBlock" value="${5}"/>
										<c:set var="pageCount" value="${countArtistSearch/boardSize+(countArtistSearch%boardSize==0 ? 0:1 )}"/>
										
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
								</ul>
							</nav>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
			<div id="subjectSearch">
				<h4>제목 검색결과(${countSubjectSearch })건</h4>
				<div class="marketBoardAttribute02 marketBoardInterval03">
					<div class="form-controlBoard">
						<label class="boardlabelBlock marketBoardSize4 label-colorO marketBoardAttribute01">
							<input type="checkbox" class="" autocomplete="off"/>
						</label>
						<label class="boardlabelBlock marketBoardSize46 label-colorO marketBoardAttribute01">Subject</label>
						<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Writer</label>
						<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Date</label>
						<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Views</label>
						<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Like</label>
					</div>
					<!-- Indi'sMusic List -->
					<c:forEach var="list" items="${searchSubjectList}">
						<div class="form-controlBoard">
							<label class="boardlabelBlock marketBoardSize4 label-color marketBoardAttribute01">
								<input type="checkbox" class="musicCheckBox" autocomplete="off"/>
							</label>
							<label class="boardlabelBlock marketBoardSize46 label-color marketBoardAttribute01 marketBoardY-location02">
								<img src="${root}${list.image_path}" style="width:50px; height:50px;"/>
								<a class="label-color" href="javascript:uploadRead('${root}','${list.board_num}','${currentPage}')">${list.subject}</a>
							</label>
							<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01 marketBoardY-location02">${list.artist_id}</label>
							<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01"><fmt:formatDate value="${list.register_date }" pattern="yyyy.MM.dd"/></label>
							<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${list.count}</label>
							<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${list.board_like}</label>
							<%-- <audio controls src="${root}${list.file_path}"></audio> --%>
						</div>
					</c:forEach>
				</div>
				
				<c:if test="${countSubjectSearch==0 }">
					<div align="center">해당 제목으로 검색된 결과가 없습니다</div>
				</c:if>
				
				<c:if test="${countSubjectSearch>0 }">
					<c:choose>
						<c:when test="${searchType==null}">
							<a href="">더보기</a>
						</c:when>
						<c:otherwise>
					<!-- page Number -->
							<nav class="marketBoardX-location01">
								<ul class="pagination marketBoardAttribute01">
									<c:if test="${countSubjectSearch>0 }">
										<c:set var="pageBlock" value="${5}"/>
										<c:set var="pageCount" value="${countSubjectSearch/boardSize+(countSubjectSearch%boardSize==0 ? 0:1 )}"/>
										
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
								</ul>
							</nav>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
		</div>
		<!-- --------------------------------- Total Search Result End ----------------------------------- -->
		<!-- --------------------------------- Artist Search Result Start ----------------------------------- -->
			<div role="tabpanel" class="tab-pane fade" id="artistSearchResult" aria-labelledby="artistSearch-tab">
				<div class="marketBoardX-location02 marketBoardInterval03 marketBoardAttribute01 marginLR15">
					<input type="button" class="marketBoardAttribute01 btn btn-default pull-left" value="Put In" onclick="musicStorage('${root}','${artist_id}')"/>
				</div>
				<div id="artistSearch">
					<h4>아티스트 검색결과 (${countArtistSearch})건</h4>
					<div class="marketBoardAttribute02 marketBoardInterval03">
						<div class="form-controlBoard">
							<label class="boardlabelBlock marketBoardSize4 label-colorO marketBoardAttribute01">
								<input type="checkbox" class="" autocomplete="off"/>
							</label>
							<label class="boardlabelBlock marketBoardSize46 label-colorO marketBoardAttribute01">Subject</label>
							<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Writer</label>
							<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Date</label>
							<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Views</label>
							<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Like</label>
						</div>
						<!-- Indi'sMusic List -->
						<c:forEach var="list" items="${searchArtistList}">
							<div class="form-controlBoard">
								<label class="boardlabelBlock marketBoardSize4 label-color marketBoardAttribute01">
									<input type="checkbox" class="musicCheckBox" autocomplete="off"/>
								</label>
								<label class="boardlabelBlock marketBoardSize46 label-color marketBoardAttribute01 marketBoardY-location02">
									<img src="${root}${list.image_path}" style="width:50px; height:50px;"/>
									<a class="label-color" href="javascript:uploadRead('${root}','${list.board_num}','${currentPage}')">${list.subject}</a>
								</label>
								<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01 marketBoardY-location02">${list.artist_id}</label>
								<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01"><fmt:formatDate value="${list.register_date }" pattern="yyyy.MM.dd"/></label>
								<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${list.count}</label>
								<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${list.board_like}</label>
								<%-- <audio controls src="${root}${list.file_path}"></audio> --%>
							</div>
						</c:forEach>
					</div>
					
					<c:if test="${countArtistSearch==0 }">
						<div align="center">해당 아티스트 명으로 검색된 결과가 없습니다.</div>
					</c:if>
				
					<c:if test="${countArtistSearch>0 }">
						<c:choose>
							<c:when test="${searchType==null}">
								<a href="">더보기</a>
							</c:when>
							<c:otherwise>
						<!-- page Number -->
								<nav class="marketBoardX-location01">
									<ul class="pagination marketBoardAttribute01">
										<c:if test="${countArtistSearch>0 }">
											<c:set var="pageBlock" value="${5}"/>
											<c:set var="pageCount" value="${countArtistSearch/boardSize+(countArtistSearch%boardSize==0 ? 0:1 )}"/>
											
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
									</ul>
								</nav>
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
			</div>
		<!-- --------------------------------- Artist Search Result End ----------------------------------- -->
		<!-- --------------------------------- Subeject Search Result Start ----------------------------------- -->
		<div role="tabpanel" class="tab-pane fade in" id="subjectSearchResult" aria-labelledby="subjectSearch-tab">
			<div class="marketBoardX-location02 marketBoardInterval03 marketBoardAttribute01 marginLR15">
				<input type="button" class="marketBoardAttribute01 btn btn-default pull-left" value="Put In" onclick="musicStorage('${root}','${artist_id}')"/>
			</div>
			<div id="subjectSearch">
				<h4>제목 검색결과(${countSubjectSearch })건</h4>
				<div class="marketBoardAttribute02 marketBoardInterval03">
					<div class="form-controlBoard">
						<label class="boardlabelBlock marketBoardSize4 label-colorO marketBoardAttribute01">
							<input type="checkbox" class="" autocomplete="off"/>
						</label>
						<label class="boardlabelBlock marketBoardSize46 label-colorO marketBoardAttribute01">Subject</label>
						<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Writer</label>
						<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Date</label>
						<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Views</label>
						<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Like</label>
					</div>
					<!-- Indi'sMusic List -->
					<c:forEach var="list" items="${searchSubjectList}">
						<div class="form-controlBoard">
							<label class="boardlabelBlock marketBoardSize4 label-color marketBoardAttribute01">
								<input type="checkbox" class="musicCheckBox" autocomplete="off"/>
							</label>
							<label class="boardlabelBlock marketBoardSize46 label-color marketBoardAttribute01 marketBoardY-location02">
								<img src="${root}${list.image_path}" style="width:50px; height:50px;"/>
								<a class="label-color" href="javascript:uploadRead('${root}','${list.board_num}','${currentPage}')">${list.subject}</a>
							</label>
							<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01 marketBoardY-location02">${list.artist_id}</label>
							<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01"><fmt:formatDate value="${list.register_date }" pattern="yyyy.MM.dd"/></label>
							<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${list.count}</label>
							<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${list.board_like}</label>
							<%-- <audio controls src="${root}${list.file_path}"></audio> --%>
						</div>
					</c:forEach>
				</div>
				
				<c:if test="${countSubjectSearch==0 }">
					<div align="center">해당 제목으로 검색된 결과가 없습니다</div>
				</c:if>
				
				<c:if test="${countSubjectSearch>0 }">
					<c:choose>
						<c:when test="${searchType==null}">
							<a href="">더보기</a>
						</c:when>
						<c:otherwise>
					<!-- page Number -->
							<nav class="marketBoardX-location01">
								<ul class="pagination marketBoardAttribute01">
									<c:if test="${countSubjectSearch>0 }">
										<c:set var="pageBlock" value="${5}"/>
										<c:set var="pageCount" value="${countSubjectSearch/boardSize+(countSubjectSearch%boardSize==0 ? 0:1 )}"/>
										
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
								</ul>
							</nav>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
		</div>
		<!-- --------------------------------- Subeject Search Result End ----------------------------------- -->
		</div>
	</div>
<script type="text/javascript">
$('#SearchResultTab a:first').click(function (e) {
	  e.preventDefault()
	  $("#totalSearchResult").tab('show')
})
$('#SearchResultTab a:eq(1)').click(function (e) {
	  e.preventDefault()
	  $("#artistSearchResult").tab('show')
})
$('#SearchResultTab a:last').click(function (e) {
	  e.preventDefault()
	  $("#subjectSearchResult").tab('show')
})
</script>
</div>
</body>
</html>