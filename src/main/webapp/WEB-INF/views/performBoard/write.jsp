<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:set var="artist_id"  value="indiScene"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript">
	function checkForm(perform){
		//alert("OK");
		$("input[name='d_day']").val($("select[name='yy']").val()+","+$("select[name='mm']").val()+","+$("select[name='dd']").val()+","+$("select[name='hh']").val());
		alert($("input[name='d_day']").val());
		
	}
</script>
</head>
<body>
		"board_num" , ${board_num}
		"group_num" , ${group_num}
		"seq_num" , ${seq_num}
		"seq_level" , ${seq_level}
		
	<form action="${root}/performBoard/write.do"  method="post" onsubmit="return checkForm(this)" enctype="multipart/form-data">	
		<input type="hidden" value="${artist_id}" name="artist_id"/>
		<input type="hidden" value="${board_num}" name="board_num"/>
		<input type="hidden" value="${group_num}" name="group_num"/>
		<input type="hidden" value="${seq_num}" name="seq_num"/>
		<input type="hidden" value="${seq_level}" name="seq_level"/>
		<input type="hidden" name="d_day"/>
		
		<span>제목</span><input id="subject" name="subject" type="text"/> <br/><br/>
		<span>내용</span><textarea rows="20" cols="100" name="conetent" id="content"></textarea><br/><br/>
		<span>일시</span>
		<select name="yy">
			<c:forEach var="i" begin="2015" end="2030"> 
				<option>${i}</option>
			</c:forEach>
		</select>
		년
		<select name="mm">
			<c:forEach var="i" begin="1" end="12"> 
				<option>${i}</option>
			</c:forEach>
		</select>
		월
		<select name="dd">
			<c:forEach var="i" begin="1" end="31"> 
				<option>${i}</option>
			</c:forEach>
		</select>
		일
		<select name="hh">
			<c:forEach var="i" begin="00" end="24"> 
				<option>${i}</option>
			</c:forEach>
		</select>
		시
		
		<br/><br/>
		
		주소<input type="text" name="address"/> <button>우편번호</button><br/></br>
		<input type="text" name="address1"/><br/><br/>
		
		파일<input type="file" name="file" >
		
		<div>
			<input type="submit" value="글쓰기"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="location.href='${root}/fileBoard/list.do'"/>
		</div>
	
	</form>
	
</body>
</html>