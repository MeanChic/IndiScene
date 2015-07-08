<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert Freeboard</title>
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
			url:root+"/freeBoard/list.do",
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
	
	<h3>자유게시판</h3>
	
	<a href="javascript:write('${root }')">자유게시판 글쓰기</a>
	<br/><br/>
	<a href="javascript:list('${root }')">자유게시판 목록보기</a>
	<div id="content"></div>

	=============================================
	
	 <a href="${root }/freeBoard/write.do">글쓰기</a> 
	<br/>
	<a href="${root }/freeBoard/list.do">목록보기</a>
	
	==========================================================================
		
	 --%>
	<div id="container">
      <div id="header">
        <h1>FreeBoard</h1>
      	<a href="javascript:write('${root }')">자유게시판 글쓰기</a>
		&nbsp;&nbsp;&nbsp;
		<a href="javascript:list('${root }')">자유게시판 목록보기</a>
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
	
	

</body>
</html>