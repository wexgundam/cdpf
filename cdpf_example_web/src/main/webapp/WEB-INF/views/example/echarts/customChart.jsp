<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp" %>
<head>
   <meta charset="utf-8" />
   <title>Echarts 自定义</title>
   
  
</head>
<body>
 <div>
     <div class="page-bar">
			<ul class="page-breadcrumb">
			    <li><a href="${dynamicServer}/index.htm">首页</a> <i class="fa fa-circle"></i>
				</li>
				<li><a href="${dynamicServer}/index.htm">代码示例</a><i class="fa fa-circle"></i>
				</li>
				<li><span>Echarts 代码示例</span></li>
			</ul>
	 </div>
	<div class="row">
	  
         <div class="col-md-6">
                 <div class="portlet light bordered">
                   <div class="portlet-title">
                     <div class="caption">
                         <i class="icon-bar-chart font-dark hide"></i>
                         <span class="caption-subject font-dark bold uppercase">快速入门</span>
                     </div>
                   </div>
                
                 <div class="portlet-body">
                     <!--      一个用于绘图的 DOM 容器  -->
                    <div id="customChart" style="height:400px;"></div>
                 </div>
               </div>
         </div>
         
          <div class="col-md-6">
                 <div class="portlet light bordered">
                   <div class="portlet-title">
                     <div class="caption">
                         <i class="icon-bar-chart font-dark hide"></i>
                         <span class="caption-subject font-dark bold uppercase">说明</span>
                     </div>
                   </div>
                
                 <div class="portlet-body" style="height:410px;">
                   <div class="col-md-12">
                     <p> 配置说明：</p>
                       <p> &nbsp;&nbsp;&nbsp;&nbsp;1、renderItem: 其中定义渲染的逻辑,函数提供了两个参数,
                       params:包含了当前数据信息和坐标系的信息,
                       api:是一些开发者可调用的方法集合。renderItem 函数须返回根据此 dataItem 绘制出的图形元素的定义信息 </p>
                       <p> &nbsp;&nbsp;&nbsp;&nbsp;  2、encode:可以指定 data 中哪些维度映射到坐标系中哪个轴，或者哪些维度在 tooltip 以及 label 中显示。
                     </p>
                   </div>
                 </div>
               </div>
         </div>
	</div>
	<div>
	    <p> 完整代码详见:[/web/src/main/webapp/WEB-INF/views/example/echarts/customerChart.jsp ]</p>                         
		<button type="button" class="btn" style="position: relative; left:12px;" onclick="window.location='index.htm'">
	                            <i class="ace-icon fa fa-undo bigger-110"></i>返回
	    </button>
    </div>
  </div>
	<script type="text/javascript" src="${staticServer}/assets/example/echarts/js/echarts.min.js"></script>
	<script>
		
		var chartContainer = document.getElementById('customChart');
	
		//用于使chart自适应高度和宽度,通过窗体高宽计算容器高宽
		var resizeChartContainer = function () {
			chartContainer.style.width = $("#customChart").parent().css("width");
			chartContainer.style.height = $("#customChart").parent().css("hieght");
		};
		
		resizeChartContainer(); 
		var myChart = echarts.init(chartContainer);
		
		var categoryData = [];
		var errorData = [];
		var barData = [];
		var dataCount = 100;
		for (var i = 0; i < dataCount; i++) {
		    var val = Math.random() * 1000;
		    categoryData.push('category' + i);
		    errorData.push([
		        i,
		        echarts.number.round(Math.max(0, val - Math.random() * 100)),
		        echarts.number.round(val + Math.random() * 80)
		    ]);
		    barData.push(echarts.number.round(val, 2));
		}

		//自定义渲染方法
		function renderItem(params, api) {
		    var xValue = api.value(0);
		    var highPoint = api.coord([xValue, api.value(1)]);
		    var lowPoint = api.coord([xValue, api.value(2)]);
		    var halfWidth = api.size([1, 0])[0] * 0.1;
		    var style = api.style({
		        stroke: api.visual('color'),
		        fill: null
		    });

		    return {
		        type: 'group',
		        children: [{
		            type: 'line',
		            shape: {
		                x1: highPoint[0] - halfWidth, y1: highPoint[1],
		                x2: highPoint[0] + halfWidth, y2: highPoint[1]
		            },
		            style: style
		        }, {
		            type: 'line',
		            shape: {
		                x1: highPoint[0], y1: highPoint[1],
		                x2: lowPoint[0], y2: lowPoint[1]
		            },
		            style: style
		        }, {
		            type: 'line',
		            shape: {
		                x1: lowPoint[0] - halfWidth, y1: lowPoint[1],
		                x2: lowPoint[0] + halfWidth, y2: lowPoint[1]
		            },
		            style: style
		        }]
		    };
		}

		var option = {
		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'shadow'
		        }
		    },
		    title: {
		        text: 'Error bar chart'
		    },
		    legend: {
		        data: ['bar', 'error']
		    },
		    dataZoom: [{
		        type: 'slider',
		        start: 50,
		        end: 70
		    }, {
		        type: 'inside',
		        start: 50,
		        end: 70
		    }],
		    xAxis: {
		        data: categoryData
		    },
		    yAxis: {},
		    series: [{
		        type: 'bar',
		        name: 'bar',
		        data: barData,
		        itemStyle: {
		            normal: {
		                color: '#77bef7'
		            }
		        }
		    }, {
		        type: 'custom',
		        name: 'error',
		        itemStyle: {
		            normal: {
		                borderWidth: 1.5
		            }
		        },
		        renderItem: renderItem,
		        encode: {
		            x: 0,
		            y: [1, 2]
		        },
		        data: errorData,
		        z: 100
		    }]
		};
		
		
		
		
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);  
        
         window.onresize = function () {
		    //重置容器高宽
		    resizeChartContainer();
		    myChart.resize();
		}; 
	</script>
</body>
