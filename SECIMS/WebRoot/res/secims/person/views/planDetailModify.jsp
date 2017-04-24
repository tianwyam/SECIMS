<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
  
    <title>编辑 学习计划详情</title>

	<%-- 公共JS 和 css --%>
	<%@include file="../../common/commonJS.jsp"%>

  </head>
  
  <body>
  
  		  <div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-sm-11">
					<div class="ibox">
	
						<div class="ibox-content">
							<div class="row">
								<div class="col-sm-11">


									<!-- 修改 学习计划 详情 表单 元素 -->
									<form id="detailModifyForm">
	
										<input type="text" name="planDetailId" id="planDetailId"  hidden="true" />
	
										<div class="form-group  has-feedback form-group-lg">
											<label class="control-label" for="planDetailTitle">计划详情标题</label>
											<div class="input-group">
												<span class="input-group-addon">#</span> 
												<input type="text" class="form-control" name="planDetailTitle" id="planDetailTitle"  aria-describedby="planDetailTitleStatus" required="required" />
											</div>
											<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span> 
											<span id="planDetailTitleStatus" class="sr-only">(success)</span>
										</div>
	
										<div class="form-group form-group-lg">
											<label class="control-label" for="status">计划详情状态</label> 
											<select class="form-control" id="status" name="status">
												<option value="E" selected="selected">执行</option>
												<option value="F">完成</option>
												<option value="K">保留</option>
											</select>
										</div>
	
										<div class="form-group form-group-lg">
											<label class="control-label" for="planDetailContent">计划详情内容</label>
											<textarea name="planDetailContent" id="planDetailContent" rows="10" class="form-control"></textarea>
										</div>
	
									</form>
									
									<button  class="btn btn-success" id="detailModifySubmit">提交</button>

								</div>
							</div>
						</div>
	
					</div>
	
				</div>
	
			</div>
		</div>
  		
  		<script type="text/javascript" src="<%=bootpath%>/res/secims/person/js/planDetailModify.js"></script>
  		
  </body>
</html>
