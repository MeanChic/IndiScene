<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%-- <c:set var="artist_id"  value="indi"/> --%>
<%-- <c:set var="artist_id"  value="indi"/> --%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="${root}/css/jquery-ui.css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
</head>
<body>
<div id="MuseGuestList">
	<input name = "count" type="hidden" value="${count}"/>
	<input name="boardnum" type="hidden" value="${boardnum}"/>
	<input name="pageCount" type="hidden" value="${count/boardnum}"/>
	<input name="pagenum" type="hidden" value="${pagenum }"/>
	
	<form> <!-- style="width:40%; height:180px; display:block; border:solid 1px black;" -->
		<span>작성자 : ${artist_id}</span> <span style="align:right;">뮤즈이름:${muse_name}</span>
		<input type="hidden" name="muse_name" value="${muse_name}">
		<input type="hidden" name="artist_id" value="${artist_id}">
		<input type="hidden" id="root" value="${root }"/>
		<textarea name="guest_content" rows="8" cols="50" ></textarea>
		<input type="button"  value="전송" onclick="guestSend()"/>
	</form>
	<br/><br/><br/><br/>
	<div id="guestline" >	
		<c:forEach var="guest" items="${list}">
			<div id = "${guest.guest_num}">
				<c:if test="${artist_id == guest.artist_id}">
					<%-- <input type="button" value="수정" onclick="update('${guest.guest_num}','${guest.guest_content}')"/>
					<input type="button" value="삭제" onclick="delete('${guest.guest_num}')"/> --%>
					<a href="javascript:guestUpdate('${guest.guest_num}','${guest.guest_content}')">수정</a>
					<a href="javascript:guestDel('${guest.guest_num}')">삭제</a>
				</c:if>
				<span> ${guest.artist_id}</span> <span>${guest.guest_date}</span> <br/>
				<span >${guest.muse_name}</span> , <span class="con">${guest.guest_content}</span>
				<form style="display:none"><textarea></textarea><input type="button"  value="수정하기" onclick="guestUpcon('${guest.guest_num}')"/><input type="button" value="취소" onclick="guestRemo('${guest.guest_num}')"/></form>
				
			</div>
		</c:forEach>
		
		<c:if test="${count < boardnum}">
			<c:forEach var="i" begin="${count+1}" end="${boardnum}">
			<div>
				<c:if test="${artist_id == guest.artist_id}">
					<%-- <input type="button" value="수정" onclick="update('${guest.guest_num}','${guest.guest_content}')"/>
					<input type="button" value="삭제" onclick="delete('${guest.guest_num}')"/> --%>
					<a href="javascript:guestUpdate()">수정</a>
					<a href="javascript:guestDel()">삭제</a>
				</c:if>
				<span></span> <span></span> <br/>
				<span ></span> , <span class="con"></span>
				<form style="display:none"><textarea></textarea><input type="button"  value="수정하기" onclick="guestUpcon()"/><input type="button" value="취소" onclick="guestRemo()"/></form>
			</div>
			</c:forEach>
		</c:if>
	</div>
		<%-- <c:if test="${count/boardnum > 1}">
			<c:if test="${pagenum != '1'}">
				<a style=""href="javascript:guestNext('${muse_name}','${pagenum-1}')">[이전]</a>
			</c:if>
		
			<c:if test="${count > 0}">
				<a id="minus" style="display:none" href="javascript:guestNext('${muse_name}','${pagenum-1}')">[이전]</a>
				<a id="plus" href="javascript:guestNext('${muse_name}','${pagenum+1}')">[다음]</a>
			</c:if>
		</c:if> --%>
	<!-- page Number -->
	<nav class="marketBoardX-location01">
		<ul class="pagination marketBoardAttribute01">
			<c:if test="${count>0 }">
				<c:set var="pageBlock" value="${5}"/>
				<c:set var="pageCount" value="${count/boardnum+(count%boardnum==0 ? 0:1 )}"/>
				
				<fmt:parseNumber var="rs" value="${(pagenum-1)/pageBlock }" integerOnly="true"/>
				<c:set var="startPage" value="${rs*pageBlock+1 }"/>
				<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
				
				<c:if test="${endPage> pageCount }">
					<c:set var="endPage" value="${pageCount }"/>
				</c:if>
				<%----------------------------------------------------------%>
				<c:if test="${startPage>pageBlock }">
					<li><a aria-label="Previous" href="javascript:guestNext('${muse_name}','${startPage-pageBlock}')"><span aria-hidden="true">&laquo;</span></a></li>
				</c:if>
				
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<li><a href="javascript:uploadList('${root}','${i}')">${i}</a></li>
				</c:forEach>
				
				<c:if test="${endPage<pageCount }">
					<li><a aria-label="Next" href="javascript:guestNext('${muse_name}','${startPage+pageBlock }')"><span aria-hidden="true">&raquo;</span></a></li>
				</c:if>
			</c:if>
		</ul>
	</nav>
</div>
</body>
</html>
