



/// 企业导师 操作 月评 PPT 相关





$(function(){
	
	$('#planEvaluation').rating({displayOnly: true, step: 0.5});
	
});





$(function(){
	
	// 导师评论 先隐藏掉
	$("#tutorMonthComment").hide();
	
	
	// 显示评论 按钮
	$(".showMonthCommentBtn").click(function(){
		
		// 判断 评论状态/是否隐藏
		var status = $("#tutorMonthComment").is(":hidden");
		
		console.log("评论状态: "+status);
		
		/*
		 * 如果是隐藏的，则显示，并把按钮改为 《隐藏评论》
		 * 反之，显示评论
		 */
		if(status){
			$(this).find("i").removeClass("glyphicon-menu-down");
			$(this).find("i").addClass("glyphicon-menu-up");
			$(this).find("i").html(" 隐藏评论");
		}else{
			$(this).find("i").removeClass("glyphicon-menu-up");
			$(this).find("i").addClass("glyphicon-menu-down");
			$(this).find("i").html(" 展开评论");
		}
		
		// 切换显示/隐藏
		$("#tutorMonthComment").toggle();
	});
	
});



// 提交评论
$(function(){
	
	// 提交按钮 响应事件
	$("#submitMonthCommentBtn").click(function(){
		
		var score = $("#score").val();
		var comment = $("#comment").val();
		var reviewId = $("#reviewId").html();
		
		
		// 异步提交
		$.ajax({
			type:"post",
			url:"/SECIMS/res/tutorMonthComment",
			async:true,
			dataType:"json",
			data:{
				score: score,
				reviewId: reviewId,
				comment: comment
			},
			success: function(data){
				
				console.log("发布评论成功！");
				console.log(data);
				
				if(data.success){
					
					console.log(" 企业导师 打分 评论 成功了。。。。。。。。。。。。");
					layer.msg("打分 评论 成功了",{icon:6});
					
					//关闭评分按钮
					$(".showMonthCommentBtn").click();
				}
				
			}
		});
		
	});
	
});














