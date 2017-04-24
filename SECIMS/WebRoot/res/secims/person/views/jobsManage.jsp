<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

	<head>

		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>工作管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link href="../../../bootstrap/css/bootstrap.css" rel="stylesheet">
		<link href="../../../summernote/summernote.css" rel="stylesheet">

		<script src="../../../jqtreetable/jquery.min.js"></script>
		<script src="../../../bootstrap/js/bootstrap.js"></script>

		<script src="../../../summernote/summernote.js"></script>
		<script src="../../../summernote/summernote-zh-CN.js"></script>

	</head>

	<body>

		<div style="width: 80%;height: 80%;margin: 2em auto;">
			<div id="note">
				<p></p>
			</div>
		</div>

		<button type="button" class="btn btn-default" aria-label="Left Align" id="disBtn">
  		<span class="glyphicon glyphicon-align-left" aria-hidden="true"></span> 禁用
		</button>

		<button type="button" class="btn btn-default" id="codeBtn">
  		<span class="glyphicon glyphicon-star" aria-hidden="true"></span> 获取
		</button>
		<button type="button" class="btn btn-default" id="resetBtn">
  		<span class="glyphicon glyphicon-star" aria-hidden="true"></span> 重置
		</button>

		<script>
			$(function() {
				$("#note").summernote({
					height: 300,
					maxHeight: 300,
					lang: 'zh-CN',
					focus: true
				});
			});
			
			
			
			$(function(){
				
				$("#codeBtn").on("click",function(){
					var code = $("#note").summernote("code");
					console.log("str code : "+code);
				});
				
				
				$("#resetBtn").on("click",function(){
					$("#note").summernote("reset");
				});
				
				$("disBtn").on("click",function(){
					
					$('#summernote').summernote('backColor', 'red');
					
					$('#summernote').summernote('foreColor', 'blue');

				});
				
				
				
				
			});
			
		</script>

	</body>

</html>