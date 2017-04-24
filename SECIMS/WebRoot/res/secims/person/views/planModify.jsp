<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>修改 计划</title>
	
	<%-- 公共JS 和 css --%>
	<%@include file="../../common/commonJS.jsp"%>
	
	<script type="text/javascript" src="<%=bootpath%>/res/secims/person/js/planModify.js"></script>

  </head>
  
  <body>
  	
  		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-sm-11">
					<div class="ibox">
	
						<div class="ibox-content">
							<div class="row">
								<div class="col-sm-11">
									<form  id="formModifyID">
									
										<input type="text" class="form-control" name="planId" id="planId" style="display: none;" />
										
										<div class="form-group  has-feedback form-group-lg">
											<label class="control-label" for="planTitle">计划标题</label>
											<div class="input-group">
												<span class="input-group-addon">#</span> 
												<input type="text" class="form-control" name="planTitle" id="planTitle" aria-describedby="planTitleStatus" required="required"  />
											</div>
											<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span> 
											<span id="planTitleStatus" class="sr-only">(success)</span>
										</div>
										
										<div class="form-group form-group-lg">
											<label class="control-label" for="planType">计划类型</label> 
											<select class="form-control" id="planType" name="planType" >
											  <option value="web前端">web前端</option>
											  <option value="开发技术" selected="selected">开发技术</option>
											  <option value="网络技术">网络技术</option>
											  <option value="操作系统">操作系统</option>
											  <option value="安全技术">安全技术</option>
											  <option value="数据库">数据库</option>
											</select>
										</div>
										
										<div class="form-group form-group-lg">
										    <label class="control-label" for="status">计划状态</label>
										    <select class="form-control" id="status" name="status" >
											  <option value="E" selected="selected">执行</option>
											  <option value="F">完成</option>
											  <option value="K">保留</option>
											</select>
										 </div>
									
										<div class="form-group form-group-lg">
											<label class="control-label" for="planContent">计划内容</label>
											<textarea name="planContent" id="planContent" class="form-control" required="required"></textarea>
										</div>
										
										
									</form>
									
									<button class="btn btn-success" id="planModSubmit">提交</button>
									
									
								</div>
							</div>
						</div>
	
					</div>
	
				</div>
	
			</div>
		</div>
  		
  
  </body>
</html>
