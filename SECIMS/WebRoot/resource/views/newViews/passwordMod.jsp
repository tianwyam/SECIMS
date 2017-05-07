<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html>
   <head>
      <title>项目列表页</title>
      <%@ include file="common/head.jsp" %>
      <link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/project/passwordMod.css" />
      <script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/project/passwordMod.js" ></script>
   </head>
   <body>
 		<!-- 页面显示部分 -->
 		<div class="container">
			<div class="panel panel-default">
				<div class="panel-heading text-center">
					<h2>密码修改</h2>
				</div>
				<div class="panel-body">
					<div class="container" style="padding-left: 19em">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label">账号</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="username" placeholder="账号" />
									<span id="usernameTip"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">旧密码</label>
								<div class="col-sm-4">
									<input type="password" class="form-control" id="oldpwd" placeholder="旧密码"/>
									<span id="oldpwdTip"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">新密码</label>
								<div class="col-sm-4">
									<input type="password" class="form-control" id="newpwd" placeholder="新密码" />
									<span id="newpwdTip"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">确认新密码</label>
								<div class="col-sm-4">
									<input type="password" class="form-control" id="newpwdAgain" placeholder="确认新密码" />
									<span id="newpwdAgainTip"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"></label>
								<div class="col-sm-10">
									<button type="button" id="btn_submit" class="btn btn-primary" id="newpwdAgain">确认修改</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div> 			
 		</div>
   </body>
   
</html>