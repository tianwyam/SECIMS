<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
  <head>
  
    <title>我回复的帖子</title>
    
    <%-- 公共JS 和 css --%>
	<%@include file="../../common/commonJS.jsp" %>


  </head>
  
  <body class="gray-bg">
  
  
    <div class="row">
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
            
                <div class="col-sm-12">
                    
                    <div class="wrapper wrapper-content animated fadeInRight">

                        <div class="ibox-content m-b-sm border-bottom">
                        
                            <div class="pull-right tooltip-demo">
								<a href="/SECIMS/res/getLearningForum" class="btn btn-white btn-sm" >
									<span class="glyphicon glyphicon-home" aria-hidden="true"></span>  论坛主页
								</a> 
							</div>
                        
                            <div class="p-xs">
                                <h2>我回复的帖子</h2>
                            </div>
                            
                        </div>

                        <div class="ibox-content forum-container">

                            <div class="forum-title">
                                <div class="pull-right forum-desc">
                                	<small>总帖子数： ${postsNum }</small>
                                </div>
                                <h3>话题</h3>
                            </div>


							<c:forEach var="post" items="${posts }">
							
							
	                            <div class="forum-item active">
	                                <div class="row">
	                                
	                                    <div class="col-sm-6">
	                                        <div class="forum-icon">
	                                            <i class="fa fa-shield"></i>
	                                        </div>
	                                        <a href="/SECIMS/res/getLearningForumDetail?postsId=${post.postsId }" class="forum-item-title">${post.title }</a>
	                                        <br />
	                                        <h3 style="font-family: '华文行楷'">${post.type }</h3>
	                                    </div>
	                                    
	                                    <div class="col-sm-4 forum-info">
	                                    	<span>发布于：</span>
	                                        <span>${post.createTimeString }</span>
	                                    </div>
	                                    
	                                    <div class="col-sm-1 forum-info">
	                                        <span class="views-number">${post.browseNum }</span>
	                                        <div>
	                                            <small>浏览</small>
	                                        </div>
	                                    </div>
	                                    
	                                    <div class="col-sm-1 forum-info">
	                                        <span class="views-number">${post.answerNum }</span>
	                                        <div>
	                                            <small>回答</small>
	                                        </div>
	                                    </div>
	                                    
	                                </div>
	                            </div>
                            
                            </c:forEach>
                            

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  		
  
  </body>
</html>
