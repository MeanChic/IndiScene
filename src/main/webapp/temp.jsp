<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html lang="ko" xml:lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<title>소리바다</title>
	<meta name="fragment" content="!">
	<meta property="fb:app_id" content="182687168411984" />
<meta property="og:title" content="소리바다" />
<meta property="og:site_name" content="Soribada" />
<meta property="og:type" content="website" />
<meta property="og:image" content="http://image.soribada.com/image/main/icon_logo.png" />
<meta property="og:url" content="http://www.soribada.com/" />
<meta property="og:description" content="Share The Rhythm" />
<meta property="al:ios:url" content="soribada30://" />
<meta property="al:ios:app_store_id" content="346528006" />
<meta property="al:ios:app_name" content="soribada" />
<meta property="al:android:package" content="com.soribada.android" />
<meta property="al:android:url" content="soribada30://" />
<meta property="al:android:app_name" content="soribada" />
<meta property="al:web:should_fallback" content="false" />
<meta property="al:web:url" content="http://www.soribada.com/" />
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:site" content="@soribada" />
<meta name="twitter:creator" content="@soribada" />
<meta name="twitter:app:country" content="KR" />
<meta name="twitter:app:name:iphone" content="soribada" />
<meta name="twitter:app:id:iphone" content="346528006" />
<meta name="twitter:app:url:iphone" content="soribada30://" />
<meta name="twitter:app:name:ipad" content="soribada" />
<meta name="twitter:app:id:ipad" content="346528006" />
<meta name="twitter:app:url:ipad" content="soribada30://" />
<meta name="twitter:app:name:googleplay" content="soribada" />
<meta name="twitter:app:id:googleplay" content="com.soribada.android" />
<meta name="twitter:app:url:googleplay" content="soribada30://" />
	<!-- due to ie9 css selecter limit make 2 files -->
<link rel="stylesheet" href="${root}/css/template01.css">
<link rel="stylesheet" href="${root}/css/template02.css">
	<script>var CONTEXT_PATH = '';</script>
	<script src="/js/lib/lib.min.691ca242.js"></script>
