/**
 * replyWrite Start
 */
var root=null;  //root를 전역변수로 선언해서 사용! 
function writeToServer(requestRoot,board_num){
	alert(requestRoot + "," + board_num);
	root=requestRoot;
	
	var reply_content=document.getElementById("writeReply").value;
	var artist_id=document.getElementById("writeId").value;
	var url=root+"/replyWrite.do";
	var params="board_num="+board_num+"&reply_content="+reply_content+"&artist_id="+artist_id;
	sendRequest("POST",url,writeFromServer,params);
}

function writeFromServer(){
	if(xhr.readyState==4&&xhr.status==200){
		//alert(xhr.responseText);
		writeReplyProcess(xhr.responseText);
	}
}

function writeReplyProcess(responseText){
	var result=responseText.split(",");   //배열! JSON과다름!
	var reply_num=result[0].trim();
	var artist_id=result[1].trim();  
	var reply_content=result[2].trim();
	var reply_date=result[3].trim();
	var board_num=result[4].trim();
	
	alert(reply_num + "," + artist_id+","+reply_content+"," +reply_date +"," +board_num);
	
	document.getElementById("writeReply").value="";
	/*<div id="newReply">
	 * 	<div class="replyDiv" id="newReply_num77">
	 * 	</div>
	 *</div>
	 * 
	 * */
	var newReply=document.getElementById("newReply");
	var div=document.createElement("div");
	div.className="replyDiv";
	div.id="newReply_num"+reply_num;   //새로고침 안했을때,, 비동기화 상태에서 삭제나 수정 가능하게하기위해서 id를 새로잡아줌,,
	
	var spanReply_num=document.createElement("span");
	spanReply_num.className="cssreply_num";
	spanReply_num.innerHTML=reply_num + "&nbsp";
	
	var spanArtist=document.createElement("span");
	spanArtist.className="cssArtist";
	spanArtist.innerHTML=artist_id + "&nbsp";
	
	var spanReply=document.createElement("span");
	spanReply.className="cssReply";
	spanReply.innerHTML=reply_content;
	
	var spanDate=document.createElement("span");
	spanReply.className="cssDate";
	spanReply.innerHTML=reply_date;
	
	var spanUpDel=document.createElement("span");
	spanUpDel.className="cssUpDel";
	
	var aUpdate=document.createElement("a");
	//alert(root);
	aUpdate.href="javascript:upSelectToServer('"+board_num +"','" +reply_num+ "',\'" +root + "\')";
	aUpdate.innerHTML="수정 ";
	
	var aDelete=document.createElement("a");
	aDelete.href="javascript:deleteToServer('"+board_num +"','" +reply_num+ "',\'" +root + "\')"; //	\' \' -> root에서 특수문자가 들어가기때문에 사용..
	aDelete.innerHTML="삭제 &nbsp"
	
	spanUpDel.appendChild(aUpdate);
	spanUpDel.appendChild(aDelete);
	
	div.appendChild(spanReply_num);
	div.appendChild(spanArtist);
	div.appendChild(spanReply);
	div.appendChild(spanDate);
	div.appendChild(spanUpDel);
	//newReply.appendChild(div);
	newReply.insertBefore(div, newReply.firstChild);
	
}


/**
 * replyUpdate Start
 */
var root=null;
var updateDiv=null; 
var board_num=null;
function upSelectToServer(board,reply_num,requestRoot){
	//alert(reply_num + "," + root);
	root=requestRoot;
	board_num=board;
	var url=root + "/replySelect.do";
	var params="reply_num="+reply_num+"&board_num="+board_num;
	
	sendRequest("GET",url,upSelectFromServer,params);
}

