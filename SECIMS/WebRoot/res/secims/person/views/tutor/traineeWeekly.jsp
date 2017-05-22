<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
  <head>
  
    <title>已发送的周报</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
    
    <%-- 加载公共 JS/CSS --%>
    <%@include file="../../../common/commonJS.jsp" %>


  </head>
  
<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
        
	  		<div class="col-sm-12 animated fadeInRight">
	  		
	                <div class="mail-box-header">
	                    <div class="pull-right tooltip-demo">
							<a href="/SECIMS/res/getTraineesPage" class="btn btn-white"> 
								<i class="glyphicon glyphicon-repeat"></i> 返回 
							</a>
						</div>
						<h2>周报 </h2>
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
	                                <td class="text-left mail-date">发送时间：${weekly.createTimeString }</td>
	                                <td class="text-right">
		                                <button class="btn btn-white btn-sm" onclick="ToViewWeekly('${weekly.weekRepId}')">
		                                	<span class="glyphicon glyphicon-folder-open"></span>  查看
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
