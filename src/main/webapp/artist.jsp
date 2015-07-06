<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Artist</title>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/artist.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/artist.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
</head>
<body>
	<!-- 
	<div>
		0.<a href="${root}/artist/test.do">[Test]</a><br/>
	</div>
	 -->
	<div>
		<c:choose>
			<c:when test="${artist_id ==null}">
				<b>Welcom to Indi Scene</b><br/>
				<div id="artist">
					<button name="register">회원가입</button>
					<button name="login">로그인</button>
					<script type="text/javascript">
						$(document).ready(function(){
							$("button[name='register']").click(function(){
								location.href="${root}/artist/register.do";
							})
							$("button[name='login']").click(function(){
								location.href="${root}/artist/login.do";
							})
						})
					</script>
				</div>
			</c:when>
			<c:otherwise>
				<b>Welcom to Indi Scene</b><br/>
				<div id="artist">
					<button name="update">개인정보 관리</button>
					<button name="logout">로그아웃</button>
					<script type="text/javascript">
							$(document).ready(function(){
								$("button[name='update']").click(function(){
									location.href="${root}/artist/updatelogin.do";
								})
								$("button[name='logout']").click(function(){
									location.href="${root}/artist/logout.do";
								})
							})
					</script>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>

