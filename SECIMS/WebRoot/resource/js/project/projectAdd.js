$(function() {
	$("#form").steps({
		bodyTag: "fieldset",
		onStepChanging: function(event, currentIndex, newIndex) {
			// Always allow going backward even if the current step contains invalid fields!
			if(currentIndex > newIndex) {
				return true;
			}

			// Forbid suppressing "Warning" step if the user is to young
			if(newIndex === 3 && Number($("#age").val()) < 18) {
				return false;
			}

			var form = $(this);

			// Clean up if user went backward before
			if(currentIndex < newIndex) {
				// To remove error styles
				$(".body:eq(" + newIndex + ") label.error", form).remove();
				$(".body:eq(" + newIndex + ") .error", form).removeClass("error");
			}

			// Disable validation on fields that are disabled or hidden.
			form.validate().settings.ignore = ":disabled,:hidden";

			// Start validation; Prevent going forward if false
			return form.valid();
		},
		onStepChanged: function(event, currentIndex, priorIndex) {
			// Suppress (skip) "Warning" step if the user is old enough.
			if(currentIndex === 2 && Number($("#age").val()) >= 18) {
				$(this).steps("next");
			}

			// Suppress (skip) "Warning" step if the user is old enough and wants to the previous step.
			if(currentIndex === 2 && priorIndex === 3) {
				$(this).steps("previous");
			}
		},
		onFinishing: function(event, currentIndex) {
			var form = $(this);

			// Disable validation on fields that are disabled.
			// At this point it's recommended to do an overall check (mean ignoring only disabled fields)
			form.validate().settings.ignore = ":disabled";

			// Start validation; Prevent form submission if false
			return form.valid();
		},
		onFinished: function(event, currentIndex) {
			var form = $(this);
			// Submit form input
			var projectName = $('#projectName').val();
			var instruction = $('#instruction').val();
			
			form.submit();
//			window.location.href=Utils.root()+"/addProject1";
		},
		onCanceled:function(){
//			window.parent.frames.location.href="projectList.jsp";
			window.location.href=Utils.root()+"/projectList";
		}
	}).validate({
		errorPlacement: function(error, element) {
			element.before(error);
		},
		rules: {
			confirm: {
				equalTo: "#password"
			}
		}
	});
	
//	$('input[name="file"]').change(function(e){
//		if(confirm("确定要放弃操作，返回列表页面吗")){
//			$('#files').append('<input type="file" name="file" onchange="change()" id="file">');
//		}
//	});
	
});

function change(){
	Utils.confirm({title:"提示",message:"是否继续上传文件?",operate:function(result){
		if(result){
			$('#files').append('<input type="file" name="file" onchange="change()" id="file">');
		}
	}});
	
//	if(window.confirm("是否继续上传文件")){
//		$('#files').append('<input type="file" name="file" onchange="change()" id="file">');
//	}
}