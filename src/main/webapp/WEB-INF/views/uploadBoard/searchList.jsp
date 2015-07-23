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
	<div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">
		<input type="button" value="담기" onclick="musicStorage('${root}','${artist_id}')"/>
		<c:set value="${currentPage}" var="currentPage"/>
		
		<!--아티스트로 검색된 결과  -->
		<div id="artistSearch">
		<b><h4>아티스트 검색결과(${countArtistSearch })건</h4></b>
		<c:forEach var="list" items="${searchArtistList}">
			<div>
				<input type="checkbox" class="musicCheckBox" value="${list.board_num}"/>
				<img src="${root}${list.image_path}" style="width:50px; height:50px;"/>
				<a href="javascript:uploadRead('${root}','${list.board_num}','${currentPage}')">${list.subject}</a>
				<%-- <audio controls src="${root}${list.file_path}"></audio> --%>
				<span><fmt:formatDate value="${list.register_date}" pattern="yyyy-MM-dd"/></span>
				<span>${list.board_like}</span>
			</div>
		</c:forEach>
		<c:if test="${countArtistSearch==0 }">
			<td align="center">해당 아티스트 명으로 검색된 결과가 없습니다.</td>
		</c:if>
		<c:if test="${countArtistSearch>0 }">
		<center>
			<c:choose>
				<c:when test="${searchType==null}">
					<a href="">더보기</a>
				</c:when>
				<c:otherwise>
					<c:if test="${countArtistSearch>0 }">
						<c:set var="pageBlock" value="${10}"/>
						<c:set var="pageCount" value="${countArtistSearch/boardSize+(countArtistSearch%boardSize==0 ? 0:1 )}"/>
						
						<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
						<c:set var="startPage" value="${rs*pageBlock+1 }"/>
						<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
						
						<c:if test="${endPage> pageCount }">
							<c:set var="endPage" value="${pageCount }"/>
						</c:if>
						
						<c:if test="${startPage>pageBlock }">
							<%-- <a href="${root }/freeBoard/list.do?pageNumber=${startPage-pageBlock}">[이전]</a> --%> 
							<a href="javascript:uploadList('${root }','${startPage-pageBlock}')">[이전]</a>	
						</c:if>
						
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<a href="javascript:uploadList('${root}','${i}')">[${i}]</a>
						</c:forEach>
						
						<c:if test="${endPage<pageCount }">
							<%-- <a href="${root }/freeBoard/list.do?pageNumber=${startPage+pageBlock}">[다음]</a> --%>
							<a href="javascript:uploadList('${root }','${startPage+pageBlock}')">[다음]</a>				
						</c:if>
					</c:if>
				</c:otherwise>
			</c:choose>
		</center>
		</c:if>
		</div>
		
		<br/><br/><br/>
		
		<!-- subject로 검색된 결과 -->
		<div id="subjectSearch">
		<b><h4>제목 검색결과(${countSubjectSearch })건</h4></b>
			<c:forEach var="list" items="${searchSubjectList}">
				<div>
					<input type="checkbox" class="musicCheckBox" value="${list.board_num}"/>
					<img src="${root}${list.image_path}" style="width:50px; height:50px;"/>
					<a href="javascript:uploadRead('${root}','${list.board_num}','${currentPage}')">${list.subject}</a>
					<%-- <audio controls src="${root}${list.file_path}"></audio> --%>
					<span><fmt:formatDate value="${list.register_date}" pattern="yyyy-MM-dd"/></span>
					<span>${list.board_like}</span>
				</div>
			</c:forEach>
			<c:if test="${countSubjectSearch==0 }">
				<td align="center">해당 제목으로 검색된 결과가 없습니다</td>
			</c:if>
			
		<c:if test="${countSubjectSearch>0 }">
		<center>
			<c:choose>
				<c:when test="${searchType==null}">
					<a href="">더보기</a>
				</c:when>
				<c:otherwise>
					<c:if test="${countSubjectSearch>0 }">
						<c:set var="pageBlock" value="${10}"/>
						<c:set var="pageCount" value="${countSubjectSearch/boardSize+(countSubjectSearch%boardSize==0 ? 0:1 )}"/>
						
						<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
						<c:set var="startPage" value="${rs*pageBlock+1 }"/>
						<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
						
						<c:if test="${endPage> pageCount }">
							<c:set var="endPage" value="${pageCount }"/>
						</c:if>
						
						<c:if test="${startPage>pageBlock }">
							<%-- <a href="${root }/freeBoard/list.do?pageNumber=${startPage-pageBlock}">[이전]</a> --%> 
							<a href="javascript:uploadList('${root }','${startPage-pageBlock}')">[이전]</a>	
						</c:if>
						
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<a href="javascript:uploadList('${root}','${i}')">[${i}]</a>
						</c:forEach>
						
						<c:if test="${endPage<pageCount }">
							<%-- <a href="${root }/freeBoard/list.do?pageNumber=${startPage+pageBlock}">[다음]</a> --%>
							<a href="javascript:uploadList('${root }','${startPage+pageBlock}')">[다음]</a>				
						</c:if>
					</c:if>
				</c:otherwise>
			</c:choose>
		</center>
		</c:if>
		</div>
	</div>
</div>
</body>
</html>