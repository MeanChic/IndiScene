<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div id="freeBoardRead">
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
		<!--  2015 0718 손유진 수정함 -->
		 
			<td height="30" colspan="4" align="center">
				<input type="button" style="color:black;" value="글수정" onclick="freeboardUpdateFun'${root}','${freeBoard.board_num}','${pageNumber}')" />
				<!-- boardNumber를 넘길경우 board_num이아닌 freeBoard.board_num을 명시해줘야 넘어간다. -->
				<input type="button" style="color:black;" value="글삭제" onclick="freeBoardDeleteFun'${root}','${freeBoard.board_num}','${pageNumber}')"/>
				<input type="button" style="color:black;" value="글목록" onclick="freeBoardList('${root}','${pageNumber}')"/>
			</td>
		</tr>
	</table>
	
	<!-- ---------------한줄댓글 ----------------------------------------------->

<%-- 	${freeBoard.board_num }--%>	
	
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<br/><br/><br/>
	<h3 style="color:#4C4C4C; font-size: 1.3em; font-weight: bold;" >commant </h3>
	<hr>
	<div>
		<input id="writeId"  type="text" name="artist_id" size="14" style="font-size:1.05em;font-family:Helvetica;" value="${freeBoard.artist_id}">
		<input id="writeReply" type="text" name="reply_content" size="80" />&nbsp;
		<input type="button" value="submit" style="color:black;" onclick="writeToServer('${root}','${freeBoard.board_num }')"/> 
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
			<p>
				<span class="cssReply">${reply.reply_content }</span>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="cssUpDel">
					<a href="javascript:upSelectToServer('${freeBoard.board_num }','${reply.reply_num }','${root}')" style="color:#36b823;">Edit</a>
					<span class="Delimiter">/</span>
					<a href="javascript:deleteToServer('${freeBoard.board_num }','${reply.reply_num }','${root}')" style="color:#D43F3A;">Delete</a>
				</span>
			</p>
			<hr>
		</div>
	</c:forEach>
	</div>
</body>
</html>