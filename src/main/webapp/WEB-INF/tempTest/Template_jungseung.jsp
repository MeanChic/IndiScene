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
<script type="text/javascript" src="${root}/js/artist.js"></script>
<script type="text/javascript" src="${root}/js/muse.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/template.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/artist.css"/>
</head>
<body id="mainBoard">
	<input type="hidden" id="root" value="${root }"/>
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
				</div>
			</c:when>
			<c:otherwise>
				<div id="artist">
					<button name="updatelogin">개인정보 관리</button>
					<button name="logout">로그아웃</button>
				</div>
			</c:otherwise>
		</c:choose>
			</div>
		</div>
		
		<div id="containers"><!-- BODY -->
			<div id="leftContainer"><!-- Left part -->
				<div id="leftContents01">
					<ul>
						<li class="brandNewMusic"><a href="">Brand New Music</a></li>
						<li class="bestMusic"><a>Best Music</a></li>
						<li class="indisMusic"><a>Indi's Music</a></li>
						<li class="performanceInfo"><a href="javascript:perform()">Performance Info</a></li>
						<li class="marketPlace"><a>Market Place</a></li>
					</ul>
				</div>
				<div id="leftContents02">
					<ul>
						<li class="myMusic"><a>My Music</a></li>
						<li class="indisMuse"><a href="javascript:indimuse('${artist_id}')">Indi's Muse</a></li>
					</ul>
				</div>
				<div id="leftContents03">
					<ul>
						<li class="notice"><a>Notice</a></li>
						<li class="freeboard"><a>Free Board</a></li>
					</ul>
				</div>
			</div>
			
			<div id="centerContainer"><!-- Center part -->
				<div class="scrollbar" style="display:block;"></div>
				<div class="tse-scroll-content">
					<div class="tse-content">
						<div id="centerContents" class="contentsNormal">
							<div id="mainPageContents" class="hasPaddingContents" style="display:block;"><center> Main Page </center></div>
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