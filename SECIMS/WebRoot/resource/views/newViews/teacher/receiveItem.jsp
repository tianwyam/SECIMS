<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html>
   <head>
      <title>项目列表页</title>
      <%@ include file="../common/head.jsp" %>
      <script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/project/receiveItem.js" ></script>
   </head>
   <body>
 		<!-- 页面显示部分 -->
 		<div class="container">
			<div class="panel panel-default">
				<div class="panel-heading text-center">
					<h2> 可接收项目列表</h2>
					<input type="text" style="display: none" id="userName" name="userName" value='<shiro:principal></shiro:principal>' />
				</div>
				<div class="panel-body">
					<table class="table table-hover" id="cusTable">
						<!--<thead>
							<tr>
								<th data-field="id">项目名称</th>
								<th data-field="name">负责人</th>
								<th data-field="phone">联系电话</th>
								<th data-field="finishDate">结束时间</th>
								<th data-field="detail">详情页</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="pl" items="${projectList }">
								<tr>
									<td>${pl.projectName }</td>
									<td>${pl.postName }</td>
									<td>${pl.phone }</td>
									<td>
										<fmt:formatDate value="${pl.finishDate }" pattern="yyyy-MM-dd"/>
									</td>
									<td>
										<a class="btn btn-info" href="${pageContext.request.contextPath }/resource/views/newViews/projectInfo.jsp">查看</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>-->
					</table>
				</div>
			</div> 			
 		</div>
   </body>
   
</html>