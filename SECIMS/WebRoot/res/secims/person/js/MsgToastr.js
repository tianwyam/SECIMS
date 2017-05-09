

// 消息通知/长连接
var MsgToastrWebSocket;

$(function() {
	
	var status = getCookie("msgToastrWebSocketStatus");
	
//	if(status == 'false' || status == false){
		
		if('WebSocket' in window) {
			MsgToastrWebSocket = new WebSocket("ws://localhost:8080/SECIMS/msgWebSocket");
		} else if('MozWebSocket' in window) {
			MsgToastrWebSocket = new MozWebSocket("ws://localhost:8080/SECIMS/msgWebSocket");
		} else {
			MsgToastrWebSocket = new SockJS("http://localhost:8080/SECIMS/sockjs/msgWebSocket");
		}
		
		setCookie("msgToastrWebSocketStatus",true);
//	}

});



$(function(){
	
	MsgToastrWebSocket.onopen = function(evnt) {
		console.log("  MsgToastrWebSocket.onopen  ");
	};
	
	
	MsgToastrWebSocket.onmessage = function(evnt) {
		console.log("  MsgToastrWebSocket.onmessage   ");
		
		
	};
	
	
	MsgToastrWebSocket.onerror = function(evnt) {
		console.log("  MsgToastrWebSocket.onerror  ");
	};
	
	MsgToastrWebSocket.onclose = function(evnt) {
		console.log("  MsgToastrWebSocket.onclose  ");
		
		setCookie("msgToastrWebSocketStatus",false);
	};
	
});




function closeMsgToastrWebSocket(){
	MsgToastrWebSocket.close();
}



window.onbeforeunload=function(){
	
	console.log("close window");
	
	closeMsgToastrWebSocket();
};



// cookie 就是多个键值对拼接而成的

// 设置cookie
function setCookie(name,value){
	
	// 对字符串进行编码
//	value = escape(value);
	document.cookie = name+"="+value;
}


// 获取cookie
function getCookie(name) {

	// cookie 存在
	if(document.cookie.length > 0) {
		
		//通过String对象的indexOf()来检查这个cookie是否存在，不存在就为 -1
		var start = document.cookie.indexOf(name + "=");
		
		if(start != -1) {
			
			//最后这个+1其实就是表示"="号啦，这样就获取到了cookie值的开始位置　　　　
			start = start + name.length + 1;　
			
			　　
			/**
			 * indexOf()第二个参数表示指定的开始索引的位置/
			 * 这句是为了得到值的结束位置。
			 * 因为需要考虑是否是最后一项，所以通过";"号是否存在来判断
			 */　　　　　　
			var end = document.cookie.indexOf(";", start);
			
			　　　　　　　　
			if(end == -1){
				end = document.cookie.length;　　
			}
				　　　　　　
			/**
			 * 通过substring()得到了值。
			 * unescape() 解码
			 * escape() 编码
			 */
//			return unescape(document.cookie.substring(start, end));
			return document.cookie.substring(start, end);
			
		}　　　　
	}　　　　
	
	return "";
}




