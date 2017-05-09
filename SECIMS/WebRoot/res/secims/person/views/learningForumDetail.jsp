<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML>
<html>
  <head>
  
    <title>帖子</title>
    
    <%-- 公共JS 和 css --%>
	<%@include file="../../common/commonJS.jsp" %>
	
	<link rel="stylesheet" href="/SECIMS/res/summernote/summernote.css">
	<link rel="stylesheet" href="/SECIMS/res/summernote/summernote-bs3.css">
	
	
	
	<script type="text/javascript" src="/SECIMS/res/secims/person/js/webSocketJS.js"></script>
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
								<span class="glyphicon glyphicon-share-alt" ></span> 返回
							</a>
						</div>

						<div class="p-xs">
							<div class="pull-left m-r-md">
								<i class="layui-icon fa fa-globe text-navy mid-icon">&#xe60b;</i>
							</div>
							<h2>${post.title }</h2>
							<br />
							<span class="label label-warning">${post.type }</span>
							<br />
							<br />
							<span>发布于：${post.createTimeString }</span>
						</div>
						<hr />
						<div class="p-xs" id="postContent">
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
								
									<span id="postsId" style="display: none;">${post.postsId }</span>

									<c:forEach var="chatMsg" items="${post.chatMsgs }">
									
										<div class="chat-message">
											<img class="message-avatar" src="/SECIMS/res/secims/person/img/a1.jpg" />
											<div class="message">
												<a class="message-author" href="#">颜文字君</a> <br />
												<span class="message-content">${chatMsg.msgContent }</span> <br />
												<span class="message-date">${chatMsg.sendTimeString }</span> <br />
											</div>
										</div>
										
									</c:forEach>
									

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
