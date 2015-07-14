<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="artist_id" value="indi"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <script type="text/javascript" src="${root}/js/recorderjs/recorderInit.js"></script>
	<script type="text/javascript" src="${root}/js/recorderjs/recorder.js"></script> --%>
		"board_num" , ${board_num}
		"group_num" , ${group_num}
		"seq_num" , ${seq_num}
		"seq_level" , ${seq_level}
	
	<form action="${root}/uploadBoard/write.do"  method="post" enctype="multipart/form-data" id="uploadWriteForm">	
		<input type="hidden" value="${artist_id}" name="artist_id"/>
		<input type="hidden" value="${board_num}" name="board_num"/>
		<input type="hidden" value="${group_num}" name="group_num"/>
		<input type="hidden" value="${seq_num}" name="seq_num"/>
		<input type="hidden" value="${seq_level}" name="seq_level"/>
		
		<span>제목</span><input id="subject" name="subject" type="text"/> <br/><br/>
		<span>일시</span><br/>
		<span>커버사진</span><input type="file" id="coverImage" name="coverImage" accept="image/*"/><span>음악파일</span><input type="file" id="musicFile" name="musicFile" accept="audio/*"/><span>녹음파일</span><a href="javascript:record('${artist_id}','${root}')" id="recordButton"><img style="width:3%; height: 3%;" src="${root}/resources/uploadBoard/Mic.jpg"/></a>
		<span id="recordBox" style="display:none;position:relative; float:none;"><img src="${root}/resources/uploadBoard/rec.png" onclick="toggleRecording(this)"/></span><br/><br/>
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
			<audio id="prevAudio" controls src=""></audio>
			<input type=button value="글쓰기" onclick="javascript:uploadWriteOk('${root}')"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="uploadList('${root}','1')"/>
		</div>
		<input type="hidden" name="recordFile" id="uploadPath" value=""/>
	</form>
	
	<input type="hidden" id="root" value="${root}"/>
	<input type="hidden" id="originalMusicPath" value=""/> 
	<input type="button" onclick="test()" value="테스트"/>
	<script type="text/javascript">
		$("#recordBox").css($("#recordButton").css("height"));
		 $("#prevListen").bind("click",function(){
			$("#prevAudio").attr("src",$("#uploadPath").val());
		}); 
		/* $("#prevListen").click(function(){
			window.open('webPlayer.jsp','target_name','scrollbars=yes,toolbar=yes,resizable=yes,width=100,height=100,left=0,top=0');
		}); */
	</script>
</body>
</html>