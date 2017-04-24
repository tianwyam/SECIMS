


//设置开始/结束时间
$(function() {
	$(".startTime,.endTime").datetimebox({
		required: true
	});
});

//
////Demo
layui.use('form', function() {

	var form = layui.form();
	var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引

	// 监听提交
	form.on('submit(formDemo)', function(data) {

		var content = JSON.stringify(data.field);

		console.log("data : " + content);

		$.ajax({
			type: "post",
			url: "/SECIMS/res/addPlan",
			data: content,
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			success: function(data) {
				if(data == "Y") {
					layer.msg('添加成功！', {
						icon: 6
					});
					console.log("添加成功");
					parent.layer.close(index); // 关闭本弹窗
				} else {
					layer.msg('添加失败！请重新添加。。。', {
						icon: 2
					});
					console.log("添加失败！请重新添加。。。");
				}
				console.log("success");
			},
			error: function(info) {
				layer.alert('增加学习计划异常！', {
					icon: 5
				});
			}
		});

		console.log("ajax: 添加学习计划 结束！");
		parent.layer.close(index); // 关闭本弹窗
		window.parent.location.reload(); // 刷新父页面

	});
});