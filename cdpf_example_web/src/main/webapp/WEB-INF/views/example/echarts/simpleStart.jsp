<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp" %>
<head>
   <meta charset="utf-8" />
   <title>Echarts 快速入门示例</title>
   
  
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
         <div class="col-md-7">
                 <div class="portlet light bordered">
                   <div class="portlet-title">
                     <div class="caption">
                         <i class="icon-bar-chart font-dark hide"></i>
                         <span class="caption-subject font-dark bold uppercase">快速入门</span>
                     </div>
                   </div>
                
                 <div class="portlet-body">
                     <!--      一个用于绘图的 DOM 容器  -->
                    <div id="simpleStart" style="height:400px;"></div>
                 </div>
               </div>
         </div>
         
         
         <div class="col-md-5">
             <div class="portlet light bordered">
                 <div class="portlet-title">
                     <div class="caption">
                         <i class="icon-bar-chart font-dark hide"></i>
                         <span class="caption-subject font-dark bold uppercase">说明</span>
                     </div>
                 </div>
                 <div class="portlet-body" style="height:410px;">
                     <p style="font-size: 16px;">
                        1、版本说明：本示例使用echarts版本为3.6.1<br/>
                        2、创建过程 :<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;  2.1、通过script标签引入echarts.min.js<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;  2.2、在绘图前我们需要为 ECharts备一个具备高宽的 DOM 容器。<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;  2.3、通过 echarts.init 方法初始化一个 echarts 实例。<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;  2.4、通过myChart.setOption方法为图设置参数。     <br/>
                                                                 注意：   <br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;  1、 创建图的script脚本一般放在初始化DOM容器的后面。<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;  2、 创建dom容器时，一定要指定高度和宽度。 <br/>
                     </p>
                 </div>
             </div>
	    </div>
	</div>
	
	<div>
	    <p> 完整代码详见：[ /web/src/main/webapp/WEB-INF/views/example/echarts/simpleStart.jsp ]</p>   
	    <button type="button" class="btn" style="position: relative; left:12px;" onclick="window.location='index.htm'">
                            <i class="ace-icon fa fa-undo bigger-110"></i>返回
        </button>
    </div>
</div>
	<script type="text/javascript" src="${staticServer}/assets/example/echarts/js/echarts.min.js"></script>
	<script>
		
		var chartContainer = document.getElementById('simpleStart');
	
		//用于使chart自适应高度和宽度,通过窗体高宽计算容器高宽
		var resizeChartContainer = function () {
			chartContainer.style.width = $("#simpleStart").parent().css("width");
			chartContainer.style.height = $("#simpleStart").parent().css("hieght");
		};
		
		resizeChartContainer(); 
		var myChart = echarts.init(chartContainer);
		// 指定图表的配置项和数据
		var option = {
		    color: ['#3398DB'],
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
		            axisTick: {
		                alignWithLabel: true
		            }
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'直接访问',
		            type:'bar',
		            barWidth: '60%',
		            data:[10, 52, 200, 334, 390, 330, 220]
		        }
		    ]
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
