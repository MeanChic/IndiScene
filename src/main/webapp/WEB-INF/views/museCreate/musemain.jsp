<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="artist_id"  value="A"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="${root}/css/jquery-ui.css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	
	var root = $("#root").val();
	var artist_id=$("input[name='artist_id']").val();
	var sendData= "artist_id=" + artist_id;
	var url = root + "/museCreate/museCheck.do?" + sendData;
	
	 $.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function (data){
			if(data == "0"){
				$("input[name='create']").val("입장")
			}else{
				$("input[name='create']").val("가입하기")
			}
		}
	});
	 
	 $("input[name='create']").click(function(){
		 if($(this).val()=="입장"){
			 location.href="";
		 }else{
			 location.href=root + "/museCreate/logup.do";
		 }
	 });
});
</script>
</head>
<body>
	<input type="hidden" name="artist_id" value="${artist_id}"/>
	<input type="hidden" id="root" value="${root}"/>
	<input type="button" name="create"/>
	
	<!-- mav.addObject("bestMuse", bestMuse);
	mav.addObject("myMuse", myMuse);
	mav.addObject("allMuse", allMuse); -->
	

	============================<br/>
	<c:forEach var="best" items="${bestMuse}">
		${best.muse_name} ${best.muse_comment} ${muse.date} <br/>
	</c:forEach>
	============================<br/>
	<c:forEach var="my" items="${myMuse}">
		${my.MUSE_NAME} ${my.MUSE_COMMENT} ${my.DATE} <c:if test="${my.MUSE_YN == 'n'}"><input type="button" value="대기중" disabled="disabled"/></c:if>
		<c:if test="${my.MUSE_YN == 'y'}"><input type="button" value="입장" /></c:if> <br/>
	</c:forEach>
	============================<br/>
	<c:forEach var="all" items="${allMuse}">
		${all.muse_name} ${all.muse_comment} ${all.date} <input type="button" value="가입신청"/><br/>
	</c:forEach>
	
</body>
</html>