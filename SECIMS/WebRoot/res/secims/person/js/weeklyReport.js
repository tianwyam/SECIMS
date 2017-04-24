



// 删除 周报(将状态位改为D)
function delWeeklyReport(weeklyID){
	
	console.log("删除已发送周报开始！");
	
	$.ajax({
		type:"post",
		url:"/SECIMS/res/delWeeklyReport",
		async:true,
		traditional: true,
		dataType:'json',
		data:{
			weekRepId: weeklyID
		},
		success:function(data){
			
			if(data.success){
				
				console.log("删除已发送周报列表成功");
				
				layer.msg("删除已发送周报列表成功",{icon:6});
				
				// 刷新 已发送周报列表
				flushWeeklyReportList(weeklyID);
			}
			
		}
	});
	
	console.log("删除已发送周报结束！");
	
}


// 刷新 已发送周报列表
function flushWeeklyReportList(id){
	$("#weeklyReportListID"+id).remove();
	
	// 获取到列表总数
	var num = $(".weeklyNum").html();
	// 转换成数字然后减一
	$(".weeklyNum").html(parseInt(num) - 1);
}



// 查看周报情况
function ToViewWeekly(weekly){
	
	console.log("查看周报情况： "+weekly);
	
	window.location.href = "/SECIMS/res/getWeeklyDetailView?"+weekly;
	
}











