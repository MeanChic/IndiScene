<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<script src="${root }/resources/ckEditor/ckeditor.js"></script>
<script src="${root }/js/jquery.js" type="text/javascript" ></script>
<script src="${root }/js/jquery.MultiFile.js" type="text/javascript" ></script>
</head>
<body>
<div id="performanceBoardUpdate">
	<script type="text/javascript">
	$(function(){
		$( "#datepicker" ).datepicker({
	    showOn: "button",
	    buttonImage: "images/calendar.gif",
	    buttonImageOnly: true,
	    buttonText: "Select date",
	    changeMonth: true,
	    changeYear: true
	    });
		//alert($("input[name='fulladd']").val());
		$("input[name = 'zipcode1']").val($("input[name='fulladd']").val().split("*")[0]);
		$("input[name = 'address']").val($("input[name='fulladd']").val().split("*")[1]); 
	});
	</script>
	<form id="marketBoardUpdateForm" action="javascript:performBoardUpdateOk()" method="post">
		<input type="hidden" name="board_num" value="${board.board_num }"/>
		<input type="hidden" name="pageNumber" value="${pageNumber }"/>
		<div class="marketBoardX-location02">
			<a class="marketBoardAttribute01 btn btn-default" href="javascript:enterPerformBoard('${root}','${pageNumber}')">List</a>
		</div>
		<div class="form-controlMarket">
			<label class="subject label-color">Writer</label>
			<div class="form-inlineblock">
				<input class="form-controller320" type="text" size="50"  name="artist_idDis" value="${board.artist_id}" disabled="disabled"/>
				<input type="hidden" name="artist_id" value="${artist_id }">
			</div>
		</div>	
		<div class="form-controlMarket">
			<label class="subject label-color">Subject</label>
			<div class="form-inlineblock">
				<input class="form-controller320" type="text" size="50" name="subject" value="${board.subject }"/>
			</div>
		</div>	
		<div class="form-controlMarket" >
			<label class="label-color marketBoardY-location01">Contents</label>
			<div class="form-inlineblock marketBoardSize80">
				<textarea name="content">${board.content }</textarea>
				<script >
					var folderName='${pageContext.request.servletPath }';
					folderName=folderName.split("views/");
					folderName=folderName[1].split("/");
					//var id=document.getElementById(folderName);
					//id.value=folderName[0]; //멀티파일폴더 만들때
					$("#folderName").val(folderName[0]);
					//alert(folderName[0])
					 CKEDITOR.replace( 'content',
							 {///IndiScene_basic/src/main/webapp/resources/ckfinder
							 	filebrowserUploadUrl: "${root}/commonIO/imageUpload.do?folderName="+folderName[0] // 이미지 업로드를 처리 할 경로 설정.
							 });
					 $(function(){
							$( "#datepicker" ).datepicker({
						    showOn: "button",
						    buttonImage: "/images/calendar.gif",
						    buttonImageOnly: true,
						    buttonText: "Select date",
						    changeMonth: true,
						    changeYear: true
						});
					});
		  		</script>
		  	</div>
		</div>	
		<div class="form-controlMarket">
			<label class="subject label-color">Date</label>
			<div class="form-inlineblock">
				<input class="form-controller220" type="text" name="d_day1" id="datepicker" value="<fmt:formatDate value="${board.d_day}" pattern="MM/dd/yyyy"/>"/>
				<select class="form-controller220" name="hh">
					<c:forEach var="i" begin="00" end="24"> 
						<option>${i}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<!-- hidden -->
		<input type="hidden" name="fulladd" value="${board.address}"/>
		<input type="hidden" name="zipcode" value="${board.zipcode }">
		<div class="form-controlMarket">
			<label class="subject label-color">Address</label>
			<div class="form-inlineblock">
				<input type="hidden" name="zipcode" value="">
				<input class="form-inlineblock form-controller220" type="text" name="zipcode1"/>
				<input class="form-inlineblockButton form-controller220" type="button" value="Zipcode" onclick="javascript:performZipcodeCheck('${root}')">
			</div>
		</div>
		<div class="form-controlMarket">
			<label class="subject label-color">Subject</label>
			<div class="form-inlineblock">
				<input class="form-inlineblock form-controller220" type="text" name="address" value=""/>
				<input class="form-inlineblockButton form-controller220" type="button"  value="Search Map" onclick="javascript:performMap()"/>
			</div>
		</div>
		<div class="form-controlMarket" style= text-align:center;>
			<!-- <input type="submit" value="글쓰기" onclick="location.href='${root}/marketBoard/enterBoard.do'"/>  -->
			<div class="marketBoardInterval04">
				<input class="btn btn-default" type="button" value="Write" onclick="javascript:performBoardWriteOk()">
				<input class="btn btn-default" type="reset" value="Reset"/>
			</div>
		</div>
	</form>
</div>
</body>
</html>