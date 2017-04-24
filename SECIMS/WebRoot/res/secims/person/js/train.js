


// 复选框 的全选/取消 按钮
$(function(){
	
	$("#checkboxCancel").hide();
	
	$("#checkboxChoose").on("click", function(){
		$("[name='checkbox']").prop("checked", true);  // 全选
		$("#checkboxCancel").show();
		$("#checkboxChoose").hide();
	});
	
	$("#checkboxCancel").on("click", function(){
		$("[name='checkbox']").prop("checked", false); //取消全选 
		$("#checkboxChoose").show();
		$("#checkboxCancel").hide();
	});
	
});




// layer 弹窗

layui.use('layer', function() {
	var layer = layui.layer;
});



// 添加 菜单 功能实现
$(function() {

	$("#toolAdd").click(function() {
		layer.open({
			type: 2,
			skin: 'layui-layer-molv',//默认皮肤
			title: '增加学习计划',
			area: ['40em', '36em'],
			maxmin: true, //开启最大化最小化按钮
			content: ['/SECIMS/res/secims/person/views/train-add.jsp','no'], // 添加页面
			cancel: function(index, layero) {
				layer.msg('已取消添加！', {icon: 5});
			}
		});

	});

});



// 删除 菜单 功能实现

$(function() {

	$("#toolDel").on("click", function(){
		
		var studyPlanIDs = [] ; // 要删除的学习计划的id
		
		$("[name='checkbox']:checked").each(function(){
			studyPlanIDs.push($(this).val()); // 存入数组中
		});
		
		console.log("学习计划的ids : " + studyPlanIDs);
		
		if(studyPlanIDs.length != 0){
			$.ajax({
				type:"post",
				url:"delPlanByIDs",
				async:true,
				traditional: true,
				data: {
					data: studyPlanIDs,
				},
				success: function(data){
					if(data == 'Y'){
						layer.msg('删除成功！', {icon: 1});
						flushPlanList(); // 刷新 学习计划列表
					}else{
						layer.msg('删除失败！', {icon: 2});
					}
				},
				error: function(info){
					layer.alert('删除学习计划异常！',{icon: 5});
				}
				
			});
		}else{
			layer.msg('请选择要删除的计划。。。', {icon: 5});
		}
	});
	
	
	// 刷新学习计划列表 删除节点
	function flushPlanList(){
		$("[name='checkbox']:checked").each(function(){
			var tr = $(this).parents("tr"); //获取父元素 （一行）
			tr.remove(); //移除
		});
	};
	
});



// 修改 学习计划 功能实现
$(function(){
	
	// 修改 按钮事件响应
	$("#toolModify").on("click",function(){
		
		
		// 获取 要修改的 计划
		var checkboxs = $("[name='checkbox']:checked");
		
		if(checkboxs.length != 1){
			layer.msg('请选择要修改的计划/只能选择一个。。。', {icon: 5});
			return false;
		}
		
		var tr ;
		
		checkboxs.each(function(){
			tr = $(this).parents("tr");
		});
		
		
		
		// 计划 各项值
		var id = tr.find("td:eq(0)").find("input").val(); // planId
		var title = tr.find("td:eq(1)").text(); // planTitle
		var content = tr.find("td:eq(2)").text(); // planContent
		var start = tr.find("td:eq(3)").text(); // startTime
		var end = tr.find("td:eq(4)").text(); // endTime
		
		console.log(id+" - "+title+" - "+content+" - "+start+" - "+end);
		
		// 对开始时间的操作
		var startd = new Date(start);
		var startYear = startd.getFullYear()+"";
		var startMonth = (startd.getMonth()+1)+"";
		var startDate = startd.getDate()+"";
		
		
		startMonth = ((startMonth.length > 1) ? "" : "0") + startMonth ;
		startDate = ((startDate.length > 1) ? "" : "0") + startDate ;
		
		var startStr = startYear+"-"+startMonth+"-"+startDate ;
		
		console.log("year : "+startYear+" - month : "+startMonth+" - day : "+startDate);
		
		// 对结束时间的操作
		var endd = new Date(end);
		var endYear = endd.getFullYear()+"";
		var endMonth = (endd.getMonth()+1)+"";
		var endDate = endd.getDate()+"";
		
		endMonth = (endMonth.length > 1 ? "" : "0") + endMonth ;
		endDate = (endDate.length > 1 ? "":"0") + endDate ;
		
		var endStr = endYear+"-"+endMonth+"-"+endDate ;
		
		console.log("year : "+endYear+" - month : "+endMonth+" - day : "+endDate);
		
		
		// 弹出子窗口
		layer.open({
			type: 2,
			skin: 'layui-layer-molv',//默认皮肤
			title: '修改-学习计划',
			area: ['40em', '36em'],
			maxmin: true, //开启最大化最小化按钮
			content: ['/SECIMS/res/secims/person/views/train-modify.jsp','no'], // 添加页面
			// 窗口创建成功后
			success: function(layero, index){
				
				//获取子窗口的body
				var body = layer.getChildFrame('body', index); 
				
				// 赋值
				body.find("#planId").val(id);
				body.find("#planTitle").val(title);
				body.find("#planContent").val(content);
				body.find("#startTime").val(startStr);
				body.find("#endTime").val(endStr);
				
			},
			cancel: function(index, layero) {
				layer.msg('已取消添加！', {icon: 5});
			}
		});
	});
});















//var $parentNode = window.parent.document;

//function $childNode(name) {
//  return window.frames[name]
//}

//// tooltips
//$('.tooltip-demo').tooltip({
//  selector: "[data-toggle=tooltip]",
//  container: "body"
//});

//// 使用animation.css修改Bootstrap Modal
//$('.modal').appendTo("body");

//$("[data-toggle=popover]").popover();


//判断当前页面是否在iframe中
if (top == this) {
 var gohome = '<div class="gohome"><a class="animated bounceInUp" href="index.html?v=4.0" title="返回首页"><i class="fa fa-home"></i></a></div>';
 $('body').append(gohome);
}

//animation.css
function animationHover(element, animation) {
 element = $(element);
 element.hover(
     function () {
         element.addClass('animated ' + animation);
     },
     function () {
         //动画完成之前移除class
         window.setTimeout(function () {
             element.removeClass('animated ' + animation);
         }, 2000);
     });
}

//拖动面板
function WinMove() {
 var element = "[class*=col]";
 var handle = ".ibox-title";
 var connect = "[class*=col]";
 $(element).sortable({
         handle: handle,
         connectWith: connect,
         tolerance: 'pointer',
         forcePlaceholderSize: true,
         opacity: 0.8,
     })
     .disableSelection();
};


















