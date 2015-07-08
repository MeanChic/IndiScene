<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${board_num == null}">
		<c:set var="board_num" value="${0}"/>
		<c:set var="group_num" value="${1}"/>
		<c:set var="seq_num" value="${0}"/>
		<c:set var="seq_level" value="${0}"/>
	</c:if>
	
		"board_num" , ${board_num}
		"group_num" , ${group_num}
		"seq_num" , ${seq_num}
		"seq_level" , ${seq_level}
	
	<form action="${root}/uploadBoard/write.do"  method="post" enctype="multipart/form-data">	
		<input type="hidden" value="${artist_id}" name="artist_id"/>
		<input type="hidden" value="${board_num}" name="board_num"/>
		<input type="hidden" value="${group_num}" name="group_num"/>
		<input type="hidden" value="${seq_num}" name="seq_num"/>
		<input type="hidden" value="${seq_level}" name="seq_level"/>
		
		<span>제목</span><input id="subject" name="subject" type="text"/> <br/><br/>
		<span>일시</span>
		<span>커버사진</span><input type="file" name="coverImage"/><span>음악파일</span><input type="file" name="musicFile"/><span>녹음파일</span><a href="javascript:record('${artist_id}','${root}')" id="recordButton"><img/></a><br/><br/>
		<span>내용</span><textarea rows="20" cols="100" name="content" id="content"></textarea><br/><br/>
		<br/><br/>
		
		<div>
			<input type="submit" value="글쓰기"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="location.href='${root}/fileBoard/list.do'"/>
		</div>
	</form>
</body>
</html>