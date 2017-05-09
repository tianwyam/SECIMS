





// 初始化 文本编辑器
$(function() {

	$('.summernote').summernote({
		height: 160,
		minHeight : 100,
		lang : 'zh-CN',
		dialogsFade : true,
		dialogsInBody : true,
		disableDragAndDrop : false,
		
	    codemirror: {
	      mode: 'text/html',
	      htmlMode: true,
	      lineNumbers: true,
	      theme: 'monokai'
	    },
	    
	    callbacks: {
	      onInit: function() {
	    	  
	      },
	      onFocus: function() {
	    	  
	      },
	      onBlur: function() {
	      }
	      
	    }
	});

	
	// 处理回复的图片的大小
	dealPicWidth();
	
	// 设置style中的width样式为60% 	先比较大小
	if($("#postContent p img").width() > $("#postContent").width()){
		$("#postContent p img").css("width","60%");
	}
	
	
});



// 默认的话，有时候图片宽度 会大于 父元素
function dealPicWidth(){
	
	var parentWidth = $(".message-content").width() ;
	
	
	$(".message-content p img").each(function(){
		
		var childWidth = $(this).width();
		
		// 设置style中的width样式为60% 	先比较大小
		if(childWidth > parentWidth){
			$(".message-content p img").css("width","60%");
		}
	});
	
}





// 聊天
$(function(){
	
	
	// 聊天
	$("#sendChattingBtnId").click(function(){
		
		// 内容
		var html = $('.summernote').summernote('code');
		
		if(html == null || html == ""){
			layer.msg("聊天内容不能为空！！",{icon:5});
			return false;
		}
		
		
		// 添加 聊天信息
//		flushMsgBox("","芥末了空","2017-04-12 12:11:30",html);
		
		console.log("html : "+html);
		
		// 内容总长度
		var len = html.length;
		// 每一次发送的大小
		var size = 8000 ;
		// 总共数目
		var count = (len % size == 0) ? parseInt(len / size) : (parseInt(len / size) + 1);
		// 转整型
		count = Math.floor(count); 
		// 保存的内容 / 分片内容
		var str = splitContent(html, size, count);
		
		
		for(var i in str){
			
			var msg = {
					msgLength: len, // 总长度
					msgCount: count, // 总片数
					msgCurrent: i, // 当前位置
					msgContent: str[i], // 内容
					postsId: $("#postsId").text() // 帖子ID
				};
				
			websocket.send(JSON.stringify(msg));
			
		}
		
		
		// 清空 发布框的内容
		$('.summernote').summernote('code','');
		
		// 设置style中的width样式为60% 	先比较大小
		dealPicWidth();
		
	});
	
	
});



/**
 * 分片内容
 * content 内容
 * size 每一片大小
 * count 分片数量 
 * str 分片后的内容数组 */ 
function splitContent(content,size,count){
	
	var str = []; // 内容
	
	for (var i=0; i < count ; i++) {
		if(i == count - 1){
			str[i] = content.substring(i*size);
		}else{
			str[i] = content.substring(i*size,(i+1)*size);
		}
	}
	
	for(var j in str){
		console.log(j + " "+str[j]);
	}
	
	return str;
}





// 添加 聊天信息
function flushMsgBox(imgUrl,name,date,content){
	
	
	var msg = '<div class = "chat-message" >';
	msg = msg + ('<img class = "message-avatar" src = "/SECIMS/res/secims/person/img/a2.jpg" />');	
	msg = msg + ('<div class = "message" >');	
	msg = msg + ('<a class ="message-author">');
	msg = msg + (name);
	msg = msg + ('</a>');
	msg = msg + ('<span class = "message-date">');
	msg = msg + (date);
	msg = msg + ('</span>');
	msg = msg + ('<span class = "message-content" >');
	msg = msg + (content);
	msg = msg + ('</span>');
	msg = msg + ('</div>');
	msg = msg + ('</div>');
	
	
	console.log("追加的元素： "+msg);
	
	// 消息框 追加
	$("#msgBoxId").append(msg);
	
	// 设置style中的width样式为60% 	先比较大小
	if($(".message-content p img").width() > $(".message-content").width()){
		$(".message-content p img").css("width","60%");
	}
	
}







// 聊天 websocket
$(function(){
	
	
	// 开启事件
	websocket.onopen = function(evnt) {
		console.log("  websocket.onopen  ");
	};
	
	
	// 接受信息事件
	websocket.onmessage = function(evnt) {
		console.log("  websocket.onmessage   ");
		
		// 刷新 聊天框
		flushMsgBox("","芥末了空","2017-05-12 12:11:30",evnt.data);
	};
	
	
	// 出现错误事件
	websocket.onerror = function(evnt) {
		console.log("  websocket.onerror  ");
	};
	
	
	// 关闭事件
	websocket.onclose = function(evnt) {
		console.log("  websocket.onclose  ");
	};
	
	
		
	//websocket.send(JSON.stringify(msg));
		
	
	
});









