<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   		<%@ include file="../common/head.jsp" %>
        <script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/project/roleList.js" ></script>
        <title>管理员界面</title>
    </head>
    <body>
    	<div class="container">
    		<h2>角色列表</h2>
			<div class="row" style="margin-top: 2em;">
				<div class="col-md-10">
					<div id="toolbar" class="btn-group">
			            <button id="btn_add" type="button" class="btn btn-default" onclick="Btn_add()">
			                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
			            </button>
       				 </div>
					<table class="table table-bordered" id="roleTable">
					</table>
				</div>
			</div>
    	</div>
    	
    	<!--添加角色信息弹出层 -->
    	<div id="roleInfo" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title text-center">
							新增角色
						</h3>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-xs-4 col-xs-offset-1">
								<input type="text" name="roleName" id="roleName" placeholder="填写角色名称" class="form-control"/>
								<span id="roleNameTip" style="display: none;color:red;"></span>
							</div>
							<div class="col-xs-4 col-xs-offset-2">
								<input type="text" name="roleType" id="roleType" placeholder="填写角色类型" class="form-control"/>
								<span id="roleTypeTip" style="display: none;color:red;"></span>
							</div>
						</div>
					</div>
					<div class="modal-footer">
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