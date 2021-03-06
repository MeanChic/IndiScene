<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div id="uploadUpdate">
	<h3>Indi's Music Update</h3>
	<form method="post" enctype="multipart/form-data" id="uploadWriteForm">	
		<input type="hidden" value="${board.artist_id}" name="artist_id"/>
		<input type="hidden" value="${board.board_num}" name="board_num"/>
		<input type="hidden" value="${board.group_num}" name="group_num"/>
		<input type="hidden" value="${board.seq_num}" name="seq_num"/>
		<input type="hidden" value="${board.seq_level}" name="seq_level"/>
		<input type="hidden" value="${pageNumber}" name="pageNumber"/>
		<div class="marketBoardX-location02">
			<a class="marketBoardAttribute01 btn btn-default" href="javascript:uploadList('${root}','1')">List</a>
		</div>
		<div class="form-controlMarket">
			<label class="subject label-color">Subject</label>
			<div class="form-inlineblock">
				<input id="subject" class="form-controller320" type="text" size="50" name="subject" value="${board.subject}"/>
			</div>
		</div>	
		<div class="form-controlMarket">
			<label class="subject label-color">Cover Image</label>
			<div class="form-inlineblock">
				<input type="file" id="coverImage" class="form-controller320" name="coverImage" accept="image/*"/>
			</div>
		</div>
		<div class="form-controlMarket">
			<label class="subject label-color">Music File</label>
			<div class="form-inlineblock" id="MusicFileUploadButton">
				<input class="form-inlineblockButton form-controller320" type="button" value="File Upload" id="fileBtn"/>
				<input class="form-inlineblockButton form-controller320" type="button" value="Record" id="recordBtn"/>
			</div>
			<div class="form-inlineblock" id="musicInputArea" style="display:none;">
				<input class="form-controller320" type="file" id="musicFile" name="musicFile" accept="audio/*"/>
			</div>
			<div class="form-inlineblock" id="recordInputArea" style="display:none;">
				<a class="btn btn-info form-inlineblockButton form-controller320" href="javascript:record('${artist_id}','${root}')" id="recordButton">
					<span class="glyphicon glyphicon-record">&nbsp;&nbsp;Record</span>
				</a>
				<input class="form-inlineblockButton form-controller320" type="button" id="prevListen" value="Beforehand listening"/>
				<div class="marketBoardAttribute01" id="recordBox" style="display:none;">
					<img src="${root}/resources/uploadBoard/recB.png" id="recordToggleImg"/>
				</div>
			</div>
		</div>		
		<script type="text/javascript">
			$("#fileBtn").click(function(){
				$("#MusicFileUploadButton").css("display","none");
				$("#musicInputArea").css("display","inline-block");
			});
			
			$("#recordBtn").click(function(){
				$("#MusicFileUploadButton").css("display","none");
				$("#recordInputArea").css("display","inline-block");
				recorderSetting();
			});
		</script>
		<!------- Audioar ------->
		<div id="Recordbars" class="form-controlMarket">
			<label class="subject label-color marketBoardY-location01">Audio</label>
			<div class="form-inlineblock">
				<audio class="instants07" id="prevAudio" controls src=""></audio>
			</div>
		</div>
		<!------- Genre CheckBox ------->
		<div class="form-controlMarket">
			<label class="subject label-color">Genre</label>
			<div class="form-inlineblock">
				<input class="form-controller60" type="radio" name="genre" value="1"/><label class="label-color">Rock</label>
				<input class="form-controller60" type="radio" name="genre" value="0"/><label class="label-color">Ballad</label>
				<input class="form-controller60" type="radio" name="genre" value="2"/><label class="label-color">Hiphop</label>
				<input type="hidden" name="genre_code" value=""/>
			</div>
		</div>
		<div class="form-controlMarket" >
			<label class="label-color marketBoardY-location01">Contents</label>
			<div class="form-inlineblock marketBoardSize80">
				<textarea id="content" name="content">${board.content}</textarea>		
				<script type="text/javascript">
				CKEDITOR.replace( 'content',
					 {///IndiScene_basic/src/main/webapp/resources/ckfinder
					 	filebrowserUploadUrl: '${root}/marketBoard/imageUpload.do' // 파일 업로드를 처리 할 경로 설정.
					 });
				</script>
			</div>
		</div>
		<div class="form-controlMarket" style= text-align:center;>
			<div class="marketBoardInterval04">
				<input class="btn btn-default" type="button" value="Modify" onclick="javascript:uploadUpdateOk('${root}')">
				<input class="btn btn-default" type="reset" value="Reset"/>
			</div>
		</div>
		
		<input type="hidden" id="root" value="${root}"/>
		<input type="hidden" id="uploadPath" value=""/>
		<input type="hidden" id="originalMusicPath" value="${board.file_path}"/> 
	</form>
		<script type="text/javascript">
			$("#recordBox").css($("#recordButton").css("height"));
			 $("#prevListen").bind("click",function(){
				$("#prevAudio").attr("src",$("#uploadPath").val());
			}); 
			/* $("#prevListen").click(function(){
				window.open('webPlayer.jsp','target_name','scrollbars=yes,toolbar=yes,resizable=yes,width=100,height=100,left=0,top=0');
			}); */
		</script>
</div>
</body>
</html>