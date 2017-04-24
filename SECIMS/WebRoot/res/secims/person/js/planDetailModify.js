





// 学习计划详情 修改
$(function(){
	
	// 详情  编辑 提交
	$("#detailModifySubmit").click(function(){
		
		console.log("计划详细 修改/编辑 开始！");
		
		// 获取本窗口索引
		var index = parent.layer.getFrameIndex(window.name); 
		
		var data= {
				planDetailId : $("#planDetailId").val(),
				planDetailTitle : $("#planDetailTitle").val(),
				status : $("#status").val(),
				planDetailContent : $("#planDetailContent").val()
			};
		
		
			
			$.ajax({
				type:"post",
				url:"/SECIMS/res/updateDetail",
				contentType:"application/json",
				dataType:"json",
				data: JSON.stringify(data),
				success: function(inf){
					
					if(inf.success){
						
						console.log("计划详情 修改成功！");
						
						layer.msg('计划详情 修改成功！', {icon : 6});
						
						// 关闭本弹窗
						parent.layer.close(index); 
						
						// 刷新父页面
						setTimeout("window.parent.location.reload();","3000");
						 
					}
					
				}
			});
			
		
		
		console.log("计划详细 修改/编辑 结束！");
		
		console.log($("#detailModifyForm").serialize());
		
//		// 关闭本弹窗
//		parent.layer.close(index); 
//		
//		// 刷新父页面
//		window.parent.location.reload(); 
		
	});
	
	
	
});



