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
	<%-- <script type="text/javascript" src="${root}/js/recorderjs/recorderInit.js"></script>
	<script type="text/javascript" src="${root}/js/recorderjs/recorder.js"></script> --%>
		"board_num" , ${board.board_num}<br/>
		"group_num" , ${board.group_num}<br/>
		"seq_num" , ${board.seq_num}	<br/>
		"seq_level" , ${board.seq_level}<br/>
		"artist_id",${artist_id}		<br/>
	<form action="${root}/uploadBoard/collabo.do"  method="post" enctype="multipart/form-data" id="uploadWriteForm">	
		<input type="hidden" value="${artist_id}" name="artist_id"/>
		<input type="hidden" value="${board.board_num}" name="board_num"/>
		<input type="hidden" value="${board.group_num}" name="group_num"/>
		<input type="hidden" value="${board.seq_num}" name="seq_num"/>
		<input type="hidden" value="${board.seq_level}" name="seq_level"/>
		<input type="hidden" value="${board.image_path}" name="image_path"/>
		
		<span>제목</span><input class="collaboSubject" value="${board.subject}" type="text" disabled="disabled"/>
		<input type="hidden" value="${board.subject}" class="collaboSubject" name="subject"/>
		<c:if test="${board.seq_level==0}">
			<script>
				$(".collaboSubject").val("[Collabo]"+$(".collaboSubject").val()+" feat."+$("input[name='artist_id']").val());
			</script>
		</c:if>
		<c:if test="${board.seq_level!=0}">
			<script>
				$(".collaboSubject").val("[Collabo]"+$(".collaboSubject").val()+", "+$("input[name='artist_id']").val());
			</script>
		</c:if>
		 <br/><br/>
		
		<span>커버사진</span><input type="file" id="coverImage" name="coverImage" accept="image/*"/>
		<input type="button" value="파일업로드" id="fileBtn"/><input type="button" value="녹음" id="recordBtn"/>
		<span id="musicInputArea" style="display:none;"><span>음악파일</span><input type="file" id="musicFile" name="musicFile" accept="audio/*"/></span>
		<span id="recordInputArea" style="display:none;"><span>녹음파일</span><a href="javascript:record('${artist_id}','${root}')" id="recordButton"><img style="width:3%; height: 3%;" src="${root}/resources/uploadBoard/Mic.jpg"/></a>
		<span id="recordBox" style="display:none;position:relative; float:none;"><img src="${root}/resources/uploadBoard/recB.png" id="recordToggleImg" onclick="toggleRecording(this)"/></span></span>
		
		<script type="text/javascript">
			$("#fileBtn").click(function(){
				$("#recordBtn").css("display","none");
				$(this).css("display","none");
				$("#musicInputArea").css("display","block");
			});
			
			$("#recordBtn").click(function(){
				$("#fileBtn").css("display","none");
				$(this).css("display","none");
				$("#recordInputArea").css("display","block");
			});
		</script>
		
		<br/><br/>
		<div><span>장르</span><input type="radio" name="genre" value="1"/>락<input type="radio" name="genre" value="0"/> 발라드 <input type="radio" name="genre" value="2"/> 힙합</div>	
		<span>내용</span><textarea rows="20" cols="100" name="content" id="content"></textarea><br/><br/>
		<script type="text/javascript">
			CKEDITOR.replace( 'content',
					 {///IndiScene_basic/src/main/webapp/resources/ckfinder
					 	filebrowserUploadUrl: '${root}/marketBoard/imageUpload.do' // 파일 업로드를 처리 할 경로 설정.
					 });
		</script>
		<br/><br/>
		
		<div>
			<input type="button" id="prevListen" value="미리듣기"/>
			<input type=button value="글쓰기" onclick="javascript:uploadCollaboOk('${root}','${board.board_num}','${pageNumber}')"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="uploadList('${root}','1')"/>
		</div>
		<input type="hidden" name="recordFile" id="uploadPath" value=""/>
		<input type="hidden" name="originalFile" id="originalMusicPath" value="${root}${board.file_path}"/> 
		<input type="hidden" name="mergeFile" id="mergeFile" value=""/>
		싱크 : <input type="number" value="0.0" min="-15.0" max="15.0" name="sync" style="width:100px;"/>
	</form>
	
	<div id="syncControl" style="display:none;">
		<input type="button" id="playCollabo" value="듣기"/><br/>
	<!-- 	원곡<input type="button" id="originalVolumeUp" value="↑"/><input type="button" id="originalVolumeDown" value="↓"/><br/>
		추가곡<input type="button" id="extraVolumeUp" value="↑"/><input type="button" id="extraVolumeDown" value="↓"/><br/>
		싱크 <input type="text" value="0.0" max="15" min="-15" id="syncController"/>
			<input type="hidden" value="0.0" max="15" min="-15" id="syncSave"/> -->
	</div>
	
	<input type="button" value="콜라보적용" id="syncAdopt"/>
	<input type="hidden" id="root" value="${root}"/>
	<input type="button" onclick="validValueCheck('uploadWriteForm')" value="테스트"/>
	<script type="text/javascript">
		prepareCollabo();
	</script>
	</div>
</body>
</html>
