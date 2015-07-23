<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%-- <c:set var="artist_id" value="indi"/> --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="uploadCollabo">
	<input type="hidden" id="root" value="${root}"/>
	<h3>Collaboration</h3>
	<%-- <script type="text/javascript" src="${root}/js/recorderjs/recorderInit.js"></script>
	<script type="text/javascript" src="${root}/js/recorderjs/recorder.js"></script> --%>
	<form action="${root}/uploadBoard/collabo.do"  method="post" enctype="multipart/form-data" id="uploadWriteForm">	
		<input type="hidden" value="${artist_id}" name="artist_id"/>
		<input type="hidden" value="${board.board_num}" name="board_num"/>
		<input type="hidden" value="${board.group_num}" name="group_num"/>
		<input type="hidden" value="${board.seq_num}" name="seq_num"/>
		<input type="hidden" value="${board.seq_level}" name="seq_level"/>
		<input type="hidden" value="${board.image_path}" name="image_path"/>
		<input type="hidden" value="${board.subject}" class="collaboSubject" name="subject"/>
		<c:if test="${board.seq_level==0}">
			<script>
				$(".collaboSubject").val("[Collabo]"+$(".collaboSubject").val()+" feat."+$("input[name='artist_id']").val());
			</script>
		</c:if>
		<c:if test="${board.seq_level!=0}">
			<script>
				$(".collaboSubject").val($(".collaboSubject").val()+", "+$("input[name='artist_id']").val());
			</script>
		</c:if>
		<div class="marketBoardX-location02">
			<a class="marketBoardAttribute01 btn btn-default" href="javascript:uploadList('${root}','1')">List</a>
		</div>
		<div class="form-controlMarket">
			<label class="subject label-color">Subject</label>
			<div class="form-inlineblock">
				<input id="subject" class="form-controller320 collaboSubject" type="text" size="50" name="제목" value="${board.subject}" disabled="disabled"/>
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
		<!------- Sync ------->
		<div class="form-controlMarket">
			<label class="subject label-color">Sync Control</label>
			<div class="form-inlineblock">
				<input type="number" class="form-inlineblock form-controller320" value="0.0" min="-15.0" max="15.0" name="sync"/>
				<input type="button" class="form-inlineblockButton form-controller320" value="Apply" id="syncAdopt"/>
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
				<input class="btn btn-default" type="button" value="Collaboration" onclick="javascript:uploadCollaboOk('${root}','${board.board_num}','${pageNumber}')">
				<input class="btn btn-default" type="reset" value="Reset"/>
			</div>
		</div>
		<input type="hidden" name="recordFile" id="uploadPath" value=""/>
		<input type="hidden" name="originalFile" id="originalMusicPath" value="${root}${board.file_path}"/> 
		<input type="hidden" name="mergeFile" id="mergeFile" value=""/>
	</form>

	<div id="syncControl" style="display:none;">
		<input type="button" id="playCollabo" value="듣기"/><br/>
	<!--<input type="button" id="originalVolumeUp" value="↑"/><input type="button" id="originalVolumeDown" value="↓"/>원곡<br/>
		<input type="button" id="extraVolumeUp" value="↑"/><input type="button" id="extraVolumeDown" value="↓"/>추가곡<br/>
		<input type="text" value="0.0" max="15" min="-15" id="syncController"/>싱크 <br/>
		<input type="hidden" value="0.0" max="15" min="-15" id="syncSave"/>-->
	</div>
	<script type="text/javascript">
		prepareUploadCollabo();
	</script>
</div>
</body>
</html>
