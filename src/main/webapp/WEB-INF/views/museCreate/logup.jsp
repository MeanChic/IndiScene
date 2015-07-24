<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%-- <c:set var="artist_id"  value="indi"/> --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="${root}/css/jquery-ui.css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
</head>
<body>
<script type="text/javascript">
	$(function(){
		var root = $("#root").val();
		$("input[name='check']").click(function(){
			
			var name=$("input[name='muse_name']").val();
			var sendData= "muse_name=" + name;
			var url = root + "/museCreate/nameCheck.do?" + sendData;
			
			//alert(url);
			 $.ajax({
				url:url,
				type:"get",
				dataType:"text",
				success:function (data){
					if(data == "0"){
						alert("사용 가능한 muse 이름입니다.");
					}else{
						alert("사용 할수 없는 muse 이름 입니다.");
						$("input[name='muse_name']").val("");
					}
				}
			}); 
		});
		
		$("input[id='file']").click(function(){
			if(window.File && window.FileList && window.FileReader)
		    {
		        var filesInput = this;
		        filesInput.addEventListener("change", function(event){
		            var files = event.target.files; //FileList object
		            var output = document.getElementById("result");
		            
		             for(var i = 0; i< files.length; i++)
		            {
		                var file = files[i];
		                 if(!file.type.match('image'))
		                   continue;	               
		                var picReader = new FileReader();		                
		                picReader.addEventListener("load",function(event){		                    
		                    var picFile = event.target;		                    
		                    var div = document.createElement("div");		                    
		                    div.innerHTML = "<img name='img' class='thumbnail' src='" + picFile.result + "'" +"title='" + picFile.name + "'/>";
		                    output.insertBefore(div,null);            
		           		});
		                 picReader.readAsDataURL(file); 
		            }                                   
		        });
		    }
		    else
		    {
		        console.log("Your browser does not support File API");
		    }
		});
	});	
	
</script>
<input type="hidden" id="root" value="${root}"/>
<input type="hidden" id="artist_id" value="${artist_id}"/>
	<c:if test="${check != null}">
		<c:if test="${check=='1'}">
			<script type="text/javascript">
				
				location.href=$("#root").val()+"/museCreate/musemain.do?artist_id="+$("#artist_id").val();
			</script>
		</c:if>
	</c:if>
<div id="templateBase">
	<h3>Create Muse</h3>
	<form enctype="multipart/form-data" method="post" id="museMakeForm"><%-- action="${root}/museCreate/logup.do"  --%>
		<input type="hidden" name="artist_id" value="${artist_id}"/>
		<div class="marketBoardX-location02">
			<a class="marketBoardAttribute01 btn btn-default" href="javascript:indimuse('${artist_id}')">MuseList</a>
		</div>		
		<div class="form-controlMarket">
			<label class="subject label-color">ID</label>
		    <div class="form-inlineblock">
				<input id="artist_id" class="form-inlineblock form-controller320" type="text" name="muse_name"/>
				<input class="form-inlineblockButton form-controller220" type="button" name="check" value="Duplicate Check"/>
			</div>
		</div>
		<div class="form-controlMarket">
			<label class="subject label-color">Muse Emblem</label>
			<div class="form-inlineblock">
				<input class="form-inlineblock form-controller320" type="file" name="file" id="file" accept="image/*"/>
			</div>
		</div>		
		<div class="form-controlMarket" >
			<label class="label-color marketBoardY-location01">Comment</label>
			<div class="form-inlineblock marketBoardSize80">
				<textarea name="muse_comment" class="instants12"></textarea>
				<script>
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
				</script>
			</div>
		</div>
		<div class="form-controlMarket" >
			<label class="label-color marketBoardY-location01">Emblem</label>
			<div class="form-inlineblock marketBoardSize80">
				<output id="result" class="marketBoardSize03"></output>
			</div>
		</div>
		
		<div class="form-controlMarket" style= text-align:center;>
			<div class="marketBoardInterval04">
				<input class="btn btn-default" type="button" onclick="createMuse()" value="Submit">
				<input class="btn btn-default" type="reset" value="Reset"/>
			</div>
		</div>	
	</form>
</div>
</body>
</html>