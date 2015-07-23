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
<div id="placeBoardWrite">
	<form id="marketBoardWriteForm" class="form_style"  action="${root }/placeBoard/write.do"  method="post" onsubmit="return checkForm(this)" enctype="multipart/form-data">	
		<input type="hidden" id="folderName" name="folderName" />
		<div class="marketBoardX-location02">
			<a class="marketBoardAttribute01 btn btn-default" href="${root}/placeBoard/enterBoard.do"">List</a>
		</div>
		<div class="form-controlMarket">
			<label class="subject label-color">Writer</label>
			<div class="form-inlineblock">
				<input class="form-controller320" type="text" size="50"  name="artist_idDis" value="${artist_id }" disabled="disabled"/>
				<input type="hidden" name="artist_id" value="${artist_id }">
			</div>
		</div>	
		<div class="form-controlMarket">
			<label class="subject label-color">Subject</label>
			<div class="form-inlineblock">
				<input class="form-controller320" type="text" size="50" name="subject"/>
			</div>
		</div>	
		<div class="form-controlMarket" >
			<label class="label-color marketBoardY-location01">Contents</label>
			<div class="form-inlineblock marketBoardSize80">
				<textarea name="content"></textarea>
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
			<label class="subject label-color">Address</label>
			<div class="form-inlineblock">
				<input type="hidden" name="zipcode" value="">
				<input class="form-inlineblock form-controller220" type="text" name="zipcode1"/>
				<input class="form-inlineblockButton form-controller220" type="button" value="Zipcode" onclick="javascript:performZipcodeCheck('${root}')">
			</div>
		</div>
		<div class="form-controlMarket">
			<label class="subject label-color">Subject</label>
			<div class="form-inlineblock">
				<input class="form-inlineblock form-controller220" type="text" name="address" value=""/>
				<input class="form-inlineblockButton form-controller220" type="button"  value="Search Map" onclick="javascript:performMap()"/>
			</div>
		</div>
		<div class="form-controlMarket" style= text-align:center;>
			<!-- <input type="submit" value="글쓰기" onclick="location.href='${root}/marketBoard/enterBoard.do'"/>  -->
			<div class="marketBoardInterval04">
				<input class="btn btn-default" type="button" value="Write" onclick="javascript:placeBoardWriteOk()">
				<input class="btn btn-default" type="reset" value="Reset"/>
			</div>
		</div>
	</form>
</div>
</body>
</html>