<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>

	<title>周报</title>
	
	<%-- 加载公共 JS/CSS --%>
    <%@include file="../../common/commonJS.jsp" %>

	<link rel="stylesheet" href="/SECIMS/res/summernote/summernote.css">
	<link rel="stylesheet" href="/SECIMS/res/summernote/summernote-bs3.css">
	
	<script type="text/javascript" src="/SECIMS/res/summernote/summernote.min.js"></script>
	<script type="text/javascript" src="/SECIMS/res/secims/person/js/weekly.js"></script>

</head>

<body class="gray-bg">

	<div class="wrapper wrapper-content">


		<div class="row">

			<div class="col-sm-12 animated fadeInRight">
			
				<div class="mail-box-header">
				
					<div class="pull-right tooltip-demo">
						<a href="#" class="btn btn-white btn-sm saveToDraftBox" data-toggle="tooltip" data-placement="top" title="存为草稿">
							<i class="layui-icon">&#xe642;</i>  存为草稿
						</a> 
						<a href="#" class="btn btn-danger btn-sm cancelWeeklyId" data-toggle="tooltip" data-placement="top" title="放弃">
							<i class="layui-icon">&#x1006;</i> 放弃
						</a>
					</div>
					<h2>编辑周报</h2>
					
				</div>
				
				<div class="mail-box">

					<div class="mail-body">

						<form class="form-horizontal" id="weeklyFormId" method="post" action="/SECIMS/res/sendWeekly">
						
							<div class="form-group">
								<label class="col-sm-2 control-label">发送到：</label>
								<div class="col-sm-10">
									<input type="email" class="form-control recipient" name="recipient" required="required" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">主题：</label>
								<div class="col-sm-10">
									<input type="text" class="form-control title" name="title" required="required" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">开始日期：</label>
								<div class="col-sm-10">
									<input type="date" class="form-control startTime" name="startTime"  required="required" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">结束日期：</label>
								<div class="col-sm-10">
									<input type="date" class="form-control endTime" name="endTime" required="required" />
								</div>
							</div>
							
							<%-- 内容 --%>
							<input name="content" class="content" hidden="true" />
							
						</form>

					</div>

					<div class="mail-text">

						<div class="summernote" ></div>
						<div class="clearfix"></div>
						
					</div>
					
					<div class="mail-body text-right tooltip-demo">
					
						<button class="btn btn-sm btn-primary" data-toggle="tooltip" data-placement="top" title="Send" id="sendWeekly">
							<i class="layui-icon">&#xe609;</i>  发送
						</button> 
						
						<button class="btn btn-white btn-sm cancelWeeklyId" data-toggle="tooltip" data-placement="top" title="Discard email">
							<i class="layui-icon">&#x1006;</i>  放弃
						</button> 
						
						<button class="btn btn-white btn-sm saveToDraftBox" data-toggle="tooltip" data-placement="top" title="Move to draft folder">
							<i class="layui-icon">&#xe642;</i>  存为草稿
						</button>
						
					</div>
					
					<div class="clearfix"></div>

				</div>

			</div>

		</div>

	</div>
	
	


</body>
</html>
