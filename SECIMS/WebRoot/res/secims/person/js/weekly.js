




// 初始化 文本编辑器
$(function() {

	$('.summernote').summernote({
		height: 160,
		minHeight : 100,
		lang : 'zh-CN',
		dialogsFade : true,
		dialogsInBody : true,
		disableDragAndDrop : false,
		
	    codemirror: {
	      mode: 'text/html',
	      htmlMode: true,
	      lineNumbers: true,
	      theme: 'monokai'
	    },
	    
	    callbacks: {
	      onInit: function() {
	    	  
	      },
	      onFocus: function() {
	    	  
	      },
	      onBlur: function() {
	      }
	      
	    }
	});

});




// 功能操作
$(function() {


	
	/*
	 * 发送周报
	 */ 
	$("#sendWeekly").click(function() {

		console.log("发送周报开始");

		// 校验 发送人
		var recipient = $(".recipient").val();
		if(recipient == null || recipient == "") {

			layer.alert('收件人必填', {
				icon: 5,
				yes: function(index) {
					layer.close(index);
					$(".recipient").focus();
				}
			});

			return false;
		}

		// 校验 主题
		var title = $(".title").val();
		if(title == null || title == "") {

			layer.alert('主题必填', {
				icon: 5,
				yes: function(index) {
					layer.close(index);
					$(".title").focus();
				}
			});

			return false;
		}

		// 校验 开始时间/结束时间
		var startTime = $(".startTime").val();
		var endTime = $(".endTime").val();
		var result = checkDate(startTime, endTime);

		if(!result[0]) {

			layer.alert(result[1], {
				icon: 5,
				yes: function(index) {
					layer.close(index);
				}
			});

			return false;
		}

		// 内容
		var html = $('.summernote').summernote('code');

		// 去掉空格及换行符
		html = RemoveBlankSpaceAndNewlineOperator(html);

		console.log("html = " + html);
		//		html = encodeURI(html); 
		//		html = encodeURI(html); //先编码两次，后台解码一次

		
//		// 给内容赋值
//		$(".content").val(html);
//		
//		var form = $("#weeklyFormId");
//		
//		// form 表单提交
//		form.submit();
		
		

		var data = {
			"recipient": recipient,
			"title": title,
			"content": html,
			"startTime": startTime,
			"endTime": endTime,
			"status": "F"
		};
		
		
		var form = $("#weeklyFormId").serialize();
		form = form+"&content="+html;
		
		console.log("form = "+form);

		//发送周报
		$.ajax({
			type: "post",
			url: "/SECIMS/res/sendWeekly",
			async: true,
			traditional: true,
			contentType: 'application/json;charset=utf-8',
			dataType:'json',
			data: JSON.stringify(data),
			success: function(data) {

				// 成功
				if(data.success) {

					console.log("发送周报成功！");
					
					layer.msg('周报发送成功！', {icon: 6,time:3000});
					
					// 跳转到 已发送周报列表页面
					window.location.href = "/SECIMS/res/getWeeklyReport" ;

				}

			}

		});
		
		
		
		// 销毁 
		$('.summernote').summernote('destroy');
	
		console.log("发送周报结束");
	
	});
	
	
	
	
	/*
	 * 取消 按钮响应事件/跳转到 已发送周报列表中
	 */ 
	$(".cancelWeeklyId").on("click", function() {
	
		//询问框
		layer.confirm('你确定要放弃吗？有可能会丢失一些东西哟^-^', {
			icon:5,
			btn: ['确定', '取消'] //按钮
		}, function() {
			
			layer.msg('OK! 即将跳转到已发送周报列表，请稍等。。。。。。', {
				icon: 1,
				time:40000
			});
			
			// 跳转到 已发送周报列表页面
			window.location.href = "/SECIMS/res/getWeeklyReport" ;
			
		}, function() {
			layer.msg('OK! 请继续。。。。。。', {
				icon:1,
				time: 2500
			});
		});
		
		console.log("放弃。。。。。。。。。");
	
	});
	
	
	
	
	/*
	 * 存为 草稿箱
	 */
	$(".saveToDraftBox").click(function(){
		
		console.log("保存到草稿箱开始");

		// 校验 发送人
		var recipient = $(".recipient").val();
		if(recipient == null || recipient == "") {

			layer.alert('收件人必填', {
				icon: 5,
				yes: function(index) {
					layer.close(index);
					$(".recipient").focus();
				}
			});

			return false;
		}

		// 校验 主题
		var title = $(".title").val();
		if(title == null || title == "") {

			layer.alert('主题必填', {
				icon: 5,
				yes: function(index) {
					layer.close(index);
					$(".title").focus();
				}
			});

			return false;
		}

		// 校验 开始时间/结束时间
		var startTime = $(".startTime").val();
		var endTime = $(".endTime").val();
		var result = checkDate(startTime, endTime);

		if(!result[0]) {

			layer.alert(result[1], {
				icon: 5,
				yes: function(index) {
					layer.close(index);
				}
			});

			return false;
		}

		// 内容
		var html = $('.summernote').summernote('code');

		// 去掉空格及换行符
		html = RemoveBlankSpaceAndNewlineOperator(html);

		console.log("html = " + html);
		
		var data = {
			"recipient": recipient,
			"title": title,
			"content": html,
			"startTime": startTime,
			"endTime": endTime,
			"status": "E"
		};
		
		
		console.log("form = "+data);

		//发送周报
		$.ajax({
			type: "post",
			url: "/SECIMS/res/saveToDraftBox",
			async: true,
			traditional: true,
			contentType: 'application/json;charset=utf-8',
			dataType:'json',
			data: JSON.stringify(data),
			success: function(data) {

				// 成功
				if(data.success) {

					console.log("保存到草稿箱成功！");
					
					layer.msg('保存到草稿箱成功！', {icon: 6,time:3000});
					
					// 跳转到 草稿箱
					window.location.href = "/SECIMS/res/getWeeklyDraftBox" ;

				}

			}

		});
		
		
		
		// 销毁 
		$('.summernote').summernote('destroy');
	
		console.log("保存到草稿箱结束");
		
	});
	
	
	
	
	
	
	

});


