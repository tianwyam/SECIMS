



// layer 弹窗

layui.use('layer', function() {
	var layer = layui.layer;
});




// 表单提交响应校验 --- 修改 学习计划
$(function() {

	$("#modifySubmit").click(function(){
		
		var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
		
		var id = $("#planId").val();
		var title = $("#planTitle").val();
		var start = $("#startTime").val();
		var end = $("#endTime").val();
		var content = $("#planContent").val();
		
		
		console.log(id+" - "+title+" - "+start+" - "+end+" - "+content)
		
		$.ajax({
			type:"post",
			url:"/SECIMS/res/modifyPlan",
			async:true,
			traditional: true,
			contentType:"application/json;charset=utf-8",
			dataType:"json",
			data: JSON.stringify({
				planId:id,
				planTitle:title,
				startTime:start,
				endTime:end,
				planContent:content
			}),
			success: function(data){
				if(data){
					layer.msg('修改成功！', {icon : 6});
					
					parent.layer.close(index); // 关闭本弹窗
//					window.parent.location.reload(); // 刷新父页面
					modifyTableTr(title,start,end,content) ;  // 刷新父页面
				}
				
				console.log("success");
			}
		});
		
		console.log("end");
		window.parent.location.reload(); // 刷新父页面
		
	});
	
	
	
	// 刷新父页面
	function modifyTableTr(title,start,end,content){
		
		// 获取 父窗口 的 复选框
		var checkboxs = parent.$("[name='checkbox']:checked");
		
		var tr ;
		
		checkboxs.each(function(){
			tr = $(this).parents("tr");
		});
		
		
		// 修改父元素的 行
		tr.find("td:eq(1)").text(title); // planTitle
		tr.find("td:eq(2)").text(content); // planContent
		tr.find("td:eq(3)").text(start); // startTime
		tr.find("td:eq(4)").text(end); // endTime
		
		console.log("刷新 父窗口 成功！");
	}
	

});