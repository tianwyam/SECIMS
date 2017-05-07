<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>个人中心</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta content="text/html; charset=utf-8">
		<meta name="keywords" content="Test">
		<meta name="description" content="Test">
		<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="shortcut icon" href="<%=path %>/resource/images/favicon.ico" type="image/png">
		<link rel="stylesheet" href="<%=path %>/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=path %>/resource/css/project/personalInfo.css" />
		<script type="text/javascript" src="<%=path %>/resource/bootstrap_table/js/jquery2.0.0.min.js"></script>
		<script type="text/javascript" src="<%=path %>/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=path %>/resource/js/common/common.js" ></script>
		<script type="text/javascript" src="<%=path %>/resource/js/project/personalInfo.js"></script>

	</head>

	<body class="loaded-page">
		<header class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
				</div>
			</div>
		</header>

		<div class="site-main">
			<div class="container">
				<div class="row">
					<div class="col-sm-10 col-md-8 main-content">
						<div class="card-header">
							<h4 class="card-title">邮件设置</h4>
						</div>
						<div class="card-content">
							<form class="form-horizontal info-group" id="userInfoForm">
								<div class="form-group">
								<input type="text" style="display: none" id="userId" name="userId" value="${userInfo.id }" />
									<label class="col-sm-2 control-label">发送</label>
									<div class="col-sm-10">
										<input class="name-input form-control" type="text" id="userName" name="userName" value='${userInfo.actualName }'>
										<span id="userNameTip" style="display: none;color: red;"></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">抄送</label>
									<div class="col-sm-10">
										<input class="phone-input form-control" type="text" id="phone" name="phone" value="${userInfo.phone }"></div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">邮箱</label>
									<div class="col-sm-10">
										<input class="location-input form-control" type="text" id="email" name="email" value="${userInfo.email }">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-10 col-sm-offset-2">
										<a class="btn btn-primary btn-block save-handler" id="submitBtn">保存</a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>