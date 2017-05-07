<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resource/images/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/project/style.css">
<title>欢迎登录</title>

 <body>
  	<div class="login" style="background-image:url('../../images/1.jpg'); ">
	  	<form  class="form-horizontal" method="post" id="loginForm" action="${pageContext.request.contextPath }/user/login">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">@</span>
			  <input id="userName" name="userName"  type="text" class="form-control" value="${user.userName }" placeholder="用户名">
			</div>
			<br>
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">@</span>
			  <input id="password" name="password" type="password" class="form-control" value="${user.password }" placeholder="密码" aria-describedby="basic-addon1">
			</div>
		<br>
		<button type="submit" style="width:280px;" class="btn btn-default">登 录</button><font color="red">${errorMsg }</font>
		</form>
	</div>
</body>
</html>