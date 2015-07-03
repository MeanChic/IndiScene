<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="artist_id"  value="A"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="${root}/css/jquery-ui.css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		var root = $("#root").val();
		$("input[name='check']").click(function(){
			
			var name=$("input[name='muse_name']").val();
			var sendData= "muse_name=" + name;
			var url = root + "/museCreate/nameCheck.do?" + sendData;
			
			alert(url);
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
</head>
<body>
<input type="hidden" id="root" value="${root}"/>
<form action="${root}/museCreate/logup.do" enctype="multipart/form-data" method="post">
	<input type="hidden" name="artist_id" value="${artist_id}"/>
	Muse Name : <input type="text" name="muse_name"/><input type="button" name="check" value="중복확인"/><br/><br/>
	Muse 설명 : <textarea rows="10" cols="20" name="muse_comment"></textarea><br/><br/>
	Muse Emblem : <input type="file" name="file" id="file"/>
	<output id="result"></output>

	<input type="submit">
	<input type="reset"/>
</form>
</body>
</html>