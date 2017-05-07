<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>boostrap_table</title>
        <link rel="stylesheet" href="../boostrap_table/css/bootstrap.min.css" />
        <link rel="stylesheet" href="../boostrap_table/css/bootstrap-table.min.css" />
        <script type="text/javascript" src="../boostrap_table/js/jquery2.0.0.min.js" ></script>
        <script type="text/javascript" src="../boostrap_table/js/bootstrap.min.js" ></script>
        <script type="text/javascript" src="../boostrap_table/js/bootstrap-table.min.js" ></script>
        <script type="text/javascript" src="../boostrap_table/js/bootstrap-table-zh-CN.js" ></script>
        <script type="text/javascript" src="../boostrap_table/js/demo.js" ></script>
    </head>
    <body>
    	<div class="container">
    		<h2>角色列表</h2>
			<div class="row" style="height: 31em;">
				<div class="col-md-8">
					<table class="table table-bordered" id="cusTable">
						<thead>
							<tr>
								<th data-field="id">角色名称</th>
								<th data-field="name">角色类型</th>
								<th data-field="price">操作</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
    	</div>
 	</body>
</html>