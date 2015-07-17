<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<%-- <c:set var="artist_id"  value="indi"/> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<title>Insert title here</title>

<style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map_canvas { height: 100% }
</style>
<script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true">
    </script>
<script type="text/javascript" src="${root}/js/performBoard.js"></script>
<script type="text/javascript" src="${root}/js/placeBoard.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=35bf5934991976c7b6f95f227c76624f&libraries=services"></script>

    
    
   <link type="text/css" href="${root}/css/jquery-ui.css" rel="stylesheet"/>

<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
<script src="${root }/js/jquery.MultiFile.js" type="text/javascript" ></script>
<script src="${root }/resources/ckEditor/ckeditor.js"></script>

<script src="${root }/resources/xhr/xhr.js" type="text/javascript" ></script>
<script src="${root }/js/reply.js" type="text/javascript" ></script>
</head>
<body>
	<a href="${root }/performBoard/write.do">시작해보자</a>
	<a href="${root}/performBoard/list.do"> 리스트 보기 </a>	

	<a href="${root}/museCreate/logup.do">muse개설</a>
	<a href="${root}/museCreate/musemain.do?artist_id=${artist_id}">musemain</a>
	
	<a href="${root}/museGuest/guest.do?muse_name=abc">guest</a><br/>
	<span>
	<a href="${root}/placeBoard/enterBoard.do">PlaceBoard</a>	
	</span>
	
	<span>
	
	     <a href="${root}/perform/enter.do">전체페이지지지지지지</a>      
	</span>
	
	
	<!-- <div id="scrollDiv" style="position: absolute; top: 100px; left: 134px; display: block;">
		<div id="pscroller2" class="someclass" style="position: relative; overflow: hidden; width: 55px;">
			<div id="textLasOut">
				<img id="sliderDefImage" src="http://img2.keywordsconnect.com/iconAdImg2.gif" style="display: none;">
				
				<div id="sliderAdText" style="display: block;">
					<a href="http://cm.keywordsconnect.com/i/economyhankook/%ED%99%94%EC%9D%B4%ED%8A%B8/?ru=http%3A//keyword.daumdn.com/clk%3Fq%3DUez24AQOfDCukNkZbVOYlFAFXgQWQOZS4Jfbd78LMf8lAgch.EKFvK9URcIsv2nuw.NPrXE9T_k2PmOW8BAU.mJNv8V.UD4B6e5gdSydUVk7h2WFmE23vutd-qLciWCui8KgGQhC7YexvDQHEX-XCtp..8qmwidQuwAhN2nnzoCne9Vg4WqUXKYC3HtWNlj-kO5qVu3TlWPmbNLVQOt6FDq.o1ozwrZjdiuDZmzTHuj4GgEHK.HYL.SOZPfdiMiULjm5M9_SVTYp6E4pPeVIkMh56c8pcY_WD-YNtSciuSHnO4NOc6dcXhafc16zl2xeFp.jZn5sUciYOAlz6Z8RbK8L5EAM122nflmeVDUevjN7ukmcOvx-r54tqMpcMHBhjVDRpqhmNB19VCiO_NIsVDoLEoxmiorN21DVQ-UK_Is9pbuDVqFxvvIWAbK6NpzrZf3mTTMksr_Dc1B47_jS3mdlHx_VTx6sZJ_mpBdYLOX8Wg-a5KsvXWrkrCzc5yu4OIu1nCw7qqfVm5LxLBUjeIMk2Ssq-a-CfMqmdLLA5sftOi3YRw1yf8eR_TBl.SHc4MnmwhlX83YbVoGDbo8T3H5v5YXjgiBjOJal-74_di_EDsy7VUIfEM.ogWHAkigOP5Mb5sgVpjn7dt7x6I8xKt5w3TRyY8SmWOkrOH3ZePMI_JWnWeHBkTQ3Br1U2DmiFPxNHH.ddb6qmfV4Z7SsMbmsdK7S9pHW7MSLVZP9tQId61ys2zC2cJ7snMmCeYGRa3ahQkiT9EK6McKkZZoxyMKrVyV-MDpbNWRkstsxpEygBWvV4WHZ3nRKRu-nyKcwx.8KJOvpogreTQ00%26s%3Dhttp%253A%252F%252Fwww.boardtown78.com%252F%253Fcafe_mkt%253Ddaum_pl&amp;kw=%ED%99%94%EC%9D%B4%ED%8A%B8&amp;au=http%3A//boardtown78.com" target="_blank" class="titleAdLink">
						<div class="textAdTitle" style="margin-top:6px">우수품질 보드,칠판 보드타운</div>
					</a><br>
					<a href="http://cm.keywordsconnect.com/i/economyhankook/%ED%99%94%EC%9D%B4%ED%8A%B8/?ru=http%3A//keyword.daumdn.com/clk%3Fq%3DUez24AQOfDCukNkZbVOYlFAFXgQWQOZS4Jfbd78LMf8lAgch.EKFvK9URcIsv2nuw.NPrXE9T_k2PmOW8BAU.mJNv8V.UD4B6e5gdSydUVk7h2WFmE23vutd-qLciWCui8KgGQhC7YexvDQHEX-XCtp..8qmwidQuwAhN2nnzoCne9Vg4WqUXKYC3HtWNlj-kO5qVu3TlWPmbNLVQOt6FDq.o1ozwrZjdiuDZmzTHuj4GgEHK.HYL.SOZPfdiMiULjm5M9_SVTYp6E4pPeVIkMh56c8pcY_WD-YNtSciuSHnO4NOc6dcXhafc16zl2xeFp.jZn5sUciYOAlz6Z8RbK8L5EAM122nflmeVDUevjN7ukmcOvx-r54tqMpcMHBhjVDRpqhmNB19VCiO_NIsVDoLEoxmiorN21DVQ-UK_Is9pbuDVqFxvvIWAbK6NpzrZf3mTTMksr_Dc1B47_jS3mdlHx_VTx6sZJ_mpBdYLOX8Wg-a5KsvXWrkrCzc5yu4OIu1nCw7qqfVm5LxLBUjeIMk2Ssq-a-CfMqmdLLA5sftOi3YRw1yf8eR_TBl.SHc4MnmwhlX83YbVoGDbo8T3H5v5YXjgiBjOJal-74_di_EDsy7VUIfEM.ogWHAkigOP5Mb5sgVpjn7dt7x6I8xKt5w3TRyY8SmWOkrOH3ZePMI_JWnWeHBkTQ3Br1U2DmiFPxNHH.ddb6qmfV4Z7SsMbmsdK7S9pHW7MSLVZP9tQId61ys2zC2cJ7snMmCeYGRa3ahQkiT9EK6McKkZZoxyMKrVyV-MDpbNWRkstsxpEygBWvV4WHZ3nRKRu-nyKcwx.8KJOvpogreTQ00%26s%3Dhttp%253A%252F%252Fwww.boardtown78.com%252F%253Fcafe_mkt%253Ddaum_pl&amp;kw=%ED%99%94%EC%9D%B4%ED%8A%B8&amp;au=http%3A//boardtown78.com" target="_blank" class="titleAdLink">
						<div class="textAdDesc">화이트보드, 게시판, 현황판 전문쇼...</div>
					</a><br>
					
					<a href="http://cm.keywordsconnect.com/i/economyhankook/%ED%99%94%EC%9D%B4%ED%8A%B8/?ru=http%3A//keyword.daumdn.com/clk%3Fq%3DUez24AQOfDCukNkZbVOYlFAFXgQWQOZS4Jfbd78LMf8lAgch.EKFvK9URcIsv2nuw.NPrXE9T_k2PmOW8BAU.mJNv8V.UD4B6e5gdSydUVk7h2WFmE23vutd-qLciWCui8KgGQhC7YexvDQHEX-XCtp..8qmwidQuwAhN2nnzoCne9Vg4WqUXKYC3HtWNlj-kO5qVu3TlWPmbNLVQOt6FDq.o1ozwrZjdiuDZmzTHuj4GgEHK.HYL.SOZPfdiMiULjm5M9_SVTYp6E4pPeVIkMh56c8pcY_WD-YNtSciuSHnO4NOc6dcXhafc16zl2xeFp.jZn5sUciYOAlz6Z8RbK8L5EAM122nflmeVDUevjN7ukmcOvx-r54tqMpcMHBhjVDRpqhmNB19VCiO_NIsVDoLEoxmiorN21DVQ-UK_Is9pbuDVqFxvvIWAbK6NpzrZf3mTTMksr_Dc1B47_jS3mdlHx_VTx6sZJ_mpBdYLOX8Wg-a5KsvXWrkrCzc5yu4OIu1nCw7qqfVm5LxLBUjeIMk2Ssq-a-CfMqmdLLA5sftOi3YRw1yf8eR_TBl.SHc4MnmwhlX83YbVoGDbo8T3H5v5YXjgiBjOJal-74_di_EDsy7VUIfEM.ogWHAkigOP5Mb5sgVpjn7dt7x6I8xKt5w3TRyY8SmWOkrOH3ZePMI_JWnWeHBkTQ3Br1U2DmiFPxNHH.ddb6qmfV4Z7SsMbmsdK7S9pHW7MSLVZP9tQId61ys2zC2cJ7snMmCeYGRa3ahQkiT9EK6McKkZZoxyMKrVyV-MDpbNWRkstsxpEygBWvV4WHZ3nRKRu-nyKcwx.8KJOvpogreTQ00%26s%3Dhttp%253A%252F%252Fwww.boardtown78.com%252F%253Fcafe_mkt%253Ddaum_pl&amp;kw=%ED%99%94%EC%9D%B4%ED%8A%B8&amp;au=http%3A//boardtown78.com" target="_blank" class="titleAdLink">
							<div class="textAdSite">boardtown78.com</div>
					</a>
				</div>
				
				<div id="iconAdBtn" style="display: block; width: 15px; height: 9px; top: 45px; left: 192px; position: absolute;">
					<a href="http://clixinfo.biz.daum.net" target="_blank" style="border:none">
					종료
						<img src="http://img2.keywordsconnect.com/btn_premium.png" style="border:none">
					</a>
				</div>	
			</div>
		</div>
		
		<div class="closeBox" id="iconADcloseBox">
			<div id="btnClose">
			
				<img src="http://img2.keywordsconnect.com/close.gif" style="border:none;cursor:pointer" onclick="closeSlider()">
			</div>
		</div>
		
		<img width="1" height="1" src="http://keyword.daumdn.com/exp?q=UeoZOlxd.xweJU57vkLYbFJNZyzEh4D8So9U4bhr_8GmGn35_MUvcMz-J4ofLC17vS_GyuOaWRplub2YsFuQkfdQvXunT39n3BxJ2zw5MMFc2Ci3.yEA8QypcQeKof16Hn92PxwiMoAuAybH5DKD1gi3dIcmpruS3_Hjkt5.AyBUU6Uy1wWK2xAH1phGjCai52Fy5U-Cmu-TBNpaFF-a.yrLbx4snASuJs71eg86W3fGvH1uusN6yXvmGxp78tH9iQRuzt.O7GIfp31lzfDzTnaqrIabvsLAMgUW_OuiQvubDyaK894SZFOgsvzrLxu7vyiBBNHW2oA2AwnJRROQuI6rwm6rej1laPiKXWmapDkogOOKuK7XhpOaRVI7qBo-urXDQQYO9DAerhO-HCk4NhJsCypREBOx6dV8YtWf6v7SQldfF4sm2sNXqIPrSe66VO4amqf4.KRxcjfZR4u_b_6ECYKZ19Q1dH5EZzSrAiEiEXgOsJ3OzyZBWyyXMUuK7aR1yqkqx5I22BZd86YFq-7F1R6e9AgARNs0&amp;r=UetTAJNP_Z2BWNrH-gkl82qZhF283ttlpsf_boQVZfBkJrs7yt6n9uczU1Pfd4Mkma3fH.hwt8pJ1j1wobWEnPkuDDJOmx7ULm57YYwKp-e8xTknU.ddkUyr9sUt4f5Aq6kB-iIRGXsHKYhn3a_js6QYlHxi4FIlANI7b_EK9uQ_QBslLlRZlT8br9QLXvfoyFRt-BnOWzO9W1A_W3sp-hvhbSXN9PNOdqruFzvrATtQh.gkSkw9c_xbQGpXbNMrdBk95_N-.M-X.A00&amp;">
	</div> -->
	
	<a href="javascript:enterPerformBoard('${root}')">거래게시판 들어가기 (ajax적용 O)</a>
	<br/>
	<a href="javascript:enterPlaceBoard('${root}')">플레이스 보드 들어가기 (ajax적용 O)</a>
	<div id="centerContents"><h1>center</h1></div>
	

</body>
</html>
