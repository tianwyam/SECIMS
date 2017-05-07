$(function(){
	$('button[id=cancel]').click(function(){
		var projectId = $(this).val();
		var judge = $(this);
		Utils.confirm({title:"提示",message:"确认删除本项目？",operate:function(result){
			if(result){
				$.post(project.URL.removeProject(projectId),{},function(res){
					judge.parent().parent().remove();
				});
			}
		}});
		
	});
});

var project = {
		URL:{
			removeProject:function(projectId){
				return Utils.root()+'/'+projectId+'/delete.do';
			},
		}
	}