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
		var muse_name=$("#muse_name").val();
		var sendData= "artist_id=" + artist_id + "&muse_name="+muse_name;
		var url = root + "/museCreate/masterCheck.do?" + sendData;
		
		 $.ajax({
			url:url,
			type:"get",
			dataType:"text",
			success:function (data){
				if(data == "0"){
					$("#master").text("회원보기");
					$("#master").attr("href","javascript:membermuse('"+muse_name+"','0')"/* root+"/museCreate/museMember.do?muse_name="+muse_name+"&check=0" */);
				}else{
					$("#master").text("회원관리");
					$("#master").attr("href","javascript:guestmuse('"+muse_name+"')"/* root+"/museCreate/museMember.do?muse_name="+muse_name */);
					//alert(muse_name);
				}
			}
		});
	}) 
</script>
${muse_name}
	<input type="hidden" id="muse_name" name="muse_name" value="${muse_name}"/>
	<input type="hidden" id="artist_id" value="${artist_id}" name="artist_id"/>
	<input type="hidden" id="root" value="${root}"/>
	<a id="master"></a>
	
	<br/><br/>
	방명록=======================================
	<c:forEach var="guest" items="${list}">
		<div id = "${guest.guest_num}">
			<span> ${guest.artist_id}</span> <span>${guest.guest_date}</span> <br/>
			<span >${guest.muse_name}</span> , <span class="con">${guest.guest_content}</span>
		</div>
	</c:forEach>
	<a href="javascript:guestboardmuse('${muse_name}')<%-- ${root}/museGuest/guest.do?muse_name=${muse_name} --%>">더보기</a>
	<br/><br/>
	게시판=======================================
	<c:forEach var="board" items="${boardList}">
		<div id = "${board.board_num}">
			<span> ${board.artist_id}</span> <span>${board.register_date}</span> <br/>
			<span >${board.muse_name}</span> , <a href="javascript:museRead('${root}','${board.board_num}','1','${muse_name}')"><span class="con">${board.subject}</span></a>
		</div>
	</c:forEach>
	<a href="javascript:museList('${root}','1','${muse_name}')">더보기</a>
	<br/><br/>
</body>
</html>
