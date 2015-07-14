<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 수정</title>
</head>
<body>
	<form id="updateForm" method="post">
		<input type="hidden" name="board_num" value="${board_num}"/>
		<input type="hidden" name="pageNumber" value="${pageNumber}"/>
		
<%-- 		<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
				<a href="${root }/freeBoard/list.do?pageNumber=${pageNumber}">글목록</a>
		</div> --%>
		 
		<div class="line">
			<label class="title">제목</label>
				<span class="content2"><input type="text" size="50" name="subject"  value="${freeBoard.subject}"/></span>
		</div>
		<div class="line">
			<label class="title">작성자</label>
				<span class="content2"><input type="text" size="50" name="artist_id" disabled="disabled"  value="${freeBoard.artist_id}"/></span>
		</div>
	
	
			<label class="title">내용</label>
			<span class="content">
				<textarea id="content" rows="14" cols="58" name="content">${freeBoard.content}</textarea><br/><br/>
			
	 		<script>
			 CKEDITOR.replace( 'content',
					 {///IndiScene_basic/src/main/webapp/resources/ckfinder
					 	filebrowserUploadUrl: '${root}/marketBoard/imageUpload.do' // 파일 업로드를 처리 할 경로 설정.
					 }); 
 			
			</script>
			
			</span>

		
			<div class="line" style="width:598px; border-width:2px; text-align:center;">
				<input type="button" value="글수정" onclick="updateFunOk('${root}','${freeBoard.board_num}','${pageNumber }')"/>
				<input type="button" value="취소" onclick="freeBoardRead('${root}','${freeBoard.board_num}','${pageNumber}'	)"/>
				
				
			<%-- 	<input type="button" value="글목록" onclick="list('${root}','${pageNumber}')"/> --%>
			</div>
	</form>
</body>
</html>