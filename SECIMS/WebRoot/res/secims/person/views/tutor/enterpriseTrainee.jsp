<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <title>实习生</title>
    <meta charset="utf-8">
    
    <%-- 公共JS 和 css --%>
	<%@include file="../../../common/commonJS.jsp" %>


</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row animated fadeInRight">
        
        	<%-- 实习生 列表 --%>
        	<div class="col-sm-12">
                <div class="contact-box">
                    <a href="#">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="/SECIMS/res/secims/person/img/a4.jpg">
                            </div>
                        </div>
                        <div class="col-sm-8">
                        
                            <h3 style="font-family: '华文行楷';">告白气球</h3><br/>
                            <p><i class="glyphicon glyphicon-map-marker"></i> 四川·成都</p><br/>
                            <address>
	                            <p><i class="glyphicon glyphicon-envelope"></i> E-mail:12345678@qq.com</p><br/>
	                            <p title="Phone"><i class="glyphicon glyphicon-phone-alt"></i> Tel: (123) 456-7890</p> 
	                        </address>
	                        
	                        <div class="text-left tooltip-demo">
                            	<a class="btn  btn-sm btn-primary" href="/SECIMS/res/getTraineePlan?traineeId=15">
                            		<i class="layui-icon">&#xe636;</i> 学习计划
                            	</a>
                            	<a class="btn  btn-sm btn-primary" href="/SECIMS/res/getTraineeMonth?traineeId=15">
                            		<i class="layui-icon">&#xe62c;</i> 月评PPT查看/评语
                            	</a>
                            	<a class="btn  btn-sm btn-primary" href="/SECIMS/res/getTraineeWeekly?traineeId=15">
                            		<i class="layui-icon">&#xe60e;</i> 工作周报
                            	</a>
	                        </div>
	                        
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>
            </div>
            
            
            
            <div class="col-sm-12">
                <div class="contact-box">
                    <a href="#">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="/SECIMS/res/secims/person/img/a9.jpg">
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3 style="font-family: '华文行楷';">告白气球</h3><br/>
                            <p><i class="glyphicon glyphicon-map-marker"></i> 四川·成都</p><br/>
                            <address>
	                            <p><i class="glyphicon glyphicon-envelope"></i> E-mail:12345678@qq.com</p><br/>
	                            <p title="Phone"><i class="glyphicon glyphicon-phone-alt"></i> Tel: (123) 456-7890</p> 
	                        </address>
	                        <div class="text-left tooltip-demo">
                            	<button class="btn  btn-sm btn-primary">
                            		<i class="layui-icon">&#xe636;</i> 学习计划
                            	</button>
                            	<button class="btn  btn-sm btn-primary">
                            		<i class="layui-icon">&#xe62c;</i> 月评PPT查看/评语
                            	</button>
                            	<button class="btn  btn-sm btn-primary">
                            		<i class="layui-icon">&#xe60e;</i> 工作周报
                            	</button>
	                        </div>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>
            </div>
        
            
        </div>
    </div>
    

</body>

</html>
