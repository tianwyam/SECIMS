$(function(){
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
		update:function(){
			return Utils.root()+'/user/updateInfo';
		}
	}
}

function ButtonInit(){
	$('#submitBtn').unbind('click').bind('click',function(){
		var userName = $('#userName').val();
		if(userName == ''){
			showError('username', '用户名不能为空');
			return;
		}
		var userId = $('#userId').val();
		var userName = $('#userName').val();
		var phone = $('#phone').val();
		var email = $('#email').val();
		var userInfo = {
				id:userId,
				actualName:userName,
				email:email,
				phone:phone
		}
		
//		var userInfo = $('#userInfoForm').serialize();
		alert(userInfo);
		var json = JSON.stringify(userInfo);
		$.post(user.URL.update(),{userInfo:json},function(result){
			alert(result);
		},"text");
	});
}


function showError(formSpan,errorText){
	$('#'+formSpan).css({"border-color":"red"});
	$('#'+formSpan+'Tip').empty();
	$('#'+formSpan+'Tip').append(errorText);
	$('#'+formSpan+'Tip').css({"display":"inline"});
}

