


$(function() {
	
	var ary = [];
	
	// jquery steps 向导
	$("#wizard").steps({
		headerTag: "h1",
		bodyTag: "fieldset",
		transitionEffect: "slideLeft",
		autoFocus: true,
		enableAllSteps: true,
	    enablePagination: true,
	    stepsOrientation: "vertical",
		onStepChanging: function (event, currentIndex, newIndex){
			
			var star = $("#evalStars").val();
			
			// 先把当前值 保存
			ary[currentIndex] = star;
			
			// next 下一步
			if(currentIndex < newIndex){
				
				
				console.log(" onStepChanging next......  "+star + " index : "+currentIndex);
				
				if(star == "" || star == null || star == 0){
					alert("请先评分 ！！ ");
					return false;
				}
				
				// 清除 star 的值，赋予 0
				$('#evalStars').rating('update', ary[newIndex]);
			}
			
			// previous 上一步
			if(currentIndex > newIndex){
				console.log(" onStepChanging previous......  "+ary[newIndex]);
				
				// 赋值给原先的值 / star 更新
				$('#evalStars').rating('update', ary[newIndex]);
			}
	    
	        return true;
	    },
	    onFinishing: function (event, currentIndex){
	    	var star = $("#evalStars").val();
			
			console.log(" onFinishing ......  "+star + " index : "+currentIndex);
			
			if(star == "" || star == null || star == 0){
				alert("请先评分 ！！ ");
				return false;
			}
			
			
			// 先把当前值 保存 // 保存的是在点击 完成 最后一次的那个值
			ary[currentIndex] = star;
	    	
	    
	        return true;
	    },
	    onFinished: function (event, currentIndex){
	    
	        console.log("Submitted! ....  index : "+currentIndex);
	        
	        console.log(ary);
	    },
	    onCanceled: function(){
	    	console.log("onCancel .......");
	    }
	});
	
	
	
});