<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="${root}/js/jquery.js"></script>
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true">
    </script>
   
    <script type="text/javascript">
    $(function(){
      function initialize() {
        var mapOptions = {
          center: new google.maps.LatLng(36.5240220, 126.9265940),
          zoom: 20,
          mapTypeId: google.maps.MapTypeId.ROADMAP   
        };
        var map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions);
        var marker = new google.maps.Marker({
    		position: new google.maps.LatLng(36.5240220, 126.9265940),
    		map: map,
    		title: 'Hello World!'
    	});
      }
      
      google.maps.event.addDomListener(window, 'load', initialize);
/*       function loadScript() {
    	  var script = document.createElement('script');
    	  script.type = 'text/javascript';
    	  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
    	      '&signed_in=true&callback=initialize';
    	  document.body.appendChild(script);
    	}

    	window.onload = loadScript; */
    });
    </script>
</head>
<body>
	${pageNumber}
	${board.subject}
	
	<a href="http://maps.googleapis.com/maps/api/geocode/json?address=${board.zipcode} ${board.address}&sensor=true">서울시 강남구 역삼 1동</a>
  	<input type="button" value="클릭" onclick="initialize()"/>
    <div id="map_canvas" style="width:50%; height:50%"></div>
    
    
</body>
</html>