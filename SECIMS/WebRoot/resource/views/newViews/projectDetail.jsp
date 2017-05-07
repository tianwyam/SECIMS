<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>项目信息</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="../../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../css/animate.css" />
    <link rel="stylesheet" href="../../css/style.css" />

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-8">
                <div class="ibox">
                    <div class="ibox-content">
                        <span class="text-muted small pull-right">最后更新：<i class="fa fa-clock-o"></i> 2015-09-01 12:00</span>
                        <h2>项目管理</h2>
                        <div class="input-group">
                            <input type="text" placeholder="查找用户" class="input form-control">
                            <span class="input-group-btn">
                                        <button type="button" class="btn btn btn-primary"> <i class="fa fa-search"></i> 搜索</button>
                                </span>
                        </div>
                        <div class="clients-list">
                            <ul class="nav nav-tabs">
                                <span class="pull-right small text-muted">6个开发</span>
                                <li class="active"><a data-toggle="tab" href="#"><i class="fa fa-user"></i> 开发者</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane active">
                                    <div class="full-height-scroll">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-hover">
                                                <tbody>
                                                    <tr>
                                                        <td class="client-avatar"><img alt="image" src="../../images/class.png"> </td>
                                                        <td><a data-toggle="tab" href="#" class="client-link">袁岳</a></td>
                                                        <td> 瑞安市海诚机械有限公司</td>
                                                        <td><span class="glyphicon glyphicon-earphone"></span>1234567890</td>
                                                        <td><span class="glyphicon glyphicon-envelope"></span> gravida@qq.com</td>
                                                        <td class="client-status"><span class="label label-primary">开发中</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="client-avatar"><img alt="image" src="../../images/class.png"> </td>
                                                        <td><a data-toggle="tab" href="#" class="client-link">袁岳</a></td>
                                                        <td> 瑞安市海诚机械有限公司</td>
                                                        <td><span class="glyphicon glyphicon-earphone"></span>1234567890</td>
                                                        <td><span class="glyphicon glyphicon-envelope"></span> gravida@qq.com</td>
                                                        <td class="client-status"><span class="label label-danger">已验证</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="client-avatar"><img alt="image" src="../../images/class.png"> </td>
                                                        <td><a data-toggle="tab" href="#" class="client-link">袁岳</a></td>
                                                        <td> 瑞安市海诚机械有限公司</td>
                                                        <td><span class="glyphicon glyphicon-earphone"></span>1234567890</td>
                                                        <td><span class="glyphicon glyphicon-envelope"></span> gravida@qq.com</td>
                                                        <td class="client-status"><span class="label label-success">已完成</span></td>
                                                    </tr>
                                                </tbody>
                                            </table>
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

    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>

    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>

    <script>
        $(function () {
            $('.full-height-scroll').slimScroll({
                height: '100%'
            });
        });
    </script>
</body>

</html>
