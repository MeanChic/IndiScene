<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:set var="artist_id"  value="indiScene"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="${root}/css/jquery-ui.css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
<script type="text/javascript">
	function checkForm(perform){
		//alert("OK");
		$("input[name='d_day1']").val($("input[name='d_day1']").val() + " 12:00")
	}
	
	 $(function (){
		/*$("#file").click(function(){
			if(window.File && window.FileList && window.FileReader)
		    {
		        var filesInput = document.getElementById("file");
		        //$("#result").children().remove();
		        alert("OK1");
		        filesInput.addEventListener("change", function(event){
		            alert("OK");
		            var files = event.target.files; //FileList object
		            var output = document.getElementById("result");
		            
		            for(var i = 0; i< files.length; i++)
		            {
		                var file = files[i];		               
		              	var newFile = document.createElement("input");
		                $(newFile).attr("type","file"); 
		               // $(newFile).val(file);
		               // $("#fileList").append(newFile);
		               //Only pics
		                if(!file.type.match('image'))
		                  continue;		                
		                var picReader = new FileReader();		                
		                picReader.addEventListener("load",function(event){		                    
		                    var picFile = event.target;		                    
		                    var div = document.createElement("div");		                    
		                    div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" +"title='" + picFile.name + "'/>";
		                    $(newFile).val(picFile.result);
		                    $("#firstList").append(newFile);
		                    output.insertBefore(div,null);            
		           		});
		                //Read the image
		                picReader.readAsDataURL(file);
		            }                               
		        });
		    }
		    else
		    {
		        console.log("Your browser does not support File API");
		 	 } */
		$( "#datepicker" ).datepicker({
		      showOn: "button",
		      buttonImage: "images/calendar.gif",
		      buttonImageOnly: true,
		      buttonText: "Select date",
		      changeMonth: true,
		      changeYear: true
		});
		
		$("input[id*='file']").click(function(){
			alert("OK");
			if(!($(this).attr("id")=="file10")){
				if(window.File && window.FileList && window.FileReader)
			    {
					
			        var filesInput = this;
			        filesInput.addEventListener("change", function(event){
			            alert("OK");
			            var files = event.target.files; //FileList object
			            var output = document.getElementById("result");
			            
			             for(var i = 0; i< files.length; i++)
			            {
			                var file = files[i];	 	               
			               //Only pics */
			                 if(!file.type.match('image'))
			                   continue;	               
			                var picReader = new FileReader();		                
			                picReader.addEventListener("load",function(event){		                    
			                    var picFile = event.target;		                    
			                    var div = document.createElement("div");		                    
			                    div.innerHTML = "<img name='img'  width='142' height='83' class='thumbnail' src='" + picFile.result + "'" +"title='" + picFile.name + "'/>";
			                   
			                    
			                    output.insertBefore(div,null);            
			           		});
			                //Read the image
			                 picReader.readAsDataURL(file); 
			            } 
			            $("#hidd").append(this);
			            $("#hidd").before($("#hidd").children().first());
			                                            
			        });
			    }
			    else
			    {
			        console.log("Your browser does not support File API");
			    }
			}else{
				
				alert("9장까지 올릴수 있습니다.");
				$("#hidd").append(this);
			}
		});
	});
	
</script>
</head>
<body>
		<%-- "board_num" , ${board_num}
		"group_num" , ${group_num}
		"seq_num" , ${seq_num}
		"seq_level" , ${seq_level} --%>
		
	<form action="${root}/performBoard/write.do"  method="post" onsubmit="return checkForm(this)" enctype="multipart/form-data">	
		<input type="hidden" value="${artist_id}" name="artist_id"/>
		<input type="hidden" value="${board_num}" name="board_num"/>
		<input type="hidden" value="${group_num}" name="group_num"/>
		<input type="hidden" value="${seq_num}" name="seq_num"/>
		<input type="hidden" value="${seq_level}" name="seq_level"/>
		
		
		<span>제목</span><input id="subject" name="subject" type="text"/> <br/><br/>
		<span>내용</span><textarea rows="20" cols="100" name="content" id="content"></textarea><br/><br/>
		<span>일시</span>
		
		<input type="text" name="d_day1" id="datepicker">
		
		<select name="hh">
			<c:forEach var="i" begin="00" end="24"> 
				<option>${i}</option>
			</c:forEach>
		</select>
		시 --%>
		
		<br/><br/>
		
		주소<input type="text" name="zipcode"/> <button>우편번호</button><br/></br>
		<input type="text" name="address"/><br/><br/>
		파일<input type="file" name="file1" id="file1">
		<div id="hidd" style="display:none">
			<input type="file" name="file2" id="file2">
			<input type="file" name="file3" id="file3">
			<input type="file" name="file4" id="file4">
			<input type="file" name="file5" id="file5">
			<input type="file" name="file6" id="file6">
			<input type="file" name="file7" id="file7">
			<input type="file" name="file8" id="file8">
			<input type="file" name="file9" id="file9">
			<input type="file" name="file10" id="file10">
		</div>
		<div>
			<input type="submit" value="글쓰기"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="location.href='${root}/performBoard/list.do'"/>
		</div>
		
		<output id="result"></output>
		
		<div id="fileList"></div>
	</form>
	
</body>
</html>
