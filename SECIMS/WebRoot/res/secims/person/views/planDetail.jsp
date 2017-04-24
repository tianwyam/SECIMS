<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE>
<html>
  <head>
    <title>计划详细</title>

 	<%-- 公共JS 和 css --%>
	<%@include file="../../common/commonJS.jsp" %>

  </head>
  
  <body>
  
  		<div class="row">
  			
        <div class="col-sm-12">
            <div class="wrapper wrapper-content animated fadeInUp">
                <div class="ibox">
                    <div class="ibox-content" >
                    
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="m-b-md">
                                    <a href="/SECIMS/res/getStudyPlans"  class="btn btn-white btn-xs pull-right">返回计划</a>
                                    <h2>学习计划</h2>
                                </div>
                                <dl class="dl-horizontal">
									<dt>状态：</dt>
									<c:choose>
										<c:when test="${plan.status == 'E' }">
											<dd><span class="label label-primary">进行中</span></dd>
										</c:when>
										<c:otherwise>
											<dd><span class="label label-default">已完成</span></dd>
										</c:otherwise>
									</c:choose>
								</dl>
                            </div>
                        </div>
                        
                        <br/>
                        
                        <div class="row">
                            <div class="col-sm-4">
                                <dl class="dl-horizontal">
                                    <dt>类型：</dt>
                                    <dd>${plan.planType }</dd>
                                    <dt>标题：</dt>
                                    <dd>${plan.planTitle }</dd>
                                </dl>
                            </div>
                            
                            <div class="col-sm-6" id="cluster_info">
                                <dl class="dl-horizontal">

                                    <dt>最后更新：</dt>
                                    <dd>${plan.finishTimeString }</dd>
                                    <dt>创建于：</dt>
                                    <dd>${plan.createTimeString }</dd>
                                </dl>
                            </div>
                            
                            
                            
                            <%-- 切换是否已经完成了计划 --%>
                            <div class="col-sm-2">
		                            <div class="switch">
			                            <div class="onoffswitch">
			                            	<c:choose>
			                            		<c:when test="${plan.status == 'E' }">
					                                <input type="checkbox" checked class="onoffswitch-checkbox" id="isFinishBtn" />
			                            		</c:when>
			                            		<c:otherwise>
					                                <input type="checkbox" class="onoffswitch-checkbox" id="isFinishBtn" />
			                            		</c:otherwise>
			                            	</c:choose>
			                                <label class="onoffswitch-label" for="isFinishBtn">
			                                    <span class="onoffswitch-inner"></span>
			                                    <span class="onoffswitch-switch"></span>
			                                </label>
			                            </div>
			                        </div>
			                 </div>
                            
                        </div>
                        
                        <br/>
                        
                        <!-- 学习计划 内容 -->
                        <div class="row">
                            <div class="col-sm-12">
                            
                                <dl class="dl-horizontal">
                                    <dt>计划内容：</dt>
                                    <dd>
                                    	<span>${plan.planContent }</span>
                                    </dd>
                                </dl>
                                
                            </div>
                        </div>
                        
                        <br/>
                        
                        <div class="row">
                            <div class="col-sm-12">
                            
                                <dl class="dl-horizontal">
                                    <dt>当前进度：</dt>
                                    <dd>
                                    	
                                    	<!-- 如果 计划 已完成 ，则不让其活动  -->
                                    	<c:choose>
                                    		<c:when test="${plan.status == 'E' && plan.progress < 100 }">
                                    			<div class="progress progress-striped active m-b-sm">
		                                            <div style="width: ${plan.progress }%;" class="progress-bar "></div>
		                                        </div>
		                                        <small>当前已完成计划总进度的 <strong>${plan.progress }%</strong></small>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<div class="progress  m-b-sm">
		                                            <div style="width: 100%;" class="progress-bar progress-bar-danger"></div>
		                                        </div>
		                                        <small>当前已完成计划总进度的 <strong>100%</strong></small>
                                    		</c:otherwise>
                                    	</c:choose>
                                        
                                    </dd>
                                </dl>
                                
                            </div>
                        </div>
                        
                        
                         <br/>
                         <br/>
						<!-- 学习计划详细 -->
						<div class="row m-t-sm" >
							<div class="col-sm-12">
								<ul class="nav nav-tabs nav-justified">
									<li  class="active">
										<a href="javascript:void(0)">
											<h4>执行学习计划的过程</h4>
										</a>
										
									</li>
								</ul>
							</div>
						</div>
						
						
						 <br/>
						<!-- 学习计划详细 -->
						<div class="row">
							<div class="col-sm-12">
								<div class="ibox-content" id="ibox-content">
									
									<!--  如果整个学习计划 已完成，则不允许再添加详情  -->
									<c:if test="${plan.status == 'E' && detailsNum < 7}">
										<div>
											<button class="layui-btn layui-btn-primary layui-btn-small" title="添加 计划详情(不得超过7个)" id="detailAdd">
										    	<i class="layui-icon">&#xe61f;</i> 添加详情
											</button>
										</div>
									</c:if>

	                                <div id="vertical-timeline" class="vertical-container dark-timeline detailLists">
	                                
	                                	<!--  计划 详情 列表  -->
	                                
	                                    <c:forEach var="detail" items="${plan.studyPlanDetails }">
	                                    
		                                    	 <div class="vertical-timeline-block detailList" id="detailID${detail.planDetailId}">
		                                    	 
			                                       	<div class="vertical-timeline-icon blue-bg">
			                                            <i class="layui-icon">&#xe63c;</i>
			                                        </div>
			
			                                        <div class="vertical-timeline-content">
			                                            <h2>${detail.planDetailTitle }</h2>
			                                            <br>
			                                            <p>${detail.planDetailContent }</p>
			                                            
			                                            <!-- 如果已经完结 就 不可以编辑/删除  -->
			                                            <c:if test="${plan.status != 'F' && detail.status != 'F' }">
				                                            <div>
																<a class="btn btn-sm btn-default" id="delDetail" onclick="delDetail('${detail.planDetailId}','${plan.planId }')">
																    <i class="layui-icon">&#xe640;</i>
																</a>
					                                            <a class="btn btn-sm btn-default" onclick="editDetail('${detail }')">
																	<i class="layui-icon">&#xe642;</i>
																</a>
															</div>
														</c:if>
														
			                                            <span class="vertical-date">
			                                            	<br>
			                                        		<small>${detail.createTimeString }</small>
			                                    		</span>
			                                        </div>
		                                    	</div>
		                                    	
	                                    	
	                                    </c:forEach>


										<!-- 新增 计划 详情 元素   开始-->
										
										<div class="vertical-timeline-block " id="newDetail">

											<div class="vertical-timeline-icon blue-bg">
												<i class="layui-icon">&#xe63c;</i>
											</div>

											<div class="vertical-timeline-content">
												
												<form  id="detailAddForm" action="/SECIMS/res/addDetail" method="post">
													
													<input type="text" name="planId" id="planId" value="${plan.planId }" hidden="true" />
													
													<div class="form-group form-group-lg has-feedback">
														<label class="control-label" for="planTitle">计划详情标题</label>
														<div class="input-group">
															<span class="input-group-addon">#</span> 
															<input type="text" class="form-control" name="planDetailTitle" id="planDetailTitle" aria-describedby="planDetailTitleStatus" required="required"  />
														</div>
														<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span> 
														<span id="planDetailTitleStatus" class="sr-only">(success)</span>
													</div>
													
													<div class="form-group form-group-lg">
													    <label class="control-label" for="status">计划详情状态</label>
													    <select class="form-control" id="status" name="status" >
														  <option value="E" selected="selected">执行</option>
														  <option value="F">完成</option>
														  <option value="K">保留</option>
														</select>
													 </div>
													
													<div class="form-group form-group-lg">
														<label class="control-label" for="planDetailContent">计划详情内容</label>
														<textarea name="planDetailContent" id="planDetailContent" class="form-control" rows="8" ></textarea>
													</div>
													
													<button type="submit" class="btn btn-sm btn-success" title="保存" id="detailAddSubmit">
														<i class="layui-icon">&#xe605;</i> 添加
													</button>
												
												</form>	
											</div>
										</div>
										
										<!-- 新增 计划 详情 元素  结束 -->

									</div>
                            	</div>
							
							</div>
						</div>

					</div>
                </div>
            </div>
        </div>
      </div>
      
      
      <script type="text/javascript" src="<%=bootpath %>/res/secims/person/js/planDetail.js"></script>
        
  </body>
</html>
