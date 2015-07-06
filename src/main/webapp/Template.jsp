<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Template</title>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
<!-- 
<link rel="stylesheet" type="text/css" href="${root}/css/template01.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/template02.css"/>
-->
<link rel="stylesheet" type="text/css" href="${root}/css/template.css"/>
<style type="text/css">
#leftContents { width:180px; background-image:url("${root}/css/images/menubar.png"); }
#leftContents ul li a { background-image:url("${root}/css/images/menubar.png"); }
</style>
</head>
<body id="mainBoard">
	<div id="indiWrapper">
		<div id="head">
			<div id="headLogo">
				<center>Indi Scene</center>
			</div>
			<div id="headLogin">
			<c:choose>
			<c:when test="${artist_id ==null}">
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
		</div>
		
		<div id="containers"><!-- BODY -->
			<div id="leftContainer"><!-- Left part -->
				<div id="leftContents">
					<ul>
						<li class="brandNewMusic"><a href="">Brand New Music</a></li>
						<li class="bestMusic"><a href="">Best Music</a></li>
						<li class="indisMusic"><a href="">Indi's Music</a></li>
						<li class="performanceInfo"><a href="">Performance Info</a></li>
						<li class="marketPlace"><a href="">Market Place</a></li>
					</ul>
				</div>
			</div>
			
			<div id="centerContainer"><!-- Center part -->
				<div class="scrollbar" style="display:block;"></div>
				<div class="tse-scroll-content">
					<div class="tse-content">
						<div id="centerContents" class="contentsNormal">
							<div id="mainPageContents" class="hasPaddingContents" style="display:block;"><span>Main</span></div>
						</div>
					</div>
				</div>
			</div>

			<div id="rightContainer"><!-- Right part -->
			</div>		
		</div>
		
		<div id="footer"><!-- FOOTER -->
		</div>
	</div>
</body>
</html>