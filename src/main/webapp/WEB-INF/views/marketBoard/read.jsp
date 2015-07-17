<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${root }/resources/xhr/xhr.js" type="text/javascript" ></script>
<script src="${root }/js/replyWrite.js" type="text/javascript" ></script>
<script src="${root }/js/replyDelete.js" type="text/javascript" ></script>
<script src="${root }/js/replyUpdate.js" type="text/javascript" ></script>
<!-- Load google font -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href='http://fonts.googleapis.com/css?family=Questrial' rel='stylesheet' type='text/css'>
<link href="${root}/css/marketBoard1.css" rel="stylesheet">
	
<!-- Load styles -->
<link href="${root}/css/bootstrap.css" rel="stylesheet">

<script type="text/javascript">
	function delFun(root, board_num, pageNumber,artist_id){
		var dd =confirm("정말 삭제하시겠습니까?");
			var url=root+"/fileBoard/delete.do?board_num="+boardNumber+"&pageNumber="+pageNumber+"&artist_id="+artist_id;
		if(dd == true){
			location.href=url;
		}
	}
	function DeleteToServer(a,b,c){
		//alert(a+b+c);
	}
	
</script>
</head>

<body>
<div id="marketBoardread"><!-- barketBoard에서 MarketBoard로 바꿈  -->
	<c:set var="root" value="${pageContext.request.contextPath }" />

	
	<input type="hidden" id="pageNumberForAjax" value="${pageNumber }"></input>
	<table border="1" width="510" cellpadding="2" cellspacing="0"align="center">
		<tr>
			<td align="center" height="20" width="125">글번호</td>
			<td align="center" height="20" width="125">${marketBoard.board_num }</td>
			

			<td align="center" height="20" width="125">조회수</td>
			<td align="center" height="20" width="125">${marketBoard.count }</td>
		</tr>

		<tr>
			<td align="center" height="20" width="125">작성자</td>
			<td align="center" height="20" width="125">${marketBoard.artist_id}</td>

			<td align="center" height="20" width="125">작성일</td>
			<td align="center" height="20" width="125">
			<fmt:formatDate
					value="${marketBoard.register_date}" type="date" /></td>
		</tr>

		<tr>
			<td align="center" height="200" width="125">글내용</td>
			<td valign="top" height="200" colspan="3">${marketBoard.content }</td>
		</tr>

	<input type="hidden" id="pageNumberForAjax" value="${pageNumber }"/>
	<div class="marketBoardX-location02">
		<a class="marketBoardAttribute01 btn btn-default" href="javascript:enterMarketBoard('${root}','${pageNumber}')">List</a>
	</div>	
	<div class="form-controlMarket">
		<label class="marketBoardSize18 label-color marketBoardAttribute01">Board Number</label>
		<div class="marketBoardSize30 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="${marketBoard.board_num}" disabled="disabled" />
		</div>
		<label class="marketBoardSize18 label-color marketBoardAttribute01">Views</label>
		<div class="marketBoardSize30 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="${marketBoard.count}" disabled="disabled" />
		</div>
	</div>
	<div class="form-controlMarket">
		<label class="marketBoardSize18 label-color marketBoardAttribute01">Writer</label>
		<div class="marketBoardSize30 marketBoardAttribute01">
			<input class="marketBoardSize25 form-controller220" type="text" value="${marketBoard.artist_id}" disabled="disabled" />
		</div>
		<label class="marketBoardSize18 label-color marketBoardAttribute01">Date</label>
		<div class="marketBoardSize30 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="<fmt:formatDate value="${marketBoard.register_date}" type='date'/>" disabled="disabled"/>
		</div>
	</div>
	<div class="form-controlMarket" >
		<label class="marketBoardSize18 label-color marketBoardY-location01" >Contents</label>
		<div class="marketBoardSize75a marketBoardAttribute01">
			<script type="text/javascript">
				$(function(){
					$("#marketReadContents img").attr("style","");
					$("#marketReadContents img").addClass("marketBoardSize03");
				})				
			</script>
			<div id="marketReadContents" class="marketBoardTextareaSize200 marketBoardAttribute02">
				${marketBoard.content}
			</div>		
		</div>
		
		<c:if test="${marketBoard.file_name !=null }">
			<tr>
				<td align="center" height="20" width="125">파일명</td>
				<td colspan="3">
				
				
				<!-- 다중파일 read 처리 -->
				<c:forTokens var="file_name" items="${marketBoard.file_name}" delims="<>" varStatus="s" >
					<c:forTokens var="file_path" items="${marketBoard.file_path}" delims="<>" begin="${s.index}" end="${s.index }"> <!--파일 네임과 동일한 s번째순번의 path를 사용한다-->
						<a href="${root}/CommonIO/download.do?board_num=${marketBoard.board_num}&file_name=${file_name}&file_path=${file_path}">${file_name}, ${s.index}
						</a><br/>
					</c:forTokens>
				</c:forTokens>
				 
				</td>
			</tr>
		</c:if>

		<tr>
			<td height="30" colspan="4" align="center"><input type="button"
				value="글수정"
				onclick="javascript:marketBoardUpdate('${marketBoard.board_num}','${pageNumber}')" />
				<input type="button" value="글삭제"
				onclick="javascript:marketBoardDelete('${marketBoard.board_num}','${pageNumber}','${marketBoard.artist_id}')"/>
				<!-- onclick="delFun('${root}','${marketBoard.board_num}','${pageNumber}','${marketBoard.artist_id}')" />  -->
				<input type="button" value="글목록"
				onclick="javascript:enterMarketBoard('${root}','${pageNumber}')" />
			</td>
		</tr>
	</table>
	<!-- ---------------한줄댓글 ----------------------------------------------->
	
	
	<%-- ${marketBoard.board_num } --%>
	
	
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<br/>
	<h3>댓글달기 </h3>
	<hr>
	<div>
		<input id="writeId" type="text" name="artist_id"  size="12" />&nbsp;
		<input id="writeReply" type="text" name="reply_content" size="90"/>&nbsp;
		<input type="button" value="한줄답글작성" onclick="writeToServer('${root}','${marketBoard.board_num }')"/> 
	</div>
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
					<a href="javascript:upSelectToServer('${marketBoard.board_num }','${reply.reply_num }','${root}')" style="color:#36b823;">Edit</a>
					<span class="Delimiter">/</span>
					<a href="javascript:deleteToServer('${marketBoard.board_num }','${reply.reply_num }','${root}')" style="color:#D43F3A;">Delete</a>
				</span>
			</p>
			<hr>

			
		</div>
	</c:forEach>

	

<%-- 
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
				<a href="javascript:upSelectToServer('${marketBoard.board_num }','${reply.reply_num }','${root}')">Update</a>
				<a href="javascript:deleteToServer('${marketBoard.board_num }','${reply.reply_num }','${root}')">Edit</a>
			</span>
		</div>
	</c:forEach>
	</div> --%>
<!-- 한줄 댓글 끝부분 -->
</div>		
</body>
</html>
