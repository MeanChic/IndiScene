<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="artist_id"  value="C"/>
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
			 location.href=root + "/museCreate/goin.do?muse_name="+muse_name;
		 }else{
			 location.href=root + "/museCreate/logup.do";
		 }
	}); 
});

function cancle(artist_id, muse_name){
	//alert(artist_id + ",,," + muse_name);
	var root = $("#root").val();
	
	var sendData= "artist_id=" + artist_id +"&muse_name=" + muse_name;
	var url = root + "/museCreate/museCancle.do?" + sendData;
	
	 $.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function (data){
			if(data == 1){
				$("."+muse_name+"> input").val("가입하기");
				$("."+muse_name+"> input").attr("onclick","signup('"+artist_id+"','"+muse_name+"')");
				$("#my").children("."+muse_name).remove();
			}
		}
	}); 
}

function signup(artist_id, muse_name){
	//alert(artist_id + ",,," + muse_name);
	var root = $("#root").val();
	
	var sendData= "artist_id=" + artist_id +"&muse_name=" + muse_name;
	var url = root + "/museCreate/museSignup.do?" + sendData;
	
	 $.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function (data){
			$("."+muse_name+"> input").val("대기중/신청취소");
			$("."+muse_name+"> input").attr("onclick","cancle('"+artist_id+"','"+muse_name+"')");
			var a = $("#best>."+ muse_name).clone();
			$("#my").prepend(a);
		}
	}); 
}


</script>
</head>
<body>
	<input type="hidden" name="artist_id" value="${artist_id}"/>
	<input type="hidden" id="root" value="${root}"/>
	<input type="hidden" name="muse_name"/>
	<input type="button" name="create"/>

	============================<br/>
	<div id="best">
	<c:forEach var="best" items="${bestMuse}">
	<div class="${best.MUSE_NAME}">
		${best.MUSE_NAME} ${best.MUSE_COMMENT} ${best.MUSE_DATE} 
		<c:if test="${best.MUSE_YN == 'n'}"><input type="button" value="대기중/신청취소" onclick="cancle('${artist_id}','${best.MUSE_NAME}')"/></c:if>
		<c:if test="${best.MUSE_YN == 'y'}"><a href="${root}/museCreate/goin.do?muse_name=${best.MUSE_NAME}"><input type="button" value="입장" /></a></c:if> 
		<c:if test="${best.MUSE_YN == '0'}"><input type="button" value="가입신청" onclick="signup('${artist_id}','${best.MUSE_NAME}')"/></c:if><br/>
	</div>
	</c:forEach>
	</div>
	============================<br/>
	<div id="my">
	<c:forEach var="my" items="${myMuse}">
		<div class="${my.MUSE_NAME}">
		
		${my.MUSE_NAME} ${my.MUSE_COMMENT} ${my.MUSE_DATE} 
		<c:if test="${my.MUSE_YN == 'n'}"><input type="button" value="대기중/신청취소" onclick="cancle('${artist_id}','${my.MUSE_NAME}')"/></c:if>
		<c:if test="${my.MUSE_YN == 'y'}"><a href="${root}/museCreate/goin.do?muse_name=${my.MUSE_NAME}"><input type="button" value="입장"/></a></c:if> <br/>
		</div>
	</c:forEach>
	</div>
	============================<br/>
	<div id="all">
	<c:forEach var="all" items="${allMuse}">
	<div class="${all.muse_name}">
		${all.muse_name} ${all.muse_comment} ${all.muse_date} 
		<input type="button" value="가입신청" onclick="signup('${artist_id}','${all.muse_name}')"/><br/>
	</div>
	</c:forEach>
	</div>
</body>
</html>