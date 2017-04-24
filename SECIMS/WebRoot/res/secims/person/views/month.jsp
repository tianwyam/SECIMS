<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>月度考核管理</title>
        
        <%-- 公共JS/CSS --%>
        <%@ include file="../../common/commonJS.jsp" %>
        
    </head>
    
    <body class="gray-bg">
    
    
    	<div class="row">
	        <div class="col-sm-12">
	            <div class="wrapper wrapper-content animated fadeInUp">
	
	                <div class="ibox-content m-b-sm border-bottom">
	                    <div class="text-center p-lg">
	                    
	                        <h2>你可以在此处上传月评PPT</h2>
	                        <br />
	                        
	                        <button title="upload PPT" class="btn btn-default btn-lg" id="uploadPPT">
		                        <span class="glyphicon glyphicon-upload" ></span>
		                        <span class="uploadPPTfont" style="font-family: '华文行楷';font-size: 2em;">upload</span>
	                        </button>
	                        
	                        <%-- 月评PPT 上传文件form --%>
	                        <form id="uploadPPTFormId" role="form" enctype="multipart/form-data" method="post" action="/SECIMS/res/uploadPPT">
	                        
	                        	<%-- 文件域提交
	                        		属性 accept: 表示要上传的文件 
	                        		application/vnd.ms-powerpoint：表示只能上传PPT文件格式
	                        	 --%>
	                        	<input type="file" name="monthFile" id="uploadInput" accept=".pptx,application/vnd.ms-powerpoint" style="display: none;"/>
	                        
		                        <div id="fileUpLoadToolBar">
		                        	<button title="返回" class="btn btn-default" type="reset" id="cancelFileBtn">
				                        <span class="glyphicon glyphicon-arrow-left" ></span>
				                        <span class="uploadPPTfont" style="font-family: '华文行楷';">取消</span>
		                        	</button>
		                        	<button title="upload PPT" class="btn btn-default" type="submit"  id="uploadFileBtn">
				                        <span class="glyphicon glyphicon-saved" ></span>
				                        <span class="uploadPPTfont" style="font-family: '华文行楷';">上传</span>
		                        	</button>
		                        </div>
		                        
	                        </form>
	                        <br />
	                        
	                        <%-- 文件名显示  --%>
	                        <h4 id="pptName"></h4>
	                        
	                    </div>
	                </div>
	
					
					<c:forEach var="month" items="${months }" >
					
		                <div class="faq-item" id="monthID${month.reviewId}">
		                	
		                    <div class="row">
		                    
		                        <div class="col-md-3">
		                            <a data-toggle="collapse" href="#" class="faq-question">新员工  ${month.createTime.month + 1 }月 月评</a>
		                        </div>
		                        
		                        <div class="col-md-4">
		                            <span class="small font-bold">${month.monthTitle }</span>
		                        </div>
		                        
		                        <div class="col-md-3">
		                            <span class="small font-bold">上传于：${month.createTimeString } </span>
		                        </div>
		                        
		                        <div class="col-md-2">
	                                <button class="btn btn-white btn-sm" onclick="toMonthReview('${month.reviewId}','${month.monthFileURL}')">
	                                	<span class="glyphicon glyphicon-folder-open"></span> 查看
	                                </button>
	                                <button class="btn btn-white btn-sm" onclick="delMonthReview('${month.reviewId}','${month.monthFileURL}')">
	                                	<span class="glyphicon glyphicon-trash"></span> 删除
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