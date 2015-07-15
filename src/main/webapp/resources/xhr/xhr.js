/**
 * 
 */
var xhr=null;

function createXHR(){
	if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else if(window.ActiveXObject){
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	return null; //?왜들어간거지?
}


function sendRequest(method, url , callback, params){
	
	xhr=createXHR();
	//alert("XMLHttpRequest:" + xhr);
	
	var httpMethod=method;
	if(httpMethod!="GET" && httpMethod!="POST"){
		httpMethod="GET";
	}
	
	var httpUrl=url;
	
	var httpParams=(params==null || params=="") ? null : params;

	if(httpMethod=="GET" && httpParams !=null){
		httpUrl+="?"+httpParams;
	}
	////alert(httpUrl);
	xhr.open(httpMethod, httpUrl , true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send(httpMethod=="POST" ? httpParams:null);
	xhr.onreadystatechange=callback;
	
	//alert(httpMethod+"," + httpUrl );
}