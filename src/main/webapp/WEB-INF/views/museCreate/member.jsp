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
	
	
	function outMember(muse_name, artist_id){
		var root = $("#root").val();
		var sendData= "muse_name=" + muse_name + "&artist_id=" + artist_id;
		var url = root + "/museCreate/outMember.do?" + sendData;
		
		alert(url);
		 $.ajax({
			url:url,
			type:"get",
			dataType:"text",
			success:function (data){
				if(data == "0"){
					alert("탈퇴되지 않았습니다.");
				}else{
					alert(artist_id+"회원이 탈되되었습니다.");
					$("#"+artist_id).remove();
				}
			}
		}); 
	}
	
	function inviteMember(muse_name, artist_id){
		var root = $("#root").val();
		var sendData= "muse_name=" + muse_name + "&artist_id=" + artist_id;
		var url = root + "/museCreate/inviteMember.do?" + sendData;
		
		alert(url);
		 $.ajax({
			url:url,
			type:"get",
			dataType:"text",
			success:function (data){
				if(data == "0"){
					alert("muse멤버로 수락할수 없습니다.");
				}else{
					alert("muse멤버로 수락되었습니다.");
					$("#"+artist_id).find("input").eq(0).remove();
					$("#"+artist_id).find("input").eq(0).val("강제탈퇴");
					$("#join").append($("#"+artist_id));
				}
			}
		});
	}
</script>
</head>
<body>
	${muse_name}
	<input type="hidden" id="muse_name" name="muse_name" value="${muse_name}"/>
	<input type="hidden" id="artist_id" value="${artist_id}" name="artist_id"/>
	<input type="hidden" id="root" value="${root}"/>
	
	<div id="join">
	<c:forEach var="join" items="${joinMember }">
		<c:if test="${join.ARTIST_ID != artist_id}">
		<div id="${join.ARTIST_ID}" >
			${join.ARTIST_ID} , ${join.MUSE_YN}, ${join.MUSE_NAME}
			<input type="button" value="강제탈퇴" onclick="outMember('${muse_name}','${join.ARTIST_ID}')">
		</div>
		</c:if>
	</c:forEach>
	</div>
	
	<c:forEach var="non" items="${nonMember }">
		<div id="${non.ARTIST_ID}" >
			${non.ARTIST_ID} , ${non.MUSE_YN}, ${non.MUSE_NAME}
			<input type="button" value="수락" onclick="inviteMember('${muse_name}','${non.ARTIST_ID}')">
			<input type="button" value="거부" onclick="outMember('${muse_name}','${non.ARTIST_ID}')">
		</div>
	</c:forEach>
	
</body>
</html>