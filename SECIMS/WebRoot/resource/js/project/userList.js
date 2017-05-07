$(function(){
	TableInit();
	ButtonInit();
	
	$('#userName').blur(function(){
		var username = $('input[id=userName]').val();
		if(username == ''){
			showError('userName', '用户名不能为空');
			return;
		}else{
			$('#userName').css({"border-color":"green"});
			$('#userNameTip').css({"display":"none"});
		}
	});
});

var user = {
	URL:{
		userList:function(){
			return Utils.root()+'/user/userList.do';
		},
		addUser:function(){
			return Utils.root()+"/user/addUser.do";
		},
		removeUser:function(){
			return Utils.root()+'/user/removeUser.do';
		}
	}
}
function TableInit(){
	$('#userTable').bootstrapTable({
		url:user.URL.userList(),
		striped: true,  //表格显示条纹
		toolbar: '#toolbar', 
		search: true,  
		pageSize:5,
	    pagination: true,
	    showColumns:true,
	    showRefresh:true,
	    pageList:[],
	    columns:[
		           {
		        	   field:'userName',
		        	   title:'用户名',
		        	   align:'center',
		           },
		           {
		        	   
		        	   field:'role',
		        	   title:'所属角色',
		        	   align:'center',
		           },
		           {
		        	   field:'createTime',
		        	   title:'创建时间',
		        	   align:'center',
		        	   sortable:true,
		           },
		           {
		        	   field:'action',
		        	   title:'Action',
		        	   align:'center',
		        	   formatter:operateFormatter
		           }]
	});
}

function ButtonInit(){
	$('#btn_add').click(function(){
		var userInfoModal = $('#userInfo');
		userInfoModal.modal({
			show:true,//显示弹出层
			backdrop:'static',//禁止位置关闭
			keyboard:false //关闭键盘事件
		});
		$('#submitBtn').unbind('click').bind('click',function(){
			var userName = $('#userName').val();
			var roleId = $('#roleName').val();
			if(userName == ''){
				showError('userName', '用户名不能为空');
				return;
			}
			$.post(user.URL.addUser(),{userName:userName,roleId:roleId},function(result){
				if(result && result['success']){
					$('#userTable').bootstrapTable('insertRow',{
						index:0,
						row:result['data']
					});
					$('#userName').val("");
					userInfoModal.modal('hide');
				}else{
					console.log('result:'+result);
				}
			});
		});
	});
}


function operateFormatter(value, row, index) {
    return [
		 '<button id="btn_delete" type="button" class="btn btn-default" onclick="onRemove(\''+row.userName+'\')">'+
		    '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除'+
		 '</button>'
    ].join('');
    
}

function onRemove(obj){
	Utils.confirm({title:"提示",message:"是否确认删除 "+obj+"用户信息",operate:function(result){
		if(result){
			$.post(user.URL.removeUser(),{userName:obj},function(result){
				if(result == 'removeSuccess'){
					$('#userTable').bootstrapTable('remove',{
						field:'userName',
						values:[obj]
					});
				}else{
					console.log("result:"+result);
				}
			});
		}
	}});
	
//	if(confirm("是否确认删除 "+obj+"用户信息")){
//		$.post(user.URL.removeUser(),{userName:obj},function(result){
//			$('#userTable').bootstrapTable('remove',{
//				field:'userName',
//				values:[obj]
//			});
//		});
//	}
}

function showError(formSpan,errorText){
	$('#'+formSpan).css({"border-color":"red"});
	$('#'+formSpan+'Tip').empty();
	$('#'+formSpan+'Tip').append(errorText);
	$('#'+formSpan+'Tip').css({"display":"inline"});
}

