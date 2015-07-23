<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<%-- <c:set var="artist_id" value="indi"/> --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="museBoardRead">
<div class="marketBoardX-location02">
		<a class="marketBoardAttribute01 btn btn-default" href="javascript:oneMusicStorage('${root}','${artist_id}','${boardDto.board_num}')">Put In</a>
		<a class="marketBoardAttribute01 btn btn-default" href="javascript:museList('${root}','${pageNumber}','${muse_name}')">List</a>
	</div>
	<div class="form-controlMarket instants09">
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Like</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="${boardDto.board_like}" disabled="disabled" />
		</div>
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Views</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="${boardDto.count}" disabled="disabled" />
		</div>
	</div>
	<div class="form-controlMarket">
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Writer</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="marketBoardSize25 form-controller220" type="text" value="${boardDto.artist_id}" disabled="disabled" />
		</div>
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Date</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="<fmt:formatDate value="${boardDto.register_date}" type='date'/>" disabled="disabled"/>
		</div>
	</div>
	<div class="form-controlMarket" >
		<div class="marketBoardSize16 marketBoardAttribute01 marketBoardY-location01">
			<label class="marketBoardAttribute02 label-color">Contents</label>
		</div>
		<div class="marketBoardSize77 marketBoardAttribute01 marketBoardY-location01">
			<div id="marketReadContents" class="marketBoardTextareaSize200 marketBoardAttribute02">
				<div class="">
					<img class="instants05" alt="" src="${root}${boardDto.image_path}">
					<audio class="instants05 instants06" controls src="${root}${boardDto.file_path}"></audio>
				</div>
				${boardDto.content}
			</div>		
		</div>
	</div>
	<div class="form-controlMarket" style= text-align:center;>
		<div class="marketBoardInterval04">
			<a class="btn btn-info btn-lg" href="javascript:museCollabo('${root}','${board_num}','${pageNumber}','${muse_name}')"><span class="glyphicon glyphicon-duplicate"></span>&nbsp;&nbsp;Collaboration</a>
		</div>
	</div>
	<c:if test="${boardDto.artist_id == artist_id }">
		<div class="form-controlMarket" style= text-align:center;>
			<div class="marketBoardInterval04">
				<input class="btn btn-default" type="button" value="Upload to Indi'sMusic" onclick="museToUpload('${root}','${board_num}','${artist_id}','${muse_name}')"/>
				<input class="btn btn-default" type="button" value="Modify" onclick="museUpdate('${root}','${board_num}','${pageNumber}','${muse_name}')">
				<input class="btn btn-default" type="button" value="Delete" onclick="museDelete('${root}','${board_num}','${pageNumber}','${muse_name}')">
			</div>
		</div>
	</c:if>
</div>
</body>
</html>