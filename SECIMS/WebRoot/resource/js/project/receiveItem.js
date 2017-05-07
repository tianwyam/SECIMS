$(function(){
	  TableInit();
});

var URL = {
		projectUrl:function(){
			return Utils.root()+"/projectListByStaus.do";
		},
		projectInfo:function(projectId){
			return Utils.root()+"/"+projectId+"/listFile.do"
		},
		updateProReceiver:function(){
			return Utils.root()+"/updateProReceiver"
		}
}

function TableInit(){
	//先销毁表格  
    $('#cusTable').bootstrapTable('destroy'); 
	$('#cusTable').bootstrapTable({
	url:URL.projectUrl(),
    striped: true,  //表格显示条纹
    search: true,  
    pagination: true,
    showColumns:true,
    showRefresh:true,
    pageList:[],
	  columns:[
	           {
	        	 field:'id',
	        	 title:'项目编号',
	        	 align:'center',
	           },
	           {
	        	   field:'projectName',
	        	   title:'项目名称',
	        	   align:'center',
	           },
	           {
	        	   
	        	   field:'postName',
	        	   title:'负责人',
	        	   align:'center',
	           },
	           {
	        	   
	        	   field:'phone',
	        	   title:'联系电话',
	        	   align:'center',
	           },
	           {
	        	   
	        	   field:'finishDate',
	        	   title:'期望完成时间',
	        	   align:'center',
	           },
	           {
	        	   field:'detail',
	        	   title:'详情页',
	        	   align:'center',
	        	   formatter:detailFormatter
	           },
	           {
	        	   filed:'Action',
	        	   title:'接收项目',
	        	   align:'center',
	        	   events:actionEvents,
	        	   formatter:actionFormatter
	           }]
  });
}


function detailFormatter(value, row, index) {
    return [
        '<a class="btn btn-info" href="'+URL.projectInfo(row.id)+'">查看</a>'
    ].join('');
}

function actionFormatter(value,row,index){
	return [
	    '<button type="button" id="add" class="btn btn-info">'+
	    	'<span class="glyphicon glyphicon-plus">添加</span>'+
	    '</button>'
	].join('');
}

function addSuccess(){
	return ['<span class="glyphicon glyphicon-ok" disabled="disabled">已添加</span>'];
}

window.actionEvents = {
		'click #add':function(e,value,row,index){
			var userName = $('#userName').val();
			var button = $(this);
			Utils.confirm({title:"提示",message:"是否确认接收项目，接收后无法取消！",operate:function(result){
				if(result){
					$.post(URL.updateProReceiver(),{receiver:userName,projectId:row.id},function(result){
						alert(result);
						if(result == 'addsuccess'){
							button.parent().children().removeClass();
							button.parent().children().addClass('btn btn-success');
							button.parent().children().html(addSuccess());
							button.parent().children().attr("disabled",true);
						}else{
							alert("添加失败");
						}
					});
				}
			}});
		}
}