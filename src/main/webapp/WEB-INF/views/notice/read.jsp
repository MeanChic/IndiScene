<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<title>게시판 읽기</title>
<!-- <script type="text/javascript">
	function replyFun(root, board_num, group_num, seq_num, seq_level, pageNumber){
		var url=root + "/notice/write.do?board_num="+board_num;
		url+="&group_num="+group_num +"&seq_num="+seq_num+"&seq_level="+seq_level+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	}
	
	function deleteFun(root, board_num, pageNumber){
		var url=root + "/notice/delete.do?board_num="+board_num+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	}
	
	function updateFun(root, board_num, pageNumber){
		var url=root + "/notice/update.do?board_num="+board_num+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	}
</script> -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div id="noticeRead">
	<h3>Notice</h3>
	<c:set var="root" value="${pageContext.request.contextPath }" />
	<input type="hidden" id="pageNumberForAjax" value="${pageNumber }"/>
	<div class="marketBoardX-location02 marketBoardInterval03">
		<a class="marketBoardAttribute01 btn btn-default" href="javascript:enterMarketBoard('${root}','${pageNumber}')">List</a>
	</div>	
	<div class="form-controlMarket">
		<label class="marketBoardSize18 label-color marketBoardAttribute01">Board Number</label>
		<div class="marketBoardSize30 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="${notice.board_num}" disabled="disabled" />
		</div>
		<label class="marketBoardSize18 label-color marketBoardAttribute01">Views</label>
		<div class="marketBoardSize30 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="${notice.count}" disabled="disabled" />
		</div>
	</div>
	<div class="form-controlMarket">
		<label class="marketBoardSize18 label-color marketBoardAttribute01">Subject</label>
		<div class="marketBoardSize30 marketBoardAttribute01">
			<input class="marketBoardSize25 form-controller220" type="text" value="${notice.subject}" disabled="disabled" />
		</div>
		<label class="marketBoardSize18 label-color marketBoardAttribute01">Date</label>
		<div class="marketBoardSize30 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="<fmt:formatDate value="${notice.register_date}" type='date'/>" disabled="disabled"/>
		</div>
	</div>			
	<div class="form-controlMarket" >
		<label class="marketBoardSize18 label-color marketBoardY-location01">Contents</label>
		<div class="marketBoardSize75a marketBoardAttribute01">
			<script type="text/javascript">
				$(function(){
					$("#noticeRead img").attr("style","");
					$("#noticeRead img").addClass("marketBoardSize03");
				})				
			</script>
			<div id="marketReadContents" class="marketBoardTextareaSize200 marketBoardAttribute02">
				${notice.content}
			</div>		
		</div>
	</div>
	<div class="form-controlMarket" style= text-align:center;>
		<div class="marketBoardInterval04">
				<input class="btn btn-default" type="button" value="Modify" onclick="noticeUpdateFun('${root}','${notice.board_num }', '${pageNumber}')" />
				<input class="btn btn-default" type="button" value="Delete" onclick="noticeDeleteFun('${root}','${notice.board_num }', '${pageNumber}')"/>
		</div>
	</div>	
	
	<!-- ---------------한줄댓글 ----------------------------------------------->

	${notice.board_num }
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<div>한줄 댓글이 가능합니다.</div>
	<br/>
	
	<div>
		<input id="writeId" type="text" name="artist_id"  size="7" />
		<input id="writeReply" type="text" name="reply_content" size="45"/>
		<input type="button" value="한줄답글작성" onclick="writeToServer('${root}','${notice.board_num }')"/> 
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
				<a href="javascript:upSelectToServer('${notice.board_num }','${reply.reply_num }','${root}')">수정</a>
				<a href="javascript:deleteToServer('${notice.board_num }','${reply.reply_num }','${root}')">삭제</a>
			</span>
		</div>
	</c:forEach>
</div>
</body>
</html>