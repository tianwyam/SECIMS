<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>学习计划-修改</title>
		
		<%-- 全局JS/CSS --%>
		<%@include file="../../common/commonJS.jsp" %>
		
		<script type="text/javascript" src="../js/train-modify.js"></script>
		
	</head>

	<body>

		<div style="margin: 2em; ">

			<form style="padding: 2em;" id="modifyPlanForm">
			
				<input id="planId" type="text" hidden="true" value="">
				
				<div class="form-group has-success has-feedback">
					<label class="control-label" for="planTitle">标题框</label>
					<div class="input-group">
						<span class="input-group-addon">#</span>
						<input type="text" class="form-control" id="planTitle" aria-describedby="planTitleStatus" value="">
					</div>
					<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
					<span id="planTitleStatus" class="sr-only">(success)</span>
				</div>
				<div class="form-group has-success">
					<label class="control-label" for="startTime">开始时间</label>
					<input type="date" class="form-control" id="startTime" placeholder="startTime" value="">
				</div>
				<div class="form-group has-success">
					<label class="control-label" for="endTime">结束时间</label>
					<input type="date" class="form-control" id="endTime" placeholder="endTime" value="">
				</div>
				<div class="form-group has-success">
					<label class="control-label" for="planContent">内容框</label>
					<textarea name="planContent" id="planContent" class="form-control"></textarea>
				</div>
				<button type="submit" class="btn btn-success" id="modifySubmit">Submit</button>
				<button type="reset" class="btn btn-default">reset</button>
			</form>
		</div>

	</body>

</html>