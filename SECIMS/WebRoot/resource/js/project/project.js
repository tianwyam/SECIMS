layui.use(['form', 'layedit'], function() {
	var form = layui.form(),
		layer = layui.layer,
		layedit = layui.layedit,

	//创建一个编辑器
	var editIndex = layedit.build('LAY_demo_editor');

	//自定义验证规则
	form.verify({
		title: function(value) {
			if(value.length < 5) {
				return '标题至少得5个字符啊';
			}
		},
		pass: [/(.+){6,12}$/, '密码必须6到12位'],
		content: function(value) {
			layedit.sync(editIndex);
		}
	});

	//监听提交
	form.on('submit(demo1)', function(data) {
		layer.alert(JSON.stringify(data.field), {
			title: '最终的提交信息'
		})
		return false;
	});

});