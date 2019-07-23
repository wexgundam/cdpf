<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp" %>
<head>
   <meta charset="utf-8" />
   <title>Echarts 仪表盘示例</title>
   
  
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
         <div class="col-md-11">
             <div class="portlet light bordered">
                 <div class="portlet-title">
                     <div class="caption">
                         <i class="icon-bar-chart font-dark hide"></i>
                         <span class="caption-subject font-dark bold uppercase">仪表盘示例</span>
                     </div>
                 </div>
            
	             <div class="portlet-body">
	                 <!--      一个用于绘图的 DOM 容器  -->
	                 <div id="gaugeChart" style="height:400px;"></div>
	                 
	             </div>
             </div>
         </div>
         </div>
	    </div>
	    <div>
            <br/>
            <p style="font-size: 18px;">
               <span>完整代码详见:[/web/src/main/webapp/WEB-INF/views/example/echarts/gauge.jsp ]<br/></span>                                        
            </p>
         </div> 
         <button type="button" class="btn" onclick="window.location='index.htm'">
                            <i class="ace-icon fa fa-undo bigger-110"></i>返回
        </button>
	</div>
	<script type="text/javascript" src="${staticServer}/assets/example/echarts/js/echarts.min.js"></script>
	<script>
		var chartContainer = document.getElementById('gaugeChart');
		
		var resizeChartContainer = function () {
			chartContainer.style.width = $("#gaugeChart").parent().css("width");
			chartContainer.style.height = $("#gaugeChart").parent().css("hieght");
		};
		
		resizeChartContainer(); 
		var gaugeChart = echarts.init(chartContainer);
		var option = {
			    tooltip : {
			        formatter: "{a} <br/>{b} : {c}"
			    },
			    series: [
			         {
			            name: '速度',
			            type: 'gauge',
			            min: 0,
			            max: 220,
			            splitNumber: 11,
			            radius: '100%',        //仪表盘半径，可以是相对于容器高宽中较小的一项的一半的百分比，也可以是绝对的数值
			            axisLine: {            // 坐标轴线
			                lineStyle: {       // 属性lineStyle控制线条样式
			                    width: 10
			                }
			            },
			            axisTick: {            // 坐标轴小标记
			                length: 15,        // 属性length控制线长
			                lineStyle: {       // 属性lineStyle控制线条样式
			                    color: 'auto'
			                }
			            },
			            splitLine: {           // 分隔线
			                length: 20,        // 属性length控制线长
			                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
			                    color: 'auto'
			                }
			            },
			            title : {
			                // 其余属性默认使用全局文本样式，详见TEXTSTYLE
			                fontWeight: 'bolder',
			                fontSize: 20,
			                fontStyle: 'italic'
			            },
			            detail: {formatter:'{value}%'},
			            data:[{value: 40, name: 'km/h'}]
			        },
			    ]
		};

		// 使用刚指定的配置项和数据显示图表。
        gaugeChart.setOption(option);  
		
        window.onresize = function () {
		    //重置容器高宽
		    resizeChartContainer();
		    gaugeChart.resize();
		}; 
        
	</script>
</body>
