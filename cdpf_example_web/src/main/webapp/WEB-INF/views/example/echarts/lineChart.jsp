<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp" %>
<head>
   <meta charset="utf-8" />
   <title>Echarts 折线图示例</title>
   
  
</head>
<body >
     <div class="page-bar">
			<ul class="page-breadcrumb">
			    <li><a href="${dynamicServer}/index.htm">首页</a> <i class="fa fa-circle"></i>
				</li>
				<li><a href="${dynamicServer}/index.htm">代码示例</a><i class="fa fa-circle"></i>
				</li>
				<li><span>Echarts 代码示例</span></li>
			</ul>
	 </div>
	<div>
	   <div class="row">
	   <!-- 分类图 -->
         <div class="col-md-6">
             <div class="portlet light bordered">
                 <div class="portlet-title">
                     <div class="caption">
                         <i class="icon-bar-chart font-dark hide"></i>
                         <span class="caption-subject font-dark bold uppercase">Echarts 分类图示例</span>
                     </div>
                 </div>
              
	              <div class="portlet-body">
	                  <!--      一个用于绘图的 DOM 容器  -->
	                  <div id="categoryLine" style="height:400px;"></div>
	                  <div>
	                  
	                  
	                  </div> 
	              </div>
             </div>
         </div>
         
         <!--  极坐标图-->
         <div class="col-md-6">
             <div class="portlet light bordered">
                 <div class="portlet-title">
                     <div class="caption">
                         <i class="icon-bar-chart font-dark hide"></i>
                         <span class="caption-subject font-dark bold uppercase">Echarts 极坐标图示例</span>
                     </div>
                 </div>
              
	              <div class="portlet-body">
	                  <!--      一个用于绘图的 DOM 容器  -->
	                  <div id="polarLine" style="height:400px;"></div>
	                  <div>
	                     
	                  </div> 
	              </div>
             </div>
         </div>
	  </div>
	  
	  <div class="row">
	   
	    <!-- 折线柱状组合图 -->
         <div class="col-md-6">
             <div class="portlet light bordered">
                 <div class="portlet-title">
                     <div class="caption">
                         <i class="icon-bar-chart font-dark hide"></i>
                         <span class="caption-subject font-dark bold uppercase">Echarts 折线柱状组合图示例</span>
                     </div>
                 </div>
             
	             <div class="portlet-body">
	                 <!--      一个用于绘图的 DOM 容器  -->
	                 <div id="barLine" style="height:400px;"></div>
	                 <div>
	                 </div> 
	             </div>
             </div>
	       </div>
	    </div>

	  <div> 
	      <p style="font-size: 18px;">
             <span> 完整代码详见：[ /web/src/main/webapp/WEB-INF/views/example/echarts/lineChart.jsp ]<br/></span>                                        
          </p>
          <button type="button" class="btn" onclick="window.location='index.htm'">
                            <i class="ace-icon fa fa-undo bigger-110"></i>返回
        </button>
	  </div>
	  
	</div>
	<script type="text/javascript" src="${staticServer}/assets/example/echarts/js/echarts.min.js"></script>
	<script>
	     var chartContainer = document.getElementById('categoryLine');
	
		 var resizeChartContainer = function (container,id) {
			 container.style.width = $("#"+id).parent().css("width");
			 container.style.height = $("#"+id).parent().css("hieght");
		 };
		 
		 resizeChartContainer(chartContainer,"categoryLine"); 
	     var myChart = echarts.init(chartContainer);
		 var option = {
		    title: {
		        text: '未来一周气温变化',
		        left:40
		    }, 
		    tooltip: {
		        trigger: 'axis'
		    },
		    grid:{
		       left:40,
		       top:-5
		    },
		    legend: {
		    	left:240,
		        data:['最高气温','最低气温']
		    },
		    xAxis:  {
		        type: 'category',
		        data: ['周一','周二','周三','周四','周五','周六','周日']
		    },
		    yAxis: {
		        type: 'value',
		        axisLabel: {
		            formatter: '{value} °C'
		        }
		    },
		    series: [
		        {
		            name:'最高气温',
		            type:'line',
		            data:[11, 11, 10, 13, 12, 13, 10],
		           
		        },
		        {
		            name:'最低气温',
		            type:'line',
		            data:[1, -2, 2, 5, 3, 2, 0],
		        }
		    ]
		};

		myChart.setOption(option);
		
		
		var chartContainer1 = document.getElementById('polarLine');
		resizeChartContainer(chartContainer,"polarLine"); 
	    var polarChart = echarts.init(chartContainer1);
		
		var data = [];
    	
      	var theta = 117.2;
    	data.push([0, 0]);
    	data.push([20,theta]);
        var angle = ["N(0°)","NE(45°)","E(90°)","SE(135°)","S(180°)","SW(225°)","W(270°)","NW(315°)"];

		var option = {
		    title: {
		        text: '极坐标双数值轴'
		    },
		    
		    polar: {},
		    tooltip: {
		        trigger: 'axis',
		        formatter: function (params) {
		        	//alert(params[0].value);
		        }
 	        },
		
		    angleAxis: {
		        type: 'value',
		        startAngle: 90,
		        min:0,
		        max:360,
		        axisLabel:{
		        	formatter: function (value, index) {
		        	    return angle[index];
					}
		        	
		        },
		        interval:45,
		        
		        
		    },
		    radiusAxis: {
		    	splitNumber:5,
		    	axisLabel:{
		    		show:false
		    	},
		    	axisLine:{
		    		show:false
		    	},
		    	splitLine:{
		    		lineStyle:{
		    			type:"dotted"
		    		}
		    	}
		    	
		    },
		    series: [{
		        coordinateSystem: 'polar',
		        name: 'line',
		        type: 'graph',
		        data: data,
		        edgeSymbol: ['circle', 'arrow'],
		        links: [{
                source: 0,
                target: 1,
                symbolSize: [1, 10],
                edgeSymbolSize:2,
                lineStyle:{
                	normal:{
                		color:'red',
                		width:2
                	}
                }
              
            }]
                                
            }]
		        
		};
		
		//为ECHARTS对象加载数据
		polarChart.setOption(option);
		
		var chartContainer2 = document.getElementById('barLine');
		resizeChartContainer(chartContainer2,"barLine"); 
	    var barLineChart = echarts.init(chartContainer2);
	
		var option = {
				tooltip : {
					trigger : 'axis',
				},

				grid : {
					x : 40
				/* y轴标题距左边的距离 */
				},
				xAxis :{
					type : 'category',
					data: ['00:00', '01:15', '02:30', '20:00', '21:15', '22:30', '23:45']
			    },
				yAxis : [ {
					type : 'value',
				},
				],
				legend : {
					data : [ '柱图', '线图' ],
					bottom : 0,
				},
				series : [ {
					name : '柱图',
					type : 'bar',
					smooth : true,
					barWidth : 30,
					symbolSize : 2,
					hoverAnimation : false,
					data: [300, 280, 250, 260, 270, 300, 550],
					
				}, {
					name : '线图',
					type : 'line',
					smooth : true,
					symbolSize : 8,
					hoverAnimation : false,
					data: [300, 280, 250, 260, 270, 300, 550],

				} ]
			};
		
		barLineChart.setOption(option);
		
		window.onresize = function () {
		    //重置容器高宽
		    resizeChartContainer(chartContainer,"categoryLine"); 
		    resizeChartContainer(chartContainer1,"polarLine"); 
		    resizeChartContainer(chartContainer2,"barLine"); 
		    myChart.resize();
		    polarChart.resize();
		    barLineChart.resize();
		}; 
			
	</script>
</body>
