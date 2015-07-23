<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div id="performBoardDelete">
		<form method="post" class="marketBoardDeleteForm" id="marketBoardDeleteForm" >
			<input type="hidden" name="board_num" value="${board_num}"/>
			<input type="hidden" name="pageNumber" value="${pageNumber}"/>
			<input type="hidden" name="artist_id" value="${artist_id }"/>
			
			<div align="center">
				<div class="performBoardDeleteInner" id="DeleteInner">
					<span> 사용자 확인을 위해 <br/> 계정 비밀번호 입력해주세요.
					</span><br />
					<br/>
				</div>
			</div>
			
			<div class="DeletefontStyle DeletePassWord" >
					<span>ID</span>
					<span id="idMarginLeft">:</span>
					<span  id="artist_id">${artist_id }</span><br/>
					<span >Password</span>
					<span id="pwMarginLeft">:</span>
					<input id="inputPw" type="password" name="password"size="20" maxlength="20" />
			</div>
			<br/>
			<div align="center" class="DeleteListPaddingLeft">
				<div>
					<a href="javascript:performBoardDeleteOk('${root}','${board_num}','${ pageNumber}')"
					id="deleteBt" class="marketBoardDelBtn marketBoardUpDelBtn-default marketBoardUpDelBtn-sm"
					onmouseover="DeleteBtnOver()" onmouseout="DeletBtnOut()" >Delete</a>
						
						
					<a href="javascript:enterPerformBoard('${root}','${pageNumber}')"
					id="listBt" class="marketBoardListBtn marketBoardUpDelBtn-default marketBoardUpDelBtn-sm"
					onmouseover="ListBtnOver()" onmouseout="ListBtnOut()">List</a>
				</div>
			</div>
			<%-- 
			<tr>
				<td align="center">
					<input type="submit" value="글삭제"/>
					<input type="button" value="목록보기" onclick="javascript:enterPerformBoard('${root}','${pageNumber}')">
				</td>
			</tr> --%>
	
	</form>
	</div>
</body>
</html>