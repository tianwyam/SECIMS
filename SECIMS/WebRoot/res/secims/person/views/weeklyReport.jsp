<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
  <head>
  
    <title>已上传的周报</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
    
    <%-- 加载公共 JS/CSS --%>
    <%@include file="../../common/commonJS.jsp" %>


  </head>
  
<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
        
	  		<div class="col-sm-12 animated fadeInRight">
	  		
	                <div class="mail-box-header">
						
						<a href="#">
		                    <span style="font-size: 2em;">已发送的周报 </span>
		                    <span class="label label-warning weeklyNum">${weeklyNum }</span>
	                    </a>
	                    
	                    <div class="mail-tools tooltip-demo m-t-md">
	                    
	                        <div class="btn-group pull-right" title="上一页">
	                            <button class="btn btn-white btn-sm">
	                            	<i class="layui-icon">&#xe603;</i>
	                            </button>
	                            <button class="btn btn-white btn-sm" title="下一页">
	                            	<i class="layui-icon">&#xe602;</i>
	                            </button>
	                        </div>
	                        
	                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="window.location.reload();" >
	                        	<i class="layui-icon">&#x1002;</i> 刷新
	                        </button>
	                        
	                    </div>
	                </div>
	                
	                
	                <div class="mail-box">
	
	                    <table class="table table-hover table-mail">
	                        <tbody>
	                        
	                        	<c:forEach var="weekly" items="${weeklys }">
	                        	
	                            <tr class="unread" id="weeklyReportListID${weekly.weekRepId}">
	                                <td class="mail-ontact"><a href="#">${weekly.recipient }</a>
	                                </td>
	                                <td class="mail-subject"><a href="#">${weekly.title }</a>
	                                </td>
	                                <td class="text-right mail-date">${weekly.createTime.year }年${weekly.createTime.month }月${weekly.createTime.day }日</td>
	                                <td class="text-right">
		                                <button class="btn btn-white btn-sm" onclick="ToViewWeekly('${weekly}')">
		                                	<span class="glyphicon glyphicon-folder-open"></span>  查看
		                                </button>
		                                <button class="btn btn-white btn-sm" onclick="delWeeklyReport('${weekly.weekRepId}')">
		                                	<span class="glyphicon glyphicon-trash"></span>  删除
		                                </button>
	                                </td>
	                            </tr>
	                            
	                            </c:forEach>
	                            

	                        </tbody>
	                    </table>
	
	
	                </div>
	            </div>
	            
	       </div>
	   </div>
  		
  		<!-- 自定义 JS -->
  		<script type="text/javascript" src="/SECIMS/res/secims/person/js/weeklyReport.js"></script>
  		
  </body>
</html>
