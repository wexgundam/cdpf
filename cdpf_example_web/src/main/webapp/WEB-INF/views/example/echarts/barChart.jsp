<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp" %>
<head>
   <meta charset="utf-8" />
   <title>Echarts 累积柱状图示例</title>
   
  
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
         <div class="col-md-12">
               <div class="portlet light bordered">
	                <div class="portlet-title">
	                    <div class="caption">
	                        <i class="icon-bar-chart font-dark hide"></i>
	                        <span class="caption-subject font-dark bold uppercase">累积柱状图</span>
	                    </div>
	                </div>
                
	                <div class="portlet-body">
	                     <!--      一个用于绘图的 DOM 容器  -->
	                     <div id="barChart" style="height:400px;"></div>
	                     <div>
	                         <br/>
	                         <br/>
	                         <p style="font-size: 18px;">
	                            <span> 完整代码详见：[ /web/src/main/webapp/WEB-INF/views/example/echarts/barChart.jsp ]<br/></span>                                        
	                         </p>
	                         
	                         
	                     </div> 
	               </div>
               </div>
             
         </div>
	    </div>
	    <button type="button" class="btn" onclick="window.location='index.htm'">
                            <i class="ace-icon fa fa-undo bigger-110"></i>返回
        </button>
	</div>
	<script type="text/javascript" src="${staticServer}/assets/example/echarts/js/echarts.min.js"></script>
	<script>
		var chartContainer = document.getElementById('barChart');
	
		var resizeChartContainer = function () {
			chartContainer.style.width = $("#barChart").parent().css("width");
			chartContainer.style.height = $("#barChart").parent().css("hieght");
		};
	
		resizeChartContainer(); 
		var myChart = echarts.init(chartContainer);
		var option = {
			    tooltip : {
			        trigger: 'axis',
			        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
			            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			        }
			    },
			    legend: {
			        data: ['直接访问', '邮件营销','联盟广告','视频广告','搜索引擎']
			    },
			    grid: {
			        /* left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true */
			    },
			    xAxis:  {
			    	type: 'category',
			        data: ['周一','周二','周三','周四','周五','周六','周日']
			        
			    },
			    yAxis: {
			    	type: 'value'
			    },
			    series: [
			        {
			            name: '直接访问',
			            type: 'bar',
			            stack: '总量',
			            label: {
			                normal: {
			                    show: true,
			                    position: 'insideRight'
			                }
			            },
			            data: [320, 302, 301, 334, 390, 330, 320]
			        },
			        {
			            name: '邮件营销',
			            type: 'bar',
			            stack: '总量',
			            label: {
			                normal: {
			                    show: true,
			                    position: 'insideRight'
			                }
			            },
			            data: [120, 132, 101, 134, 90, 230, 210]
			        },
			        {
			            name: '联盟广告',
			            type: 'bar',
			            stack: '总量',
			            label: {
			                normal: {
			                    show: true,
			                    position: 'insideRight'
			                }
			            },
			            data: [220, 182, 191, 234, 290, 330, 310]
			        },
			        {
			            name: '视频广告',
			            type: 'bar',
			            stack: '总量',
			            label: {
			                normal: {
			                    show: true,
			                    position: 'insideRight'
			                }
			            },
			            data: [150, 212, 201, 154, 190, 330, 410]
			        },
			        {
			            name: '搜索引擎',
			            type: 'bar',
			            stack: '总量',
			            label: {
			                normal: {
			                    show: true,
			                    position: 'insideRight'
			                }
			            },
			            data: [820, 832, 901, 934, 1290, 1330, 1320]
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
