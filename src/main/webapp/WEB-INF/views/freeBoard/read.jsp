<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<c:set var="root" value="${pageContext.request.contextPath }"/>

<html>
<title>FreeBoard Read</title>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/freeBoard.css"/>
<script type="text/javascript">

function replyFun(root, board_num, group_num, seq_num, seq_level, pageNumber){
	$.ajax({
		url:root+"/freeBoard/read.do",
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

	/* function replyFun(root, board_num, group_num, seq_num, seq_level, pageNumber){
		var url=root + "/freeBoard/write.do?board_num="+board_num;
		url+="&group_num="+group_num +"&seq_num="+seq_num+"&seq_level="+seq_level+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	}
	
	
	function deleteFun(root, board_num, pageNumber){
		var url=root + "/freeBoard/delete.do?board_num="+board_num+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	}
	
	function updateFun(root, board_num, pageNumber){
		var url=root + "/freeBoard/update.do?board_num="+board_num+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	} */
</script>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 읽기</title>

</head>
<body>
	<table border="1" width="510" cellpadding="2"  cellspacing="0" align="center">
		<tr>
			<td align="center"  height="20" width="125">글번호</td>
			<td align="center"  height="20" width="125" >${freeBoard.board_num }</td>
			
			<td align="center"  height="20" width="125">조회수</td>
			<td align="center"  height="20" width="125" >${freeBoard.count }</td>
		</tr>
		
		<tr>
			<td align="center"  height="20" width="125">작성자</td>
			<td align="center"  height="20" width="125" >${freeBoard.artist_id }</td>
			<td align="center"  height="20" width="125">작성일</td>
			<td align="center"  height="20" width="5"><fmt:formatDate value="${freeBoard.register_date }" type="date"/></td>
		</tr>
		
		<tr>
			<td align="center"  height="200" width="125">글내용</td>
			<td valign="top"  height="200" colspan="3">${freeBoard.content }</td>
		</tr>
		
		<tr>
			<td height="30" colspan="4" align="center">
				<input type="button" value="글수정" onclick="updateFun('${root}','${freeBoard.board_num }', '${pageNumber}')" />
				<input type="button" value="글삭제" onclick="deleteFun('${root}','${freeBoard.board_num }', '${pageNumber}')"/>
				<input type="button" value="글목록" onclick="location.href='${root}/freeBoard/list.do?pageNumber=${pageNumber}'"/>
			</td>
		</tr>
	</table>
</body>
</html>