<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<script src="${root }/js/jquery.MultiFile.js" type="text/javascript" ></script>
</head>
<body>
	<div id="noticeWrite">>
		<form id="NoticeWriteForm" class="form_style" method="post" >	
			<input type="hidden" name="board_num" value="${board_num}"/>
			<input type="hidden" name="group_num" value="${group_num }"/>
			<input type="hidden" name="seq_num" value="${seq_num }"/>
			<input type="hidden" name="seq_level" value="${seq_level }"/>
			<input type="hidden" name="pageNumber" value="${pageNumber}"/>
		
			<c:if test="${pageNumber ==null}">
				<c:set var="pageNumber" value="${1}"/>
			</c:if>
			<br/><br/>		
			
			<div class="line">
				<label class="title">작성자</label>
				<span class="content2">
					<input type="text" size="50" name="artist_id" value="indi"/> 
				</span>
			</div>
			
			<div class="line">
				<label class="title">제목</label>
				<span class="content2">
					<input type="text" size="50" name="subject"/>
				</span>
			</div>
			
			
			<br/>
				<label class="title">내용</label>
				<span class="content">
					<textarea id="content" rows="14" cols="58" name="content"></textarea>
				<br/><br/>
				
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
				<br/>
				<input type="button" value="글쓰기" onclick="writeOk('${root}','${pageNumber}')"/>
				<input type="reset" value="다시작성"/>
				<input type="button" value="목록보기"  onclick="list('${root}','${pageNumber}')"/>
		</form>
	</div>	
</body>
</html>