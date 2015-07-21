<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="uploadBoardRead">
		<a style="margin:0 0 0 600px"href="javascript:uploadList('${root}','${pageNumber}')">리스트로 돌아가기</a>
		<div style="border:solid 1px black; width:700px; margin:100px 0 100px 20px ">
		<span>${pageNumber}</span><span>${boardDto.register_date}</span>
		<div style="border:solid 1px black;"><img alt="" src="${root}${boardDto.image_path}" style="width:100px; height:100px;"></div>
		<div style="border:solid 1px black">${boardDto.subject}</div>
		<div style="border:solid 1px black;"><audio controls src="${root}${boardDto.file_path}"></audio></div>
		<div style="border:solid 1px black">${boardDto.artist_id}</div>
		<div style="border:solid 1px black; height:100px;">${boardDto.content}</div>
	<br/>
		${boardDto.count}<br/>
		<a href="javascript:uploadLike('${root}','${board_num}','${artist_id}')"><img src="${root}/resources/uploadBoard/social-media-like-button.jpg" style="width:50px;height:50px;"/></a>;
		
		<div style="margin:0 0 0 400px">
		<c:if test="${boardDto.artist_id == artist_id }">
		<input type="button" value="수정" onclick="uploadUpdate('${root}','${board_num}','${pageNumber}')">
		<input type="button" value="삭제" onclick="uploadDelete('${root}','${board_num}','${pageNumber}')">
		</c:if>
		<input type="button" value="콜라보" onclick="uploadCollabo('${root}','${board_num}','${pageNumber}')"/>
		</div>
		
		</div>
		
			<!-- ---------------한줄댓글 ----------------------------------------------->
	
	
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<br/><br/><br/>
	<h3 style="color:#4C4C4C; font-size: 1.3em; font-weight: bold;" >commant </h3>
	<hr>
	<div>
		<input id="writeId"  type="text" name="artist_id" size="14" style="font-size:1.05em;font-family:Helvetica;">
		<input id="writeReply" type="text" name="reply_content" size="80" />&nbsp;
		<input type="button" value="submit" style="color:black;" onclick="writeToServer('${root}','${board_num }')"/> 
	</div>
	<div></div>
	 
	<div></div>
	
	<!-- 새로운 데이터 -->
	<div id="newReply"></div>
	
	<!--  기존데이타 -->
	<c:forEach var="reply" items="${replyList }">
		<div class="replyDiv" id="${reply.reply_num }">   <!-- div를 통해 한번에 삭제하기위함,, 자식들도 삭제되므로! -->
			<%-- <span class="cssBunho">${reply.reply_num }</span> --%>
			<p class="DiscussInfo"><!--  아이디/날짜   -->
				<span class="cssAritist">${reply.artist_id }</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="cssDate"><fmt:formatDate
					value="${reply.reply_date }" type="date" pattern="yyyy/MM/dd HH:mm" /></span>		
			</p>
			<p >
				<span class="cssReply">${reply.reply_content }</span>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="cssUpDel">
					<a href="javascript:upSelectToServer('${uploadBoard.board_num }','${reply.reply_num }','${root}')" style="color:#36b823;">Edit</a>
					<span class="Delimiter">/</span>
					<a href="javascript:deleteToServer('${uploadBoard.board_num }','${reply.reply_num }','${root}')" style="color:#D43F3A;">Delete</a>
				</span>
			</p>
			<hr>
		</div>
	</c:forEach>
	
	</div>
</body>
</html>