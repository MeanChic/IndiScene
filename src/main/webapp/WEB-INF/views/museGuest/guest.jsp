<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="artist_id"  value="indi"/>
<%-- <c:set var="artist_id"  value="indi"/> --%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="${root}/css/jquery-ui.css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
<script type="text/javascript">
	function guestSend(){
		alert("OK");
		//form=$("form");
		var artist_id = $("form input[name = 'artist_id']").val();
		var muse_name = $("form input[name = 'muse_name']").val();
		var guest_content = $("form textarea[name = 'guest_content']").val();
		var root = $("#root").val();
		
		var sendData="artist_id="+artist_id+"&muse_name="+muse_name+"&guest_content="+guest_content;
		var form = document.getElementById("formtag");
		//alert(sendData);
		var url = root + "/museGuest/guest.do?";
		//alert(url);
		$.ajax({
			url: url,
			type:"post",
			data:sendData,
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			dataType:"text",
			success:function(data){
				//alert(data);
				if(data == "1"){
					alert("입력완료");
					$("form textarea[name='guest_content']").val("");
					guestNext(muse_name,'1');
					//abc();
				}else{
					alert("아니되어");
				}
				
			},
			error:function(xhr, status, error){
				//xhr:XHMLHttpRequest, status 4 20, error
				var arr=new Array();
				arr.push("xhr:" + xhr);
				arr.push("status:" + status);
				arr.push("error: "+error);
				alert(arr);
			}
		});
	
	}
	/* function abc(){
		alert("하하");
	} */
	function guestNext(muse_name, pagenum){
		var root = $("#root").val(); 
		
		var sendData="muse_name="+muse_name+"&pagenum="+pagenum;
		//alert(sendData);
		var url = root + "/museGuest/guest.do?";
		//alert(url);
		$.ajax({
			url: url,
			type:"get",
			data:sendData,
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			dataType:"text",
			success:function(data){
				$("#centerContents").html(data);
				//$("body").html(data);
			},
			error:function(xhr, status, error){
				//xhr:XHMLHttpRequest, status 4 20, error
				var arr=new Array();
				arr.push("xhr:" + xhr);
				arr.push("status:" + status);
				arr.push("error: "+error);
				alert(arr);
			}
		});
	}
	
	function guestUpdate(guest_num, guest_content){
		//alert("OK");
		$("#guestline").find("form").attr('style','display:none');
		$("#guestline").find(".con").attr('style','');
		$("#"+guest_num+">.con").attr('style','display:none');
		$("#"+guest_num+">form>textarea").val(guest_content);
		$("#"+guest_num+">form").attr('style','display:block');
	}
	
	function guestRemo(guest_num){
		$("#"+guest_num+">.con").attr('style','');
		$("#"+guest_num+"> form").attr('style','display:none');	
	}
	
	function guestUpcon(guest_num){
		//alert($("#"+guest_num).children("form").children("textarea").val());
		
		var root = $("#root").val(); 
		var pagenum = $("input[name='pagenum']").val();
		var muse_name = $("input[name='muse_name']").val();
		var sendData="guest_num="+guest_num+"&guest_content="+$("#"+guest_num).children("form").children("textarea").val();
		//alert(sendData);
		var url = root + "/museGuest/update.do?";
		//alert(url);
		$.ajax({
			url: url,
			type:"get",
			data:sendData,
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			dataType:"text",
			success:function(data){
				//alert("OK");
				if(data == "0"){
					alert("수정되지 않았습니다.");
					guestRemo(guest_num);
				}else{
					alert("수정이 완료되었습니다.");
					guestRemo(guest_num);
					guestNext(muse_name, pagenum);
				}
			}
		});
	}
	
	function guestDel(guest_num){
		//alert(guest_num);
		var root = $("#root").val(); 
		var pagenum = $("input[name='pagenum']").val();
		var muse_name = $("input[name='muse_name']").val();
		var sendData="guest_num="+guest_num;
		//alert(sendData);
		var url = root + "/museGuest/delete.do?";
		//alert(url);
		$.ajax({
			url: url,
			type:"get",
			data:sendData,
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			dataType:"text",
			success:function(data){
				//alert("OK");
				if(data == "0"){
					alert("삭제되지 않았습니다.");
					
				}else{
					alert("삭제가 완료되었습니다.");
					guestNext(muse_name, pagenum);
				}
			}
		});
	}
