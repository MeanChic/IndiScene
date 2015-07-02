<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="artist_id"  value="E"/>
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
		var muse_name=$("#muse_name").val();
		var sendData= "artist_id=" + artist_id + "&muse_name="+muse_name;
		var url = root + "/museCreate/masterCheck.do?" + sendData;
		
		 $.ajax({
			url:url,
			type:"get",
			dataType:"text",
			success:function (data){
				if(data == "0"){
					$("input[name='create']").val("입장")
				}else{
					$("input[name='create']").val("개설하기")
				}
			}
		});
	}) 

</script>
</head>
<body>
	<input type="hidden" id="muse_name" name="muse_name" value="${muse_name}"/>
	<input type="hidden" id="artist_id" value="${artist_id}" name="artist_id"/>
	<input type="hidden" id="root" value="${root}"/>

	

</body>
</html>