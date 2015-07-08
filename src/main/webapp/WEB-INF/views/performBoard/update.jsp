<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${root}/performBoard/update.do"  method="post" onsubmit="return checkForm(this)" enctype="multipart/form-data">	
		<input type="hidden" value="${artist_id}" name="artist_id"/>
		
		<span>제목</span><input id="subject" name="subject" type="text" value="${board.subject }"/> <br/><br/>
		<span>내용</span><textarea rows="20" cols="100" name="content" id="content">${board.content}</textarea><br/><br/>
		<span>일시</span>
		
		<input type="text" name="d_day1" id="datepicker">
		
		<select name="hh">
			<c:forEach var="i" begin="00" end="24"> 
				<option>${i}</option>
			</c:forEach>
		</select>
		
		
		<br/><br/>
		
		주소<input type="text" name="zipcode" value="${board.zipcode }"/> <button>우편번호</button><br/></br>
		<input type="text" name="address" value="${board.address}"/><br/><br/>
		파일<input type="file" name="file1" id="file1">
		<div id="hidd" style="display:none">
			<input type="file" name="file2" id="file2">
			<input type="file" name="file3" id="file3">
			<input type="file" name="file4" id="file4">
			<input type="file" name="file5" id="file5">
			<input type="file" name="file6" id="file6">
			<input type="file" name="file7" id="file7">
			<input type="file" name="file8" id="file8">
			<input type="file" name="file9" id="file9">
			<input type="file" name="file10" id="file10">
		</div>
		<div>
			<input type="submit" value="글쓰기"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="location.href='${root}/performBoard/list.do'"/>
		</div>
		
		<output id="result"></output>
		
		<div id="fileList"></div>
	</form>
</body>
</html>