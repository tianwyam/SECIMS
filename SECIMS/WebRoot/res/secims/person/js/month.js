


$(function(){
	
	$("#fileUpLoadToolBar").hide();
	
	// ppt 上传
	$("#uploadPPT").click(function(){
		
		// 文件域打开
		$("#uploadInput").click();
		
		
		
	});
	
	
	// 选择文件ppt
	$("#uploadInput").change(function(){
		
		console.log($(this).val());
		
		var fileVal = $(this).val() ;
		
		var names = fileVal.split("\\");
		
		// 取 最后一个元素
		var fileName = names.pop();
		
		$("#pptName").text(fileName);
		
		// 工具栏打开
		$("#fileUpLoadToolBar").toggle();
		
		// 关闭 上传PPT
		$("#uploadPPT").toggle();
		
	});
	
	
	// 取消 文件上传
	$("#cancelFileBtn").click(function(){
		
		// 工具栏
		$("#fileUpLoadToolBar").toggle();
		
		// 上传PPT
		$("#uploadPPT").toggle();
		
		// 清空 文件域 内容
		//$("#uploadInput").val("");
		$("#pptName").text("");
		
	});
	
	
	
	// 文件上传
	$("#uploadFileBtn").click(function(){
		
		console.log("上传月评PPT 开始");
		
		
		$("#uploadPPTFormId").submit();
		
		
		layer.msg('上传月评PPT成功 ！', {time:50000,icon: 6});
		
		
		console.log("上传月评PPT 结束");
		
		// 表单提交
//		$("#uploadPPTFormId").submit(function(){
//			
//			var fileName = $("#pptName").text();
//			
//			console.log("fileName : "+fileName);
//			console.log("file : "+$("#uploadPPTFormId").serialize());
//			
//			
//			$.ajax({
//				type:'post',
//				url:'/SECIMS/month/uploadPPT',
//				enctype:"multipart/form-data",
//				async:true,
//				traditional: true,
//				success:function(inf){
//					
//					console.log("月评 PPT上传成功！");
//					console.log(inf);
//					
//				},
//				error:function(e){
//					console.log("上传PPT异常！ "+e);
//				}
//			});
//			
//			
//		});
//		
		
		
	});
	
	
	
});





// 删除 上传的月评PPT
function delMonthReview(id,fileURL){
	
	
	console.log("将要被删除的月评情况： "+id+" - "+fileURL);
	
	console.log("删除月评 开始");
	
	$.ajax({
		type:"post",
		url:"/SECIMS/res/delMonthReview",
		async:true,
		traditional: true,
		data:{
			reviewId:id,
			monthFileURL:fileURL
		},
		dataType:"json",
		
		success:function(inf,status){
			
			console.log("删除月评PPT成功！"+inf);
			
			if(inf.success){
				
				// 刷新 月评PPT情况列表
				flushMonthList(id);
				
				layer.msg('删除月评PPT成功 ！', {time:5000,icon: 6});
				
			}
			
		}
	});
	
	
	console.log("删除月评 结束");
	
}



// 刷新 月评PPT情况列表
function flushMonthList(id){
	
	$("#monthID"+id).remove();

}







// 查看 PPT

function toMonthReview(id,filePath){
	
//	filePath = filePath.replace("\\","-");
	
	filePath = encodeURI(filePath); 
	filePath = encodeURI(filePath); 
	
	console.log(filePath);
	
	var url = "/SECIMS/res/toViewPPT" ;
	var param = "?reviewId="+id+"&monthFileURL="+filePath;
	
	window.location.href = url+param ;


//
//	$.ajax({
//		type:"post",
//		url:"/SECIMS/res/toViewPPT",
//		async:true,
//		traditional: true,
//		data:{
//			reviewId:id,
//			monthFileURL:filePath
//		},
//		success:function(inf){
//			
//			console.log(inf);
//			
//			window.location.href = "/SECIMS/res/secims/person/views/monthPPTView.jsp";
//			
//		}
//	});
	
	
}

