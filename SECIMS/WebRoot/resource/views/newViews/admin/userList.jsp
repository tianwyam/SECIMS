<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="../common/head.jsp" %>
        <script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/project/userList.js" ></script>
        
        <title>管理员界面</title>
    </head>
    <body>
    	<div class="container">
    		<h2>用户列表</h2>
			<div class="row" style="margin-top: 2em;">
				<div class="col-md-10">
					<div id="toolbar" class="btn-group">
			            <button id="btn_add" type="button" class="btn btn-default">
			                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
			            </button>
       				 </div>
					<table class="table table-bordered" id="userTable">
					</table>
				</div>
			</div>
    	</div>
    	
    	<!--添加用户信息弹出层 -->
    	<div id="userInfo" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title text-center">
							新增用户
						</h3>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-xs-4 col-xs-offset-1">
								<input type="text" name="userName" id="userName" placeholder="填写用户名" class="form-control"/>
								<span id="userNameTip" style="display: none;color:red;"></span>
							</div>
							<div class="col-xs-4 col-xs-offset-2">
								<select class="selectpicker" id="roleName">
									<option value="3">学生</option>
									<option value="2">教师</option>
									<option value="4">导师</option>
									<option value="1">管理员</option>
									<option value="5">实习生</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer text-center">
						<button type="button" id="submitBtn" class="btn btn-success">
							提交
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							关闭
						</button>
					</div>
				</div>
			</div>    		
    	</div>
 	</body>
</html>