</script>
</head>
<body>
	
	<input name = "count" type="hidden" value="${count}"/>
	<input name="boardnum" type="hidden" value="${boardnum}"/>
	<input name="pageCount" type="hidden" value="${count/boardnum}"/>
	<input name="pagenum" type="hidden" value="${pagenum }"/>
	
	<form> <!-- style="width:40%; height:180px; display:block; border:solid 1px black;" -->
		<span>작성자 : ${artist_id}</span> <span style="align:right;">뮤즈이름:${muse_name}</span>
		<input type="hidden" name="muse_name" value="${muse_name}">
		<input type="hidden" name="artist_id" value="${artist_id}">
		<input type="hidden" id="root" value="${root }"/>
		<textarea name="guest_content" rows="8" cols="50" ></textarea>
		<input type="button"  value="전송" onclick="guestSend()"/>
	</form>
	<br/><br/><br/><br/>
	<div id="guestline" >	
		<c:forEach var="guest" items="${list}">
			<div id = "${guest.guest_num}">
				<c:if test="${artist_id == guest.artist_id}">
					<%-- <input type="button" value="수정" onclick="update('${guest.guest_num}','${guest.guest_content}')"/>
					<input type="button" value="삭제" onclick="delete('${guest.guest_num}')"/> --%>
					<a href="javascript:guestUpdate('${guest.guest_num}','${guest.guest_content}')">수정</a>
					<a href="javascript:guestDel('${guest.guest_num}')">삭제</a>
				</c:if>
				<span> ${guest.artist_id}</span> <span>${guest.guest_date}</span> <br/>
				<span >${guest.muse_name}</span> , <span class="con">${guest.guest_content}</span>
				<form style="display:none"><textarea></textarea><input type="button"  value="수정하기" onclick="guestUpcon('${guest.guest_num}')"/><input type="button" value="취소" onclick="guestRemo('${guest.guest_num}')"/></form>
				
			</div>
		</c:forEach>
		
		<c:if test="${count < boardnum}">
			<c:forEach var="i" begin="${count+1}" end="${boardnum}">
			<div>
				<c:if test="${artist_id == guest.artist_id}">
					<%-- <input type="button" value="수정" onclick="update('${guest.guest_num}','${guest.guest_content}')"/>
					<input type="button" value="삭제" onclick="delete('${guest.guest_num}')"/> --%>
					<a href="javascript:guestUpdate()">수정</a>
					<a href="javascript:guestDel()">삭제</a>
				</c:if>
				<span></span> <span></span> <br/>
				<span ></span> , <span class="con"></span>
				<form style="display:none"><textarea></textarea><input type="button"  value="수정하기" onclick="guestUpcon()"/><input type="button" value="취소" onclick="guestRemo()"/></form>
			</div>
			</c:forEach>
		</c:if>
	</div>
	
	<%-- <c:if test="${count/boardnum > 1}">
		<c:if test="${pagenum != '1'}">
			<a style=""href="javascript:guestNext('${muse_name}','${pagenum-1}')">[이전]</a>
		</c:if>
	
		<c:if test="${count > 0}">
			<a id="minus" style="display:none" href="javascript:guestNext('${muse_name}','${pagenum-1}')">[이전]</a>
			<a id="plus" href="javascript:guestNext('${muse_name}','${pagenum+1}')">[다음]</a>
		</c:if>
	</c:if> --%>
	
	<c:if test="${count>0 }">
	
				 
				<c:set var="pageBlock" value="${5}"/>
				<c:set var="pageCount" value="${count/boardnum+(count%boardnum==0 ? 0:1 )}"/>
				
				<fmt:parseNumber var="rs" value="${(pagenum-1)/pageBlock }" integerOnly="true"/>
				<c:set var="startPage" value="${rs*pageBlock+1 }"/>
				<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
				
				<c:if test="${endPage> pageCount }">
					<c:set var="endPage" value="${pageCount }"/>
				</c:if>
				
				<c:if test="${startPage>pageBlock }">
					<a href="javascript:guestNext('${muse_name}','${startPage-pageBlock}')">[이전]</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href="javascript:guestNext('${muse_name}','${i}')">[${i}]</a>
				</c:forEach>
				
				<c:if test="${endPage<pageCount }">
					<a href="javascript:guestNext('${muse_name}','${startPage+pageBlock}')">[다음]</a>
				</c:if>
				
				<br/>
			</c:if>
	
</body>
</html>
