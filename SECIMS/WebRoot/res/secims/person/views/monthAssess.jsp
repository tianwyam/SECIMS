<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

	<head>
		<title>月度考核</title>
		
		<%-- 公共JS/CSS --%>
        <%@ include file="../../common/commonJS.jsp" %>
        
        <link rel="stylesheet" href="/SECIMS/res/SweetAlert/sweetalert.css" />

	</head>

	<body class="gray-bg">
  	
	    <div class="wrapper wrapper-content">
	        
	        <div class="row">
	        	
	        
	            <div class="col-sm-12">

					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h4>月评</h4>
						</div>
						<div class="ibox-content">
						
							<div id="my" style="max-width: 70em;height: 30em;margin: 0 auto;"></div>
							
							<div style="text-align: center;">
								<span style="color: red;">注：点击查看详情</span>
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
		
		
		
		
		<script type="text/javascript" src="/SECIMS/res/echarts/echarts.js"></script>
		<script type="text/javascript" src="/SECIMS/res/echarts/shine.js"></script>
		<script type="text/javascript" src="/SECIMS/res/SweetAlert/sweetalert.min.js"></script>
		
		
		<script type="text/javascript" src="/SECIMS/res/secims/person/js/monthAssess.js"></script>

	</body>

</html>