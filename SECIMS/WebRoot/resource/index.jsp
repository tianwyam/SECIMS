<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>SECIMS_01 - 主页</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resource/images/favicon.ico" type="image/x-icon"/>
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    
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
                                        <strong class="font-bold">SECIMS</strong><br>
                                        <shiro:hasRole name="admin">
											admin-<shiro:principal/>
										</shiro:hasRole>
										<shiro:hasRole name="student">
											student-<shiro:principal/>
										</shiro:hasRole>
										<shiro:hasRole name="teacher">
											teacher-<shiro:principal/>
										</shiro:hasRole>
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
                        <a class="J_menuItem" href="welcome.jsp">
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
                            <li><a class="J_menuItem" href="views/newViews/emailInfo.jsp">邮件设置</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">分类</span>
                    </li>
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    </li>
                    <li>
                        <a href="views/person/trainManage.jsp">
                        	<i class="glyphicon glyphicon-list-alt"></i> 
                        	<span class="nav-label">项目管理 </span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                            	<shiro:hasRole name="admin">
                            		<a class="J_menuItem" href="${pageContext.request.contextPath}/projectList.do">项目列表</a>
                            	</shiro:hasRole>
                            	<shiro:hasRole name="student">
                            		<a class="J_menuItem" href="sss.jsp">项目列表</a>
                            	</shiro:hasRole>
                            </li>
                            <li>
                            	<shiro:hasRole name="admin">
                            		<a class="J_menuItem" href="views/newViews/admin/projectAdd.jsp">项目添加</a>
                            	</shiro:hasRole>
                            </li>
                            <shiro:hasRole name="teacher">
                            	<li>
                            		<a class="J_menuItem" href="views/newViews/teacher/receiveItem.jsp">可选项目列表</a>
                            	</li>
                            	<li>
                            		<a class="J_menuItem" href="views/newViews/teacher/receivedItem.jsp">已选项目列表</a>
                            	</li>
                            </shiro:hasRole>
                        </ul>
                    </li>
                    
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    </li>
                    <li>
                        <a href="views/person/trainManage.jsp">
                        	<i class="glyphicon glyphicon-user"></i> 
                        	<span class="nav-label">基础管理 </span>
                        </a>
                        <ul class="nav nav-second-level">
                        	<shiro:hasRole name="admin">
	                        	<li>
	                            	<a class="J_menuItem" href="views/newViews/admin/userList.jsp">用户列表</a>
	                            </li>
	                             <li>
	                            	<a class="J_menuItem" href="views/newViews/admin/roleList.jsp">权限管理</a>
	                            </li>
                        	</shiro:hasRole>
                        	<li>
                        		<a class="J_menuItem" href="views/newViews/passwordMod.jsp">密码修改</a>
                        	</li>
                        	<li>
                        		<a class="J_menuItem" href="${pageContext.request.contextPath}/user/userInfo?userName=<shiro:principal></shiro:principal>">个人资料</a>
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
                <iframe id="J_iframe" width="100%" height="100%" src="welcome.jsp" frameborder="0" data-id="index_v1.html" seamless></iframe>
            </div>
            
        </div>
        <!--右侧部分结束-->
    </div>

    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="js/hAdmin.js?v=4.1.0"></script>
    <script type="text/javascript" src="js/index.js"></script>

    <!-- 第三方插件 -->
    <script src="js/plugins/pace/pace.min.js"></script>

</body>

</html>
