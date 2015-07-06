<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="artist_id"  value="A"/>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="${root}/css/jquery-ui.css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
<script type="text/javascript">
	function send(){
		//alert("OK");
		form=$("form");
		var artist_id = $("form input[name = 'artist_id']").val();
		var muse_name = $("form input[name = 'muse_name']").val();
		var guest_content = $("form textarea[name = 'guest_content']").val();
		var root = $("#root").val();
		
		var sendData="artist_id="+artist_id+"&muse_name="+muse_name+"&guest_content="+guest_content;
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
					next(muse_name,'1');
					//abc();
				}else{
					alert("아니되어");
				}
				return true;
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
	function next(muse_name, pagenum){
		/* form=$("form");
		var artist_id = $("form input[name = 'artist_id']").val();
		var muse_name = $("form input[name = 'muse_name']").val();
		var guest_content = $("form textarea[name = 'guest_content']").val();*/
		//alert(muse_name + " , " + pagenum);
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
				if(data != null){
					var line = data.split("/");
					var boardnum = Number($("input[name='boardnum']").val());
				
					if(Number(line.length)-1 < (boardnum-1)){
						for(var i = 0; i < line.length-1; i++){
							var up = line[i].split(",");
							var sun = $("#guestline > div:eq("+i+")");
							sun.attr('id',"'"+up[0]+"'");
							for(var j = 0; j < up.length; j++){
								if(j == 0){}else{
									sun.children("span:eq("+(j-1)+")").text(up[j]);
								}
							}
						}
						for(var k = line.length-1; k < boardnum; k++){
							var sun = $("#guestline > div:eq("+k+")");
							sun.attr('style','display:none');
						}
					}else{
						for(var i = 0; i < line.length-1; i++){
							var up = line[i].split(",");
							var sun = $("#guestline > div:eq("+i+")");
							sun.attr('style','display:block');
							sun.attr('id',"'"+up[0]+"'");
							for(var j = 0; j < up.length; j++){
								if(j == 0){}else{
									sun.children("span:eq("+(j-1)+")").text(up[j]);
								}
							}
						}
					}
					var a = Number(pagenum);
					$("input[name='pagenum']").val(a);
					//alert("페이지 넘버: " + $("input[name='pageCount']").val());
					if(a>=2){
						$("#minus").attr('href','javascript:next('+"'"+muse_name+"'"+",'"+(a-1)+"'"+')');
						$("#minus").attr('style','');
						if(a>Number($("input[name='pageCount']").val())){
							$("#plus").attr('style','display:none');
							alert("마지막 페이지 입니다.");
						}else{
							$("#plus").attr('style','');
						}
					}else{
						$("#minus").attr('style','display:none');
						alert("최초 페이지 입니다.");
					}
					$("#plus").attr('href','javascript:next('+"'"+muse_name+"'"+",'"+(a+1)+"'"+')');
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
	
	function update(guest_num, guest_content){
		$("#guestline").find("form").attr('style','display:none');
		$("#guestline").find(".con").attr('style','');
		$("#"+guest_num+">.con").attr('style','display:none');
		$("#"+guest_num+">form>textarea").val(guest_content);
		$("#"+guest_num+">form").attr('style','display:block');
		
		
		
	}
	
	function remo(guest_num){
		$("#"+guest_num+">.con").attr('style','');
		$("#"+guest_num+"> form").attr('style','display:none');
		
	}
</script>
</head>
<body>
	작성자 : ${artist_id} 뮤즈이름:${muse_name}
	<input name = "count" type="hidden" value="${count}"/>
	<input name="boardnum" type="hidden" value="${boardnum}"/>
	<input name="pageCount" type="hidden" value="${count/boardnum}"/>
	<input name="pagenum" type="hidden"/>
	
	<form>
	<input type="hidden" name="muse_name" value="${muse_name}">
	<input type="hidden" name="artist_id" value="${artist_id}">
	<input type="hidden" id="root" value="${root }"/>
	<textarea name="guest_content" rows="5" cols="30"></textarea>
	<input type="button"  value="전송" onclick="send()"/>
	</form>
	
	<div id="guestline">	
		<c:forEach var="guest" items="${list}">
			<div id = "${guest.guest_num}">
				<span> ${guest.artist_id}</span> <span>${guest.guest_date}</span> <br/>
				<span >${guest.muse_name}</span> , <span class="con">${guest.guest_content}</span>
				<form style="display:none"><textarea></textarea><input type="button"  value="전송" onclick="send()"/><input type="button" value="취소" onclick="remo('${guest.guest_num}')"/></form>
				<c:if test="${artist_id == guest.artist_id}">
					<input type="button" value="수정" onclick="update('${guest.guest_num}','${guest.guest_content}')"/>
					<input type="button" value="삭제" onclick="delete('${guest.guest_num}')"/>
				</c:if>
			</div>
		</c:forEach>
	</div>
	
	<c:if test="${count > 0}">
			<%-- <c:set var="pageBlock" value="${3}"/>
			
			<fmt:parseNumber var="rs" value="${(pagenum-1)/pageBlock}" integerOnly="true"/>
			
			<c:set var="startPage" value="${rs*pageBlock+1}"/>
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			
			<c:set var="pageCount" value="${count/boardnum+(count%boardnum==0 ? 0:1)}"/>
			
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if> --%>
			
			<c:if test="${pagenum != '1'}">
				<a style=""href="javascript:next('${muse_name}','${pagenum-1}')">[이전]</a>
			</c:if>
			
		<%-- 	<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="javascript:next('${muse_name}','${i}')">[${i}]</a>
			</c:forEach>
	 --%>
			<c:if test="${count > 0}">
				<a id="minus" style="display:none" href="javascript:next('${muse_name}','${pagenum-1}')">[이전]</a>
				<a id="plus" href="javascript:next('${muse_name}','${pagenum+1}')">[다음]</a>
			</c:if>
		</c:if>
	
</body>
</html>