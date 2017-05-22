<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE>
<html>
  <head>
    <title>计划详细</title>

 	<%-- 公共JS 和 css --%>
	<%@include file="../../../common/commonJS.jsp" %>
	
	<link rel="stylesheet" href="/SECIMS/res/bootstrap-star-rating/css/star-rating.min.css" >
	<script type="text/javascript" src="/SECIMS/res/bootstrap-star-rating/js/star-rating.js"></script>
		

  </head>
  
  <body class="gray-bg">
  
     <div class="wrapper wrapper-content animated fadeInUp">
     
  		<div class="row">
  		
  			<%-- 学习计划详情内容 start --%>
        	<div class="col-sm-9">
                <div class="ibox">
                
                	<div class="mail-box-header">
                		 <div class="row">
                            <div class="col-sm-12">
                            	<div class="pull-right tooltip-demo">
                                    <a href="javascript:self.location=document.referrer;"  
                                    	class="btn btn-white pull-right">
                                    	<i class="glyphicon glyphicon-repeat"></i> 返回
                                    </a>
                                </div>
                            	<h2>学习计划</h2>
                            </div>
                         </div>
                	</div>
                    <div class="ibox-content" >
                    
                        <div class="row">
                            <div class="col-sm-12">
                                
                                <dl class="dl-horizontal">
									<dt>状态：</dt>
									<dd><span class="label label-default">已完成</span></dd>
								</dl>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-4">
                                <dl class="dl-horizontal">
                                    <dt>类型：</dt>
                                    <dd>${plan.planType }</dd>
                                    <dt>标题：</dt>
                                    <dd>${plan.planTitle }</dd>
                                </dl>
                            </div>
                            
                            <div class="col-sm-8" id="cluster_info">
                                <dl class="dl-horizontal">

                                    <dt>最后更新：</dt>
                                    <dd>${plan.finishTimeString }</dd>
                                    <dt>创建于：</dt>
                                    <dd>${plan.createTimeString }</dd>
                                </dl>
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
                                    	<span id="planId" style="display: none;">${plan.planId }</span>
                                    </dd>
                                </dl>
                                
                            </div>
                        </div>
                        
                         <br/>
						<!-- 学习计划详细 -->
						<div class="row m-t-sm" >
							<div class="col-sm-12">
								<a href="javascript:void(0)">
									<h4>执行学习计划的过程</h4>
								</a>
							</div>
						</div>
						
						
						 <br/>
						 
						<!-- 学习计划详细 start -->
						<div class="row">
							<div class="col-sm-12">
								<div class="ibox-content" id="ibox-content">
									
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
			                                            
			                                            <span class="vertical-date">
			                                            	<br>
			                                        		<small>${detail.createTimeString }</small>
			                                    		</span>
			                                        </div>
		                                    	</div>
	                                    	
	                                    </c:forEach>

									</div>
                            	</div>
							
							</div>
						</div>
						<!-- 学习计划详细 end -->
						
						<button class="btn btn-block m showCommentBtn">
							<i class="glyphicon glyphicon-menu-down"> 显示评论</i>
						</button>
						
						<!-- 显示评论 start -->
						<div class="row" id="tutorComment">
							<div class="col-sm-12">
								<div  style="margin: 10px auto;padding: 1em;">
									
									<%-- 导师评论打分  start--%>
									<div>
										
											<div class="form-group  form-group-lg">
									    		<label class="control-label" for="score">评分：</label>
												<input id="score" name="score" 
													class="rating rating-loading form-control" 
													data-size="lg" type="number"
													data-min="0" data-max="10" value="${comments.score }"
													data-stars="10" data-step="0.1" />
											
											<div class="form-group  form-group-lg">
												<label class="control-label" for="comment">评论：</label>
												<textarea name="comment" id="comment" class="form-control" rows="5" >${comments.comment }</textarea>
											</div>
											
											<button class="btn btn-sm btn-primary" id="submitCommentBtn" autofocus="autofocus">
												<i class="layui-icon">&#xe618;</i> 提交
											</button>
											
									</div>
									<%-- 导师评论打分  end--%>
									
								</div>
							</div>
						</div>
						<!-- 显示评论 end -->

					</div>
					
					
                </div>
            </div>
        </div>
        <%-- 学习计划详情内容 end --%>
        
        
        <%-- 其他人的评分（学习计划互评的） 开始 --%>
        <div class="col-sm-3">
            <div class="wrapper wrapper-content project-manager" style="padding: 1em;margin: 1em;">
            	<h4>实习生互评得分：</h4>
            	<br>
            	<div>
            		<p>平均分：${score }分</p><br>
	            	<input id="planEvaluation" name="planEvaluation" 
						class="rating-loading" 
						data-size="xs" type="number" readonly="readonly"
						data-min="0" data-max="10" value="${score }" 
						showCaption="false" displayOnly="true"
						data-stars="5" data-step="0.1" showClear="false"/><br>
					<div>
						共${totalNum }人评分
					</div>
				</div>
            </div>
        </div>
        <%-- 其他人的评分（学习计划互评的） 结束 --%>
        
        
        
      </div>
      
      <%-- 引入自定义JS文件 --%>
      <script type="text/javascript" src="/SECIMS/res/secims/person/js/tutor/traineePlanDetail.js"></script>
      
  </body>
</html>
