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
<div id="indimuseList">
	<h2>Muse : ${muse_name}</h2>
	<div class="panel-group marginLR20" role="tablist" aria-multiselectable="true">
		<div class="marketBoardAttribute01 marketBoardX-location02 marketBoardInterval02">
			<a id="master" class="marketBoardAttribute01 btn btn-default pull-right marginR5" type="button" onclick=""></a>
		</div>
	<hr><!-- --------------- 방 명 록 ---------------- -->
	<h3>방명록</h3>
		<input type="hidden" id="muse_name" name="muse_name" value="${muse_name}"/>
		<input type="hidden" id="artist_id" value="${artist_id}" name="artist_id"/>
		<input type="hidden" id="root" value="${root}"/>
		<c:forEach var="guest" items="${list}">
		<div class="marketBoardAttribute01 marketBoardX-location02 marketBoardInterval02">
			<a id="master" class="marketBoardAttribute01 btn btn-default pull-right marginR5" type="button" onclick="guestboardmuse('${muse_name}')">More</a>
		</div>
			<div id="${guest.guest_num}" class="form-controlMarket">
				<label class="marketBoardSize16 label-color marketBoardAttribute01">Writer</label>
				<div class="marketBoardSize01 marketBoardAttribute01">
					<input class="marketBoardSize25 form-controller220" type="text" value="${guest.artist_id}" disabled="disabled" />
				</div>
				<label class="marketBoardSize16 label-color marketBoardAttribute01">Date</label>
				<div class="marketBoardSize01 marketBoardAttribute01">
					<input class="form-controller220" type="text" value="<fmt:formatDate value="${guest.guest_date}" type='date'/>" disabled="disabled"/>
				</div>
			</div>
			<div class="form-controlMarket" >
				<div class="marketBoardSize16 marketBoardAttribute01 marketBoardY-location01">
					<label class="marketBoardAttribute02 label-color">Contents</label>
				</div>
				<div class="marketBoardSize77 marketBoardAttribute01 marketBoardY-location01">
					<div id="marketReadContents" class="con marketBoardTextareaSize200 marketBoardAttribute02">
						${guest.guest_content}
					</div>		
				</div>
			</div>
		</c:forEach>
	<hr><!-- --------------- 게 시 판 ---------------- -->
	<h3>게시판</h3>
		<div class="marketBoardAttribute01 marketBoardX-location02 marketBoardInterval02">
			<a id="master" class="marketBoardAttribute01 btn btn-default pull-right marginR5" type="button" onclick="museList('${root}','1','${muse_name}')">More</a>
		</div>
		<div class="form-controlBoard">
			<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Muse</label>
			<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Writer</label>
			<label class="boardlabelBlock marketBoardSize60 label-colorO marketBoardAttribute01">Subject</label>
			<label class="boardlabelBlock marketBoardSize12 label-colorO marketBoardAttribute01">Date</label>
		</div>
		<!-- Board List -->
		<c:forEach var="board" items="${boardList}">
			<div id = "${board.board_num}" class="form-controlBoard">
				<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01 marketBoardY-location02">${board.muse_name}</label>
				<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01 marketBoardY-location02">${board.artist_id}</label>
				<label class="boardlabelBlock marketBoardSize60 label-color marketBoardAttribute01 marketBoardY-location02">
					<a href="javascript:museRead('${root}','${board.board_num}','1','${muse_name}')">
						<span class="con">${board.subject}</span>
					</a>
				</label>
				<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01 marketBoardY-location02">${board.register_date}</label>
			</div>
		</c:forEach>
	</div>
</div>
</body>
</html>
