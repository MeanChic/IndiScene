<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/freeBoard.css"/>
<script type="text/javascript">

function write(root){
	$.ajax({
		url:root+"/freeBoard/write.do",
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			var realData = realData[1].split("</body>")[0];
			//alert(realData);
			$("#content").html(realData);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	}); 
}

function list(root){
	$.ajax({
		url:root+"/notice/list.do",
		type:"get",
		dataType:"html",
		success:function(data){
			//alert(data);
			var realData = data.split("<body>");
			var realData = realData[1].split("</body>")[0];
		//	alert(realData);
			$("#content").html(realData);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	}); 
}
</script>
</head>
<body>
<%-- 
	<a href="${root}/test.do">테스트</a>
	 --%>
	
	<div id="container">
      <div id="header">
        <h1>NoticeBoard</h1>
      	<a href="javascript:write('${root }')">공지사항쓰기</a>
		&nbsp;&nbsp;&nbsp;
		<a href="javascript:list('${root }')">공지사랑 목록보기</a>
      </div>
      
      <div id="content">
        <h2>Content</h2>	
        </div>
      <div id="sidebar">
        <h2>Sidebar</h2>
        <ul>
          <li>광고</li>
          <li>광고</li>
          <li>광고</li>
        </ul>
      </div>
      <div id="footer">
        <p>Copyright</p>
      </div>
    </div>
	
	</div>
</body>
</html>