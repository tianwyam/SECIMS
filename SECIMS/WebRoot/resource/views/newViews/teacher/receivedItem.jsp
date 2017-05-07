<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html>
   <head>
      <title>项目列表页</title>
      <%@ include file="../common/head.jsp" %>
      <script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/project/receivedItem.js" ></script>
   </head>
   <body>
 		<!-- 页面显示部分 -->
 		<div class="container">
			<div class="panel panel-default">
				<div class="panel-heading text-center">
					<h2> 已接收项目列表</h2>
					<input type="text" style="display: none" id="userName" name="userName" value='<shiro:principal></shiro:principal>' />
				</div>
				<div class="panel-body">
					<table class="table table-hover" id="cusTable">
					</table>
				</div>
			</div> 			
 		</div>
   </body>
   
</html>