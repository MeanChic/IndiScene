<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${root }/resources/xhr/xhr.js" type="text/javascript" ></script>
<script src="${root }/js/replyWrite.js" type="text/javascript" ></script>
<script src="${root }/js/replyDelete.js" type="text/javascript" ></script>
<script src="${root }/js/replyUpdate.js" type="text/javascript" ></script>
</head>
<body>
<script>
	$(function(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 2 // 지도의 확대 레벨
	    };  
		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		var address = document.getElementById('address').value;
		
		lat = address.split("(")[1].split(",")[0];
		lng = address.split("(")[1].split(",")[1].split(")")[0];
		//alert(lat);
		//alert(lng);
		/* geocoder.addr2coord(address, function(status, result) { */

	    // 정상적으로 검색이 완료됐으면 
	     /* if (status === daum.maps.services.Status.OK) { */
		$(function(){
	        var coords = new daum.maps.LatLng(lat,lng);/* result.addr[0].lat, result.addr[0].lng); */

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="padding:5px;">공연장 위치</div>'
	        });
	        infowindow.open(map, marker);
	    /* } */ 
	});   
	});
</script>
<div id="placeBoardRead">
	<h3>PlaceBoard Read</h3>
	<c:set var="root" value="${pageContext.request.contextPath }" />
	<input type="hidden" id="address" value="${marketBoard.zipcode}"/>
	<input type="hidden" id="pageNumberForAjax" value="${pageNumber }"></input>
	<div class="marketBoardX-location02">
		<a class="marketBoardAttribute01 btn btn-default" href="javascript:enterPlaceBoard('${root}','${pageNumber}')">List</a>
	</div>	
	<div class="form-controlMarket">
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Board Number</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="${marketBoard.board_num }" disabled="disabled" />
		</div>
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Views</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="${marketBoard.count }" disabled="disabled" />
		</div>
	</div>
	<div class="form-controlMarket">
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Writer</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="marketBoardSize25 form-controller220" type="text" value="${marketBoard.artist_id }" disabled="disabled" />
		</div>
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Date</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="<fmt:formatDate value="${marketBoard.register_date}" type='date'/>" disabled="disabled"/>
		</div>
	</div>
	<div class="form-controlMarket" >
		<label class="marketBoardSize16 label-color marketBoardY-location01" >Contents</label>
		<div class="marketBoardSize77 marketBoardAttribute01">
			<div id="marketReadContents" class="marketBoardTextareaSize200 marketBoardAttribute02">
				${marketBoard.content }
			</div>		
		</div>
	</div>
	<div class="form-controlMarket">
		<label class="marketBoardSize16 label-color marketBoardY-location01">Date&Place</label>
		<div class="marketBoardSize77 marketBoardAttribute01">
			<div id="marketReadContents" class="marketBoardTextareaSize200 marketBoardAttribute02">
				<div id="map" style="width:300px;height:300px;"></div>
				${marketBoard.address}
			</div>		
		</div>
	</div>
	<div class="form-controlMarket">
		<label class="marketBoardSize16 label-color">Address</label>
		<div class="marketBoardSize77 form-inlineblock">
			<input class="form-controller320 marketBoardSize03" type="text" size="50" value="${marketBoard.address}" disabled="disabled"/>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			//alert($("#marketReadContents img").attr("src"));
			$("#marketReadContents img").attr("style","width:100%;");
		})				
	</script>

	<div class="form-controlMarket" style= text-align:center;>
		<div class="marketBoardInterval04">
			<c:if test="${marketBoard.artist_id == artist_id }">
				<input class="btn btn-default" type="button" value="Modify" onclick="javascript:placeBoardUpdate('${marketBoard.board_num}','${pageNumber}')" />
				<input class="btn btn-default" type="button" value="Delete" onclick="javascript:placeBoardDelete('${marketBoard.board_num}','${pageNumber}','${marketBoard.artist_id}')"/>
				<c:set var="artist" value="${artist_id }"></c:set>
			</c:if>
		</div>
	</div>
	<!-- ---------------한줄댓글 ----------------------------------------------->

	${marketBoard.board_num }
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<div>한줄 댓글이 가능합니다.</div>
	<br/>
	
	<div>
		<input type="hidden" value="${artist_id }" name="artist_id" />
		<input id="writeId"  type="text" name="artist" size="14" style="font-size:1.05em;font-family:Helvetica;" value="${artist_id}" disabled="disabled"/>
		<input id="writeReply" type="text" name="reply_content" size="45"/>
		<input type="button" value="한줄답글작성" onclick="writeToServer('${root}','${marketBoard.board_num }')"/> 
	</div>

	 
	<div></div>
	
	<!-- 새로운 데이터 -->
	<div id="newReply"></div>
	
	<!--  기존데이타 -->
	<c:forEach var="reply" items="${replyList }">
		<div class="replyDiv" id="${reply.reply_num }">   <!-- div를 통해 한번에 삭제하기위함,, 자식들도 삭제되므로! -->
			<span class="cssBunho">${reply.reply_num }</span>
			<span class="cssAritist">${reply.artist_id }</span>
			<span class="cssReply">${reply.reply_content }</span>
			<span class="cssDate">${reply.reply_date }</span>
			<span class="cssUpDel">
				<a href="javascript:upSelectToServer('${marketBoard.board_num }','${reply.reply_num }','${root}')">수정</a>
				<a href="javascript:deleteToServer('${marketBoard.board_num }','${reply.reply_num }','${root}')">삭제</a>
			</span>
		</div>
	</c:forEach>
</div>
</body>
</html>
