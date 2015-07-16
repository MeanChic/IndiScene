<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Market board update</title>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<script src="${root }/resources/ckEditor/ckeditor.js"></script>
<script src="${root }/js/jquery.js" type="text/javascript" ></script>
<script src="${root }/js/jquery.MultiFile.js" type="text/javascript" ></script>
</head>
<body>
<div id="marketBoardUpdate">
	<h3>Market Board Update</h3>
	<form id="marketBoardUpdateForm" action="javascript:marketBoardUpdateOk()" method="post" >
		<input type="hidden" name="board_num" value="${board.board_num }"/>
		<input type="hidden" name="pageNumber" value="${pageNumber }"/>
		<div class="marketBoardX-location02">
			<a class="marketBoardAttribute01 btn btn-default" href="javascript:enterMarketBoard('${root}','${pageNumber}')">List</a>
		</div>
		<div class="form-controlMarket">
			<label class="subject label-color">Writer</label>
			<div class="form-inlineblock">
				<input class="form-controller320" type="text" name="artist_id" value="${board.artist_id }" disabled="disabled" />
			</div>
		</div>
		<div class="form-controlMarket">
			<label class="subject label-color">Subject</label>
			<div class="form-inlineblock">
				<input class="form-controller320" type="text" size="50" name="subject"  value="${board.subject }"/>
			</div>
		</div>
		<div class="form-controlMarket" >
			<label class="label-color marketBoardY-location01" >Contents</label>
			<div class="form-inlineblock marketBoardSize80">
				<textarea name="content">${board.content }</textarea>		
				<script >
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
		<div class="form-controlMarket">
			<label class="label-color marketBoardY-location01">File</label>
			<div class="form-inlineblock">
				<input class="form-controller320" type="file" name="file[]" multiple>
				<p>${board.file_name}</p>
			</div>
		</div>	
		<div class="form-controlMarket" style= text-align:center;>
			<div class="marketBoardInterval04">
				<input class="btn btn-default" type="submit" value="Modify"/>
				<input class="btn btn-default" type="reset" value="Reset"/>
			</div>
		</div>
	</form>
</div>
</body>
</html>