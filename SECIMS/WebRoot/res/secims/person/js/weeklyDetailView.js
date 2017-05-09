



// 删除周报（真正上的删除）
function delWeekly(id){
	
	
		
	//询问框
	layer.confirm('删除后将无法恢复， 您确定要删除吗？', {
		icon: 5,
		btn: ['确定', '取消'] //按钮
	}, function() {
	
		layer.msg('OK! 正在删除，请稍等。。。。。。', {
			icon: 1,
			time: 4000
		});
		
		// 删除草稿箱中的周报操作
		delWeeklyDraftBoxOperation(id);
	
	}, function() {
		
		console.log("取消了 删除周报!");
		
	});
	
}
	
	
	
// 删除周报操作
function delWeeklyDraftBoxOperation(id){
	
	console.log("删除周报 开始！");
	
	
	// 重用 删除 草稿箱的删除
	$.ajax({
		type:"post",
		url:"/SECIMS/res/delWeeklyDraftBox",
		async:true,
		traditional: true,
		dataType:'json',
		data:{
			weekRepId: id
		},
		success:function(data){
			
			if(data.success){
				
				console.log("删除周报成功");
				
				layer.msg("删除周报成功",{icon:6});
				
				// 返回上一步并刷新
				self.location=document.referrer;
			}
			
		}
	});
	
	
	console.log("删除周报 结束！");
	
}



// 发送 周报
function sendWeekly(weekRepId){
	
	console.log("发送周报 开始");
	
	$.ajax({
		type:"post",
		url:"/SECIMS/res/sendWeeklytoF",
		async:true,
		dataType:'json',
		data:{
			weekRepId : weekRepId
		},
		success: function(data){
			
			if(data.success){
				
				console.log("发送周报成功！");
				
				layer.msg("发送周报成功",{icon:6});
				
				// 返回 到已发送周报列表页面
				window.location.href="/SECIMS/res/getWeeklyReport";
			}
			
		}
	});
	
	
	console.log("发送周报 结束");
	
}














