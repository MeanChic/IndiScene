<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
<%-- <script src="${root }/resources/ckEditor/ckeditor.js"></script> --%>
<script src="${root }/js/jquery.MultiFile.js" type="text/javascript" ></script>

</head>
<body>

<form id="FreeBoardWriteForm" class="form_style" method="post"> 
		<input type="hidden" name="board_num" value="${board_num}"/>
		<input type="hidden" name="group_num" value="${group_num }"/>
		<input type="hidden" name="seq_num" value="${seq_num }"/>
		<input type="hidden" name="seq_level" value="${seq_level }"/>
		<input type="hidden" name="page_num" value="${page_num}"/>
		<%-- <input type="hidden" name="artist_id" value="${artist_id}"/> --%>
			<c:if test="${page_num ==null}">
				<c:set var="page_num" value="${1}"/>
			</c:if>
		
		<br/><br/>

		
		<div class="line">
			<label class="title">제목</label>
			<span class="content2"><input type="text" size="50" name="subject"/></span>
		
		</div>
		<div class="line">
			<label class="subject">작성자</label>
				<span class="content2">
				<input type="text" size="50" name="artist_id" value="indi" />
				</span>
		</div>	
		<br/>
			<label class="title">내용</label>
			<span class="content">
				<textarea id="content" rows="14" cols="58" name="content"></textarea><br/><br/>
			
			<script>
			 CKEDITOR.replace( 'content',
					 {///IndiScene_basic/src/main/webapp/resources/ckfinder
					 	filebrowserUploadUrl: '${root}/marketBoard/imageUpload.do' // 파일 업로드를 처리 할 경로 설정.
					 });
 			
			</script>
			
				</span>
			<br/>
			
	
			<br/>
			<input type="button" value="글쓰기" onclick="writeOk('${root}','${page_num}')"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="list('${root}','${page_num}')"/>
		
		
	</form>
</body>
</html>