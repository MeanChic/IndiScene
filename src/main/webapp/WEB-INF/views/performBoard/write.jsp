<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<%-- <script src="${root }/resources/ckEditor/ckeditor.js"></script>
<script src="${root }/resources/ckfinder/ckfinder.js"></script>
<script src="${root }/js/jquery.js" type="text/javascript" ></script>
<script src="${root }/js/jquery.MultiFile.js" type="text/javascript" ></script>
<script src="${root }/js/jquery-ui.js" type="text/javascript" ></script>
<script type="text/javascript" src="${root }/css/marketBoard/script.js"></script> --%>
<div id="performanceBoardWrite">
	<form id="marketBoardWriteForm" class="form_style" enctype="multipart/form-data">	
		<input type="hidden" id="folderName" name="folderName" />
		<div class="marketBoardX-location02">
			<a class="marketBoardAttribute01 btn btn-default" href="javascript:enterPerformBoard('${root}','${pageNumber}')">List</a>
		</div>			
		<div class="form-controlMarket">
			<label class="subject label-color">Writer</label>
			<div class="form-inlineblock">
				<input class="form-controller320" type="text" size="50"  name="artist_idDis" value="${artist_id }" disabled="disabled"/>
				<input type="hidden" name="artist_id" value="${artist_id }">
			</div>
		</div>	
		<div class="form-controlMarket">
			<label class="subject label-color">Subject</label>
			<div class="form-inlineblock">
				<input class="form-controller320" type="text" size="50" name="subject"/>
			</div>
		</div>	
		<div class="form-controlMarket" >
			<label class="label-color marketBoardY-location01">Contents</label>
			<div class="form-inlineblock marketBoardSize80">
				<textarea name="content"></textarea>
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
					function datePickerSettingPerform(){
							$( "#datepicker" ).datepicker({
	
						    showOn: "button",
						   // buttonImage: "/images/calendar.gif",
						    buttonImageOnly: false,
						    buttonText: "Select date",
						    changeMonth: true,
						    changeYear: true
						});
					}
					datePickerSettingPerform();
					$("#ui-datepicker-div").appendTo("#centerContents");
		  		</script>
		  	</div>
		</div>	
		<div class="form-controlMarket">
			<label class="subject label-color">Date</label>
			<div class="form-inlineblock">
				<input class="form-controller220" type="text" name="d_day1" id="datepicker">
				<select class="form-controller220" name="hour">
					<c:forEach var="i" begin="00" end="24">
						<c:forEach var="j" begin="0" end="1"> 
							<c:if test="${j==0}">
								<option style="align:right;">${i} : 00</option>
							</c:if>
							<c:if test="${j==1}">
								<option style="align:right;">${i} : 30</option>
							</c:if>
						</c:forEach>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-controlMarket">
			<label class="subject label-color">Address 1</label>
			<div class="form-inlineblock">
				<input type="hidden" name="zipcode" value="">
				<input class="form-inlineblock form-controller320 instants11" type="text" name="zipcode1" />
				<input class="form-inlineblockButton form-controller220" type="button"  value="Search Map" onclick="javascript:performMap()"/>
				<!-- <input class="form-inlineblockButton form-controller220" type="button" value="Zipcode" onclick="javascript:performZipcodeCheck('${root}')"> -->
			</div>
		</div>
		<div class="form-controlMarket">
			<label class="subject label-color">Address 2</label>
			<div class="form-inlineblock">
				<input class="form-inlineblock form-controller220 instants11" type="text" name="address" value="" size="80"/>
				
			</div>
		</div>
		<div class="form-controlMarket" style= text-align:center;>
			<!-- <input type="submit" value="글쓰기" onclick="location.href='${root}/marketBoard/enterBoard.do'"/>  -->
			<div class="marketBoardInterval04">
				<input class="btn btn-default" type="button" value="Write" onclick="javascript:performBoardWriteOk()"/>
				<input class="btn btn-default" type="reset" value="Reset"/>
			</div>
		</div>
	</form>
</div>
</body>
</html>