<script src="/js/s/core/s.min.c67eef19.js"></script>
<script src="/js/player/player.min.82c83941.js"></script>
<script src="/js/s/main.min.70f615f3.js"></script>

	<script type="text/javascript">
	
	window.S = window.S || {};
	// 페이스북콜백
	S.readyFB = function(){}
	// 인증관련
	S.AuthInfo = {"SORI_ENCRYPT":"","VID":"0","USERID":"","URLID":"","IDTYPE":"","NICKNAME":"","EMAIL":"","ADULT_AUTH":"","SELF_AUTH":"","REMEMBER_ME":"","AUTO_LOGIN_KEY":"","STREAMING_KEY":"","PROFILE_IMAGE":"","PROFILE_IMAGE_L":"","FACEBOOKID":"","KAKAOID":"","KAKAOTOKENID":"","DOWNLOAD_TYPE":"","EXTRA_SETTING":"","AUTH_KEY":"","ITEM_CODE":"","ITEM_NAME":"","isLogin":false};
	// 상수
	S.Const = {
		SBCHECKVER:'1,0,0,18',
		SBCHECKCLSID:'489F44C4-72C0-4FB2-B4BB-D1BE155CCBCB',
		SBCHECKCABPATH:'http://download.soribada.com/down/SBCheck/20081021',
		FACEBOOK_APP_ID:'182687168411984',
		SORIBADAWWW: 1,
		SORIBADAMOBILEWEB: 2,
		SORIBADAP2P: 3
	};

	/**
	 * S.Api 작업 후 삭제할 예정, 서버정보 노출은 치명적!
	 */
	S.Server = {
		PATH:'http://www.soribada.com',
		SSL:'https://www.soribada.com',
		WWW:'http://www.soribada.com',
		SBAPI:'http://sbapi.soribada.com',
		PG:'http://bill.soribada.com',
		SNA:'http://sna.soribada.com',
		SMA:'http://sma.soribada.com',
		CIMAGE:'http://cimage.soribada.com',
		ES:'http://es.soribada.com',
		MGATE:'http://mgate.soribada.com',
		WWWOLD:'http://www.soribada.com'
	};
	/* os가 xp 이고 브라우져가 8이하 버젼일경우  by suc 2014.01.29*/
	/**
	 * S.Utils.SEEKING 삭제 예정, 영철과장님 확인
	 * 플레이어 쪽 정리해야할 듯.
	 */
	if(S.BrowserDetect.browser == 'Explorer' && parseInt(S.BrowserDetect.version, 10) <= 8 && navigator.appVersion.indexOf("Windows NT 5.1")!=-1){
		// S.Utils.Osver = true;
		S.Utils.SEEKING = 1000;
		// S.Utils.MainIndex = 4;
		// S.Utils.Mtimeout = 0;
		// S.Utils.Settime = 0;
	}else{
		// S.Utils.Osver = false;
		S.Utils.SEEKING = 500;
		// S.Utils.MainIndex = 3;
		// S.Utils.Mtimeout = 5000;
		// S.Utils.Settime = 50;
	}

	/**
	 * SYNC_PARAM 삭제해야함
	 */
	SYNC_PARAM = '';

	// 여기서 서버별 분기를 꼭 php에서 해야하나?
	// host 보고 분기하면 되지 않나?
	// 아니면 authInfo처럼 serverInfo를 받던지...
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	// 구글분석
	var _gaq = _gaq || [];
	var pluginUrl = '//www.google-analytics.com/plugins/ga/inpage_linkid.js';
	_gaq.push(['_require', 'inpage_linkid', pluginUrl]);
	_gaq.push(['_setAccount', 'UA-33396598-1']);
	_gaq.push(['_setDomainName', 'soribada.com']);
	_gaq.push(['_setAllowLinker', true]);
		
	if(S.AuthInfo.isLogin){ ///이용권의 통계를 잡기위한 로그쌓기
		if(!S.AuthInfo.ITEM_CODE) {S.AuthInfo.ITEM_NAME = "이용권 없음";}
		_gaq.push(['_setCustomVar',1,"Member",S.AuthInfo.ITEM_NAME,2]);
	}

	_gaq.push(['_trackPageview']);

	// 자동로그인 경우 로그쌓기
	if (S.AuthInfo.REMEMBER_ME == '1' && !S.Utils.getCookie('AUTO_LOGIN_KEY_CHECKED')){
		_gaq.push(['_trackEvent', 'account', 'login', 'auto']);
		S.Utils.setCookie('AUTO_LOGIN_KEY_CHECKED', '1');
	}
	// 일반로그인 경우 로그쌓기
	else if (S.Utils.getCookie('GENERAL_LOGIN_COMPLETE') == '1'){
		_gaq.push(['_trackEvent', 'account', 'login', 'general']);
		S.Utils.deleteCookie('GENERAL_LOGIN_COMPLETE');
	}
	// 페북 로그인 경우 로그쌓기
	else if (S.Utils.getCookie('FB_LOGIN_COMPLETE') == '1'){
		_gaq.push(['_trackEvent', 'account', 'login', 'facebook']);
		S.Utils.deleteCookie('FB_LOGIN_COMPLETE');
	}
	// 페북 회원가입인 경우 로그쌓기
	else if (S.Utils.getCookie('FB_SIGNUP_COMPLETE') == '1'){
		_gaq.push(['_trackEvent', 'account', 'create', 'facebook']);
		S.Utils.deleteCookie('FB_SIGNUP_COMPLETE');
	}
			
	S.Utils.consoleFallback();

	(function() {
	var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  	})();

  	// 페이스북 설정
	window.fbAsyncInit = function() {
		FB.init({
				appId      : '182687168411984', // App ID from the App Dashboard
				status     : true, // check the login status upon init?
				cookie     : true, // set sessions cookies to allow your server to access the session?
				xfbml      : true,  // parse XFBML tags on this page?
				version    : "v2.2" // version
		});
	};

	(function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/ko_KR/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>

<script type="text/javascript">
	/**
	 * 카톡 이닛 위치 변경 필요
	 */
	if(S.BrowserDetect.version != "7.0"){
	    Kakao.init('76dc78654ffbab0048f05bcc8999bb8f');
	}
</script></head>
<body>
	<div id="fb-root"></div>
	<div id="soribadaWrapper"> <!-- soribadaWrapper -->	
		<div id="header"> <!-- header -->
			<a href="/" tabindex="1"><h1 id="logo"><span class="hide">soribada</span></h1></a>
			
			<!-- 검색 -->
			<div id="searchSection">
				<fieldset>
					<legend class="hide">검색</legend>
					<span>
						<input type="text" class="textType_hide" placeholder="" textval="" />
					</span>
				</fieldset>
				<button class="searchBtn"><span>검색</span></button>
			</div>
			<!-- //검색 -->
			<!--///viaGlobal값이 1인 경우 kpop에서 온 경우. KR인 경우 국내사용자.-->
			<div class="soribada6 sb6UTButton"><button><img src="//image.soribada.com/image/v27/main/header_btn_soba6.png" alt="소리바다6" /></button></div>
						<div class="headerBanner"><!--<a href=""><img src="" /></a>--></div>
						<div id="userSection">
				<div class="userInfo butUserNotLogin">
					<span>
						<a href="https://www.soribada.com/member/signup" target="_top"><img src="//image.soribada.com/image/v27/main/header_txt_join.png" alt="회원가입" /></a>
					</span>
					<span>
						<a href="/ticket/hit"><img src="//image.soribada.com/image/v27/main/header_txt_coupon.png" alt="이용권구매" /></a>
					</span>
				</div>
				<div class="btnMypage"><a href="/member/login" class="login"><img src="//image.soribada.com/image/v27/main/header_btn_login.png" alt="로그인" /></a></div>
			</div>
					</div> <!-- // header -->
		
		<div class="emailAuthMessage">
			<span class="group emailGroup"><span class="nickname"></span>님, <span class="email msgEmail mailColor"></span> 으로 메시지가 전송되었습니다. 이메일 인증 완료를 위해 이메일을 확인해 주세요. <span class="mailUtil first"><a href="#" target="_blank" class="confirm mailColor">이메일 확인</a></span><span class="mailUtil"><a href="#" class="resend mailColor">이메일 재 전송</a></span><span class="mailUtil"><a href="/mypage/info" class="change mailColor">이메일 주소 변경</a></span></span>
			<span class="group emptyEmailGroup"><span class="nickname"></span>님 본인 확인을 위해 이메일을 등록해 주세요. <span class="mailUtil first"><a href="/mypage/info" class="regEmail mailColor">이메일 등록하기</a></span></span>
			<span class="group facebookGroup">이미 소리바다 ID가 있다면 facebook ID 계정과 통합하세요. <span class="mailUtil first"><a href="#" class="integration mailColor">통합하기</a></span></span>
			<button class="msgCancel"><span class="hide">닫기</span></button>
		</div>
		<div class="messageBox">
			<span class="msgTxt">This site is available only in Korea. You will be automatically redirected in a <span class="numberTxt"></span> seconds.</span>
		</div>
		
		<div id="containers"> <!-- containers -->
			<div id="leftContainer"> <!-- leftContainer -->
				<div id="leftContents">
					<!-- gnb -->
					<div id="gnb">
						<ul>
							<li class="lm gnb1"><a href="/music/new/recommend/all" title="최신앨범">최신앨범<span class="ir"></span></a></li>
							<li class="lm gnb2"><a href="/music/chart" title="인기차트">인기차트<span class="ir"></span></a></li>
							<li class="lm gnb3"><a href="/music/genre" title="장르음악">장르음악<span class="ir"></span></a></li>
							<li class="lm gnb4"><a href="/music/video" title="뮤직비디오">뮤직비디오<span class="ir"></span></a></li>
							<li class="lm gnb5"><a href="/recommend" title="추천음악">추천음악<span class="ir"></span></a></li>
							<li class="lm gnb6"><a href="/music/artist" title="아티스트랭킹">아티스트랭킹<span class="ir"></span></a></li>
						</ul>
					</div>
					<!-- /gnb -->
					
					<!-- 마이뮤직 -->
					<div id="cloudCounter" class="sideListType">
						<p class="title"><span>마이뮤직<span class="ir"></span></span></p>
						<ul>
							<li class="mm music3">
								<span class="menuTxt" index="1" title="음악친구">음악친구<span class="ir"></span></span>
							</li>
							<li class="mm music1">
								<span class="music1_margin" title="재생목록">재생목록<span class="ir"></span></span>
								<ul>
									<li class="mm my_list my_list01">
										<span class="menuTxt" index="3" title="즐겨찾기 곡">즐겨찾기 곡<span class="ir tit_ir"></span></span>
										<button class="btn fullPlay" title="전체듣기" index="3">전체듣기<span class="ir"></span></button>
									</li>
									<li class="mm my_list my_list02">
										<span class="menuTxt" index="4" title="최근 들은 곡">최근 들은 곡<span class="ir tit_ir"></span></span>
										<button class="btn fullPlay" title="전체듣기" index="1">전체듣기<span class="ir"></span></button>
									</li>
									<li class="mm my_list my_list03">
										<span class="menuTxt" index="5" title="많이 들은 곡">많이 들은 곡<span class="ir tit_ir"></span></span>
										<button class="btn fullPlay" title="전체듣기" index="2">전체듣기<span class="ir"></span></button>
									</li>
									<li class="mm my_list my_list04">
										<span class="menuTxt" index="6" title="내 목록">내 목록<span class="ir tit_ir"></span></span>
									</li>
								</ul>
							</li>
							<li class="mm music2">
								<span class="menuTxt" index="0" title="구매한 음악">구매한 음악<span class="ir"></span></span>
							</li>
							<li class="mm music4">
								<span class="menuTxt" index="2" title="내 클라우드">내 클라우드<span class="ir"></span></span>
							</li>
						</ul>
					</div>
					<!-- /마이뮤직 -->
					
					<!-- 바로가기링크 -->
					<div class="siteUtils">
						<div class="btnBuy"><a href="/ticket/hit" title="이용권 구매"><img src="//image.soribada.com/image/v27/lnb/btn_coupon.png" alt="이용권구매" /></a></div>
						<div class="moreMenu">
							<a href="/event/list/motion/all/1" title="이벤트">
								<img src="//image.soribada.com/image/v25/layout/btn_event.gif" alt="이벤트" />
							</a>
							<a href="http://phone.soribada.com/soribada/list_main.asp" target="_blank" title="폰꾸미기">
								<img src="//image.soribada.com/image/v25/layout/btn_phone_decorating.gif" alt="폰꾸미기" />
							</a>
							<a href="/guide/service" target="_blank" title="소리바다 서비스">
								<img src="//image.soribada.com/image/v25/layout/btn_mobile_soribada_2.gif" alt="소리바다 서비스" />
							</a>
						</div>
						<div class="serviceMenu">
							<a href="/cs/notic/1" target="_blank" title="공지사항"><img src="//image.soribada.com/image/v25/layout/btn_notice.gif" alt="공지사항" /></a>
							<a href="/cs" target="_blank" title="고객센터"><img src="//image.soribada.com/image/v25/layout/btn_customer_service.gif" alt="고객센터" /></a>
						</div>
						<div class="sns-link">
							<ul>
							<li><a href="https://www.facebook.com/soribada" target="_blank" title="페이스북"><img src="//image.soribada.com/image/v25/layout/social_icon_01.gif" alt="FACE BOOK" /></a></li>
							<li><a href="http://twitter.com/soribada" target="_blank" title="트위터"><img src="//image.soribada.com/image/v25/layout/social_icon_02.gif" alt="twitter" /></a></li>
							<li><a href="http://blog.naver.com/soribada007" target="_blank" title="네이버 블로그"><img src="//image.soribada.com/image/v25/layout/social_icon_03.gif" alt="BLOG" /></a></li>
							</ul>
						</div>
					</div>
					<!-- //바로가기링크 -->
				</div>
			</div> <!-- // leftContainer -->
		
			<div id="centerContainer"> <!-- centerContainer -->				
				<div class="tse-scrollable centerContainerScrollWrapper">
					<div class="tse-content">
						<div id="centerContents" class="contentsNormal"></div> <!-- //centerContents -->
					</div>
				</div>
			</div> <!-- // centerContainer -->
		
			<div id="rightContainer"> <!-- rightContainer -->
				<div id="rightContents">
					<!-- 이벤트 배너 -->
					<div class="eventBanner">
						<ul>
							<li><a><img src="http://image.soribada.com/image/v25/main/album_none.jpg"></a></li>
						</ul>
					</div>
					<!-- //이벤트 배너 -->

					<div id="realtimeSearchKeyword">
						<h3 class="tit_searchKey">인기 검색어</h3>
						<ul class="listSearchKey list_searchKey"></ul>
					</div>

					<div id="recommPado">
						<h3 class="tit_recommpado"><span class="txt">pado</span><span class="ico"></span></h3>
						<ul class="listPado list_pado"></ul>
						<div class="page_recommpado">
							<a class="btnPage btn_page1">1</a>
							<a class="btnPage btn_page2">2</a>
							<a class="btnPage btn_page3">3</a>
						</div>
					</div>

					<!-- //스타나우 -->
					<!-- div id="nowPlayingNotice">
						<h3 class="titleWithRightButton">
							<span class="tit_nowPlaying"><img src="//image.soribada.com/image/v25/layout/tit_nowplaying.gif" alt="스타나우 플레잉"></span>
						</h3>
						<div class="starItemList" style="height:230px;">
								<div class="listener"></div>
						</div>
						<div class="pageControl starControl"></div>
				   </div -->
					<!-- //스타나우 -->
					<!-- //소셜라디오 -->
					<!-- div id="socialRadioNotice">
						<h3>
							<span><img src="//image.soribada.com/image/v25/layout/tit_socialradio.gif" alt="소셜 라디오"></span>
							<button class="btn-play-allsongs"><img src="//image.soribada.com/image/v25/common/btn_radio.png" title="라디오 듣기"></button>
						</h3>
						<div class="radioItemList">
							<div class='pageView'>
								<div class="listener"></div>
							</div>
							<div class='pageView'></div>
							<div class='pageView'></div>
						</div>
						<div class="pageControl socialControl"></div>
				   </div -->
					<!-- //스셜라디오 -->
						
				</div>
			</div> <!-- // rightContainer -->
		</div> <!-- // containers -->
		
		<div id="footer"></div> <!-- footer -->

	</div> <!-- // soribadaWrapper -->


	<div class="dimOverlay"></div>
	<div class="fullModelScreen"></div>
	<!-- 이메일이 없는 사용자 경고팝업 -->
	<div class="modEmailContainer">
		<div class="modEmail">
			<div class="step1">
				<img src="http://image.soribada.com/image/member/join/sb2_me_popup_01.png" usemap="#step1"/>
				<map name="step1">
					<area shape="rect" coords="617,14,638,35" title="닫기" href="javascript:S.app.modEmail.closeEmailPopup();" />
					<area shape="rect" coords="220,488,325,512" title="이메일등록하기" href="javascript:S.app.modEmail.clickConfirmEmail();" />
					<area shape="rect" coords="334,488,439,512" title="다음에하기" href="javascript:S.app.modEmail.closeEmailPopup();" />
				</map>
				<input type="text" class="inputEmail input_fix" />
				<div class="errorEmail" isError="true"></div>
				<input type="checkbox" class="cbAgree" />
			</div>
			<div class="step2">
				<img src="http://image.soribada.com/image/member/join/sb2_me_popup_02.png" usemap="#step2"/>
				<map name="step2">
					<area shape="rect" coords="617,14,638,35" title="닫기" href="javascript:S.app.modEmail.closeEmailPopup();" />
					<area shape="rect" coords="366,487,475,510" title="인증메일 재전송" href="javascript:S.app.modEmail.resendEmail();" />
				</map>
				<div class="labelEmail"></div>
			</div>
		</div>
	</div>

	<!-- zip_down용 dummy iframe -->
	<form id="formZipDown" name="formZipDown" method="POST" target="iframeZipDown" action="http://mp3down.soribada.com/zipdown/index.php">
		<input class="zipDownVid" type="hidden" name="vid" value="0"/>
		<input class="zipDownAuthKey" type="hidden" name="authKey" value=""/>
		<input class="zipDownList" type="hidden" name="downList" />
		<input class="zipDownFileName" type="hidden" name="zipFileName" />
		<input class="zipDownDeviceId" type="hidden" name="deviceId" />
		<input class="zipDownBitRate" type="hidden" name="bitRate" value="192k"/>
		<input class="zipDownOverwrite" type="hidden" name="overwrite" />
	</form>
	<div class='dragNoticeBox'>
		<span class="hoverPointer">&nbsp;</span>
		<div class="songDrag">
			총 <span class="songCount dragCount">0</span>개의 곡이 선택됨<br />
			<span class="firstSongName"></span> <span class="other">외 <span class="otherSongCount dragCount">0</span>곡</span>
		</div>
		<div class="playlistDrag"><span class="PlaylistName"></span></div>
	</div>

	<div id="popupWrapper">
		<div class="popupBackground"></div>
		<div class="popSection web25">
			<div class="popCloseSection">
				<label>
					<input type="checkbox" value="chk" name="close" class="chkbox"/>
				</label>
			</div>
			<a href="/ticket/hit" style="position:absolute;bottom:58px;left:83px;width:235px;height:51px;" class="btn-ticket"></a>
			<!-- a href="http://beta.soribada.com/guide/service" target="_blank" style="position:absolute;bottom:70px;left:431px;width:269px;height:52px;" class="web25mobile"></a -->
			<div class="web25_closeBtn" style="position:absolute;bottom:3px;left:338px;width:59px;height:27px;cursor:pointer" class="web25close"></div>
		</div>
	</div>
	
	<div id="popupWrapperSub">
		<div class="popupBackground"></div>
		<div class="popSection web25">
			<div class="popCloseSection">
				<label>
					<input type="checkbox" value="chk" name="close" class="chkbox"/>
				</label>
			</div>
			<a href="/ticket/hit" style="position:absolute;bottom:58px;left:83px;width:235px;height:51px;" class="btn-ticket"></a>
			<!-- a href="http://beta.soribada.com/guide/service" target="_blank" style="position:absolute;bottom:70px;left:431px;width:269px;height:52px;" class="web25mobile"></a -->
			<div class="web25_closeBtn" style="position:absolute;bottom:3px;left:338px;width:59px;height:27px;cursor:pointer" class="web25close"></div>
		</div>
	</div>
	
</body>
</html>
