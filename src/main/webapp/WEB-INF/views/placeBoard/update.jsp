<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>거래 게시판 업데이트</title>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<script src="${root }/resources/ckEditor/ckeditor.js"></script>
<script src="${root }/js/jquery.js" type="text/javascript" ></script>
<script src="${root }/js/jquery.MultiFile.js" type="text/javascript" ></script>
</head>
<body>

	<form action="${root}/placeBoard/update.do" method="post" onsubmit="return checkForm(this)">
		<input type="hidden" name="board_num" value="${board.board_num }"/>
		<input type="hidden" name="pageNumber" value="${pageNumber }"/>
		
		<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
				<a href="${root }/placeBoard/list.do?pageNumber=${pageNumber}">글목록</a>
		</div>
			
		<div class="line">
			<label class="title">작성자</label>
			<span class="content">
				<input type="text" name="writer" value="${board.artist_id }" disabled="disabled" />
			</span>
		</div>
		
		<div class="line">
			<label class="title">제목</label>
				<span class="content"><input type="text" size="50" name="subject"  value="${board.subject }"/></span>
		</div>
		
		<div class="line" >
			<label class="title" >내용</label>
			<span class="content" >
				<textarea  name="content" >${board.content }</textarea>		
			<script >
				
				 CKEDITOR.replace( 'content',
						 {///IndiScene_basic/src/main/webapp/resources/ckfinder
						 	
						 	filebrowserUploadUrl: '${root}/placeBoard/fileUpload.do' // 파일 업로드를 처리 할 경로 설정.
						 });
	  	</script>
			</span>
		</div>	
		
		<div class="line">
			<label class="subject">파일</label>
				<span class="content">${board.file_name }<input class="multi" type="file" name="file[]" multiple></span>
		</div>	
		
		
		<div class="line" style="width:598px; border-width:2px; text-align:center;">
			<input type="submit" value="글수정"/>
			<input type="reset" value="취소"/>
			<input type="button" value="목록보기" onclick="location.href='${root}/placeBoard/enterBoard.do?pageNumber=${pageNumber}'">
		</div>
	</form>

</body>
</html>