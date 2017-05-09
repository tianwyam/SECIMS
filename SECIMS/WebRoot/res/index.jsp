<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>

<head>

    <title>SECIMS - 主页</title>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">


    <link rel="shortcut icon" href="heart.ico">
    
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
                        <a class="J_menuItem" href="index.html">
                            <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                            <span class="nav-label">主页</span>
                        </a>
                    </li>
                    
                    
                    <!-- 培养管理模块-->
                    
                     <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">分类</span>
                    </li>
                    <li>
                        <a href="getStudyPlans">
                        	<i class="layui-icon">&#xe636;</i>
                        	<span class="nav-label">培养管理 </span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="/SECIMS/res/getStudyPlans">学习计划</a>
                            </li>
                            <li><a class="J_menuItem" href="/SECIMS/res/getAddPlanPage">添加学习计划</a>
                            </li>
                            <li><a class="J_menuItem" href="/SECIMS/res/getPlanEvaluation">学习计划互评</a>
                            </li>
                        </ul>
                    </li>
                    
                     <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">分类</span>
                    </li>
                    <li>
                        <a href="mailbox.html">
                        	<i class="layui-icon">&#xe62c;</i>
                        	<span class="nav-label">月度考核管理 </span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="/SECIMS/res/getMonth">月评</a>
                            </li>
                            <li><a class="J_menuItem" href="/SECIMS/res/getMonthAssess">评定情况</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">分类</span>
                    </li>
                    <li>
                        <a href="#">
                        	<i class="layui-icon">&#xe60e;</i>
                        	<span class="nav-label">工作管理 </span>
                        	<span class="label label-warning pull-right">16</span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="/SECIMS/res/getWeekly">编辑周报</a>
                            </li>
                            <li><a class="J_menuItem" href="/SECIMS/res/getWeeklyReport">已发送的周报</a>
                            </li>
                            <li><a class="J_menuItem" href="/SECIMS/res/getWeeklyDustbin">已删除的周报</a>
                            </li>
                            <li><a class="J_menuItem" href="/SECIMS/res/getWeeklyDraftBox">草稿箱</a>
                            </li>
                        </ul>
                    </li>
                    
                    
                    
                    
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">分类</span>
                    </li>
                    <li>
                        <a href="#">
                        	<i class="layui-icon">&#xe63a;</i>
                        	<span class="nav-label">论坛 </span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="/SECIMS/res/getLearningForum">学习论坛</a>
                            <li><a class="J_menuItem" href="/SECIMS/res/getLearningForumMyPosts">我发布的帖子</a>
                            <li><a class="J_menuItem" href="/SECIMS/res/getLearningForumMyReply">我回复的帖子</a>
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
                <iframe id="J_iframe" width="100%" height="100%" src="/SECIMS/res/getStudyPlans" frameborder="0" data-id="plan" seamless></iframe>
            </div>
            
        </div>
        <!--右侧部分结束-->
    </div>

</body>

</html>
