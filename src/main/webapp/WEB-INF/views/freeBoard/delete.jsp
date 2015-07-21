<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<script type="text/javascript">
	/*  list Btn*/
	function ListBtnOver() {
		$("#listBt").css("background", "#36b823");
		$("#listBt").css("color", "white");
	}function ListBtnOut() {
		$("#listBt").css("background", "white");
		$("#listBt").css("color","black");
	}function DeleteBtnClick(){
		$("#listBt").css("background","#F361A6");
	}
	/*	Delete Btn  */
	function DeleteBtnOver() {
		$("#deleteBt").css("background", "red");
		$("#deleteBt").css("color", "white");
	}function DeletBtnOut() {
		$("#deleteBt").css("background", "white");
		$("#deleteBt").css("color","black");
	}
	</script>
	<div id="freeBoardDelete">
		<%-- 	<form method="post" action="${root }/freeBoard/delete.do">--%>
		<form id="deleteForm" method="post">
			<input type="hidden" name="board_num" value="${board_num}" /> <input
				type="hidden" name="pageNumber" value="${pageNumber}" /> <input
				type="hidden" name="artist_id" value="${artist_id }" />
			<!-- 		<table border="1" width="300" cellpadding="2" cellspacing="0" align="center">
 -->
			<div align="center">
				<div class="marketBoardDeleteInner"
					style="color: black; font-size: 1.3em">
					<span> 사용자 확인을 위해 <br /> 계정 비밀번호 입력해주세요.
					</span><br />
					<br />
				</div>
			</div>

			<div class="DeletefontStyle DeletePassWord">
				<div style="color: #333333">
					ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${artist_id }
				</div>
				<div style="color: #4C4C4C font-size:1.3em;">
					Password&nbsp;:&nbsp; <input type="password" name="password"
						size="20" maxlength="20" />
				</div>
			</div>
			<br />
			<div align="center" class="DeleteListPaddingLeft">
				<div>
					<a
						href="javascript:freeBoardDeleteFunOk('${root}','${board_num}','${ pageNumber}')"
						id="deleteBt" style="font-size: 1.0em; font-family: Helvetica;"
						class="marketBoardDelBtn marketBoardUpDelBtn-default marketBoardUpDelBtn-sm"
						onmouseover="DeleteBtnOver()" onmouseout="DeletBtnOut()" onclick="DeleteBtnClick()">Delete</a>
						
						
						<a href="javascript:freeBoardList('${root}','${pageNumber}')"
						id="listBt" style="font-size: 1.0em; font-family: Helvetica;" 
						class="marketBoardListBtn marketBoardUpDelBtn-default marketBoardUpDelBtn-sm"
						onmouseover="ListBtnOver()" onmouseout="ListBtnOut()">List</a>
				</div>

			</div>

		</form>
	</div>
</body>
</html>