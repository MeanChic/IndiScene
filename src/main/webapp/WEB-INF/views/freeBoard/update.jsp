<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div id="freeBoardUpdate">
	<h3>FreeBoard Update</h3>
	<form id="updateForm" method="post" action="javascript:updateFunOk('${root}','${freeBoard.board_num}','${pageNumber }')">
		<input type="hidden" name="board_num" value="${board_num}"/>
		<input type="hidden" name="pageNumber" value="${pageNumber}"/>
		<div class="marketBoardX-location02 marketBoardInterval03">
			<a class="marketBoardAttribute01 btn btn-default" href="javascript:FreeBoardList('${root}','${pageNumber}')">List</a>
		</div>
		<div class="form-controlMarket">
			<label class="label-color">Subject</label>
			<div class="form-inlineblock">
				<input class="form-controller320" type="text" size="50" name="subject" value="${freeBoard.subject}"/>
			</div>
		</div>	
		<div class="form-controlMarket">
			<label class="label-color">Writer</label>
			<div class="form-inlineblock">
				<input class="form-controller320" type="text" size="50" name="subject" value="${freeBoard.artist_id}"/>
			</div>
		</div>			
		<div class="form-controlMarket" >
			<label class="label-color marketBoardY-location01" >Contents</label>
			<div class="form-inlineblock marketBoardSize80">
				<textarea name="content">${freeBoard.content }</textarea>		
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
			</div>
		</div>
		<div class="form-controlMarket" style= text-align:center;>
			<div class="marketBoardInterval04">
				<input class="btn btn-default" type="button" value="Modify" onclick="freeBoardUpdateFunOk('${root}','${freeBoard.board_num}','${pageNumber }')"/>
				<input class="btn btn-default" type="button" value="Cancel" onclick="freeBoardRead('${root}','${freeBoard.board_num}','${pageNumber}'	)"/>
			</div>
		</div>
	</form>
</div>
</body>
</html>
