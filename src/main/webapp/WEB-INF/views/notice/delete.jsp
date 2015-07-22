<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
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
	<div id=noticeDelete>
	<form class="marketBoardDeleteForm" method="post">
		<input type="hidden" name="board_num" value="${board_num}"/>
		<input type="hidden" name="pageNumber" value="${pageNumber}"/>
		<input type="hidden" name="artist_id" value="${artist_id }"/>
	
		<div align="center">
 			<div class="marketBoardDeleteInner" id="DeleteInner" style="color:black; font-size:1.3em"  >
				<span>	사용자 확인을 위해 <br/>
				계정 비밀번호를 입력해주세요.</span><br/><br/>
			</div>
		</div>
		
		
			<div  class="DeletefontStyle DeletePassWord">
				<div style="color:#333333"> ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${artist_id }  </div>
				<div  style="color:#4C4C4C font-size:1.3em;">Password&nbsp;:&nbsp;
				<input type="password" name="password" size="20" maxlength="20"/>
				</div>
			</div>
			<br/>
			<div align="center" class="DeleteListPaddingLeft">
				<div >
					<a 
						href="javascript:noticeDeleteFunOk('${root}','${board_num}','${ pageNumber}')" 
						id="deleteBt" class="marketBoardDelBtn marketBoardUpDelBtn-default marketBoardUpDelBtn-sm" 
						onmouseover="DeleteBtnOver()" onmouseout="DeletBtnOut()" >Delete</a>
						
					<a href="javascript:noticeList('${root}','${pageNumber}')" 
					id="listBt" class="marketBoardListBtn marketBoardUpDelBtn-default marketBoardUpDelBtn-sm" 
					onmouseover="ListBtnOver()" onmouseout="ListBtnOut()">List</a>
				</div>

			</div>
		
		</form>
	</div> 

</body>
</html>