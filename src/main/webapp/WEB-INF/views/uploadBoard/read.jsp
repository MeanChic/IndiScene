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
	<h3>Indi's Music : ${boardDto.subject}</h3>
	<div class="marketBoardX-location02">
		<a class="marketBoardAttribute01 btn btn-default" href="javascript:oneMusicStorage('${root}','${artist_id}','${boardDto.board_num}')">Put In</a>
		<a class="marketBoardAttribute01 btn btn-default" href="javascript:uploadList('${root}','${pageNumber}')">List</a>
	</div>
	<div class="form-controlMarket instants09">
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Like</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="${boardDto.board_like}" disabled="disabled" />
		</div>
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Views</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="${boardDto.count}" disabled="disabled" />
		</div>
	</div>
	<div class="form-controlMarket">
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Writer</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="marketBoardSize25 form-controller220" type="text" value="${boardDto.artist_id}" disabled="disabled" />
		</div>
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Date</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="<fmt:formatDate value="${boardDto.register_date}" type='date'/>" disabled="disabled"/>
		</div>
	</div>
	<div class="form-controlMarket" >
		<div class="marketBoardSize16 marketBoardAttribute01 marketBoardY-location01">
			<label class="marketBoardAttribute02 label-color">Contents</label>
		</div>
		<div class="marketBoardSize77 marketBoardAttribute01 marketBoardY-location01">
			<div id="marketReadContents" class="marketBoardTextareaSize200 marketBoardAttribute02">
				<div class="">
					<img class="instants05" alt="" src="${root}${boardDto.image_path}">
					<audio class="instants05 instants06" controls src="${root}${boardDto.file_path}"></audio>
				</div>
				${boardDto.content}
			</div>		
		</div>
	</div>
	<div class="form-controlMarket" style= text-align:center;>
		<div class="marketBoardInterval04">
			<a class="btn btn-info btn-lg" href="javascript:uploadLike('${root}','${board_num}','${artist_id}')"><span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;&nbsp;Like</a>
			<a class="btn btn-info btn-lg" href="javascript:uploadCollabo('${root}','${board_num}','${pageNumber}')"><span class="glyphicon glyphicon-duplicate"></span>&nbsp;&nbsp;Collaboration</a>
		</div>
	</div>
	<c:if test="${boardDto.artist_id == artist_id }">
		<div class="form-controlMarket" style= text-align:center;>
			<div class="marketBoardInterval04">
				<input class="btn btn-default" type="button" value="Modify" onclick="uploadUpdate('${root}','${board_num}','${pageNumber}')">
				<input class="btn btn-default" type="button" value="Delete" onclick="uploadDelete('${root}','${board_num}','${pageNumber}')">
			</div>
		</div>
	</c:if>
		
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