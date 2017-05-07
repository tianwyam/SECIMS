<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 表单向导</title>
    <link rel="shortcut icon" href="favicon.ico"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/style.css" />
    
	<%@ include file="../common/head.jsp" %>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/project/projectAdd.js" ></script>

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox">
                    <div class="ibox-content">
                        <h2> 添加项目</h2>
                        <form id="form" action="${pageContext.request.contextPath }/addProject1" class="wizard-big" enctype="multipart/form-data" method="post">
                            <h1>项目介绍</h1>
                            <fieldset>
                                <h2>项目信息</h2>
                                <div class="row">
                                    <div class="col-sm-8">
                                        <div class="form-group">
                                            <label>项目名 *</label>
                                            <input id="projectName" name="projectName" type="text" class="form-control required">
                                        </div>
                                        <div class="form-group">
			                                <label>说明：</label>
			                                <textarea id="instruction" name="instruction" class="form-control" aria-required="false" rows="4"></textarea>
                            			</div>
                                    </div>
                                </div>

                            </fieldset>
                            <h1>附件</h1>
                            <fieldset>
                                <h2>需求文档上传</h2>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group" id="files">
										  <!--   <label class="sr-only" for="inputfile">文件输入</label> -->
										    <input type="file" name="file" onchange="change()" id="file">
										 </div>
                                    </div>
                                </div>
                            </fieldset>

                            <h1>备注</h1>
                            <fieldset>
                                <h2>开发说明</h2>
                               <div class="form-group">
                                     <label>期望完成时间 *</label>
                                     <input id="finishDate" name="finishDate" type="date" class="form-control required">
                                </div>
                                <div class="form-group">
                                     <label>需求提出人 *</label>
                                     <input id="postName" name="postName" type="text" class="form-control required">
                                </div>
                                <div class="form-group">
                                     <label>联系方式 *</label>
                                     <input id="phone" name="phone" type="text" class="form-control required">
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal hide fade" id="comm_modal"></div>
</body>

</html>
