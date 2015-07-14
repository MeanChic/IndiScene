<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/marketBoard.js"></script>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script src="${root }/js/jquery.MultiFile.js" type="text/javascript" ></script>
<script src="${root }/resources/ckEditor/ckeditor.js"></script>

<script src="${root }/resources/xhr/xhr.js" type="text/javascript" ></script>
<script src="${root }/js/reply.js" type="text/javascript" ></script>

</head>
<body>

<a href="${root}/Copy of marketBoard/enterBoard.do">거래게시판 들어가기(ajax적용X)&nbsp;&nbsp;&nbsp;</a>
	<a href="javascript:enterMarketBoard('${root}')">거래게시판 들어가기 (ajax적용 O)</a>
	<div id="centerContents"><h1>center</h1></div>
	


</body>
</html>