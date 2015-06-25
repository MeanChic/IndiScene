<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
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
	${pageNumber}<br/>${board.register_date}<br/>
	${board.subject}<br/>
	${board.artist_id}<br/>
	${board.content}<br/>
	${board.d_day}<br/>
	${board.count}<br/>
	
	<c:forEach var="path1" items="${path}">
		<img  width="142" height="83" src="${root}/${path1}">
	</c:forEach> 
	
	<input type="hidden" id="address" value="${board.zipcode} ${board.address}"/>
	<input type="hidden" id="date" value="${date }" name="d_day"/>
	<br/><br/>
    
    ${board.zipcode} ${board.address}
    <br/><br/>
    <div id="map_canvas" style="width:50%; height:50%"></div>
    
    <div id="datepicker"></div>
</body>
</html>