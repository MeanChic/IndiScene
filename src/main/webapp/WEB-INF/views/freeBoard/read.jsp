
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<c:set var="root" value="${pageContext.request.contextPath }"/>

<html>
<title>Notice Read</title><%-- 
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/freeBoard.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/freeBoard.css"/> --%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 읽기</title>
</head>
<body>

	<table border="1" width="510" cellpadding="2"  cellspacing="0" align="center">
		<tr>
			<td align="center"  height="20" width="125">글번호</td>
			<td align="center"  height="20" width="125" >${freeBoard.board_num }</td>
			
			<td align="center"  height="20" width="125">조회수</td>
			<td align="center"  height="20" width="125" >${freeBoard.count }</td>
		</tr>
		
		<tr>
			<td align="center"  height="20" width="125">작성자</td>
			<td align="center"  height="20" width="125" >${freeBoard.artist_id }</td>
			<td align="center"  height="20" width="125">작성일</td>
			<td align="center"  height="20" width="5"><fmt:formatDate value="${freeBoard.register_date }" type="date"/></td>
		</tr>
			<tr>
			<td align="center"  height="20" width="125">제목</td>
			<td align="center"  height="20" colspan="3">${freeBoard.subject }</td>
	
			
		</tr>
		<tr>
			<td align="center"  height="200" width="125">글내용</td>
			<td valign="top" height="200" colspan="3">${freeBoard.content }</td>
		</tr>
		
		<tr>
			<td height="30" colspan="4" align="center">
				<input type="button" value="글수정" onclick="updateFun('${root}','${freeBoard.board_num}','${pageNumber}')" />
				<!-- boardNumber를 넘길경우 board_num이아닌 freeBoard.board_num을 명시해줘야 넘어간다. -->
				<input type="button" value="글삭제" onclick="deleteFun('${root}','${freeBoard.board_num}','${pageNumber}')"/>
				<input type="button" value="글목록" onclick="freeBoardList('${root}','${pageNumber}')"/>
			</td>
		</tr>
	</table>
	
	<!-- ---------------한줄댓글 ----------------------------------------------->

	${freeBoard.board_num }
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<div>한줄 댓글이 가능합니다.</div>
	<br/>
	
	<div>
		<input id="writeId" type="text" name="artist_id"  size="7" />
		<input id="writeReply" type="text" name="reply_content" size="45"/>
		<input type="button" value="한줄답글작성" onclick="writeToServer('${root}','${freeBoard.board_num }')"/> 
	</div>

	 
	<div></div>
	
	<!-- 새로운 데이터 -->
	<div id="newReply"></div>
	
	<!--  기존데이타 -->
	<c:forEach var="reply" items="${replyList }">
		<div class="replyDiv" id="${reply.reply_num }">   <!-- div를 통해 한번에 삭제하기위함,, 자식들도 삭제되므로! -->
			<span class="cssBunho">${reply.reply_num }</span>
			<span class="cssAritist">${reply.artist_id }</span>
			<span class="cssReply">${reply.reply_content }</span>
			<span class="cssDate">${reply.reply_date }</span>
			<span class="cssUpDel">
				<a href="javascript:upSelectToServer('${freeBoard.board_num }','${reply.reply_num }','${root}')">수정</a>
				<a href="javascript:deleteToServer('${freeBoard.board_num }','${reply.reply_num }','${root}')">삭제</a>
			</span>
		</div>
	</c:forEach>
		
	
	
</body>
</html>