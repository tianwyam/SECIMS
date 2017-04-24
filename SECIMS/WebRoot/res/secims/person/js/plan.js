


// 查看 计划
function readPlan(plan){
	
	var ary = new Array();
	
	console.log("plan" + plan);
	
	var planAttrs = plan.split(",");
	
	console.log(planAttrs);
	
	for (var i = 0 ; i < planAttrs.length ; i++) {
		var planAttr = planAttrs[i].split("=");
		ary.push(planAttr[1]);
	}
	
	
	var id = ary[0];
	var title = ary[1];
	var type = ary[2];
	var content = ary[3];
	var createTime = ary[4];
	var finishTime = ary[5];
	var userid = ary[6];
	var status = ary[7];
	
	console.log(id+" - "+title+" - "+content+" - "+status+" - "+createTime);
	
	
	var url = "/SECIMS/res/planDetais" ;
	var param = {
		"planId": id,
		"planTitle": title,
		"planType": type,
		"planContent": content,
		"createTime": createTime,
		"finishTime": finishTime,
		"userid": userid,
		"status": status
	};
	
	
	var jsonAry = JSON.stringify(param);
	
	console.log(jsonAry);
	
	
	window.location.href = url+"?planId="+id ;
//	

//	$.ajax({
//		type:"post",
//		url:"",
//		async:true,
//		traditional: true,
//		data: {
//			plan: ary,
//		},
//		success: function(data){
//			
//		}
//	});
}



// 编辑 修改计划

function writePlan(plan){
	
	var ary = new Array();
	
	console.log("plan  " + plan);
	
	var planAttrs = plan.split(",");
	
	
	for (var i = 0 ; i < planAttrs.length ; i++) {
		var planAttr = planAttrs[i].split("=");
		ary.push(planAttr[1]);
	}
	
	
	var id = ary[0];
	var title = ary[1];
	var type = ary[2];
	var content = ary[3];
	var createTime = ary[4];
	var finishTime = ary[5];
	var userid = ary[6];
	var status = ary[7];
	
	
	// 弹出子窗口
	layer.open({
		type: 2,
		title: '编辑',
		area: ['40em', '40em'],
		scrollbar: false,
		maxmin: true, //开启最大化最小化按钮
		content: ['/SECIMS/res/getPlanModifyPage','no'], // 添加页面
		// 窗口创建成功后
		success: function(layero, index){
			
			//获取子窗口的body
			var body = layer.getChildFrame('body', index); 
			
			// 赋值
			body.find("#planId").val(id);
			body.find("#planTitle").val(title);
			body.find("#planType").val(type);
			body.find("#status").val(status);
			body.find("#planContent").val(content);
			
		},
		cancel: function(index, layero) {
			layer.msg('已取消添加！', {icon: 5});
			layer.close(index);
		}
	});
	
	
	
}



// 删除学习计划

function delPlan(planId){
	
	console.log("planId = " + planId);
	
	$.ajax({
		type:"post",
		url:"delPlan",
		async:true,
		traditional: true,
		data:{
			planId : planId,
		},
		success : function(data){
			
			if(data){
				
				// 刷新 计划 视图
				flushPlansView("planTr"+planId) ; 
				layer.msg('删除计划成功！', {icon: 6});
				
				console.log("删除 计划 成功！");
			}
			
		}
	});
	
	
}


// 刷新 计划 视图
function flushPlansView(planTrId){
	
	// 移除
	$("#"+planTrId).remove(); 
	
}
























