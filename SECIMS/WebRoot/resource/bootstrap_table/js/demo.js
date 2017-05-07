$(function(){
	//先销毁表格  
      $('#cusTable').bootstrapTable('destroy'); 
	  $('#cusTable').bootstrapTable({
	  url:getRootPath()+"/projectListByStaus.do",
      striped: true,  //表格显示条纹
      search: true,  
      pagination: true,
      showColumns:true,
      showRefresh:true,
      pageList:[],
	  columns:[
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
	        	   title:'结束时间',
	        	   align:'center',
	           },
	           {
	        	   field:'detail',
	        	   title:'详情页',
	        	   align:'center',
	        	   formatter:operateFormatter
	           }]
    });
});

/**   
 * 获取项目根目录
 */
function getRootPath() {
    // 获取当前网址，如： http://localhost:8088/test/test.jsp
    var curPath = window.document.location.href;
    //获取主机地址之后的目录，如： test/test.jsp
    var pathName = window.document.location.pathname;
    var pos = curPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8088
    var localhostPath = curPath.substring(0, pos);
    //获取带"/"的项目名，如：/test
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    return (localhostPath + projectName);//发布前用此
}

function operateFormatter(value, row, index) {
    return [
        '<a class="btn btn-info" href="#">查看</a>'
    ].join('');
}