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
<script type="text/javascript">
	function delFun(root, board_num, pageNumber,artist_id){
		var dd =confirm("정말 삭제하시겠습니까?");
			var url=root+"/placeBoard/delete.do?board_num="+boardNumber+"&pageNumber="+pageNumber+"&artist_id="+artist_id;
		if(dd == true){
			location.href=url;
		}
	}
	function DeleteToServer(a,b,c){
		//alert(a+b+c);
	}
	
</script>
</head>

<body>

<script>

	$(function(){
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
		
		alert(lat);
		alert(lng);
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
	<c:set var="root" value="${pageContext.request.contextPath }" />
	<input type="hidden" id="address" value="${marketBoard.zipcode}"/>
	
	<input type="hidden" id="pageNumberForAjax" value="${pageNumber }"></input>
	<table border="1" width="510" cellpadding="2" cellspacing="0"align="center">
		<tr>
			<td align="center" height="20" width="125">글번호</td>
			<td align="center" height="20" width="125">${marketBoard.board_num }</td>
			

			<td align="center" height="20" width="125">조회수</td>
			<td align="center" height="20" width="125">${marketBoard.count }</td>
		</tr>

		<tr>
			<td align="center" height="20" width="125">작성자</td>
			<td align="center" height="20" width="125">${marketBoard.artist_id}</td>

			<td align="center" height="20" width="125">작성일</td>
			<td align="center" height="20" width="125">
			<fmt:formatDate
					value="${marketBoard.register_date}" type="date" /></td>
		</tr>

		<tr>
			<td align="center" height="200" width="125">글내용</td>
			<td valign="top" height="200" colspan="3">${marketBoard.content }</td>
		</tr>
		
		
			<tr>
				<td align="center" height="20" width="125">파일명</td>
				<td colspan="3">
				
				<div id="map" style="width:300px;height:300px;"></div>
				${marketBoard.address}
				</td>
				 
				</td>
			</tr>
		

		<tr>
			<td height="30" colspan="4" align="center"><input type="button"
				value="글수정"
				onclick="javascript:placeBoardUpdate('${marketBoard.board_num}','${pageNumber}')" />
				<input type="button" value="글삭제"
				onclick="javascript:placeBoardDelete('${marketBoard.board_num}','${pageNumber}','${marketBoard.artist_id}')"/>
				<!-- onclick="delFun('${root}','${marketBoard.board_num}','${pageNumber}','${marketBoard.artist_id}')" />  -->
				<input type="button" value="글목록"
				onclick="javascript:enterPlaceBoard('${root}','${pageNumber}')" />
			</td>
		</tr>
	</table>
	<!-- ---------------한줄댓글 ----------------------------------------------->

	${marketBoard.board_num }
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<div>한줄 댓글이 가능합니다.</div>
	<br/>
	
	<div>
		<input id="writeId" type="text" name="artist_id"  size="7" />
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
		
</body>
</html>