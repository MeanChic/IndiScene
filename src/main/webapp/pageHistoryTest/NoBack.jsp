<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#btn1').add('#btn2').add('#btn3').bind('click', function(e) {
		showPage($(this).val());
	});
});

function showPage(value) {
	$("#display").html(value);
}
</script>
</head>
<body>

<div id="display"></div>
<input type="button" value="1" id="btn1">&nbsp;
<input type="button" value="2" id="btn2">&nbsp;
<input type="button" value="3" id="btn3">&nbsp;
<br/>
<br/>
<br/>
<a href="http://www.google.com">Google :)</a>

</body>
</html>