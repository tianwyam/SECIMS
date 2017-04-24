<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>增加学习计划</title>

		<!-- 全局JS/CSS -->
		<%@include file="../../common/commonJS.jsp" %>
		
		<script type="text/javascript" src="/SECIMS/res/secims/person/js/train-add.js"></script>


	</head>

	<body>

		<div class="plan-add" style="margin: 2em ;">
			<form class="layui-form" >
				
				<div class="layui-form-item">
					<label class="layui-form-label">标题框</label>
					<div class="layui-input-block">
						<input type="text" name="planTitle" required lay-verify="required" placeholder="请输入标题" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">开始时间</label>
					<div class="layui-input-block">
						<input  type="text" name="startTime" class="easyui-datetimebox layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">结束时间</label>
					<div class="layui-input-block">
						<input  type="text" name="endTime" class="easyui-datetimebox layui-input " >
					</div>
				</div>
				
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">内容框</label>
					<div class="layui-input-block">
						<textarea name="planContent" placeholder="请输入内容" class="layui-textarea"></textarea>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>

			</form>
		</div>

	</body>

</html>