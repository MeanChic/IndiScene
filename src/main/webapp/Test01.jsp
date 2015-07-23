<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<title>Indi Scene - Music & Collaboration</title>
	<!-- Load google font -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link href='http://fonts.googleapis.com/css?family=Questrial' rel='stylesheet' type='text/css'>
	<!-- Load styles -->
	<link href="${root}/css/bootstrap.css" rel="stylesheet">
	<link href="${root}/css/style.css" rel="stylesheet">
	<link href="${root}/css/colorbox.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${root}/css/artist.css"/>
	<link rel="stylesheet" type="text/css" href="${root}/css/marketboard.css"/>
	<link href="${root}/css/marketBoard1.css" rel="stylesheet">
	<link href="${root}/css/jquery-ui.css" rel="stylesheet">
	

	<!-- Load javascrips libraries
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>-->
	<script src="${root}/js/jquery.js"></script>
	<script src="${root}/js/jquery.bxslider.js"></script>
	<script src="${root}/js/jquery.easypiechart.js"></script>
	<script src="${root}/js/jquery.colorbox.js"></script>
	<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${root}/js/artist.js"></script>
	<script type="text/javascript" src="${root}/js/uploadBoard.js"></script>
	<script type="text/javascript" src="${root}/js/webPlayer.js"></script>
	<script type="text/javascript" src="${root}/js/bootstrap.js"></script>
	<script type="text/javascript" src="${root}/js/bootstrap.min.js"></script>
	
	<!-- Load javaScript for Hyuckjin-->
	<script src="${root }/js/jquery.MultiFile.js" type="text/javascript" ></script>
	<script src="${root }/resources/ckEditor/ckeditor.js"></script>
	<script src="${root }/resources/xhr/xhr.js" type="text/javascript" ></script>
	<script src="${root }/js/reply.js" type="text/javascript" ></script> 
	
	<!-- Load javaScript for AJAX -->
	<script type="text/javascript" src="${root}/js/marketBoard.js"></script>
	<script type="text/javascript" src="${root}/js/notice.js"></script>
	<script type="text/javascript" src="${root}/js/freeBoard.js"></script>
	<script type="text/javascript" src="${root}/js/performBoard.js"></script>
	<script type="text/javascript" src="${root}/js/muse.js"></script>
	<script type="text/javascript" src="${root}/js/museGuest.js"></script>
	<script type="text/javascript" src="${root}/js/placeBoard.js"></script>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=35bf5934991976c7b6f95f227c76624f&libraries=services"></script>
	<script type="text/javascript" src="${root}/js/search.js"></script>
	<script type="text/javascript" src="${root}/js/myMusic.js"></script>
	<script type="text/javascript" src="${root}/js/museBoard.js"></script>
