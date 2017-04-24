<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>执行学习计划</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%-- 公共JS 和 css --%>
<%@include file="../../common/commonJS.jsp"%>

<script src="<%=path%>/res/secims/person/js/planDetail.js"
	type="text/javascript"></script>

<link rel="stylesheet" href="<%=path%>/res/secims/person/css/train.css" />

</head>
<body>

	<!-- 培养管理的导航条 开始  -->
	<div class="collapse navbar-collapse" id="nav">
		<a class="brand">
			<button type="button" class="btn  btn-success " id="brandBtn">
				<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
				培养管理
			</button> </a>
		<ul class="nav nav-tabs nav-justified">
			<li role="presentation"><a href="getStudyPlans"> <span
					class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
					制定学习计划 </a></li>
			<li role="presentation" class="active"><a
				href="getStudyPlanDetails"> <span
					class="glyphicon glyphicon-tags" aria-hidden="true"></span> 执行学习计划
			</a></li>
			<li role="presentation"><a href="#fff"> <span
					class="glyphicon glyphicon-check" aria-hidden="true"></span> 评定学习评价
			</a></li>
		</ul>
	</div>
	<!-- 导航条  结束 -->


	<!-- 学习计划 明细 树 开始 -->

	<div style="margin:1em;">

		<div>
			<button class="layui-btn layui-btn-primary" id="expendBtn">
				<i class="layui-icon ">&#xe608;</i> 展开
			</button>
			<button class="layui-btn layui-btn-primary" id="closeBtn" >
				<i class="layui-icon">&#x1006;</i> 收缩
			</button>
			
			
			
			<button class="layui-btn layui-btn-primary" id="planAddBtn">
				<i class="layui-icon ">&#xe654;</i> 添加
			</button>
			<button class="layui-btn layui-btn-primary" id="planDelBtn">
				<i class="layui-icon">&#xe640;</i> 删除
			</button>
			<button class="layui-btn layui-btn-primary" id="planModBtn">
				<i class="layui-icon">&#xe642;</i> 修改
			</button>
		</div>

		<table id="mytable" class="treetable">
			<thead>
				<tr>
					<th></th>
					<th>标题</th>
					<th>内容</th>
					<th>开始时间</th>
					<th>结束时间</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="plan" items="${ planDetails}">
					<tr data-tt-id="${plan.planId }">
						<td>
							<input type="radio" name="planRadio" value="${plan.planId }" />
							<i class="layui-icon">&#xe61d;</i>
						</td>
						<td>${plan.planTitle }</td>
						<td>${plan.planContent }</td>
						<td>${plan.startTime }</td>
						<td>${plan.endTime }</td>
					</tr>
					<c:forEach var="detail" items="${plan.studyPlanDetails }">
						<tr data-tt-id="${detail.planDetailId }"
							data-tt-parent-id="${detail.planId }">
							<td>
								<input type="checkbox" name="planDetail" value="${detail.planDetailId }" />
								<i class="layui-icon">&#xe621;</i>
							</td>
							<td>${detail.planDetailTitle }</td>
							<td>${detail.planDetailContent }</td>
							<td>${detail.startTime }</td>
							<td>${detail.endTime }</td>
						</tr>
					</c:forEach>
				</c:forEach>

			</tbody>

		</table>

		

	</div>

	<!-- 学习计划 明细 树 结束 -->



</body>
</html>