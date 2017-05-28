$(function(){
    //菜单点击
    //J_iframe
    $(".J_menuItem").on('click',function(){
    	
    	var current = $(this);
    	
    	// 修改框架中的SRC
        var url = $(this).attr('href');
        $("#J_iframe").attr('src',url);
        
        // 首先清除所有颜色及图标
        $(".J_menuItem").each(function(index,element){
        	$(this).css("color","#869fb1");
        	$(this).removeClass("glyphicon glyphicon-hand-right");
        });
        
        // 当前点击的菜单改变颜色及图标
        current.css("color","white");
        current.addClass("glyphicon glyphicon-hand-right");
        
        // 返回false，可以提前退出循环
        return false;
    });
    
    
 
    
    
});