



// 是否已经完成 按钮的切换事件

$(function(){
	
	if(!$("#isFinishBtn").is(':checked')){
		$(".onoffswitch-label").css("border","2px solid red");
		$(".onoffswitch-switch").css("border","2px solid red");
	}else{
		$(".onoffswitch-label").css("border","2px solid #23b7e5");
		$(".onoffswitch-switch").css("border","2px solid #23b7e5");
	}
	
	
	// 切换按钮
	$("#isFinishBtn").click(function(){
		
		var finishStatus ;
		var id = $("#planId").val();
		
		console.log(id);
		
		console.log("已经点击了");
		console.log($("#isFinishBtn").is(':checked'));
		
		if(!$("#isFinishBtn").is(':checked')){
			$(".onoffswitch-label").css("border","2px solid red");
			$(".onoffswitch-switch").css("border","2px solid red");
			finishStatus = 'F';
		}else{
			$(".onoffswitch-label").css("border","2px solid #23b7e5");
			$(".onoffswitch-switch").css("border","2px solid #23b7e5");
			finishStatus = 'E';
		}
		
		
		
		// 修改状态
		$.ajax({
			type:"post",
			url:"/SECIMS/res/revisePlanStatus",
			async:true,
			data:{
				planId : id,
				status: finishStatus
			},
			dataType:'json',
			success: function(data){
				
				console.log("将要修改计划成功返回的信息："+data);
				if(data.success){
					console.log("修改计划状态成功！");
					
					// 重新洗牌
					window.location.reload();
				}
			}
		});
		
		
		
	}); 
	
});





//删除 计划 详情

function delDetail(detailId,planId){
	
	console.log("删除 计划 详情  开始!");
	
	
	$.ajax({
		type:"post",
		url:"delDetail",
		async:true,
		traditional: true,
		data: {
			detailId : detailId,
			planId:planId
		},
		success: function(inf){
			
			if(inf){
				
				console.log("删除 计划 详情 成功！");
				
				// 刷新 详情视图
				flushDetailList(detailId);
				
				layer.msg('删除 计划详情 成功！！', {icon: 6});
			}
			
		},
	});
	
	
	
	console.log("删除 计划 详情  结束!");
	
	
}


// 刷新 详情 视图
function flushDetailList(detailId){
	
	// 删除
	$("#detailID"+detailId).remove();
	
	
	// 刷新一下页面
	setTimeout("window.location.reload();","3000");
	 
	
}




// 编辑 计划详情

function editDetail(detail){
	
	console.log("编辑 计划详情 " + detail);
	
	var ary = detail.split("&");
	
	var detailId = ary[0];
	var planId = ary[1];
	var title = ary[2];
	var content = ary[3];
	var createTime = ary[4];
	var finishTime = ary[5];
	var status = ary[6];
	
	
	// 弹出子窗口
	layer.open({
		type: 2,
		title: '编辑',
		area: ['40em', '40em'],
		scrollbar: false,
		maxmin: true, //开启最大化最小化按钮
		content: ['/SECIMS/res/secims/person/views/planDetailModify.jsp','yes'], // 添加页面
		// 窗口创建成功后
		success: function(layero, index){
			
			//获取子窗口的body
			var body = layer.getChildFrame('body', index); 
			
			// 赋值
			body.find("#planDetailId").val(detailId);
			body.find("#planDetailTitle").val(title);
			body.find("#planDetailContent").val(content);
			body.find("#status").val(status);
			
		},
		cancel: function(index, layero) {
			layer.msg('已取消添加！', {icon: 5});
			layer.close(index);
		}
	});
	
	
	
}





// 增加 计划详情

$(function(){
	
	// 新增框 
	$("#newDetail").hide();
	
	// 增加 按钮 响应事件
	$("#detailAdd").click(function(){
		
		
		//显示 新增框
		$("#newDetail").toggle();
		$("#planDetailTitle").focus();
		
		
	});
	
	
	
	// 添加 计划详情
//	$("#detailAddSubmit").click(function(){
//		
//		console.log("新增 计划详情   开始");
//		
//		// 表单提交
//		$("#detailAddForm").submit(function(){
//			
//			var formval = $(this).serialize();
//			
//			// 输出 表单数据
//			console.log("add planDetail : "+formval);
//			
//			var jsonform = JSON.stringify(formval);
//			
//			console.log("json form : "+jsonform);
//			
//			$.ajax({
//				type:"post",
//				url:"addDetail",
//				async:true,
//				dataType:"json",
//				traditional: true,
//				data: $(this).serialize(),
//				success : function(inf,status){
//					
//					if(inf.success){
//						
//						console.log("添加计划详情成功！");
//						
//						layer.msg('添加计划详情成功！', {time:5000,icon: 6});
//						
//						// 刷新 界面
//						window.location.reload();
//						
//					}
//					
//					console.log(" add plan detail success ");
//				}
//				
//			});
//			
//		});
//		
//		
//		console.log("新增 计划详情   结束");
//		
//		// 刷新 界面
//		window.location.reload();
//		
//	});
	
	
});

















//
//
//// jquery-treetable
//
//$(function(){
//	
//	
//	$("#mytable").treetable({ expandable: true });
//	
//	$("#closeBtn").hide();
//	
//	$("#expendBtn").on("click",function(){
//		$("#mytable").treetable("expandAll");
//		$("#closeBtn").show();
//		$("#expendBtn").hide();
//	});
//	
//	$("#closeBtn").on("click",function(){
//		$("#mytable").treetable("collapseAll");
//		$("#expendBtn").show();
//		$("#closeBtn").hide();
//	});
//	
//	$("#moveBtn").on("click",function(){
//		$("#mytable").treetable("move","3","4");
//	});
//	
//	$("#getBtn").on("click",function(){
//		
//		console.log("get node");
//		
//		var node = $("#mytable").treetable("node","3");
//		
//		var childs = node.children ;
//		
//		alert(childs);
//		
//		for (var i=0; i < childs.length ; i++) {
//			var chd = childs[i];
//			
//			console.log(chd.id);
//			
//			var cells =  chd.row.context.cells;
//			
//			for (var k = 0 ; k < cells.length ; k ++) {
//				var td = cells[k].textContent ;
//				console.log("第"+k+"列的内容： "+td);
//			}
//			
//			console.log(chd) ;
//		}
//		
//		
//		console.log(node.id);
//		
//		console.log(node);
//		
//		console.log(childs);
//	});
//	
//});
//
//
//// 获取 treetable 值
//$(function(){
//	$(".treetable tbody tr").on("dblclick",function(){
//		
//		var attrs = this.attributes ;
//		
//		for (var i=0; i < attrs.length ; i++) {
//			var attrName = attrs[i].name;
//			console.log(attrName);
//			
//			var attrValue = attrs[i].value ;
//			console.log(attrValue) ;
//			
//		}
//		
//	});
//	
//});
//
//
//
///// 增加 / 删除 /修改 按钮的实现
//
//$(function(){
//	
//	
//	// 增加
//	
//	$("#planAddBtn").click(function(){
//		
//		
//		//选择被选中Radio的Value值
//
//		var parentID = $("input[name='planRadio']:checked").val();  
//		
//
//		console.log(parentID);
//		
//		$.ajax({
//			type:"post",
//			url:"",
//			async:true,
//			data:parentID,
//			success: function(data){
//				
//			}
//		});
//		
//		
//	});
//	
//		
//});
//
//
//















