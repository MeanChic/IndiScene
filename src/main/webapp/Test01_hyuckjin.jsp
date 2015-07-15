<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<title>Momentio - single page html template by GraphBerry.com</title>
	<!-- Load google font -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link href='http://fonts.googleapis.com/css?family=Questrial' rel='stylesheet' type='text/css'>
	<!-- Load styles -->
	<link href="${root}/css/bootstrap.css" rel="stylesheet">
	<link href="${root}/css/style.css" rel="stylesheet">
	<link href="${root}/css/icons.css" rel="stylesheet">
	<link href="${root}/css/colorbox.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${root}/css/artist.css"/>
	
	<!-- Load javascrips libraries-->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="${root}/js/jquery.bxslider.js"></script>
	<script src="${root}/js/jquery.easypiechart.js"></script>
	<script src="${root}/js/jquery.colorbox.js"></script>
	<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${root}/js/artist.js"></script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	
	<!-- Load javaScript for Hyuckjin-->
	<script src="${root }/js/jquery.MultiFile.js" type="text/javascript" ></script>
	<script src="${root }/resources/ckEditor/ckeditor.js"></script>
	<script src="${root }/resources/xhr/xhr.js" type="text/javascript" ></script>
	<script src="${root }/js/reply.js" type="text/javascript" ></script> 
	<script type="text/javascript" src="${root}/js/marketBoard.js"></script>
</head>
<body>
	<input type="hidden" id="root" value="${root}"/>
	<!-- Offsite canvas navigation start -->
	<nav class="main-nav">
		<a href="#" class="close"><span class="glyphicon glyphicon-remove"></span></a>
		<img class="logo" src=" " alt="logo">
		<h2>Indi Scene</h2>
		<hr>
		<ul class="nav nav-pills nav-stacked">
			<li class="brandNewMusic"><a href="#brandNewMusic">Brand New Music</a></li>
			<li class="bestMusic"><a href="#bestMusic">Best Music</a></li>
			<li class="indisMusic"><a href="#indisMusic">Indi's Music</a></li>
			<li class="performanceInfo"><a href="#performanceInfo">Performance Info</a></li>
			<li class="marketPlace"><a href="javascript:enterMarketBoard('${root}')">Market Place</a></li>
		</ul>
		<hr>
		<ul class="nav nav-pills nav-stacked">
			<li class="myMusic"><a href="#myMusic">My Music</a></li>
			<li class="indisMuse"><a href="indisMuse">Indi's Muse</a></li>
		</ul>
		<hr>
		<ul class="nav nav-pills nav-stacked">
			<li class="notice"><a href="#notice">Notice</a></li>
			<li class="freeboard"><a href="#freeboard">Free Board</a></li>
		</ul>
	</nav>
	<!-- Offsite canvas navigation end -->
	
	<!-- Button login, update navigation start -->
	<nav class="sub-nav">
		<a href="#" class="close"><span class="glyphicon glyphicon-remove"></span></a>
		<img class="logo" src=" " alt="logo">
		<h2>Indi Scene</h2>
		<hr>
		<div id="sub-navDiv">
			<!-- sub-navTag -->
		</div>
	</nav>
	<!-- Button login, update navigation end -->
	
	<!-- Header Part start -->
	<div class="navbar navbar-head">
		<div class="navbar-inner">
			<a href="#" id="nav-expander" class="nav-expander pull-left btn btn-info btn-lg"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;Menu</a>
			<c:choose>
				<c:when test="${artist_id ==null}">
					<a href="#" id="loginButton" class="sub-expander pull-right btn btn-info btn-lg"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;Login</a>
					<a id="registerButton" class="nav-expander btn btn-info btn-lg"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;Join</a>
				</c:when>
				<c:otherwise>
					<a href="#" id="updateloginButton" class="sub-expander btn btn-info btn-lg"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;PIM</a>
					<a id="logoutButton" class="nav-expander btn btn-info btn-lg"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;Logout</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- Header Part end -->
	
	<!-- Main slider start -->
	<div id="centerContents" class="container">
		<div class="jumbotron" id="home">
			<img class="logo" src="" alt="logo">
			<h1><big>Indi Scene</big></h1>
			<hr>
			<p>We created the <span>Indi Scene</span> and now they control the world.</p>
		</div>
	</div>
	<!-- Main slider end -->
	
	<!-- Footer section start -->
	<div class="footer">
		<div class="brand"><p>Indi Scene</p></div>
		<div class="container">
			<img class="logo" src="" alt="logo">
			<a href="#" class="toTop">Back to top</a>
			<p class="copiright">&copy; Copyright 2015 <a target="_blank" href="http://grapberry.com>ref=momentio">. All Rights Reserved.</p>
		</div>
	</div>
	<!-- Footer section end -->
	<!-- Music Player start -->
	<div class="navbar navbar-default navbar-fixed-bottom">
		<div class="navbar-inner">
			<a href="">Music Player</a>
		</div>
	</div>
	<!-- Music Player end -->
	
