<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>项目清单</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="images/favicon.ico"> 
    
    <!--<link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/bootstrap.min.css" />
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/animate.css" /> --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/project/jquery-3.1.1.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>-->
     <link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/style.css" />
    <%@ include file="../common/head.jsp" %>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/project/projectList.js"></script>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-4">
                <div class="ibox">
                    <div class="ibox-content">
                        <h3>项目列表(未开始)</h3>
						 <div class="input-group">
                            <input type="text" placeholder="项目名称" class="input input-sm form-control">
                            <span class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-white"> <i class="fa fa-plus"></i> 查找</button>
                                </span>
                        </div>
                        <ul class="sortable-list connectList agile-list">
                        	<c:forEach var="project" items="${projectList1 }">
                        		<li class="info-element">
	                                <div class="agile-detail">
	                                    <a href="${pageContext.request.contextPath}/${project.id }/listFile.do" class="faq-question">${project.projectName }</a>
	                                    <button id="cancel" class="pull-right btn btn-xs btn-danger" value="${project.id }">取消</button>
	                                    <i class="fa fa-clock-o"></i> 计划完成时间: <fmt:formatDate value="${project.finishDate}" pattern="yyyy-MM-dd"/>
	                                </div>
                            	</li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox">
                    <div class="ibox-content">
                        <h3>进行中</h3>
                        <div class="input-group">
                            <input type="text" placeholder="项目名称" class="input input-sm form-control">
                            <span class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-white"> <i class="fa fa-plus"></i> 查找</button>
                                </span>
                        </div>
                        <ul class="sortable-list connectList agile-list">
                        	<c:forEach var="project" items="${projectList2 }">
                        		<li class="warning-element">
	                                <div class="agile-detail">
	                                    <a href="${pageContext.request.contextPath }/resource/views/newViews/projectDetail.jsp" class="faq-question">${project.projectName }</a>
	                                    <i class="fa fa-clock-o"></i> 2015.09.01
	                                </div>
                            	</li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox">
                    <div class="ibox-content">
                        <h3>已完成</h3>
                        <div class="input-group">
                            <input type="text" placeholder="项目名称" class="input input-sm form-control">
                            <span class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-white"> <i class="fa fa-plus"></i> 查找</button>
                                </span>
                        </div>
                        <ul class="sortable-list connectList agile-list">
                        	<c:forEach var="project" items="${projectList3 }">
                        		<li class="success-element">
	                                <div class="agile-detail">
	                                    <a href="${pageContext.request.contextPath }/resource/views/newViews/projectInfo.jsp" class="faq-question">${project.projectName }</a>
	                                    <i class="fa fa-clock-o"></i> 2015.09.01
	                                </div>
                            	</li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
            </div>

        </div>


    </div>

<!--     全局js
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <script src="js/jquery-ui-1.10.4.min.js"></script>

    自定义js
    <script src="js/content.js?v=1.0.0"></script> -->

    <script>
     /*    $(document).ready(function () {
            $(".sortable-list").sortable({
                connectWith: ".connectList"
            }).disableSelection();

        }); */
    </script>

    
    

</body>

</html>
