var error = false;
var project = {
		URL:{
			userList:function(){
				return Utils.root()+'';
			},
			addUser:function(){
				return Utils.root()+"/role/addRole";
			},
			removeRole:function(){
				return Utils.root()+'/role/removeRole';
			}
		}
	}
$(function(){
	TableInit();
	
	$('#roleName').blur(function(){
		var roleName = $('input[id=roleName]').val();
		if(roleName == ''){
			showError('roleName', '角色名不能为空');
			error=true;
			return;
		}else{
			$('#roleName').css({"border-color":"green"});
			$('#roleNameTip').css({"display":"none"});
			error = false;
		}
	});
	$('#roleType').blur(function(){
		var username = $('input[id=roleType]').val();
		if(username == ''){
			showError('roleType', '角色类型不能为空');
			error=true;
			return;
		}else{
			$('#roleType').css({"border-color":"green"});
			$('#roleTypeTip').css({"display":"none"});
			error = false;
		}
	});
});



function TableInit(){
	$('#userTable').bootstrapTable('destroy');
	$('#userTable').bootstrapTable({
		url:project.URL.userList(),
		striped: true,  //表格显示条纹
		toolbar: '#toolbar', 
	    pagination: true,
	    pageList:[],
	    columns:[
		           {
		        	   field:'userName',
		        	   title:'姓名',
		        	   align:'center',
		           },
		           {
		        	   field:'phone',
		        	   title:'电话',
		        	   align:'center',
		           },
		           {
		        	   field:'email',
		        	   title:'邮箱',
		        	   align:'center',
		           },
		           {
		        	   field:'action',
		        	   title:'Action',
		        	   align:'center',
		        	   formatter:operateFormatter
		           }]
	});
	 $('#roleTable').bootstrapTable('hideColumn', 'id');
}

function Btn_add(){
	var status = $('#status').val();
	if(status == 1){
		alert("未接收本项目！！！");
		return;
	}
	var roleInfoModal = $('#userInfo');
	roleInfoModal.modal({
		show:true,//显示弹出层
		backdrop:'static',//禁止位置关闭
		keyboard:false //关闭键盘事件
	});
	
	$('#submitBtn').unbind('click').bind('click',function(){
		$('#roleName').blur();
		$('#roleType').blur();
		if(!error){
			var roleName = $('#roleName').val();
			var roleType = $('#roleType').val();
			$.post(role.URL.addRole(),{roleName:roleName,roleType:roleType},function(result){
				if(result && result['success']){
					$('#roleTable').bootstrapTable('insertRow',{
						index:0,
						row:result['data']
					});
					$('#roleName').val("");
					$('#roleType').val("");
					roleInfoModal.modal('hide');
				}else{
					console.log('result:'+result);
				}
			});
		}
//		window.location.reload();
	});
	
}

function operateFormatter(value, row, index) {
	return [
			 '<button id="btn_delete" type="button" class="btn btn-default" onclick="onRemove(\''+row.id+'\')">'+
			    '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除'+
			 '</button>'
	    ].join('');
}

function onRemove(obj){
	Utils.confirm({title:"提示",message:"是否确认删除 "+obj+"角色信息",operate:function(result){
		if(result){
			$.post(role.URL.removeRole(),{roleId:obj},function(result){
				if(result == 'removeSuccess'){
					$('#roleTable').bootstrapTable('remove',{
						field:'id',
						values:[parseInt(obj)]
					});
				}else{
					console.log("result:"+result);
				}
			});
		}
	}});
}

function showError(formSpan,errorText){
	$('#'+formSpan).css({"border-color":"red"});
	$('#'+formSpan+'Tip').empty();
	$('#'+formSpan+'Tip').append(errorText);
	$('#'+formSpan+'Tip').css({"display":"inline"});
}

