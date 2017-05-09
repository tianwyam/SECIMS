


// 连接
var websocket;



// 连接 WebSocket
$(function() {
	
	
	// 判断是否存在
	if('WebSocket' in window) {
		websocket = new WebSocket("ws://localhost:8080/SECIMS/websocket");
	} else if('MozWebSocket' in window) {
		websocket = new MozWebSocket("ws://localhost:8080/SECIMS/websocket");
	} else {
		websocket = new SockJS("http://localhost:8080/SECIMS/sockjs/websocket");
	}
	
	

});



// 关闭事件
function closeWebSocket(){
	websocket.close();
}



// 浏览器/窗口关闭
window.onbeforeunload=function(){
	closeWebSocket();
};

