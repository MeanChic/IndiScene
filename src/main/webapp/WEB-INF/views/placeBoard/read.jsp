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
<script type="text/javascript">
	function delFun(root, board_num, pageNumber,artist_id){
		var dd =confirm("정말 삭제하시겠습니까?");
			var url=root+"/placeBoard/delete.do?board_num="+boardNumber+"&pageNumber="+pageNumber+"&artist_id="+artist_id;
		if(dd == true){
			location.href=url;
		}
	}
	
</script>
</head>
<body>
<body>
	<c:set var="root" value="${pageContext.request.contextPath }" />

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
		
		<c:if test="${marketBoard.file_name !=null }">
			<tr>
				<td align="center" height="20" width="125">파일명</td>
				<td colspan="3">
				
				<c:forTokens var="file_path" items="${marketBoard.file_path}" delims=";" varStatus="k" begin="1" end="1">
				<p> ${file_path}</p>
				</c:forTokens>
			
				<c:forTokens var="file_name" items="${marketBoard.file_name}" delims=";" varStatus="s" >
					<c:forTokens var="file_path" items="${marketBoard.file_path}" delims=";" begin="${s.index}" end="${s.index }">
						<a href="${root}/marketBoard/download.do?board_num=${marketBoard.board_num}&file_name=${file_name}&file_path=${file_path}">${file_name}, ${s.index}
						</a><br/>
					</c:forTokens>
				</c:forTokens>
				</td>
			</tr>
		</c:if>

		<tr>
			<td height="30" colspan="4" align="center"><input type="button"
				value="글수정"
				onclick="location.href='${root}/marketBoard/update.do?board_num=${marketBoard.board_num}&pageNumber=${pageNumber}'" />
				<input type="button" value="글삭제"
				onclick="location.href='${root}/marketBoard/delete.do?board_num=${marketBoard.board_num}&pageNumber=${pageNumber}&artist_id=${marketBoard.artist_id}'"/>
				<!-- onclick="delFun('${root}','${marketBoard.board_num}','${pageNumber}','${marketBoard.artist_id}')" />  -->
				<input type="button" value="글목록"
				onclick="location.href='${root}/marketBoard/enterBoard.do?pageNumber=${pageNumber}'" />
			</td>
		</tr>
	</table>
	<!-- ---------------한줄댓글 ----------------------------------------------->
	<c:set var="artistid" value="testId"/> <!-- session 적용하면 지울것 -->
	
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	${marketBoard.board_num }
	<div>한줄 댓글이 가능합니다.</div>
	<br/>
	
	<div>
		<input id="writeId" type="text" name="artist_id"  size="7" />
		<input id="writeReply" type="text" name="reply_content" size="45"/>
		<input type="button" value="한줄답글작성" onclick="writeToServer('${root}','${marketBoard.board_num }')"/> 
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
				<a href="javascript:upSelectToServer('${reply.reply_num }','${root}')">수정</a>
				<a href="javascript:deleteToServer('${reply.reply_num }','${root}')">삭제</a>
			</span>
		</div>
	</c:forEach>
		
</body>
</html>