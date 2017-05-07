<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 项目详情</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <%@ include file="common/head.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/style.css" />
    <shiro:hasRole name="teacher">
	    <script type="text/javascript">
	    	$(function(){
	    		$('#myFormId').find('input,textarea,select').attr('readonly',true);
	    	});
	    </script>
    </shiro:hasRole>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/project/projectInfo.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/project/addProUser.js" ></script>
</head>

<body class="gray-bg">
    <div class="row">
        <div class="col-sm-9">
            <div class="wrapper wrapper-content animated fadeInUp">
                <div class="ibox">
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="m-b-md">
                                    <a href="#" class="btn btn-white btn-xs pull-right" onclick="history.back([-1])">返回上一步</a>
                                    <h2 id="proName">${project.projectName}</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row m-t-sm">
                            <div class="col-sm-12">
                                <div class="panel blank-panel">
                                    <div class="panel-heading">
                                        <div class="panel-options">
                                            <ul class="nav nav-tabs">
                                                <li><a href="#tab-1" data-toggle="tab">基本信息</a>
                                                </li>
                                                <shiro:hasRole name="teacher">
                                                	 <li class=""><a href="#tab-3" data-toggle="tab">开发人员</a>
                                                </li>
                                                </shiro:hasRole>
                                                <li class=""><a href="#tab-2" data-toggle="tab">附件</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="panel-body">

                                        <div class="tab-content">
                                             <div class="tab-pane active" id="tab-1">
                                                <div class="panel-group" id="accordion">
													<div class="panel panel-default">
														<form class="form-horizontal" style="margin-top: 2em" id="myFormId">
															<input type="text" style="display: none" id="projectId" value="${project.id }" />
															<div class="form-group">
																<label class="col-sm-2 control-label">项目名称:：</label>
																<div class="col-sm-4">
																	<input type="text" class="form-control" id="projectName" value="${project.projectName }" />
																</div>
															</div>
															<div class="form-group">
																<label class="col-sm-2 control-label">项目提出者：</label>
																<div class="col-sm-4">
																	<input type="text" class="form-control" id="postName" value="${project.postName }" />
																</div>
															</div>
															<div class="form-group">
																<label class="col-sm-2 control-label">联系电话：</label>
																<div class="col-sm-4">
																	<input type="text" class="form-control" id="phone" value="${project.phone }"/>
																</div>
															</div>
															<div class="form-group">
																<label class="col-sm-2 control-label">开发语言：</label>
																<div class="col-sm-4">
																	<input type="text" class="form-control" id="language" value="不限" />
																</div>
															</div>
															<div class="form-group">
																<label class="col-sm-2 control-label">计划完成时间：</label>
																<div class="col-sm-4">
																	<input type="date" class="form-control" id="finishDate" value='<fmt:formatDate value="${project.finishDate }" pattern="yyyy-MM-dd"/>'/>
																</div>
															</div>
															<div class="form-group">
																<label class="col-sm-2 control-label">项目说明：</label>
																<div class="col-sm-4">
																	<textarea class="info" id="instruction" name="instruction" rows="4" cols="30">${project.instruction }</textarea><br/>
																</div>
															</div>
															<shiro:hasRole name="admin">
																<div class="form-group">
																	<label class="col-sm-2 control-label"></label>
																	<div class="col-sm-10">
																		<button type="button" id="btn_submit" class="btn btn-primary" id="newpwdAgain">确认修改</button>
																	</div>
																</div>
															</shiro:hasRole>
														</form>
													</div>
												</div>

                                            </div> 
                                            <div class="tab-pane" id="tab-2">
												<h5>项目文档</h5>
								                <ul class="list-unstyled project-files">
								                	<c:forEach var="doc" items="${projectDoc }">
								                		<c:url value="/downFile.do" var="downurl">
								                			<c:param name="fileName" value="${doc.documents }"></c:param>
								                		</c:url>
								                		<li>
								                			<a href="${downurl }"><i class="fa fa-file"></i>${doc.docName }</a>
								                			<span>提交者：${doc.operator }</span>
								                    	</li>
								                	</c:forEach>
								                </ul>
                                            </div>
                                            
                                            <div class="tab-pane" id="tab-3">
								                <div class="">
													<div class="row" style="">
														<div class="col-md-10">
															<div id="toolbar" class="btn-group">
															<input type="text" style="display: none" id="status" value="${project.status }" />
													            <button id="btn_add" type="button" class="btn btn-default" onclick="Btn_add()">
													                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
													            </button>
										       				 </div>
															<table class="table table-bordered" id="userTable">
															</table>
														</div>
													</div>
										    	</div>
										    	
										    	<!--添加用户信息弹出层 -->
										    	<div id="userInfo" class="modal fade">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h3 class="modal-title text-center">
																	新增开发人员
																</h3>
															</div>
															<div class="modal-body">
																<form class="form-horizontal">
																	<div class="form-group">
																		<label class="col-sm-2 control-label">姓名</label>
																		<div class="col-sm-4">
																			<input type="text" class="form-control" id="username" placeholder="姓名" />
																			<span id="usernameTip"></span>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-2 control-label">电话</label>
																		<div class="col-sm-4">
																			<input type="text" class="form-control" id="phone" placeholder="电话"/>
																			<span id="phoneTip"></span>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-2 control-label">邮箱</label>
																		<div class="col-sm-4">
																			<input type="password" class="form-control" id="email" placeholder="邮箱" />
																			<span id="emailTip"></span>
																		</div>
																	</div>
																	<div class="form-group">
										                                <label>说明：</label>
										                                <textarea id="instruction" name="instruction" class="form-control" aria-required="false" rows="4"></textarea>
							                            			</div>
																</form>
															</div>
															<div class="modal-footer">
																<button type="button" id="submitBtn" class="btn btn-success">
																	提交
																</button>
																<button type="button" class="btn btn-default" data-dismiss="modal">
																	关闭
																</button>
															</div>
														</div>
													</div>    		
										    	</div>
                                            </div>
                                        </div>

                                    </div>
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