// 校验开始时间/结束时间 周报日期之间最多工作日为7天
function checkDate(startTime, endTime) {

	var result = new Array();

	// 是否成功标准
	result[0] = false;
	// 错误信息
	result[1] = "";

	if(startTime == null || startTime == "") {
		result[1] = "开始日期不能为空！";
		return result;
	}

	if(endTime == null || endTime == "") {
		result[1] = "结束日期不能为空！";
		return result;
	}

	var start = new Date(startTime);
	var end = new Date(endTime);

	/*
	 *  end.getTime() - start.getTime() 之间相差的毫秒数
	 */
	if(end <= start || (end.getTime() - start.getTime()) / (24 * 3600 * 1000) >= 7) {
		result[1] = "周报开始时间要小于结束时间，并且之间工作日最多为7天";
		return result;
	}

	// 成功
	result[0] = true;

	return result;

}



// 去掉空格及换行符
function RemoveBlankSpaceAndNewlineOperator(html){
	
	// 去掉空格及换行符
	html = html.replace(/\ +/g, "").replace(/[ ]/g, "").replace(/[\r\n]/g, "");

	html = html.replace(/<\/?[^>]*>/g, ''); //去除HTML tag
	html = html.replace(/[ | ]*\n/g, '\n'); //去除行尾空白
	html = html.replace(/\n[\s| | ]*\r/g, '\n'); //去除多余空行
	html = html.replace(/ /ig, ''); //去掉 
	html = html.replace(/^[\s　]+|[\s　]+$/g, ""); //去掉全角半角空格
	html = html.replace(/[\r\n]/g, ""); //去掉回车换行
	html = html.replace(/^\s*|\s*$/g, "");
		
	return html;
	
}



