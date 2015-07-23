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
	<h3>FreeBoard</h3>
	<div class="marketBoardX-location02 marketBoardInterval03">
		<a class="marketBoardAttribute01 btn btn-default" href="javascript:freeBoardList('${root}','${pageNumber}')">List</a>
	</div>	
	<div class="form-controlMarket">
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Board Number</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="${freeBoard.board_num}" disabled="disabled" />
		</div>
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Views</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="${freeBoard.count}" disabled="disabled" />
		</div>
	</div>
	<div class="form-controlMarket">
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Subject</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="marketBoardSize25 form-controller220" type="text" value="${freeBoard.subject}" disabled="disabled" />
		</div>
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Date</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="<fmt:formatDate value="${freeBoard.register_date}" type='date'/>" disabled="disabled"/>
		</div>
	</div>			
	<div class="form-controlMarket" >
		<label class="marketBoardSize16 label-color marketBoardY-location01">Contents</label>
		<div class="marketBoardSize77 marketBoardAttribute01">
			<script type="text/javascript">
				$(function(){
					$("#noticeRead img").attr("style","");
					$("#noticeRead img").addClass("marketBoardSize03");
				})				
			</script>
			<div id="marketReadContents" class="marketBoardTextareaSize200 marketBoardAttribute02">
				${freeBoard.content}
			</div>		
		</div>
	</div>
	<div class="form-controlMarket" style= text-align:center;>
		<div class="marketBoardInterval04">
			<c:if test="${artist_id == freeBoard.artist_id }">
				<input class="btn btn-default" type="button" value="Modify" onclick="freeBoardUpdateFun('${root}','${freeBoard.board_num }', '${pageNumber}')" />
				<input class="btn btn-default" type="button" value="Delete" onclick="freeBoardDeleteFun('${root}','${freeBoard.board_num }', '${pageNumber}')"/>
			</c:if>
		</div>
	</div>
	 	
	<!-- ---------------한줄댓글 ----------------------------------------------->

<%-- 	${freeBoard.board_num }--%>	
	
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<br/><br/><br/>
	<h3 style="color:#4C4C4C; font-size: 1.3em; font-weight: bold;" >comment </h3>
	<hr>
	<div>
		<input type="hidden" value="${artist_id }" name="artist_id" />
		<input id="writeId"  type="text" name="artist" size="14" style="font-size:1.05em;font-family:Helvetica;" value="${freeBoard.artist_id}" disabled="disabled"/>
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