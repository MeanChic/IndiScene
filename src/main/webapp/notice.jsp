<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	
	function body(){
		
	}
</script>
</head>
<body>

	<a href="${root}/test.do">�׽�Ʈ</a>
	
	<h3>�Խ���</h3>
	
	<a href="${root }/notice/write.do" id="write">�������׾���</a> 
	<br/>
	<a href="${root }/notice/list.do" id="list">�������� ��Ϻ���</a>
	
	<div id="body" style="background:pink; height: 300px; padding: 10px  20px  30px  20px ; " >
		
	h
	</div>
</body>
</html>