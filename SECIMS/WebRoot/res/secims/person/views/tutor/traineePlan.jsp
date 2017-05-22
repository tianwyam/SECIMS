<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>学习计划</title>
        
        <%-- 公共JS 和 css --%>
		<%@include file="../../../common/commonJS.jsp" %>
		<style type="text/css">
			.planListTable tbody tr th{
				text-align: center;
				font-size: 1.2em;
			}
			.listKind{
				margin: 1em;
				font-size: 1.2em;
				font-family:'微软雅黑';
				color:#e81a9f;
			}
			.listKind2{
				margin: 1em;
				font-size: 1.2em;
				font-family:'微软雅黑';
				color:#bb9bb0;
			}
		</style>
        
    </head>
    
    <body class="gray-bg">
    
    	<div class="wrapper wrapper-content animated fadeInUp">
        <div class="row">
            <div class="col-sm-11">

                <div class="ibox">
                    <div class="mail-box-header">
						<div class="pull-right tooltip-demo">
							<a href="/SECIMS/res/getTraineesPage" class="btn btn-white"> 
								<i class="glyphicon glyphicon-repeat"></i> 返回 
							</a>
						</div>
						<h3>所有计划</h3>
					</div>
                    <div class="ibox-content">
                    
                    	<div class="listKind">未评的：</div>
                    	
						<!-- 未评论的计划列表 -->
                        <div class="project-list">

                            <table class="table table-hover planListTable">
                                <tbody>
                                
                                <%--
                                	<tr>
                                		<th>状态</th>
                                		<th>计划标题</th>
                                		<th>计划内容</th>
                                		<th>计划进度</th>
                                		<th>计划类型</th>
                                	</tr>  --%>
                                
                                    <c:forEach var="plan" items="${plansWithOutComments }">
                                    
	                                    <tr id="planTr${plan.planId }">
	                                        <td class="project-status">
	                                        	<span class="label label-primary">未评</span>
	                                        </td>
	                                        
	                                        <td class="project-title">
	                                            <a href="/SECIMS/res/getTraineePlanDetail?planId=${plan.planId }">${plan.planTitle }</a>
	                                            <br/>
	                                            <br/>
	                                            <small>提交： ${plan.createTimeString }</small>
	                                        </td>
	                                        
	                                        <td class="project-content">
	                                            <span>${plan.planContent }</span>
	                                        </td>
	                                        
	                                        <td class="project-completion">
	                                            <small>当前进度： ${plan.progress }%</small>
	                                            <div class="progress progress-mini">
	                                                <div style="width: ${plan.progress }%;" class="progress-bar"></div>
	                                            </div>
	                                        </td>
	                                        
	                                        <td class="project-people">
	                                        	<span>${plan.planType }</span>
	                                        </td>
	                                        
	                                    </tr>
                                    
                                    </c:forEach>
                                    
                                    <c:if test="${plansWithOutComments.size() == 0 }">
                                    	<div style="margin: 1em;">没有还未评论的...</div>
                                    </c:if>
                                    
                                    </tbody>
                                </table>
                            </div>
                            
                            
                            
                            <div class="listKind2">已评的：</div>
                    	
                            <!-- 已经评论了的计划列表 -->
                        	<div class="project-list">

	                            <table class="table table-hover planListTable">
	                                <tbody>
                                
	                                    <c:forEach var="plan" items="${plansWithComments }">
	                                    
		                                    <tr id="planTr${plan.planId }">
		                                        <td class="project-status">
		                                        	<span class="label label-default">已评</span>
		                                        </td>
		                                        
		                                        <td class="project-title">
		                                            <a href="/SECIMS/res/getTraineePlanDetail?planId=${plan.planId }">${plan.planTitle }</a>
		                                            <br/>
		                                            <br/>
		                                            <small>提交： ${plan.createTimeString }</small>
		                                        </td>
		                                        
		                                        <td class="project-content">
		                                            <span>${plan.planContent }</span>
		                                        </td>
		                                        
		                                        <td class="project-completion">
		                                            <small>当前进度： ${plan.progress }%</small>
		                                            <div class="progress progress-mini">
		                                                <div style="width: ${plan.progress }%;" class="progress-bar"></div>
		                                            </div>
		                                        </td>
		                                        
		                                        <td class="project-people">
		                                        	<span>${plan.planType }</span>
		                                        </td>
		                                        
		                                        <td class="project-content">
		                                        	<span>${plan.score }</span>
		                                        </td>
		                                        
		                                    </tr>
	                                    
	                                    </c:forEach>
	                                    
	                                    <c:if test="${plansWithComments.size() == 0 }">
	                                    	<div style="margin: 1em;">没有已经评论的...</div>
	                                    </c:if>
	                                    
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    
    	<script type="text/javascript" src="/SECIMS/res/secims/person/js/plan.js"></script>
    
    
 	</body>
</html>