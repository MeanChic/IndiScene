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
	function send(form){
		alert("OK");
		var artist_id = form.artist_id.value;
		var muse_name = form.muse_name.value;
		var guest_content = form.guest_content.value;
		var root = $("#root").val();
		
		var sendData="artist_id="+artist_id+"&muse_name="+muse_name+"&guest_content="+guest_content;
		alert(sendData);
		var url = root + "/museGuest/guest.do?";
		alert(url);
		$.ajax({
			url: url,
			type:"post",
			data:sendData,
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			dataType:"text",
			success:function(data){
				
			},
			error:function(xhr, status, error){
				//xhr:XHMLHttpRequest, status 4 20, error
				var arr=new Array();
				arr.push("xhr:" + xhr);
				arr.push("status:" + status);
				arr.push("error: "+error);
				alert(arr);
			}
		});
	
	}
</script>
</head>
<body>
	<form  onsubmit="send(this)">
	<input type="hidden" name="muse_name" value="${muse_name}">
	<input type="hidden" name="artist_id" value="${artist_id}">
	<input type="hidden" id="root" value="${root }"/>
	<textarea name="guest_content" rows="5" cols="30"></textarea>
	<input type="submit" value="전송" />
	</form>
</body>
</html>