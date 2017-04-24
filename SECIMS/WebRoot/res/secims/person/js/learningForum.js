





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




// 发布 话题
$(function(){
	
	$("#AddForumPostsId").click(function(){
		
		var title = $(".title").val();
		
		if(title == "" || title == null){
			layer.msg("标题必须填写",{icon:5});
			return false;
		}
		
		if(title.length > 40){
			layer.msg("标题长度超过了20个汉字，请重新输入",{icon:5});
			return false;
		}
		
		// 内容
		var html = $('.summernote').summernote('code');
		
		// 给 内容框赋值
		$(".content").val(html);
		
		
		// 表单 提交
		$("#forumId").submit();
		
		
		layer.msg("发布话题论坛帖子成功！！！",{icon:6,time:5000});
		
	});
	
	
});


