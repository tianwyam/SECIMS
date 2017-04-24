<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    
    <title>PPT</title>
	
	<%-- 公共JS/CSS --%>
    <%@ include file="../../common/commonJS.jsp" %>

  </head>
  
  <body class="gray-bg">
  	
	    <div class="wrapper wrapper-content">
	        
	        <div class="row">
	        	
	        
	            <div class="col-sm-12">
	            
	                <div class="ibox float-e-margins">
	                
	                    <div class="ibox-title">
	                        <h5>PPT</h5>
	                        <div class="ibox-tools">
	                            <a class="btn btn-default" href="javascript:" onclick="self.location=document.referrer;">
	                                <span class="glyphicon glyphicon-share-alt"></span> 返回
	                            </a>
	                        </div>
	                    </div>
	                    
	                    <div class="row">
	                    
		                    <div class="col-sm-2"></div>
		                    
		                    <div class="col-sm-10">
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
	                    
	                </div>
	                
	            </div>
	            
	            
	        </div>	
	     </div>
        	
    
    
  </body>
</html>
