



$(function() {
    $('#exampleTableEvents').bootstrapTable({
      url: "/SECIMS/res/test.json",
      search: false,
      pagination: true,
      showRefresh: true,
      showToggle: true,
      showColumns: true,
      pageSize: 2,
      pageList: [2,5,10,20,25,50,100],
      iconSize: 'outline',
    });
    
});

























/*
var websocket;

$(function() {

	
	
	
	if('WebSocket' in window) {
		websocket = new WebSocket("ws://localhost:8080/SECIMS/websocket");
	} else if('MozWebSocket' in window) {
		websocket = new MozWebSocket("ws://localhost:8080/SECIMS/websocket");
	} else {
		websocket = new SockJS("http://localhost:8080/SECIMS/sockjs/websocket");
	}
	
	
	websocket.onopen = function(evnt) {
		console.log("  websocket.onopen  ");
	};
	
	
	websocket.onmessage = function(evnt) {
		$("#msg").append("<p>(<font color='red'>" + evnt.data + "</font>)</p>");
		console.log("  websocket.onmessage   ");
	};
	
	
	websocket.onerror = function(evnt) {
		console.log("  websocket.onerror  ");
	};
	
	websocket.onclose = function(evnt) {
		console.log("  websocket.onclose  ");
	};
	
	
	$("#TXBTN").click(function(){
		
		var text = $("#tx").val();
		
		if(text == null || text == ""){
			alert(" content  can not empty!!");
			return false;
		}
		
		var msg = {
			msgContent: text,
			postsId: 1
		};
		
		websocket.send(JSON.stringify(msg));
		
	});
	
	
	

});


function closeWebSocket(){
	websocket.close();
}



window.onbeforeunload=function(){
	
	alert("close window");
	
};




*/



//
//$(function() {
//	
//	layui.use('tree', function() {
//		layui.tree({
//			elem: '#demo' //传入元素选择器
//				,
//			nodes: [{ //节点
//				name: '父节点1',
//				children: [{
//					name: '子节点11'
//				}, {
//					name: '子节点12'
//				}]
//			}, {
//				name: '父节点2（可以点左侧箭头，也可以双击标题）',
//				children: [{
//					name: '子节点21',
//					children: [{
//						name: '子节点211'
//					}]
//				}]
//			}]
//		});
//	});
//
//});
//
//
//
//// jquery-treetable
//
//$(function(){
//	
//	$("#mytable").treetable({ expandable: true });
//	
//	$("#expendBtn").on("click",function(){
//		$("#mytable").treetable("expandAll");
//	});
//	
//	$("#closeBtn").on("click",function(){
//		$("#mytable").treetable("collapseAll");
//	});
//	
//	$("#moveBtn").on("click",function(){
//		$("#mytable").treetable("move","3","4");
//	});
//	
//	$("#getBtn").on("click",function(){
//		
//		console.log("get node");
//		
//		var node = $("#mytable").treetable("node","3");
//		
//		var childs = node.children ;
//		
//		alert(childs);
//		
//		for (var i=0; i < childs.length ; i++) {
//			var chd = childs[i];
//			
//			console.log(chd.id);
//			
//			var cells =  chd.row.context.cells;
//			
//			for (var k = 0 ; k < cells.length ; k ++) {
//				var td = cells[k].textContent ;
//				console.log("第"+k+"列的内容： "+td);
//			}
//			
//			console.log(chd) ;
//		}
//		
//		
//		console.log(node.id);
//		
//		console.log(node);
//		
//		console.log(childs);
//	});
//	
//});
//
//
//// 获取 treetable 值
//$(function(){
//	$(".treetable tbody tr").on("dblclick",function(){
//		
//		var attrs = this.attributes ;
//		
//		for (var i=0; i < attrs.length ; i++) {
//			var attrName = attrs[i].name;
//			console.log(attrName);
//			
//			var attrValue = attrs[i].value ;
//			console.log(attrValue) ;
//			
//		}
//		
//	});
//	
//});