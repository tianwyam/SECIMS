





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

});





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
		flushMsgBox("","芥末了空","2017-04-12 12:11:30",html);
		
		
		// 清空 发布框的内容
		$('.summernote').summernote('code','');
		
		// 设置style中的width样式为60% 	先比较大小
		if($(".message-content p img").width() > $(".message-content").width()){
			$(".message-content p img").css("width","60%");
		}
		
	});
	
	
});




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
	
}



