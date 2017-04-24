




$(function(){
	
	// 编辑 计划 提交
	$("#planModSubmit").click(function(){
		
		console.log("修改 计划 开始！");
		
		// 获取本窗口索引
		var index = parent.layer.getFrameIndex(window.name); 
		
		var data = {
				planId : $("#planId").val(),
				planTitle : $("#planTitle").val(),
				planType : $("#planType").val(),
				status : $("#status").val(),
				planContent : $("#planContent").val()
			};
		
		console.log(JSON.stringify(data));
			
			$.ajax({
				type:"post",
				url:"/SECIMS/res/modifyPlan",
				contentType:"application/json",
				dataType:'json',
				data:JSON.stringify(data),
				success: function(data){
					
					console.log(data);
					
					if(data.success){
						
						console.log("修改计划成功！");
						
						layer.alert('修改成功！', {icon : 6});
					
						// 关闭本弹窗
						parent.layer.close(index); 
						
						// 刷新父页面
						setTimeout("window.parent.location.reload();","3000"); 
					}
					
					console.log(" success modify - data : " + data);
				},
				error: function(e){
					console.log("error: "+e);
				}
			});
			
			
			console.log("编辑计划  = " + $("#formModifyID").serialize());
			
			
//			// 关闭本弹窗
//			parent.layer.close(index); 
//			
//			// 刷新父页面
//			window.parent.location.reload(); 
		
		
		
		
	});
	
	
	
});
