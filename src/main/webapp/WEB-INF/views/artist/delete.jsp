<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<script type="text/javascript" src="${root}/js/artist.js"></script>
</head>
<body>
	<div id="SecessionForm" style="background-color:white;">
	<h2 >회원탈퇴</h2>
		<form class="controlArtistForm" action="${root }/artist/delete.do" method="post" onsubmit="return deleteCheck(this)">
			<br/><br/>
		<!-- 	<div id="secsseionForm">
			<label>** 회원 신청에 앞서 아래의 사항을 반드시 확인하시기 바랍니다 **</label>
			<br/>
			<label>1.회원탈퇴 시 회원님의 소중한 개인정보 및 이용정보가<br/> &nbsp;&nbsp;&nbsp;영구삭제되어 복구가 불가능합니다.</label>
			<br/>
			<label>2.IndiScene아이디로 사용하셨던 서비스의 이용이 <br/>&nbsp;&nbsp;&nbsp;불가능하게 됩니다.</label>
			</div>
		 -->
		 <!-- 회원탈퇴 창 -->
		 <div id="secsseionForm">
		 	회원탈퇴 신청에 앞서 아래의 사항을 반드시 확인하시기 바랍니다.
		 </div>
		 <div class="line hLine608"></div>
		 <div class="ruleBox basic"> 
		 	<div class="rule">1. 회원탈퇴 시 회원님의 소중한 개인정보 및 이용정보가 영구 삭제되어 복구가 불가능합니다.</div> 
			<div class="rule">2.IndiScene아이디로 사용하셨던 서비스의 이용이 불가능하게 됩니다.</div> 
		 </div>	
		 <!--  -->
			<div class="form-controlArtist">	
				<label class="form-inlineblock label-color">ID</label>
			    <div class="form-inlineblock">
					<input class="form-inlineblock form-controller320" name="artist_idView"  value="${artist_id}" disabled="disabled"/>
					<input type="hidden" name="artist_id"  value="${artist_id}"/>
				</div>
			</div>
			<div class="form-controlArtist">
				<label class="form-inlineblock label-color">Password</label>
			    <div class="form-inlineblock">
					<input class="form-inlineblock form-controller320" type="password" name="artist_password"/>
				</div>
			</div>
			<div class="form-controlArtist" style="">
	    		<div class="marginCenter marketBoardX-location01">
					<input type="submit" class="btn btn-default marketBoardAttribute01" value="Byebye"/>
					<input type="button" class="btn btn-default marketBoardAttribute01" value="Cancel"/>
				</div>
			</div>
		</form>
	</div>
</body>
</html>