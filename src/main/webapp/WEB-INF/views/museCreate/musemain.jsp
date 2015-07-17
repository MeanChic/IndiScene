<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%-- <c:set var="artist_id"  value="indi"/> --%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="${root}/css/jquery-ui.css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
</head>
<body>
<script type="text/javascript">
$(function(){
	
	var root = $("#root").val();
	var artist_id=$("input[name='artist_id']").val();
	var sendData= "artist_id=" + artist_id;
	var url = root + "/museCreate/museCheck.do?" + sendData;
	var muse_name;
	 $.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function (data){
			if(data == "0"){
				$("input[name='create']").val("개설하기")
				
			}else{
				$("input[name='create']").val("입장")
				$("input[name='muse_name']").val(data);	
				muse_name = $("input[name='muse_name']").val();	
			}
		}
	});
	 
	 $("input[name='create']").click(function(){
		 //alert(muse_name);
		 
		 if($(this).val()=="입장"){
			// location.href=root + "/museCreate/goin.do?muse_name="+muse_name;
			goinmuse(muse_name);
			//goinmuse
		 }else{
			//location.href=root + "/museCreate/logup.do";
			logupmuse();
		 }
	}); 
});
</script>
	<input type="hidden" name="artist_id" value="${artist_id}"/>
	<input type="hidden" id="root" value="${root}"/>
	<input type="hidden" name="muse_name"/>
	<input type="button" name="create"/>

	<br/>===============인기있는 MUSE=============<br/>
	<div id="best">
	<c:forEach var="best" items="${bestMuse}">
	<div class="${best.MUSE_NAME}">
		<img src="${best.MUSE_FILEPATH }" style="width:100px; height:100px"/>${best.ARTIST_ID }${best.MUSE_NAME} ${best.MUSE_COMMENT} ${best.MUSE_DATE} ${best.MUSE_YN }
		<c:if test="${best.MUSE_YN == 'n'}"><input type="button" value="대기중/신청취소" onclick="cancle('${artist_id}','${best.MUSE_NAME}')"/></c:if>
		<c:if test="${best.MUSE_YN == 'y'}"><a <%-- href="${root}/museCreate/goin.do?muse_name=${best.MUSE_NAME} --%>href="javascript:goinmuse('${best.MUSE_NAME}')"><input type="button" value="입장" /></a></c:if> 
		<c:if test="${best.MUSE_YN == '0'}"><input type="button" value="가입신청" onclick="signup('${artist_id}','${best.MUSE_NAME}')"/></c:if><br/>
	</div>
	</c:forEach>
	</div>
	==============내가 가입되어 있는 MUSE==============<br/>
	<div id="my">
	<c:forEach var="my" items="${myMuse}">
		<div class="${my.MUSE_NAME}">
		
		<img src="${my.MUSE_FILEPATH }" style="width:100px; height:100px"/>${my.MUSE_NAME} ${my.MUSE_COMMENT} ${my.MUSE_DATE} 
		<c:if test="${my.MUSE_YN == 'n'}"><input type="button" value="대기중/신청취소" onclick="cancle('${artist_id}','${my.MUSE_NAME}')"/></c:if>
		<c:if test="${my.MUSE_YN == 'y'}"><a href="javascript:goinmuse('${my.MUSE_NAME}')"<%-- href="${root}/museCreate/goin.do?muse_name=${my.MUSE_NAME}" --%>><input type="button" value="입장"/></a></c:if> <br/>
		</div>
	</c:forEach>
	</div>
	===============모든 뮤즈=============<br/>
	<div id="all">
	<c:forEach var="all" items="${allMuse}">
	<div class="${all.muse_name}">
		<img src="${all.muse_filepath }" style="width:100px; height:100px"/>${all.muse_name} ${all.muse_comment} ${all.muse_date} 
		<input type="button" value="가입신청" onclick="signup('${artist_id}','${all.muse_name}')"/><br/>
	</div>
	</c:forEach>
	</div>
</body>
</html>
