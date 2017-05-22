<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<!DOCTYPE html>
<html>
  <head>
    
    <title>PPT</title>
	
	<%-- 公共JS/CSS --%>
    <%@ include file="../../common/commonJS.jsp" %>
    
    <%-- 评分插件 --%>
    <link rel="stylesheet" href="/SECIMS/res/bootstrap-star-rating/css/star-rating.min.css" >
	<script type="text/javascript" src="/SECIMS/res/bootstrap-star-rating/js/star-rating.js"></script>
    
    <style type="text/css">
    	#showCommentBtn{
    		height: 100%;
    		width: 2em;
    		background-color: red;
    	}
    </style>

  </head>
  
  <body class="gray-bg">
  	
	    <div class="wrapper wrapper-content animated fadeInUp">
	        
	        <div class="row">
	        	
	        
	            <div class="col-sm-8 col-sm-offset-2">
	            
	                <div class="ibox float-e-margins">
	                
	                    <div class="mail-box-header">
	                        <div class="pull-right tooltip-demo">
	                            <a class="btn btn-default" href="javascript:" onclick="self.location=document.referrer;">
	                                <span class="glyphicon glyphicon-share-alt"></span> 返回
	                            </a>
	                        </div>
	                        <h3>PPT</h3>
	                    </div>
	                    
	                    <div class="row">
	                    
		                    <div class="col-sm-12">
			                    <div class="ibox-content">
			                    
			                    	<!--  相册  carousel 旋转木马 -->
			                        <div class="carousel slide" id="carousel1">
			                            
			                            <!-- 幻灯片 -->
			                            <div class="carousel-inner">
			                            
			                                <c:forEach var="imgURL" items="${imgURLs }" varStatus="i">
			                                	
			                                	<c:choose>
			                                		<c:when test="${i.index == 0 }">
			                                			<div class="item active">
						                                    <img alt="image" class="img-responsive" src="${imgHead }/${imgURL }">
						                                    <div class="carousel-caption" style="color:red;">
						                                    	<h2>${i.index+1}/${imgTotalNum }</h2>
						                                    </div>
						                                </div>
			                                		</c:when>
			                                		<c:otherwise>
				                                		<div class="item">
						                                    <img alt="image" class="img-responsive" src="${imgHead }/${imgURL }">
						                                    <div class="carousel-caption" style="color:red;">
						                                    	<h2>${i.index+1}/${imgTotalNum }</h2>
						                                    </div>
						                                </div>
			                                		</c:otherwise>
			                                	</c:choose>
				                                
			                                </c:forEach>
			
			                            </div>
			                            
			                            <!-- 控制 前后 -->
			                            <a data-slide="prev" href="#carousel1" class="left carousel-control">
			                                <span class="icon-prev"></span>
			                            </a>
			                            <a data-slide="next" href=" #carousel1" class="right carousel-control">
			                                <span class="icon-next"></span>
			                            </a>
			                            
			                        </div>
			                        
			                        
			                    </div>
		                    </div>
		                    
	                    </div>
	                    
	                     <%-- 企业导师权限 - 评论 月评PPT  start --%>
	                    <shiro:hasRole name="tutor">
	                    
	                    <button class="btn btn-block showMonthCommentBtn">
							<i class="glyphicon glyphicon-menu-down"> 展开评论</i>
						</button>
						
						<!-- 显示评论 start -->
						<div class="row" id="tutorMonthComment">
							<div class="col-sm-12">
								<div  style="margin: 10px auto;padding: 1em;">
									
									<%-- 导师评论打分  start--%>
									<div>
											<%-- 月评ID --%>
											<label id="reviewId" style="display: none;">${reviewId }</label>
											
											<div class="form-group  form-group-lg">
									    		<label class="control-label" for="score">评分：</label>
												<input id="score" name="score" 
													class="rating rating-loading form-control" 
													data-size="lg" type="number"
													data-min="0" data-max="10" value="${comments.result }"
													data-stars="10" data-step="0.1" />
											
												<div class="form-group  form-group-lg">
													<label class="control-label" for="comment">评论：</label>
													<textarea name="comment" id="comment" class="form-control" rows="5" >${comments.comment }</textarea>
												</div>
												
												<button class="btn btn-sm btn-primary" id="submitMonthCommentBtn" autofocus="autofocus">
													<i class="layui-icon">&#xe618;</i> 提交
												</button>
												
										</div>
										<%-- 导师评论打分  end--%>
										
									</div>
								</div>
							</div>
							<!-- 显示评论 end -->
	
						</div>
						</shiro:hasRole>
	                    
	                </div>
	                
	            </div>
	            
	        </div>	
	     </div>
        	
        <%-- 自定义文件 --%>
	    <script type="text/javascript" src="/SECIMS/res/secims/person/js/monthPPTView.js" ></script>
    
  </body>
</html>