</head>
<body>
	<input type="hidden" id="root" value="${root}"/>
	<!-- Offsite canvas navigation start -->
	<nav class="main-nav">
		<a href="#" class="close"><span class="glyphicon glyphicon-remove"></span></a>
		<img class="logo" src="${root}/css/images/logo-img.png" alt="logo">
		<h2>Indi Scene</h2>
		<hr>
		<ul class="nav nav-pills nav-stacked">
			<li class="brandNewMusic"><a href="javascript:brandNewList('${root}','1')">Brand New Music</a></li>
			<li class="bestMusic"><a href="javascript:bestList('${root}','1')">Best Music</a></li>
			<li class="indisMusic"><a href="javascript:uploadList('${root}',1)">Indi's Music</a></li>
			<li class="performanceInfo"><a href="javascript:performPlace('${root}')">Performance Info</a></li>
			<li class="marketPlace"><a href="javascript:enterMarketBoard('${root }')">Market Place</a></li>
		</ul>
		<hr>
		<ul class="nav nav-pills nav-stacked">
			<li class="myMusic"><a href="javascript:myUploadMusic('${root}','${artist_id}','1')">My Music</a></li>
			<li class="indisMuse"><a href="javascript:indimuse('${artist_id}')">Indi's Muse</a></li>
		</ul>
		<hr>
		<ul class="nav nav-pills nav-stacked">
			<li class="notice"><a href="javascript:noticeList('${root }','1')">Notice</a></li>
			<li class="freeboard"><a href="javascript:freeBoardList('${root }','1')">Free Board</a></li>
		</ul>
	</nav>
	<!-- Offsite canvas navigation end -->
	
	<!-- Button login, update navigation start -->
	<nav class="sub-nav">
		<a href="#" class="close"><span class="glyphicon glyphicon-remove"></span></a>
		<img class="logo" src="${root}/css/images/logo-img.png" alt="logo">
		<h2>Indi Scene</h2>
		<hr>
		<div id="sub-navDiv">
			<!-- sub-navTag -->
		</div>
	</nav>
	<!-- Button login, update navigation end -->
	
	<!-- Music player list start -->	
	<nav class="music-nav">
		<a href="#" class="close"><span class="glyphicon glyphicon-remove"></span></a>
		<h2>Music player List</h2>
		<hr>
		<div id="audioListDiv" class="audioList" style="display:none">
			<a class="musicClick" style="cursor:pointer;">
				<span class="musicSubject"></span>
				<span class="artistName"></span>
				<input type="hidden" value="" class="sourcePath"/>
				<input type="hidden" value="" class="musicBoardNum"/>
			</a>
			<a class="listDelete" style="cursor:pointer;"><span class="glyphicon glyphicon-remove"></span></a>
			<hr>
		</div>
		<div id="audioList">
				<!-- music-nav -->
		</div>
	</nav>
	<script type="text/javascript">
		getMusicList('${root}','${artist_id}');
	</script>
	<!-- Music player list end -->
	
	<!-- Header Part start -->
	<div class="navbar navbar-head">
		<div class="navbar-inner">
			<img class="logo logoDouplicate" src="${root}/css/images/logo-full.png" alt="logo">
			

			<a href="#" id="nav-expander" class="nav-expander pull-left btn btn-info btn-lg"><span class="glyphicon glyphicon-list" ></span>&nbsp;&nbsp;Menu</a>
		
			<c:choose>
				<c:when test="${artist_id ==null}">
					<a href="#" id="loginButton" class="sub-expander pull-right btn btn-info btn-lg"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;Login</a>
					<a id="registerButton" class="sub-expander btn btn-info btn-lg"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;Join</a>

				</c:when>
				<c:otherwise>
					<a href="#" id="updateloginButton" class="sub-expander btn btn-info btn-lg"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;PIM</a>
					<a id="logoutButton" class="sub-expander btn btn-info btn-lg"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;Logout</a>
				</c:otherwise>
			</c:choose>
		
			
			
		<!-- 	<script type="text/javascript">
						function LoginId(artist_id){
							alert("로그인후 사용해주세요");
							}
					</script> -->	
			<!-- 메인검색창 -->
			<div id="MainSearchBox" class="pull-right marketBoardAttribute01 marketBoardX-location03 instants03">
				<form class="instants02" name="searchForm" method="get" action="javascript:searchMain('${root}','1');">
			<!--   페이징작업을위한 GET방식 -->     
				<input type="hidden" name="searchflag" value="true"/> <!-- 검색글 요청시 플래그값을 true로 넘김 -->
	                <input class="form-controller220 instants02" type="text"  id="MainSearchWord" name="searchWord">
	                <input class=" btn btn-info btn-lg instants02 instants04" name="searchSubmit" type="submit" value="Search"/>
	   			</form>
	        </div>
			
		</div>
	</div>
	<!-- Header Part end -->
	
	<!-- Main slider start -->
	<div id="centerContents" class="container">
		<div class="jumbotron" id="homeTag">
			<img class="logo" src="${root}/css/images/logo-full.png" alt="logo">
			<hr>
			<p>Your Music Career Start Here. Music & Collaboration <span>Indi Scene</span> is for You.</p>
		</div>
	</div>
	<!-- Main slider end -->
	
	<!-- Footer section start -->
	<div class="footer">
		<div class="brand"><p>Indi Scene</p></div>
		<div class="container">
			<a href="${root}/Test01.jsp"><img class="logo" src="${root}/css/images/logo-img.png" alt="logo"></a>
			<a href="" class="toTop">Back to top</a>
			<p class="copiright">&copy; Copyright 2015 <a href=""></a>. All Rights Reserved.</p>
		</div>
	</div>
	<!-- Footer section end -->

	<!-- Music Player start -->
	<div class="navbar navbar-default navbar-fixed-bottom">
		<a href="" id="music-expander" class="music-expander pull-right btn"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;List</a>
		<a class="music-player pull-right btn"><span class="glyphicon glyphicon-volume-up"></span>&nbsp;&nbsp;Volume</a>
		<div>
			<a id="prev" class="music-player pull-left btn"><span class="glyphicon glyphicon-backward"></span></a>
			<a id="play" class="music-player pull-left btn"><span class="glyphicon glyphicon-play"></span></a>
			<a id="next" class="music-player pull-left btn"><span class="glyphicon glyphicon-forward"></span></a>
		</div>
		<div class="progress Instant01">
			<div id="musicBar" class="progress-bar music-player Instant02" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
		</div>
			<!-- 
			<input type="image" id="prev" src="${root}/resources/backward.png" alt="prev" style="width:4%;height:4%;min-height:4%;min-width:4%;"/>
			<input type="image" id="play" src="${root}/resources/play.png" alt="Play/Pause" style="width:4%;height:4%;min-height:4%;min-width:4%;"/>
			<input type="image" id="next" src="${root}/resources/forward.png" alt="next" style="width:4%;height:4%;min-height:4%;min-width:4%;"/>
			<input id="musicBar" type="range" max="" min="0" step="1" value="0" style="width: 60%; margin-top: -3%; margin-left: 13%;"/>
			<input type="image" id="volumeBtn" alt="볼륨" src="${root}/resources/speaker.png" style="width:2%;height:2%;float:right;margin-top:-1.6%;margin-right:25%;min-height:2%;min-width:2%;"/>
			<input id="volumeBar" type="range" max="100" min="0" step="1" value="50" style="display:none;width:5%;float:right; margin-right:-7%; margin-top:-1.3%;position:relative;"/>
			 -->
	</div>
	<!-- Music Player end -->
	
