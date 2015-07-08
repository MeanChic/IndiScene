/**
 * 
 */
var root=null;
var updateDiv=null;
function upSelectToServer(bunho,requestRoot){
	//alert(bunho + "," + root);
	root=requestRoot;
	var url=root + "/12_reply/replySelect.do";
	var params="bunho="+bunho;
	
	sendRequest("GET",url,upSelectFromServer,params);
}

function upSelectFromServer(){
	if(xhr.readyState==4&&xhr.status==200){
		//alert(xhr.responseText);
		upSelectProcess(xhr.responseText);
	}
}

function upSelectProcess(responseText){
	var result=responseText.split(",");
	var bunho=result[0].trim();
	var reply=result[1].trim();
	var bunhoDiv=document.getElementById(bunho);
	//alert(bunho + "," + reply + "," + bunhoDiv);
	
	var div=document.createElement("div");
	div.id="upBunho" + bunho;
	
	var inputText=document.createElement("input");
	inputText.type="text";
	inputText.value=reply;
	
	var inputButton=document.createElement("input");
	inputButton.type="button";
	inputButton.value="수정";
	inputButton.onclick=function(){
		updateToServer(bunho,inputText.value);
	}
	
	div.appendChild(inputText);
	div.appendChild(inputButton);
	
	if(bunhoDiv!=null){
		bunhoDiv.appendChild(div);
	}else{
		var newBunho=document.getElementById("newBunho"+bunho);
		newBunho.appendChild(div);
	}
	
	updateDiv=div;
}

function updateToServer(bunho, value){
	//alert(bunho + "," + value);
	var url=root+"/12_reply/replyUpdate.do";
	var params="bunho="+bunho+"&lineReply="+value;
	
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
	var bunho=result[0].trim();
	var reply=result[1].trim();
	
	var bunhoDiv=document.getElementById(bunho);
	//var updateDiv=document.getElementById("upBunho"+bunho);
	//alert(bunho + "," + reply + "," + bunhoDiv);
	
	if(bunhoDiv!=null){
		var span=bunhoDiv.getElementsByTagName("span");
		span[1].innerHTML=reply;
		bunhoDiv.removeChild(updateDiv);
	}else{
		var newBunho=document.getElementById("newBunho"+bunho);
		var span=newBunho.getElementsByTagName("span");
		span[1].innerHTML=reply;
		//alert(updateDiv);
		newBunho.removeChild(updateDiv);
	}
	
	
	
	
}