<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
</head>
<body>
	
<form ><!-- onsubmit="return checkForm(this)" --><%-- class="form_style"  action="${root}/freeBoard/write.do"  method="post" --%> 
		<input type="hidden" name="board_num" value="${board_num}"/>
		<input type="hidden" name="group_num" value="${group_num }"/>
		<input type="hidden" name="seq_num" value="${seq_num }"/>
		<input type="hidden" name="seq_level" value="${seq_level }"/>
		<input type="hidden" name="page_num" value="${page_num}"/>
		<%-- <input type="hidden" name="artist_id" value="${artist_id}"/> --%>
			
		
				<a href="${root}/freeBoard/list.do">글목록</a>
	
		<br/><br/>

		
		<div class="line">
			<label class="title">제목</label>
			<span class="content"><input type="text" size="50" name="subject"/></span>
		
		</div>
		<div class="line">
			<label class="subject">작성자</label>
				<span class="content">
				<input type="text" size="50" name="artist_id" value="indi" />
				</span>
		</div>	
		<br/>
			<label class="title" style="height:230px;">내용</label>
			<textarea rows="14" cols="58" name="content"></textarea>
			<br/>
			
	
			<br/>
			<input type="button" value="글쓰기" onclick="writeOk('${root}')"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="location.href='${root}/freeBoard/list.do'"/>
		
		
	</form>
</body>
</html>