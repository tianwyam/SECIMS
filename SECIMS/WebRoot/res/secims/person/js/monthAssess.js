




$(function() {

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
			data: ["一月", "二月", "三月", "四月", "五月", "六月"]
		},
		yAxis: {},
		series: [{
			name: '月评评定',
			type: 'bar',
			smooth: true,
			data: [75, 80, 86, 80, 90, 85]
		}]
	};

	// 使用刚指定的配置项和数据显示图表。
	myChart.setOption(option);

	//点击事件
	myChart.on('click', function(params) {
		// 控制台打印数据的名称
		console.log(params.name);
		console.log(params.data);
		console.log(params.dataIndex);
		console.log(params.value);
		
		var text = "评定：<span style=\"color:#F8BB86\">"+params.data+"</span> 分.<br/><br/>";
		
		text += "月份："+params.name+"<br/><br/>";
		text += "评语：<br/><br/>";
		
		 swal({
			  title: "月评 <small>信息</small>!",
			  text: text,
			  html: true
			});
		
	});



});