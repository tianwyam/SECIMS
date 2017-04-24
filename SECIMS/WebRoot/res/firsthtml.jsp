<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>

<head>

    <title>SECIMS - 主页</title>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">


    <link rel="shortcut icon" href="favicon.ico">
    
    <%-- 加载公共 JS/CSS --%>
    <%@include file="secims/common/commonJS.jsp" %>
    
    
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close">
            	<i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        <i class="fa fa-area-chart"></i>
                                        <strong class="font-bold">SECIMS</strong>
                                    </span>
                                </span>
                            </a>
                        </div>
                        <div class="logo-element">SECIMS
                        </div>
                    </li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">分类</span>
                    </li>
                    <li>
                        <a class="J_menuItem" href="index_v1.html">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">主页</span>
                        </a>
                    </li>
                    
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">分类</span>
                    </li>
                    <li>
                        <a href="mailbox.html">
                        	<i class="fa fa-envelope"></i> 
                        	<span class="nav-label">信箱 </span>
                        	<span class="label label-warning pull-right">16</span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="mailbox.html">收件箱</a>
                            </li>
                            <li><a class="J_menuItem" href="mail_detail.html">查看邮件</a>
                            </li>
                            <li><a class="J_menuItem" href="mail_compose.html">写信</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">分类</span>
                    </li>
                    <li>
                        <a href="plans/getStudyPlans">
                        	<i class="fa fa-envelope"></i> 
                        	<span class="nav-label">人员培养 </span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="getStudyPlans">培养管理</a>
                            </li>
                            <li><a class="J_menuItem" href="secims/person/views/monthManage.jsp">月度考核管理</a>
                            </li>
                            <li><a class="J_menuItem" href="secims/person/views/jobsManage.jsp">工作管理</a>
                            </li>
                        </ul>
                    </li>
                    
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        
        
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
        	
        	
            
            <div class="row J_mainContent" id="content-main">
                <iframe id="J_iframe" width="100%" height="100%" src="getStudyPlans" frameborder="0" data-id="getStudyPlans" seamless></iframe>
            </div>
            
        </div>
        <!--右侧部分结束-->
    </div>

</body>

</html>
