


// 删除草稿箱中的周报（真正上的删除）
function delWeeklyDraftBox(id){
	
	
		
	//询问框
	layer.confirm('删除后草稿将无法恢复， 您确定要删除吗？', {
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
		
		console.log("取消了 删除草稿箱中的周报!");
		
	});
	
}
	
	
	
// 删除草稿箱中的周报操作
function delWeeklyDraftBoxOperation(id){
	
	console.log("删除草稿箱中的周报 开始！");
	
	
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
				
				console.log("删除草稿箱中的周报成功");
				
				layer.msg("删除草稿箱中的周报成功",{icon:6});
				
				// 刷新 草稿箱中的周报列表
				flushWeeklyDraftBoxList(id);
			}
			
		}
	});
	
	
	console.log("删除草稿箱中的周报 结束！");
	
}



// 刷新 草稿箱中的周报列表
function flushWeeklyDraftBoxList(id){
	$("#weeklyDraftBoxListID"+id).remove();
	
	// 获取到列表总数
	var num = $(".weeklysNum").html();
	// 转换成数字然后减一
	$(".weeklysNum").html(parseInt(num) - 1);
}






//查看周报情况
function ToViewWeekly(weekRepId){
	
	console.log("查看周报情况： "+weekRepId);
	
	window.location.href = "/SECIMS/res/getWeeklyDetailView?weekRepId="+weekRepId;
	
}












