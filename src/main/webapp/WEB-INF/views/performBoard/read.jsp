<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<title>Insert title here</title>
<script src="${root }/js/jquery.js"></script>
<script src="${root }/resources/xhr/xhr.js" type="text/javascript" ></script>
<script src="${root }/js/replyWrite.js" type="text/javascript" ></script>
<script src="${root }/js/replyDelete.js" type="text/javascript" ></script>
<script src="${root }/js/replyUpdate.js" type="text/javascript" ></script>
<script src="${root }/js/reply.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div id="performRead">
	<h3>PerformanceBoard Read</h3>
	<input type="hidden" id="address" value="${performBoard.zipcode}"/>
	<input type="hidden" id="date" value="<fmt:formatDate value="${performBoard.d_day}" pattern="MM/dd/yyyy"/>" name="d_day"/>
	<input type="hidden" id="pageNumberForAjax" value="${pageNumber }"></input>
	
	<div class="marketBoardX-location02">
		<a class="marketBoardAttribute01 btn btn-default" href="javascript:enterPerformBoard('${root}','${pageNumber}')">List</a>
	</div>	
	<div class="form-controlMarket">
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Board Number</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="${performBoard.board_num}" disabled="disabled" />
		</div>
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Views</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="${performBoard.count}" disabled="disabled" />
		</div>
	</div>
	<div class="form-controlMarket">
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Writer</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="marketBoardSize25 form-controller220" type="text" value="${performBoard.artist_id}" disabled="disabled" />
		</div>
		<label class="marketBoardSize16 label-color marketBoardAttribute01">Date</label>
		<div class="marketBoardSize01 marketBoardAttribute01">
			<input class="form-controller220" type="text" value="<fmt:formatDate value="${performBoard.register_date}" type='date'/>" disabled="disabled"/>
		</div>
	</div>
	<div class="form-controlMarket" >
		<label class="marketBoardSize16 label-color marketBoardY-location01" >Contents</label>
		<div class="marketBoardSize77 marketBoardAttribute01">
			<div id="marketReadContents" class="marketBoardTextareaSize200 marketBoardAttribute02">
				${performBoard.content}
			</div>		
		</div>
	</div>
	<script type="text/javascript">
				$(function(){
					$("#marketReadContents img").addClass("marketBoardSize03");
				})				
			</script>
	<div class="form-controlMarket">
		<label class="marketBoardSize16 label-color marketBoardY-location01">Date&Place</label>
		<div class="marketBoardSize77 marketBoardAttribute01">
			<script type="text/javascript">
				$(function(){
					$("#marketReadContents img").addClass("marketBoardSize03");
				})				
			</script>
			<div id="marketReadContents" class="marketBoardTextareaSize200 marketBoardAttribute02">
				<div style="width:300px; float:left;" id="datepicker"></div>
   		 		<fmt:formatDate value="${performBoard.d_day}" pattern="MM/dd/yyyy hh:mm"/>
				<!-- <div id="map_canvas" style="width:300px; height:300px; float:left;"></div> -->
				<div id="map" style="width:300px;height:300px;">${performBoard.address}</div>
				${performBoard.address}
			</div>		
		</div>
	</div>
	<div class="form-controlMarket" style= text-align:center;>
		<div class="marketBoardInterval04">
			<c:if test="${performBoard.artist_id == artist_id }">
				<input class="btn btn-default" type="button" value="Modify" onclick="javascript:performBoardUpdate('${performBoard.board_num}','${pageNumber}')" />
				<input class="btn btn-default" type="button" value="Delete" onclick="javascript:performBoardDelete('${performBoard.board_num}','${pageNumber}','${performBoard.artist_id}')"/>
				<c:set var="artist" value="${artist_id }"></c:set>
			</c:if>
		</div>
	</div>	
	<!-----------------한줄댓글 ----------------------------------------------->
	
	
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<br/><br/><br/>
	<h3 style="color:#4C4C4C; font-size: 1.3em; font-weight: bold;" >comment </h3>
	<hr>
	<div>
		<input type="hidden" value="${artist_id }" name="artist_id" />
		<input id="writeId"  type="text" name="artist" size="14" style="font-size:1.05em;font-family:Helvetica;" value="${artist_id}" disabled="disabled"/>
		<input id="writeReply" type="text" name="reply_content" size="80" />&nbsp;
		<input type="button" value="submit" style="color:black;" onclick="writeToServer('${root}','${performBoard.board_num}')"/> 
	</div>
	<div></div>
	 
	<div></div>
	
	<!-- 새로운 데이터 -->
	<div id="newReply"></div>
	
	<!--  기존데이타 -->
	<c:forEach var="reply" items="${replyList }">
		<div class="replyDiv" id="${reply.reply_num }">   <!-- div를 통해 한번에 삭제하기위함,, 자식들도 삭제되므로! -->
			<%-- <span class="cssBunho">${reply.reply_num }</span> --%>
			<p class="DiscussInfo"><!--  아이디/날짜   -->
				<span class="cssAritist">${reply.artist_id }</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="cssDate"><fmt:formatDate
					value="${reply.reply_date }" type="date" pattern="yyyy/MM/dd HH:mm" /></span>		
			</p>
			<p >
				<span class="cssReply">${reply.reply_content }</span>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="cssUpDel">
					<a href="javascript:upSelectToServer('${performBoard.board_num }','${reply.reply_num }','${root}')" style="color:#36b823;">Edit</a>
					<span class="Delimiter">/</span>
					<a href="javascript:deleteToServer('${performBoard.board_num }','${reply.reply_num }','${root}')" style="color:#D43F3A;">Delete</a>
				</span>
			</p>
			<hr>
		</div>
	</c:forEach>
</div>
 
<script type="text/javascript">

	function performReadInit(){
		$( "#datepicker" ).datepicker({
    		defaultDate: $("#date").val()
    	});

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
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
	

	//function mapMarker(){
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
	}
	performReadInit();
	$("#ui-datepicker-div").appendTo("#centerContents");
	
</script>
 
</body>
</html>