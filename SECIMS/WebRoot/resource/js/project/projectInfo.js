$(function(){
	$('#btn_submit').one('click',function(){
		var id = $('#projectId').val();
		var projectName = $('#projectName').val();
		var instruction = $('#instruction').val();
		var finishDate = $('#finishDate').val();
		var postName = $('#postName').val();
		var phone = $('#phone').val();
		
		var project = {
				id : id,
				projectName:projectName,
				instruction:instruction,
				finishDate:finishDate,
				postName:postName,
				phone:phone
		};
		var json = JSON.stringify(project);
		alert(json);
//		$.ajax({
//			url:pro.URL.update(),
//			data:{
//				project:json
//			},
//			success:function(result){
//				alert(result+"success");
//			},
//			error:function(result){
//				alert(result+"error");
//			}
//		});
		$.post(pro.URL.update(),{project:json},function(result){
			if(result == 'updateSuccess'){
				alert("修改成功");
				$('#proName').html(projectName);
			}else{
				alert("修改失败");
			}
		},"text");
		
	});
});
var pro = {
		URL:{
			update:function(){
//				return Utils.root()+'/'+projectId+'/update';
				return Utils.root()+'/update';
			},
		}
};