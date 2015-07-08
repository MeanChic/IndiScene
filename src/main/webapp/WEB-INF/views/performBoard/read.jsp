<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:set var="artist_id" value="indiScene"/>
<html>
<head>
<meta charset="UTF-8">
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
   <link type="text/css" href="${root}/css/jquery-ui.css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
    	//$( "#datepicker" ).datepicker("setDate","24/06/2015");	
    	$( "#datepicker" ).datepicker({
    		defaultDate: $("#date").val()
    	});
    	
      	function initialize() {
    		geocoder = new google.maps.Geocoder();
        	var mapOptions = {
            	center: new google.maps.LatLng(36.5240220, 126.9265940),
				zoom: 15,    
            };
          
    	  	var address = document.getElementById('address').value;
		  	geocoder.geocode( { 'address': address}, function(results, status) {
		    
			if (status == google.maps.GeocoderStatus.OK) {
				map.setCenter(results[0].geometry.location);
		    	var marker = new google.maps.Marker({
		        	map: map,
		       	 	position: results[0].geometry.location
		     	});
		    } else {
		    	alert('Geocode was not successful for the following reason: ' + status);
		    }
		});
		  
        var map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions);
		}
      
		google.maps.event.addDomListener(window, 'load', initialize);
   });
</script>
</head>
<body>
	<a href="${root}/performBoard/write.do">글쓰기</a><a style="margin:0 0 0 600px"href="${root}/performBoard/list.do">리스트로 돌아가기</a>
	<div style="border:solid 1px black; width:700px; margin:100px 0 100px 20px ">
	<span>${pageNumber}</span><span>${board.register_date}</span>
	<div style="border:solid 1px black">${board.subject}</div>
	<div style="border:solid 1px black">${board.artist_id}</div>
	<div style="border:solid 1px black; height:100px;">${board.content}</div>
	${board.d_day}<br/>
	${board.count}<br/>
	
	<c:forEach var="path1" items="${path}">
		<img  width="142" height="83" src="${root}/${path1}">
	</c:forEach> 
	
	<input type="hidden" id="address" value="${board.zipcode} ${board.address}"/>
	<input type="hidden" id="date" value="${date}" name="d_day"/>
	<br/><br/>
    
    ${board.zipcode} ${board.address}
    <br/><br/>
    
    <div id="map_canvas" style="width:300px; height:300px"></div>
    
    <div style="width:300px;" id="datepicker"></div>
	<div style="margin:0 0 0 400px">
	<c:if test="${board.artist_id == artist_id }">
	<input type="button" value="수정" onclick="javascript:location.href='${root}/performBoard/update.do?board_num=${board.board_num}'">
	<input type="button" value="삭제" onclick="javascript:location.href='${root}/performBoard/delete.do?board_num=${board.board_num}'">
	</c:if>
	</div>
	</div>
</body>
</html>