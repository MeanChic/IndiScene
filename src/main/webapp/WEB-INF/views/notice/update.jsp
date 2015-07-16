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
	<div id="noticeUpdate">
	<form id="updateForm" method="post" >
		<input type="hidden" name="board_num" value="${notice.board_num}"/>
		<input type="hidden" name="pageNumber" value="${pageNumber}"/>
		
		<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
				
		</div>
		
		<div class="line">
			<label class="title">제목</label>
				<span class="content"><input type="text" size="50" name="subject"  value="${notice.subject}"/></span>
		</div>
	
		
			<label class="title">내용</label>
			<span class="content">
				<textarea id="content" rows="14" cols="58" name="content">${notice.content}</textarea><br/><br/>
			
	 		<script>
			var folderName='${pageContext.request.servletPath }';
			folderName=folderName.split("views/");
			folderName=folderName[1].split("/");
			//var id=document.getElementById(folderName);
			//id.value=folderName[0]; //멀티파일폴더 만들때
			$("#folderName").val(folderName[0]);
			//alert(folderName[0])
			 CKEDITOR.replace( 'content',
					 {///IndiScene_basic/src/main/webapp/resources/ckfinder
					 	filebrowserUploadUrl: "${root}/commonIO/imageUpload.do?folderName="+folderName[0] // 이미지 업로드를 처리 할 경로 설정.
					 });
 			
			</script>
			</span>

		<div class="line" style="width:598px; border-width:2px; text-align:center;">
			<input type="button" value="글수정" onclick="updateFunOk('${root}','${notice.board_num }','${pageNumber }')"/>
			<input type="button" value="취소" onclick="read('${root}','${notice.board_num }','${pageNumber }')"/>
		
<%-- 		<input type="button" value="목록보기" onclick="location.href='${root}/notice/list.do?pageNumber=${pageNumber}'">--%>		
		</div>
	</form>
	</div>
</body>
</html>
