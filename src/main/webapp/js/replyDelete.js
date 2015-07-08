/**
 * 
 */
function deleteToServer(bunho,root){
	//alert(bunho + "," + root);
	var url=root+"/12_reply/delete.do";
	var params="bunho="+bunho;
	
	sendRequest("GET",url,deleteFromServer,params);
}

function deleteFromServer(){
	if(xhr.readyState==4&&xhr.status==200){
		//alert(xhr.responseText);
		deleteProcess(xhr.responseText);
	}
}

function deleteProcess(responseText){
	var bunho=parseInt(responseText);
	var divBunho=document.getElementById(bunho);
	//alert(divBunho);
	if(divBunho!=null){
		//기존데이터
		document.body.removeChild(divBunho);
	}else{
		//새로운데이터
		var newBunhoDiv=document.getElementById("newBunho" + bunho);
		var newReply=document.getElementById("newReply");
		newReply.removeChild(newBunhoDiv);
	}
	
//	var body=document.getElementsByTagName("body");
//	body[0].removeChild(document.getElementById(bunho));
}