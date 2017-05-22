<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>月度考核管理</title>
        
        <%-- 公共JS/CSS --%>
        <%@ include file="../../../common/commonJS.jsp" %>
        
    </head>
    
    <body class="gray-bg">
    
    	<div class="row">
	        <div class="col-sm-12">
	            <div class="wrapper wrapper-content animated fadeInUp">
	
	                <div class="mail-box-header">
	                	<div class="pull-right tooltip-demo">
							<a href="/SECIMS/res/getTraineesPage" class="btn btn-white"> 
								<i class="glyphicon glyphicon-repeat"></i> 返回 
							</a>
						</div>
	                	<h2>月评</h2>
	                </div>
	
					<div>已评论</div>
					<c:forEach var="month" items="${months }" >
					
		                <div class="faq-item" id="monthID${month.reviewId}">
		                	
		                    <div class="row">
		                    
		                        <div class="col-md-2">
		                            <a href="#" class="faq-question"> ${month.createTime.month + 1 }月 </a>
		                        </div>
		                        
		                        <div class="col-md-4">
		                            <a class=" font-bold" onclick="toMonthReview('${month.reviewId}','${month.monthFileURL}','${month.userid}')">${month.monthTitle }</a>
		                        </div>
		                        
		                        <div class="col-md-3">
		                            <span class=" font-bold">上传于：${month.createTimeString } </span>
		                        </div>
		                        
		                        <div class="col-md-2">
	                                <button class="btn btn-white" onclick="toMonthReview('${month.reviewId}','${month.monthFileURL}','${month.userid}')">
	                                	<span class="glyphicon glyphicon-folder-open"></span> 查看
	                                </button>
		                        </div>
		                        
		                    </div>
		                    
		                </div>
		                
	                </c:forEach>
	                
	            </div>
	        </div>
    	</div>
    
    
	    <%-- 自定义文件 --%>
	    <script type="text/javascript" src="/SECIMS/res/secims/person/js/month.js" ></script>
    
 	</body>
</html>