<script type="text/javascript">
/*
 * Initialize switcher on conact section from address view to contat form.
 * We use bxSlider for this.
 * More information and documentation on http://bxslider.com/
 */
$('.contact-slider').bxSlider({
	nextSelector: '#contact-form',
	prevSelector: '#go-to-address',
	autoControls: false,
	pager: false,
	nextText: "Drop a line",
	prevText: "View address",
});

/*
 * Initialize slider for team members.
 * We use bxSlider for this.
 * More information and documentation on http://bxslider.com/
 */
$('#slider').bxSlider({
 	pagerCustom: '#person-pager',
 	autoControls: false,
 	controls: false,
});

/*
 * Initialize lightbox for images in portfolio.
 * We use ColorBox for this.
 * More information and documentation http://www.jacklmoore.com/colorbox/
 */
$(".portfolio-search").colorbox({
	rel:'portfolio-search',
	height:"75%"
});

/*
 * Show or hide offsite navigation.
 *
 */
$('#nav-expander').on('click', function(e) {
	e.preventDefault();
	$('.main-nav').toggleClass('nav-expanded');
});
$('.main-nav .close').on('click', function(e) {
	e.preventDefault();
	$('.main-nav').toggleClass('nav-expanded');
});

$('#loginButton').on('click', function(e){
	e.preventDefault();
	$('.sub-nav').toggleClass('sub-expanded');
});
$('.sub-nav .close').on('click', function(e) {
	e.preventDefault();
	$('.sub-nav').toggleClass('sub-expanded');
});

$('#updateloginButton').on('click', function(e){
	e.preventDefault();
	$('.sub-nav').toggleClass('sub-expanded');
});
$('.sub-nav .close').on('click', function(e) {
	e.preventDefault();
	$('.sub-nav').toggleClass('sub-expanded');
});
/*
 * Link navigation and webpage sections.
 *
 */
$(window).load(function() {
	function filterPath(string) {
		return string.replace(/^\//, '').replace(/(index|default).[a-zA-Z]{3,4}$/, '').replace(/\/$/, '');
	}
	$('a[href*=#]').each(function() {
		if (filterPath(location.pathname) == filterPath(this.pathname) && location.hostname == this.hostname && this.hash.replace(/#/, '')) {
			var $targetId = $(this.hash),
			$targetAnchor = $('[name=' + this.hash.slice(1) + ']');
			var $target = $targetId.length ? $targetId : $targetAnchor.length ? $targetAnchor : false;

			if ($target) {

				$(this).click(function() {

					var targetOffset = $target.offset().top - 63;
					$('html, body').animate({
						scrollTop: targetOffset
					}, 800);
					return false;
				});
			}
		}
	});
});


/*
 * Initialize main slider with BxSlider. http://bxslider.com/
 */
$('#main-slider').bxSlider({
	auto: true,
	autoControls: false,
	pager: false,
	controls: false,
	mode: 'fade',
	onSlideAfter: function($slideElement, oldIndex, newIndex){
		$slideElement.find('.mask h1').addClass("current animated  fadeInRightBig");
		$slideElement.find('.mask p').addClass("current animated  fadeInLeftBig");
	},onSlideBefore: function($slideElement, oldIndex, newIndex) {
		$slideElement.find('.mask h1').removeClass("current animated  fadeInRightBig");
		$slideElement.find('.mask p').removeClass("current animated  fadeInLeftBig");
	}
});

</script>
</body>
</html>