<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath(); %>

<!DOCTYPE HTML>
<html>

	<head>
		<title>培养管理</title>

		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="renderer" content="webkit">
		
		<%-- 公共JS 和 css --%>
		<%@include file="../../common/commonJS.jsp" %>
		
		<link rel="stylesheet" href="<%=path %>/res/secims/person/css/train.css" />

		<script type="text/javascript" src="<%=path %>/res/secims/person/js/train.js"></script>
		
	</head>

	<body>

		<!-- 培养管理的导航条 开始  -->
		<div class="collapse navbar-collapse" id="nav">
			<a class="brand">
				<button type="button" class="btn  btn-success " id="brandBtn">
  					<span class="glyphicon glyphicon-star" aria-hidden="true"></span> 培养管理
				</button>
			</a>
			<ul class="nav nav-tabs nav-justified">
				<li role="presentation" class="active">
					<a href="getStudyPlans">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 制定学习计划
					</a>
				</li>
				<li role="presentation">
					<a href="getStudyPlanDetails">
						<span class="glyphicon glyphicon-tags" aria-hidden="true"></span> 执行学习计划
					</a>
				</li>
				<li role="presentation">
					<a href="#fff">
						<span class="glyphicon glyphicon-check" aria-hidden="true"></span> 评定学习评价
					</a>
				</li>
			</ul>
		</div>
		<!-- 导航条  结束 -->


		<!-- 制定学习计划  菜单栏   开始 -->

		<div class="toolGroup">
			<div id="tools" class="btn-group btn-group-justified" role="group" aria-label="tools">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-success" id="toolAdd">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>  增加
					</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-success" id="toolDel">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>  删除
					</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-success" id="toolModify">
						<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>  修改
					</button>
				</div>
			</div>
		</div>
		
		<!-- 制定学习计划  菜单栏   结束 -->


		<!-- 制定学习计划  开始 -->
		<div class="studyPlan">
			
			<!--  全选/全取消  按钮-->
			<div style="margin: .8em;">
				<button class="layui-btn layui-btn-primary" id="checkboxChoose">
					<i class="layui-icon">&#xe627;</i> 全选
				</button>
				<button class="layui-btn layui-btn-primary" id="checkboxCancel">
					<i class="layui-icon">&#xe626;</i> 取消
				</button>
			</div>
			
			<!--  学习计划 -->
			<table class="table table-bordered table-hover" style="overflow: auto;">
				<tr class="warning">
					<th></th>
					<th>标题</th>
					<th>内容</th>
					<th>开始时间</th>
					<th>结束时间</th>
				</tr>
				
				<c:forEach var="plan" items="${plans }" >
					<tr>
						<td><input type="checkbox" name="checkbox" value="${plan.planId }"  /></td>
						<td>${plan.planTitle }</td>
						<td>${plan.planContent }</td>
						<td>${plan.startTime }</td>
						<td>${plan.endTime }</td>
					</tr>
				</c:forEach>
				
			</table>

		</div>
		<!-- 制定学习计划  结束 -->
		
		
		<div class="row">
	        <div class="col-sm-12">
	            <div class="wrapper wrapper-content animated fadeInUp">
	                <ul class="notes">
	                    
	                    <c:forEach var="plan" items="${plans }">
	                    <li>
							<div>
								<small>2014年10月24日(星期五) 下午5:31</small>
								<h4>${plan.planTitle }</h4>
								<p>${plan.planContent }</p>
								<a href="pin_board.html#"><i class="layui-icon">&#xe640;</i>
								</a>
								<a href="pin_board.html#"><i class="layui-icon">&#xe640;</i>
								</a>
								<a href="pin_board.html#"><i class="layui-icon">&#xe640;</i>
								</a>
							</div>
						</li>
						</c:forEach>
	                    
	                    
	                </ul>
	            </div>
	        </div>
    	</div>
		


	</body>

</html>