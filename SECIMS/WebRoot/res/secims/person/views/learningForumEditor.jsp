<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML>
<html>
  <head>
  
    <title>发布话题</title>
    
    <%-- 加载公共 JS/CSS --%>
    <%@include file="../../common/commonJS.jsp" %>

	<link rel="stylesheet" href="/SECIMS/res/summernote/summernote.css">
	<link rel="stylesheet" href="/SECIMS/res/summernote/summernote-bs3.css">
	
	<script type="text/javascript" src="/SECIMS/res/summernote/summernote.min.js"></script>
	
	<%-- 自定义JS --%>
	<script type="text/javascript" src="/SECIMS/res/secims/person/js/learningForum.js"></script>

  </head>
  
 <body class="gray-bg">

	<div class="wrapper wrapper-content">


		<div class="row">

			<div class="col-sm-12 animated fadeInRight">
			
				<div class="mail-box-header">
				
					<div class="pull-right tooltip-demo">
						<a href="javascript:" onclick="self.location=document.referrer;" class="btn btn-white btn-sm" >
							<i class="layui-icon">&#xe642;</i>  返回上一步
						</a> 
					</div>
					
					<h2>发布话题</h2>
					
				</div>
				
				<div class="mail-box">

					<div class="mail-body">

						<form class="form-horizontal" id="forumId" method="post" action="/SECIMS/res/sendForumPosts">
						
							<div class="form-group form-group-lg">
								<label class="col-sm-2 control-label">标题：</label>
								<div class="col-sm-10">
									<input type="text" class="form-control title" name="title" required="required" placeholder="最多输入20个汉字" />
								</div>
							</div>
							
							<div class="form-group form-group-lg">
								<label class="col-sm-2 control-label">分类：</label> 
								<div class="col-sm-10">
									<select class="form-control" id="type" name="type">
										<option value="web前端">web前端</option>
										<option value="开发技术" selected="selected">开发技术</option>
										<option value="网络技术">网络技术</option>
										<option value="操作系统">操作系统</option>
										<option value="安全技术">安全技术</option>
										<option value="数据库">数据库</option>
									</select>
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
					
					<div class="mail-body  tooltip-demo">
					
						<button class="btn btn-sm btn-primary" id="AddForumPostsId">
							<i class="layui-icon">&#xe609;</i>  发表
						</button> 
						
					</div>
					
					<div class="clearfix"></div>

				</div>

			</div>

		</div>

	</div>
	
	
	
	
  		
  </body>
</html>