function upSelectFromServer(){
	if(xhr.readyState==4&&xhr.status==200){
		//alert(xhr.responseText);
		upSelectProcess(xhr.responseText);
	}
}
//여기부터
function upSelectProcess(responseText){
	var result=responseText.split(",");
	var reply_num=result[0].trim();
	var reply_content=result[1].trim();
	var reply_numDiv=document.getElementById(reply_num);//새로만들어진것 말고 원래있었던것
	alert(reply_num + "," + reply_content + "," + reply_numDiv);
	
	
	var div=document.createElement("div");
	div.id="upBunho" + reply_num;
	
	var inputText=document.createElement("input");
	inputText.type="text";
	inputText.value=reply_content;
	
	var inputButton=document.createElement("input");
	inputButton.type="button";
	inputButton.value="수정";
	inputButton.onclick=function(){
		updateToServer(reply_num,inputText.value);
	}
	
	div.appendChild(inputText);
	div.appendChild(inputButton);
	
	if(reply_numDiv!=null){//예전것은 그냥 reply_num이 id 이므로 잡힌다
		reply_numDiv.appendChild(div);
	}else{ //새로만들어진것은 id가 "newReply_num"+reply_num 으로 생성되어있다 
		var newReply_num=document.getElementById("newReply_num"+reply_num);
		newReply_num.appendChild(div);
	}
	
	updateDiv=div;  //수정용으로 만든 div의 이름을 바꾼다 나중에 없애기 위해서
}

function updateToServer(reply_num, reply_content){//수정한 내용을 update하기 위해 보낸다
	alert(reply_num + "," + reply_content+ "," + board_num);
	var url=root+"/replyUpdate.do";
	var params="reply_num="+reply_num+"&reply_content="+reply_content+"&board_num="+board_num;
	
	sendRequest("GET", url, updateFromServer, params);
}

function updateFromServer(){
	if(xhr.readyState==4&&xhr.status==200){
		//alert(xhr.responseText);
		updateProcess(xhr.responseText);
	}
}

function updateProcess(responseText){
	var result=responseText.split(",");
	var reply_num=result[0].trim();
	var reply_content=result[1].trim();
	
	var reply_numDiv=document.getElementById(reply_num);
	//var updateDiv=document.getElementById("upBunho"+reply_num);
	alert("돌아온것"+reply_num + "," + reply_content + "," + reply_numDiv);
	
	if(reply_numDiv!=null){
		var span=reply_numDiv.getElementsByTagName("span");
		span[2].innerHTML=reply_content;
		reply_numDiv.removeChild(updateDiv);//수정용 텍스트 생성용으로 만든div 삭제
	}else{
		var newReply_num=document.getElementById("newReply_num"+reply_num);
		var span=newReply_num.getElementsByTagName("span");
		span[2].innerHTML=reply_content;
		//alert(updateDiv);
		newReply_num.removeChild(updateDiv); //수정용 텍스트 생성용으로 만든div 삭제
	}
	
}


/**
 * replyDelete Start
 */

function deleteToServer(board,reply_num,root){
	var board_num=board;
	alert(reply_num + "," + root+","+board_num);
	var url=root+"/replyDelete.do";
	
	var params="reply_num="+reply_num+"&board_num="+board_num;
	
	sendRequest("GET",url,deleteFromServer,params);
}

function deleteFromServer(){
	if(xhr.readyState==4&&xhr.status==200){
		//alert(xhr.responseText);
		deleteProcess(xhr.responseText);
	}
}

function deleteProcess(responseText){
	var result=responseText.split(",");
	var reply_num=result[0].trim();
	var board_num=result[1]; 
	alert(reply_num + ";;dataprocess;;"+board_num);
	var divReply_num=document.getElementById(reply_num);
	alert(divReply_num);
	if(divReply_num!=null){
		//기존데이터
		$(divReply_num).remove(); //일반 자바 스크립트가 안되서 제이쿼리로 삭제함
	}else{
		
		//새로운데이터
		var newReply_numDiv=document.getElementById("newReply_num" + reply_num);
		var newReply=document.getElementById("newReply");
		//alert("newReply_num::::" + reply_num);
		newReply.removeChild(newReply_numDiv);
	}
	
//	var body=document.getElementsByTagName("body");
//	body[0].removeChild(document.getElementById(reply_num));
}