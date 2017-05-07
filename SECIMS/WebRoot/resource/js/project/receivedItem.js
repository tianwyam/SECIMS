$(function(){
	  TableInit();
});

var URL = {
		projectUrl:function(name){
			return Utils.root()+"/"+name+"/proListByReceiver";
		},
		projectInfo:function(projectId){
			return Utils.root()+"/"+projectId+"/listFile.do"
		}
		
}

function TableInit(){
	//先销毁表格  
    $('#cusTable').bootstrapTable('destroy'); 
    var name = $('#userName').val();
	$('#cusTable').bootstrapTable({
	url:URL.projectUrl(name),
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
	           }]
  });
}


function detailFormatter(value, row, index) {
    return [
        '<a class="btn btn-info" href="'+URL.projectInfo(row.id)+'">查看</a>'
    ].join('');
}