<script type="text/javascript">

/******** tootip ********/
/* Menu Bar */
$(document).ready(function(){
    $('.brandNewMusic').tooltip({title: "최신곡", placement: "bottom"}); 
    $('.bestMusic').tooltip({title: "Top100", placement: "bottom"}); 
    $('.indisMusic').tooltip({title: "음악", placement: "bottom"}); 
    $('.performanceInfo').tooltip({title: "공연/대관 정보", placement: "bottom"}); 
    $('.marketPlace').tooltip({title: "중고거래", placement: "bottom"}); 
    $('.myMusic').tooltip({title: "회원님의 indiScene활동을 살펴보세요", placement: "bottom"}); 
    $('.indisMuse').tooltip({title: "동호회활동", placement: "bottom"}); 
    $('.notice').tooltip({title: "공지사항", placement: "bottom"}); 
    $('.freeboard').tooltip({title: "자유게시판", placement: "bottom"}); 
   
});

/******** tootip End ********/
$(document).ready(function(){
	history.pushState({indiData:($("#centerContents").html())},"제목","/indiscene/Test01.jsp");//다음페이지에 히스토리 저장
	window.onpopstate=function(e){
	$("#centerContents").html(e.state.indiData);
	}
	
});
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

$("#volumeBtn").click(function(){
	$("#volumeBar").toggle({left:"5%"},1000);
});

/*
 * Show or hide offsite navigation.
 */
 /* main-Nav */
