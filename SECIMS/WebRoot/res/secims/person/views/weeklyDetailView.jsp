<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML>
<html>
  <head>
  
    <title>查看周报详细</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
    
    <%-- 加载公共 JS/CSS --%>
    <%@include file="../../common/commonJS.jsp" %>


  </head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
  		
  		
	  		<div class="col-sm-12 animated fadeInRight">
	  		
	                <div class="mail-box-header">
	                
	                    <div class="pull-right tooltip-demo">
	                        <button onclick="self.location=document.referrer;" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="返回">
	                        	<span class="glyphicon glyphicon-share-alt" ></span> 返回
	                        </button>
	                    </div>
	                    
	                    <h2>查看邮件</h2>
	                    
	                    <div class="mail-tools tooltip-demo m-t-md">
	
	                        <h3><span class="font-noraml">主题： </span>${weekly.title }</h3>
	                        <h5>
		                        <span class="pull-right font-noraml">2014年10月28日(星期二) 晚上8:20</span>
		                        <br/>
		                        <span class="font-noraml">收件人： </span>${weekly.recipient }
	                    	</h5>
	                    </div>
	                    
	                </div>
	                
	                
	                <div class="mail-box">
	
	
	                    <div class="mail-body">
	                        <p>${weekly.content }</p>
	
	                        <p class="text-right"> 发件人： ${weekly.sender }</p>
	                    </div>
	                    

	                    <div class="mail-body text-right tooltip-demo">
	                    
	                    	<!-- 发送按钮就只有 是删除的/草稿箱里的，如果是已经发送了的就不允许发送了 -->
	                    	<c:if test="${weekly.status != 'F' }">
		                        <a class="btn btn-sm btn-primary" href="#" onclick="sendWeekly('${weekly.weekRepId}')">
		                        	<i class="layui-icon">&#xe609;</i>  发送
		                        </a>
	                        </c:if>
	                        
	                        <a class="btn btn-sm btn-danger" href="#" onclick="delWeekly('${weekly.weekRepId}')">
	                        	<i class="layui-icon">&#xe640;</i>  删除
	                        </a>
	                    </div>
	                    <div class="clearfix"></div>
	                    
	                </div>
	                
	                
	            </div>
	     	</div>
	  	</div>
	  	
	  	
	  	<!-- 自定义JS -->
  		<script type="text/javascript" src="/SECIMS/res/secims/person/js/weeklyDetailView.js"></script>
  
  </body>
</html>
