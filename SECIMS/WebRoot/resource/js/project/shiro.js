layui.use(['layer','element','form','laypage'], function(){
	var layer = layui.layer;
	var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
//	layer.msg("hello");
	var laypage = layui.laypage
//监听导航点击
	element.on('nav(demo)', function(elem){
	    layer.msg(elem.text());
	});
	
	var $ = layui.jquery, form = layui.form();
  
  //全选
  form.on('checkbox(allChoose)', function(data){
    var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
    child.each(function(index, item){
      item.checked = data.elem.checked;
    });
    form.render('checkbox');
  });
  
  laypage({
    cont: 'demo1'
    ,pages: 10 //总页数
    ,groups: 5 //连续显示分页数
    ,skip:true
    ,jump:function(obj){
    	layer.msg('第 '+ obj.curr +' 页');
    }
  });
  
  var nums = 5; //每页出现的数据量
  
  //模拟渲染
  var render = function(curr){
    //此处只是演示，实际场景通常是返回已经当前页已经分组好的数据
    var str = '', last = curr*nums - 1;
    layer.msg(curr);
    last = last >= data.length ? (data.length-1) : last;
    for(var i = (curr*nums - nums); i <= last; i++){
      str += '<li>'+ data[i] +'</li>';
    }
    return str;
  };
});