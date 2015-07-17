<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				$("input[name='create']").val("Create")
			}else{
				$("input[name='create']").val("Admission")
				$("input[name='muse_name']").val(data);	
				muse_name = $("input[name='muse_name']").val();	
			}
		}
	});
	 
	 $("input[name='create']").click(function(){
		 //alert(muse_name);
		 if($(this).val()=="Admission"){
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
<div id="boardBasic">
	<input type="hidden" name="artist_id" value="${artist_id}"/>
	<input type="hidden" id="root" value="${root}"/>
	<input type="hidden" name="muse_name"/>
	<h3>Indi's Muse</h3>
	<div class="marketBoardX-location02 marketBoardInterval03">
		<input class="marketBoardAttribute01 btn btn-default" type="button" name="create"/>
	</div>
	<%-- ===============인기있는 MUSE============= --%>
	<div class="form-controlMarket">
		<div id="best" class="boardBlock marketBoardAttribute01 marketBoardSize495 marketBoardInterval01">
			<h4>Best Muse</h4>
			<c:forEach var="best" items="${bestMuse}">
				<div class="${best.MUSE_NAME} form-controlBoard">
					<img class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01" src="${best.MUSE_FILEPATH }" style="width:40px; height:40px"/>
					<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${best.ARTIST_ID}</label>
					<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${best.MUSE_NAME}</label>
					<label class="boardlabelBlock marketBoardSize02 label-color marketBoardAttribute01">${best.MUSE_COMMENT}</label>
						<%--${best.MUSE_DATE} --%>
					<c:if test="${best.MUSE_YN == 'n'}">
						<input class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01" type="button" value="대기중/신청취소" onclick="cancle('${artist_id}','${best.MUSE_NAME}')"/>
					</c:if>
					<c:if test="${best.MUSE_YN == 'y'}">
						<a class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01" <%-- href="${root}/museCreate/goin.do?muse_name=${best.MUSE_NAME} --%>href="javascript:goinmuse('${best.MUSE_NAME}')"><input type="button" value="입장" /></a>
					</c:if> 
					<c:if test="${best.MUSE_YN == '0'}">
						<input class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01" type="button" value="가입신청" onclick="signup('${artist_id}','${best.MUSE_NAME}')"/>
					</c:if>
				</div>
			</c:forEach>
		</div>
	<%--==============내가 가입되어 있는 MUSE============== --%>
		<div id="my" class="boardBlock marketBoardAttribute01 marketBoardSize495 marketBoardInterval01">
			<h4>My Muse</h4>
			<c:forEach var="my" items="${myMuse}">
				<div class="${my.MUSE_NAME} form-controlBoard">
					<img class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01" src="${my.MUSE_FILEPATH }" style="width:40px; height:40px"/>
					<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${my.MUSE_NAME}</label>
					<label class="boardlabelBlock marketBoardSize60 label-color marketBoardAttribute01">${my.MUSE_COMMENT}</label>
					<c:if test="${my.MUSE_YN == 'n'}">
						<input class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01" type="button" value="대기중/신청취소" onclick="cancle('${artist_id}','${my.MUSE_NAME}')"/>
					</c:if>
					<c:if test="${my.MUSE_YN == 'y'}">
						<a class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01" href="javascript:goinmuse('${my.MUSE_NAME}')"<%-- href="${root}/museCreate/goin.do?muse_name=${my.MUSE_NAME}" --%>><input type="button" value="입장"/></a>
					</c:if>
				</div>
			</c:forEach>
		</div>
	</div>
	<%--===============모든 뮤즈============= --%>
	<div id="all" class="boardBlock form-controlMarket marketBoardInterval03">
		<h4>All Muse</h4>
		<c:forEach var="all" items="${allMuse}">
			<div class="${all.muse_name} marketBoardAttribute02">
				<img class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01" src="${all.muse_filepath }" style="width:40px; height:40px"/>
				<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${all.muse_name}</label>
				<label class="boardlabelBlock marketBoardSize02 label-color marketBoardAttribute01">${all.muse_comment}</label>
				<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01"><fmt:formatDate value="${all.muse_date}" type="date"/></label> 
				<input class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01" type="button" value="가입신청" onclick="signup('${artist_id}','${all.muse_name}')"/>
			</div>
		</c:forEach>
	</div>
</div>
</body>
</html>
