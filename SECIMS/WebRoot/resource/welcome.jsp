<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/welcome.css" />
        <title>welcome</title>
    </head>
    <body>
    	<shiro:principal/> 欢迎使用校企合作信息管理系统<br/>
 	</body>
</html>