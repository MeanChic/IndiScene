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
	<script type="text/javascript" src="${root }/css/marketBoard/script.js"></script>
	<!--  <link rel="stylesheet" type="text/css" href="${root }/css/marketBoard/style.css"/>-->
</head>
<body>

	<form class="form_style"  action="${root }/board/write.do"  method="post" onsubmit="return checkForm(this)">	
		<input type="hidden" name="boardNumber" value="${boardNumber }"/>
			
		<div style="width:598px; height:15기px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
				<a href="${root}/marketBoard/enterBoard.do">글목록</a>
		</div>
		
		<div class="line">
			<label class="title">제목</label>
				<span class="content"><input type="text" size="50" name="subject"/></span>
		</div>	

		<div class="line" style="height:230px;">
			<label class="title" style="height:230px;">내용</label>
			<span class="content" style="height:230px;">
				<textarea  name="content" style="height:230px"></textarea>		
			<script >
			CKEDITOR.replace('content');
			CKEDITOR.editorConfig(config){
				config.width=300;
			};
		</script>
			</span>
		</div>	
 

		
		<div class="line" style="width:598px; border-width:2px; text-align:center;">
			<input type="submit" value="글쓰기"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="location.href='${root}/marketBoard/enterBoard.do'"/>
		</div>
	</form>
</body>
</html>