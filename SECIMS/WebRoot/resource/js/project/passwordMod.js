$(function(){
	var error = false;
	$('#btn_submit').click(function(event){
		$('#username').blur();
		$('#oldpwd').blur();
		$('#newpwd').blur();
		$('#newpwdAgain').blur();
		if(!error){
			var username = $('input[id=username]').val();
			var oldpwd = $('input[id=oldpwd]').val();
			var newpwd = $('input[id=newpwd]').val();
			$.post(user.URL.modPwd(),{username:username,oldPwd:oldpwd,newPwd:newpwd},function(result){
				if(result == 'nouser'){
					showError('username', '用户名不存在!');
					return;
				}
				if(result == 'pwderror'){
					showError('oldpwd', '密码错误!');
					return;
				}
				if(result == 'success'){
					alert("修改成功");
					window.parent.frames.location.href=user.URL.login();
				}
			});
		}
	});
	
	$('#username').blur(function(){
		var username = $('input[id=username]').val();
		if(username == ''){
			showError('username', '用户名不能为空');
			error=true;
			return;
		}else{
			$('#username').css({"border-color":"green"});
			$('#usernameTip').css({"display":"none"});
			error = false;
		}
	});
	
	$('#oldpwd').blur(function(){
		var username = $('input[id=username]').val();
		if(username == ''){
			showError('username', '用户名不能为空');
			error=true;
			return;
		}
		
		var oldpwd = $('input[id=oldpwd]').val();
		if(oldpwd == ''){
			showError('oldpwd', '密码不能为空');
			error=true;
			return;
		}else{
			$("#oldpwd").css({"border-color":"green"});
			$("#oldpwdTip").css({"display":"none"});
			error = false;
		}
	});
	
	$('#newpwd').blur(function(){
		var newpwd = $('input[id=newpwd]').val();
		if(newpwd ==  ''){
			showError('newpwd', '新密码不能为空');
			error=true;
			return;
		}else{
			$("#newpwd").css({"border-color":"green"});
			$("#newpwdTip").css({"display":"none"});
			error = false;
		}
	});
	
	$('#newpwdAgain').blur(function(){
		var newpwd = $('input[id=newpwd]').val();
		if(newpwd == '') {
			showError('newpwd', '新密码不能为空');
			error=true;
			return;
		}

		var newpwdAgain = $("#newpwdAgain").val();
		if(newpwdAgain != newpwd) {
			showError('newpwdAgain', '与输入的新密码不一致');
			error=true;
		}else {
			$("#newpwdAgain").css({"border-color":"green"});
			$("#newpwdAgainTip").css({"display":"none"});
			error = false;
		}
	});
	
});

var user = {
	URL : {
		modPwd : function() {
			return Utils.root() + '/user/modPassword.do';
		},
		login:function(){
			return Utils.root();
		}
	}

}

function showError(formSpan,errorText){
	$('#'+formSpan).css({"border-color":"red"});
	$('#'+formSpan+'Tip').empty();
	$('#'+formSpan+'Tip').append(errorText);
	$('#'+formSpan+'Tip').css({"display":"inline"});
}