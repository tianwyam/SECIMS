




//
//$(function(){
//	
//	// 提交 表单
//	$("#planAddSubmit").click(function(){
//		
//		$("#planAddForm").action = "/SECIMS/res/addPlan" ;
//		$("#planAddForm").method = "post" ;
//		
//		
//		//表单提交
//		$("#planAddForm").submit() ;
//		
//	});
//	
//	
//});











//
//
//$(function(){
//	
//	// 提交 表单
//	$("#planAddSubmit").click(function(){
//
//				
//		var data = {
//			planTitle : $("#planTitle").val(),
//			planType : $("#planType").val(),
//			status : $("#status").val(),
//			planTitle : $("#planTitle").val(),
//			planContent : $("#planContent").val()
//		};
//
//		console.log("添加的计划： " + JSON.stringify(data));
//
//		$.ajax({
//			type : "post",
//			url : "/SECIMS/res/addPlan",
//			contentType : 'application/json',
//			dataType : "json",
//			data : JSON.stringify(data),
//			success : function(inf) {
//
//				console.log(inf);
//
//				console.log("data.success " + inf.success);
//
//				if (inf.success) {
//
//					layer.msg('添加计划成功！', {time : 5000, icon : 6 });
//
//					// 跳转到 学习计划 界面
//					window.location.href = "/SECIMS/res/getStudyPlans";
//					console.log("添加计划成功！");
//
//				} else {
//
//					layer.alert(inf.msg, {
//						icon: 5,
//						skin: 'layui-layer-molv' //样式类名
//					});
//					
//					console.log(inf.msg);
//				}
//			},
//			error : function(inf) {
//				console.log("error inf " + inf);
//			}
//		});
//
//		console.log($("#planAddForm").serialize());
//
//	});
//	
//});