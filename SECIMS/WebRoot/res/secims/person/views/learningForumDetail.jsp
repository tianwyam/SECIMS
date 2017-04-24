<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>



<!DOCTYPE HTML>
<html>
  <head>
  
    <title>帖子</title>
    
    <%-- 公共JS 和 css --%>
	<%@include file="../../common/commonJS.jsp" %>
	
	<link rel="stylesheet" href="/SECIMS/res/summernote/summernote.css">
	<link rel="stylesheet" href="/SECIMS/res/summernote/summernote-bs3.css">
	
	<script type="text/javascript" src="/SECIMS/res/summernote/summernote.min.js"></script>
	<script type="text/javascript" src="/SECIMS/res/secims/person/js/learningForumDetail.js"></script>

</head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">

        <div class="row">
            
            <div class="col-sm-12">

					<%-- 帖子信息展示 --%>
					<div class="ibox-content">

						<div class="pull-right tooltip-demo">
							<a href="javascript:self.location=document.referrer;" class="btn btn-white btn-sm"> 
								<span class="glyphicon glyphicon-share-alt" ></span> 返回上一步 
							</a>
						</div>

						<div class="p-xs">
							<div class="pull-left m-r-md">
								<i class="layui-icon fa fa-globe text-navy mid-icon">&#xe60b;</i>
							</div>
							<h2>${post.title }</h2>
							<br />
							<span>发布于：${post.createTimeString }</span>
						</div>
						<hr />
						<div class="p-xs">
							<p>${post.content }</p>
						</div>

					</div>

					
					<%-- 聊天信息展示 --%>
					<div class="ibox-content">
					
						<div class="p-xs">
							<h3>讨论区：</h3>
						</div>

						<div class="row">

							<div class="col-md-12 ">
								<div class="chat-discussion" id="msgBoxId">

									<div class="chat-message">
										<img class="message-avatar" src="/SECIMS/res/secims/person/img/a1.jpg" alt="">
										<div class="message">
											<a class="message-author" href="#"> 颜文字君</a> 
											<span class="message-date"> 2015-02-02 18:39:23 </span> 
											<span class="message-content"> H+ 是个好框架 </span>
										</div>
									</div>

									<div class="chat-message">
										<img class="message-avatar" src="/SECIMS/res/secims/person/img/a4.jpg" alt="">
										<div class="message">
											<a class="message-author" href="#"> 林依晨Ariel </a> 
											<span class="message-date"> 2015-02-02 11:12:36 </span> 
											<span class="message-content"> jQuery表单验证插件 - 让表单验证变得更容易 </span>
										</div>
									</div>

									<div class="chat-message">
										<img class="message-avatar" src="/SECIMS/res/secims/person/img/a2.jpg" alt="">
										<div class="message">
											<a class="message-author" href="#"> 谨斯里 </a> 
											<span class="message-date"> 2015-02-02 11:12:36 </span> 
											<span class="message-content"> 验证日期格式(类似30/30/2008的格式,不验证日期准确性只验证格式 </span>
										</div>
									</div>

								</div>

							</div>

						</div>

					</div>


					<%-- 发布 框 --%>
					<div class="ibox-content">
	
						<div class="row">
							<div class="col-sm-12">
	
								<div class="mail-text">
	
									<div class="summernote"></div>
									<div class="clearfix"></div>
	
								</div>
	
								<div class="mail-body  tooltip-demo">
	
									<button class="btn btn-sm btn-primary" id="sendChattingBtnId">
										<i class="layui-icon">&#xe609;</i> 发表
									</button>
	
								</div>
	
								<div class="clearfix"></div>
	
							</div>
							
						</div>
	
					</div>
					

				</div>

        	</div>


    	</div>




</body>
</html>
