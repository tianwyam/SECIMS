<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>学习计划</title>
        
        <%-- 公共JS 和 css --%>
		<%@include file="../../common/commonJS.jsp" %>
		<style type="text/css">
			.planListTable tbody tr th{
				text-align: center;
				font-size: 1.2em;
			}
		</style>
        
    </head>
    <body>
    
    	
    	<div class="wrapper wrapper-content animated fadeInUp">
        <div class="row">
            <div class="col-sm-12">

                <div class="ibox">
                    <div class="ibox-title">
						<h3>所有计划</h3>
						<div class="pull-right tooltip-demo">
							<a href="/SECIMS/res/getAddPlanPage" class="btn btn-white btn-sm"> 
								<i class="layui-icon">&#xe609;</i> 添加计划 
							</a>
						</div>
					</div>
                    <div class="ibox-content">
                    
                    	<!-- 工具栏 -- 刷新/搜索 -->
                        <div class="row m-b-sm m-t-sm">
                            <div class="col-md-1">
                                <button type="button" id="loading-example-btn" class="btn btn-white btn-sm" onclick="window.location.reload();">
                                	<i class="layui-icon">&#x1002;</i>  刷新
                                </button>
                            </div>
                        </div>
						
						
						<!-- 计划列表 -->
                        <div class="project-list">

                            <table class="table table-hover planListTable">
                                <tbody>
                                
                                	<tr>
                                		<th>状态</th>
                                		<th>计划标题</th>
                                		<th>计划内容</th>
                                		<th>计划进度</th>
                                		<th>计划类型</th>
                                		<th>操作</th>
                                	</tr>
                                
                                    <c:forEach var="plan" items="${plans }">
                                    
	                                    <tr id="planTr${plan.planId }">
	                                        <td class="project-status">
	                                        	<c:choose>
	                                        		<c:when test="${plan.status == 'E' }">
		                                            	<span class="label label-primary">进行中</span>
	                                        		</c:when>
	                                        		<c:otherwise>
	                                        			<span class="label label-default">已完成</span>
	                                        		</c:otherwise>
	                                        	</c:choose>
	                                        </td>
	                                        
	                                        <td class="project-title">
	                                            <a href="#">${plan.planTitle }</a>
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
	                                        
	                                        <td class="project-actions">
	                                            <a href="javascript:void(0)" class="btn btn-white btn-sm" onclick="readPlan('${plan}')">
	                                            	<i class="layui-icon">&#xe622;</i> 查看 
	                                            </a>
	                                            
	                                            <!-- 完成了的计划，就无法修改及删除 -->
	                                           <c:if test="${plan.status == 'E' }">
	                                            <a href="javascript:void(0)" class="btn btn-white btn-sm" onclick="writePlan('${plan}')">
	                                            	<i class="layui-icon">&#xe642;</i> 编辑 
	                                            </a>
	                                            <a href="javascript:void(0)" class="btn btn-white btn-sm" onclick="delPlan('${plan.planId}')">
	                                            	<i class="layui-icon">&#xe640;</i> 删除
	                                            </a>
	                                           </c:if>
	                                        </td>
	                                    </tr>
                                    
                                    </c:forEach>
                                    
                                    
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