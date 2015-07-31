<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html >
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert Freeboard</title>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/freeBoard.js"></script>
<script src="${root }/resources/ckEditor/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/freeBoard.css"/>
<script src="${root }/resources/xhr/xhr.js" type="text/javascript" ></script>
<script src="${root }/js/reply.js" type="text/javascript" ></script>

</head>
<body onload="javascript:freeBoardList('${root }','1')">
<nav></nav>
	<div id="container">
      <div id="header">
        <h1>FreeBoard</h1>
      	<a href="javascript:write('${root }')">자유게시판 글쓰기</a>
      	<%-- <a href="${root}/freeBoard/write.do">자유게시판 글쓰기</a> --%>
		&nbsp;&nbsp;&nbsp;
		<a href="javascript:freeBoardList('${root }','1')">자유게시판 목록보기</a>
      </div>
      
      <div id="centerContents">
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