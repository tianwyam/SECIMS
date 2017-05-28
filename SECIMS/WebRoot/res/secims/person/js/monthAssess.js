

// 存放数据
var monthData ;

$(function() {
	
	
	// 图表
	var myChart = echarts.init(document.getElementById("my"), "shine");

	// 指定图表的配置项和数据
	var option = {
		title: {
			text: '月度考核评定',
			textStyle: {
				color: '#154',
				fontStyle: 'oblique',
				fontFamily: '华文行楷'
			},
		},
		tooltip: {},
		toolbox: {
			feature: {
				magicType: {
					type: ['line', 'bar'],
					title: {
						line: '折线图',
						bar: '柱状图'
					}
				}
			}
		},
		legend: {
			data: ['月评评定']
		},
		color: ['#6e7074', '#546570'],
		xAxis: {
			axisPointer: {
				show: true,
			},
			data: []
		},
		yAxis: {},
		series: [{
			name: '月评评定',
			type: 'bar',
			smooth: true,
			data: []
		}]
	};

	// 使用刚指定的配置项和数据显示图表。
	myChart.setOption(option);
	
	
	console.log("开始获取月评评论信息！！");
	
	
	// 获取 月评信息
	$.ajax({
		type:"post",
		url:"/SECIMS/res/getMonthResult",
		contentType:"application/json;charset=UTF-8",
		async:true,
		dataType:"json",
		success:function(data){
			
			console.log(data);
			
			// 报错信息
			monthData = data;
			
			// 填入数据
		    myChart.setOption({
		        xAxis: {
		            data: data.categories
		        },
		        series: [{
		            // 根据名字对应到相应的系列
		            data: data.data
		        }]
		    });
		    
		    console.log("获取 月评 评价 信息成功！！！");
			
		}
	});
	
	console.log("结束获取月评评论信息！！");
	

	//点击事件
	myChart.on('click', function(params) {
		
		// 评语
		var comment = monthData.comments[params.dataIndex] ;
		// ID
		var reviewId = monthData.reviewIds[params.dataIndex] ;
		
		// 获取HTML内容
		var text = getHtmlContent(params.data, params.name, comment,reviewId);
		
		 swal({
			  title: "月评 <small>信息</small>!",
			  text: text,
			  html: true
			});
		 
		 
		 
		// 控制台打印数据的名称
		console.log(params.name);
		console.log(params.data);
		console.log(params.dataIndex);
		console.log(params.value);
		console.log("评语："+comment);
		
	});



});



// 拼装 html 提示 月评信息
function getHtmlContent(data,name,comment,reviewId){
	
	var css = "style=\"color:red;margin:1em;\"";
	var color = "style=\"color:blue;\"";
	var divCss = " style=\"text-align: left;padding:1em;\" ";
	var css1 = " style=\"color:red;margin:1em;font-size:2em;\" ";
	var href = " href=\"/SECIMS/res/getMonthPPTView?reviewId="+reviewId+"\" ";
	
	
	var text =  getH3("评定：")+getBr()+getSpan(data, css1)+ " 分."+getBr()+getBr();
	text += getH3("月份：")+getBr()+getSpan(name, css)+getBr()+getBr();
	text += getH3("详情：")+getBr()+getSpan(getA("点击-查看月评PPT", href, color), css)+getBr()+getBr();
	text += getH3("评语：")+getBr()+getSpan(comment, css);
	
	var htmlContent = getDiv(text, divCss);
	
	return htmlContent ;
	
	
}


// 获取HTML标签各样式

function getH3(text){
	return "<h3>"+text+"</h3>";
}

function getBr(){
	return "<br/>";
}

function getSpan(text,css){
	return "<span "+css+" >"+text+"</span>";
}

function getA(text,href,css){
	return "<a  "+href+css+" >"+text+"</a>" ;
}

function getDiv(text,css){
	return "<div "+css+" >"+text+"</div>";
}