$('#nav-expander').on('click', function(e) {
	e.preventDefault();
	$('.main-nav').toggleClass('nav-expanded');
});
$('.main-nav .close').on('click', function(e) {
	e.preventDefault();
	$('.main-nav').toggleClass('nav-expanded');
});
/* Login&PIM window */
$('#loginButton').on('click', function(e){
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
/* music list */
$('#music-expander').on('click', function(e) {
	e.preventDefault();
	$('.music-nav').toggleClass('music-expanded');
});
$('.music-nav .close').on('click', function(e) {
	e.preventDefault();
	$('.music-nav').toggleClass('music-expanded');
});

/*
 *	각 게시판 들어갈때마나 메뉴바 사라지게 하기 
 */
$('.indisMusic a').on('click', function(e) {
	//e.preventDefault();
	//enterMarketBoard('${root }')
	$('.main-nav').toggleClass('nav-expanded');
});

$('.marketPlace a').on('click', function(e) {
	//e.preventDefault();
	//enterMarketBoard('${root }')
	$('.main-nav').toggleClass('nav-expanded');
});

$('.myMusic a').on('click', function(e) {
	//e.preventDefault();
	//enterMarketBoard('${root }')
	$('.main-nav').toggleClass('nav-expanded');
});

$('.indisMuse a').on('click', function(e) {
	//e.preventDefault();
	//enterMarketBoard('${root }')
	$('.main-nav').toggleClass('nav-expanded');
});

$('.notice a').on('click', function(e) {
	//e.preventDefault();
	//enterMarketBoard('${root }')
	$('.main-nav').toggleClass('nav-expanded');
});

$('.freeboard a').on('click', function(e) {
	//e.preventDefault();
	//enterMarketBoard('${root }')
	$('.main-nav').toggleClass('nav-expanded');
});

$('input[name="searchWord"]').on('click', function(e) {
	//e.preventDefault();
	//enterMarketBoard('${root }')
	$('.main-nav').removeClass('nav-expanded');
});

$('input[name="searchWord"]').on('click', function(e) {
	//e.preventDefault();
	//enterMarketBoard('${root }')
	$('.main-nav').removeClass('nav-expanded');
});

$('input[name="searchSubmit"]').on('click', function(e) {
	//e.preventDefault();
	//enterMarketBoard('${root }')
	$('.main-nav').removeClass('nav-expanded');
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
/*---------------------------  Reple.js-------------------------------------- 적용 부분  */

function writeToServer(requestRoot,board_num){
//	alert(requestRoot + "," + board_num);
	root=requestRoot;
	
	var reply_content=document.getElementById("writeReply").value;
	var artist_id=document.getElementById("writeId").value;
	var url=root+"/replyWrite.do";
	var params="board_num="+board_num+"&reply_content="+reply_content+"&artist_id="+artist_id;
	sendRequest("POST",url,writeFromServer,params);
}

function writeFromServer(){
	if(xhr.readyState==4&&xhr.status==200){
		//alert(xhr.responseText);
		writeReplyProcess(xhr.responseText);
	}
}

function writeReplyProcess(responseText){
	var result=responseText.split(",");   //배열! JSON과다름!
	var reply_num=result[0].trim();
	var artist_id=result[1].trim();  
	var reply_content=result[2].trim();
	var reply_date=result[3].trim();
	var board_num=result[4].trim();
	
//	alert(reply_num + "," + artist_id+","+reply_content+"," +reply_date +"," +board_num);
	
	document.getElementById("writeReply").value="";
	/*<div id="newReply">
	 * 	<div class="replyDiv" id="newReply_num77">
	 * 	</div>
	 *</div>
	 * 
	 * */
	var newReply=document.getElementById("newReply");
	
	var div=document.createElement("div");
	div.className="replyDiv";
	
	//div.id="newReply_num"+reply_num;   //새로고침 안했을때,, 비동기화 상태에서 삭제나 수정 가능하게하기위해서 id를 새로잡아줌,,
	div.id=reply_num;
	/*  //0720//  */	
	var pReply=document.createElement("p");
	pReply.className="DiscussInfo";
	var p2 = document.createElement("p");
	/*	//P태그//  */	
	
	var spanReply_num=document.createElement("span");
	//spanReply_num.className="cssreply_num";
	spanReply_num.innerHTML=reply_num + "&nbsp";
	
	var spanArtist=document.createElement("span");
	spanArtist.className="cssAritist";
	spanArtist.innerHTML=artist_id + "&nbsp";
	
	var spanReply=document.createElement("span");
	spanReply.className="cssReply";
	spanReply.innerHTML=reply_content;
	
	var spanDate=document.createElement("span");
	spanDate.className="cssDate";
	spanDate.innerHTML=reply_date;
	

	
	
	var spanUpDel=document.createElement("span");
	spanUpDel.className="cssUpDel";
	
	var aUpdate=document.createElement("a");
	//alert(root);
	aUpdate.className="cssUpDelEdit";
	aUpdate.href="javascript:upSelectToServer('"+board_num +"','" +reply_num+ "',\'" +root + "\')";
	aUpdate.innerHTML="Edit";
	
	var spanDelimiter=document.createElement("span");
	spanDelimiter.className="Delimiter";
	spanDelimiter.innerHTML="/";
	
	var aDelete=document.createElement("a");
	aDelete.className="cssUpDelDelete";
	aDelete.href="javascript:deleteToServer('"+board_num +"','" +reply_num+ "',\'" +root + "\')"; //	\' \' -> root에서 특수문자가 들어가기때문에 사용..
	aDelete.innerHTML="delete"
	
	
	newReply.appendChild(div);
	
	div.appendChild(pReply);
	pReply.appendChild(spanArtist);
	pReply.appendChild(spanDate);///// Fomatdate 
	div.appendChild(p2);

	
	p2.appendChild(spanReply);
	p2.appendChild(spanUpDel);
	spanUpDel.appendChild(aUpdate);
	spanUpDel.appendChild(spanDelimiter);
	spanUpDel.appendChild(aDelete);
	
}
</script>
</body>
</html>
