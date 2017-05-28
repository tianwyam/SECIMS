


// 自定义 操作按钮
 var operateFormatter = function (value, row, index) {//赋予的参数
	 console.log("周报ID："+row.weekRepId);
      return [
          '<button class="btn btn-info btn-sm rightSize detailBtn" onclick="ToViewWeekly('+row.weekRepId+')"><i class="glyphicon glyphicon-folder-open"></i> 详情</button>',
          '<button class="btn btn-danger btn-sm rightSize packageBtn" onclick="delWeeklyReport('+row.weekRepId+')"><i class="glyphicon glyphicon-trash"></i> 删除</button>'
      ].join('');
  }


// 表列
var columns = [
               {
                   checkbox: true
               },
               {
                   field: 'weekRepId',
                   title: 'ID',
                   align: 'center',
               }, {
                   field: 'recipient',
                   title: '接受人',
                   align: 'center',
               }, {
                   field: 'title',
                   title: '标题',
                   align: 'center'
               }, {
                   field: 'createTime',
                   title: '创建时间',
                   align: 'center',
               }, {
                   field: 'startTime',
                   title: '开始时间',
                   align: 'center',
                   halign:'center' //设置表头列居中对齐
               }, {
            	   field: 'endTime',
                   title: '开始时间',
                   align: 'center',
                   halign:'center' //设置表头列居中对齐
               }, {
                   field: 'operate',
                   title: '操作',
                   align: 'center',
                   valign: 'middle',
                   formatter: operateFormatter //自定义方法，添加操作按钮
               }
           ];


// 初始化 表格 weeklyTable
$(function(){
	$('#weeklyTable').bootstrapTable({
      url: "/SECIMS/res/getWeeklyReportJson",
      striped: true, //是否显示行间隔色
      sortable: false, //是否启用排序
      sortOrder: "desc", //排序方式
      search: false,
      pagination: true,
      showRefresh: true, //是否显示刷新按钮
      showToggle: true,
      showColumns: true, //是否显示所有的列
      pageNumber: 1, //初始化加载第一页，默认第一页
      pageSize: 1, //每页的记录行数（*）
      pageList: [2,5,10,20,25,50,100],
      paginationPreText: "上一页",
      paginationNextText: "下一页",
      paginationFirstText: "首页",
      paginationLastText: "末页",
      clickToSelect: true, //是否启用点击选中行
      showToggle: true, //是否显示详细视图和列表视图的切换按钮
      columns: columns,
      onLoadSuccess: function (data) { //加载成功时执行
          console.log(data);
      },
      onLoadError: function (res) { //加载失败时执行
          console.log(res);
      }
    });
});




// 删除 周报(将状态位改为D)
function delWeeklyReport(weeklyID){
	
	console.log("删除已发送周报开始！");
	
	$.ajax({
		type:"post",
		url:"/SECIMS/res/delWeeklyReport",
		async:true,
		traditional: true,
		dataType:'json',
		data:{
			weekRepId: weeklyID
		},
		success:function(data){
			
			if(data.success){
				
				console.log("删除已发送周报列表成功");
				
				layer.msg("删除已发送周报列表成功",{icon:6});
				
				// 刷新 已发送周报列表
				flushWeeklyReportList(weeklyID);
			}
			
		}
	});
	
	console.log("删除已发送周报结束！");
	
}


// 刷新 已发送周报列表
function flushWeeklyReportList(id){
	$("#weeklyReportListID"+id).remove();
	
	// 获取到列表总数
	var num = $(".weeklyNum").html();
	// 转换成数字然后减一
	$(".weeklyNum").html(parseInt(num) - 1);
}



// 查看周报情况
function ToViewWeekly(weekRepId){
	
	console.log("查看周报情况： "+weekRepId);
	
	window.location.href = "/SECIMS/res/getWeeklyDetailView?weekRepId="+weekRepId;
	
}











