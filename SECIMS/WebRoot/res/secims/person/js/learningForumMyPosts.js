



// 删除 我发布的帖子
function　delPost(postsId){
	
	console.log("要删除的帖子ID："+postsId);
	
	$.ajax({
		type:"post",
		url:"/SECIMS/res/delForumPosts",
		async:true,
		dataType:"json",
		data:{
			postsId: postsId
		},
		success: function(data){
			
			if(data.success){
				
				layer.msg("删除帖子成功!",{icon:6});
				
				// 刷新帖子列表
				flushForumPostsList(postsId);
			}
			
			console.log("删除帖子成功! "+data);
		}
	});
	
}


// 刷新 帖子列表
function flushForumPostsList(postsId){
	
	// 删除 帖子
	$("#forumListId"+postsId).remove();
	
	// 获取帖子总数
	var num = $("#postsNum").html();
	
	// 修改帖子总数
	$("#postsNum").html(parseInt(num) - 1);
}
