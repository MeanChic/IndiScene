<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>거래 게시판 글쓰기 </title>
<script src="${root }/resources/ckEditor/ckeditor.js"></script>
<script src="${root }/resources/ckfinder/ckfinder.js"></script>
<script src="${root }/js/jquery.js" type="text/javascript" ></script>
<script src="${root }/js/jquery.MultiFile.js" type="text/javascript" ></script>
	<script type="text/javascript" src="${root }/css/marketBoard/script.js"></script>
	<!--  <link rel="stylesheet" type="text/css" href="${root }/css/marketBoard/style.css"/>-->
</head>
<body>

	<form class="form_style"  action="${root }/marketBoard/write.do"  method="post" onsubmit="return checkForm(this)" enctype="multipart/form-data">	
		<!-- <input type="hidden" name="board_num" value="${boardNumber }"/>-->
			
		<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
				<a href="${root}/marketBoard/enterBoard.do">글목록</a>
		</div>
		
			<div class="line">
			<label class="subject">작성자</label>
				<span class="content"><input type="text" size="50" name="artist_id" value="testId"/></span>
		</div>	
		
		<div class="line">
			<label class="subject">제목</label>
				<span class="content"><input type="text" size="50" name="subject"/></span>
		</div>	

		<div class="line" >
			<label class="title" >내용</label>
			<span class="content" >
				<textarea  name="content" ></textarea>		
			<script >
				
				 CKEDITOR.replace( 'content',
						 {///IndiScene_basic/src/main/webapp/resources/ckfinder
						 	filebrowserUploadUrl: '${root}/marketBoard/imageUpload.do' // 파일 업로드를 처리 할 경로 설정.
						 });
	  	</script>
			</span>
		</div>	
		
		<div class="line">
			<label class="subject">파일</label>
				<span class="content"><input class="multi" type="file" name="file[]" multiple></span>
				                    
		</div>	
		
		<div class="line" style= text-align:center;>
			<input type="submit" value="글쓰기"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="location.href='${root}/marketBoard/enterBoard.do'"/>
		</div>
	</form>
</body>
</html>