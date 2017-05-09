


$(function() {
	
	var scores = [];
	var planIds = [];
	
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
			var planId = $("#planID"+currentIndex).html();
			
			// 先把当前值 保存
			scores[currentIndex] = star;
			planIds[currentIndex] = planId;
			
			// next 下一步
			if(currentIndex < newIndex){
				
				
				console.log(" onStepChanging next......  "+star + " index : "+currentIndex);
				
				if(star == "" || star == null || star == 0){
					layer.alert("请先评分 ！！ ",{icon:5});
					return false;
				}
				
				// 清除 star 的值，赋予 0
				$('#evalStars').rating('update', scores[newIndex]);
			}
			
			// previous 上一步
			if(currentIndex > newIndex){
				console.log(" onStepChanging previous......  "+scores[newIndex]);
				
				// 赋值给原先的值 / star 更新
				$('#evalStars').rating('update', scores[newIndex]);
			}
	    
	        return true;
	    },
	    onFinishing: function (event, currentIndex){
	    	var star = $("#evalStars").val();
	    	var planId = $("#planID"+currentIndex).html();
			
			console.log(" onFinishing ......  "+star + " index : "+currentIndex);
			
			if(star == "" || star == null || star == 0){
				layer.alert("请先评分 ！！ ",{icon:5});
				return false;
			}
			
			
			// 先把当前值 保存 // 保存的是在点击 完成 最后一次的那个值
			scores[currentIndex] = star;
			planIds[currentIndex] = planId;
	    	
	    
	        return true;
	    },
	    onFinished: function (event, currentIndex){
	    
	        console.log("Submitted! ....  index : "+currentIndex);
	        
	        console.log(scores);
	        console.log(planIds);
	        
	        
	        // 批量修改计划成绩
	        $.ajax({
	        	type:"post",
	        	url:"/SECIMS/res/updateScores",
	        	traditional:true,
	        	dataType:"json",
	        	data:{
	        		"scores" : scores,
	        		"planIds" : planIds
	        	},
	        	success:function(data){
	        		
	        		console.log("批量修改计划评分成功！！！！ - data = ");
	        		console.log(data);
	        		
	        		if(data.success){
	        			
	        			layer.msg("评分完成，即将跳转到 计划主页 ....",{icon:6,time:3000});
	        			
	        			setTimeout('window.location.href="/SECIMS/res/getStudyPlans";',3000);
	        		}
	        	}
	        });
	        
	        
	        
	        
	        
	    },
	    onCanceled: function(){
	    	console.log("onCancel .......");
	    	
	    	layer.msg("即将跳回 计划主页 ....",{icon:6,time:3000});
	    	
	    	setTimeout('window.location.href="/SECIMS/res/getStudyPlans";',3000);
	    	
	    }
	});
	
	
	
});