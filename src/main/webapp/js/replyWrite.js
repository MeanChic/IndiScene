/**
 * 
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
	
	alert(reply_num + "," + artist_id+","+reply_content);
	
	document.getElementById("writeReply").value="";
	/*<div id="newReply">
	 * 	<div class="replyDiv" id="newBunho77">
	 * 	</div>
	 *</div>
	 * 
	 * */
	var newReply=document.getElementById("newReply");
	var div=document.createElement("div");
	div.className="replyDiv";
	div.id="newBunho"+reply_num;   //새로고침 안했을때,, 비동기화 상태에서 삭제나 수정 가능하게하기위해서 id를 새로잡아줌,,
	
	var spanBunho=document.createElement("span");
	spanBunho.className="cssBunho";
	spanBunho.innerHTML=reply_num;
	
	var spanArtist=document.createElement("span");
	spanBunho.className="cssArtist";
	spanBunho.innerHTML=artist_id;
	
	var spanReply=document.createElement("span");
	spanReply.className="cssReply";
	spanReply.innerHTML=reply_content;
	
	var spanUpDel=document.createElement("span");
	spanUpDel.className="cssUpDel";
	
	var aUpdate=document.createElement("a");
	//alert(root);
	aUpdate.href="javascript:upSelectToServer(" + reply_num + ",\'" + root + "\')";
	aUpdate.innerHTML="수정 ";
	
	var aDelete=document.createElement("a");
	aDelete.href="javascript:deleteToServer(" + reply_num + ",\'" + root + "\')"; //	\' \' -> root에서 특수문자가 들어가기때문에 사용..
	aDelete.innerHTML="삭제 &nbsp";
	
	spanUpDel.appendChild(aUpdate);
	spanUpDel.appendChild(aDelete);
	
	div.appendChild(spanBunho);
	div.appendChild(spanArtist);
	div.appendChild(spanReply);
	div.appendChild(spanUpDel);
	//newReply.appendChild(div);
	newReply.insertBefore(div, newReply.firstChild);
	
}