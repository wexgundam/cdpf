<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp" %>
<head>
   <meta charset="utf-8" />
   <title>Echarts 雷达图示例</title>
   
  
</head>
<body >
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
                         <span class="caption-subject font-dark bold uppercase">基础雷达图</span>
                     </div>
                  </div>
             
	              <div class="portlet-body">
	                  <!--      一个用于绘图的 DOM 容器  -->
	                  <div id="radarChart" style="height:400px;"></div>
	              </div>
              </div>
         </div>
         
          <div class="col-md-6">
             <div class="portlet light bordered">
                 <div class="portlet-title">
                     <div class="caption">
                         <i class="icon-bar-chart font-dark hide"></i>
                         <span class="caption-subject font-dark bold uppercase">自定义雷达图</span>
                     </div>
                 </div>
             
              <div class="portlet-body">
                  <!--      一个用于绘图的 DOM 容器  -->
                  <div id="customRadar" style="height:400px;"></div>
              </div>
            </div>
	    </div>
        </div>
        
        <div>
            <p style="font-size: 18px;">
               <span> 完整代码详见：[ /web/src/main/webapp/WEB-INF/views/example/echarts/radar.jsp ]<br/></span>                                        
            </p>
            
            <button type="button" class="btn"  onclick="window.location='index.htm'">
                             <i class="ace-icon fa fa-undo bigger-110"></i>返回
            </button>
        </div> 
	</div>
	<script type="text/javascript" src="${staticServer}/assets/example/echarts/js/echarts.min.js"></script>
	<script>
	
		 var chartContainer = document.getElementById('radarChart');
		 
		 var resizeChartContainer = function (container,id) {
			 container.style.width = $("#"+id).parent().css("width");
			 container.style.height = $("#"+id).parent().css("hieght");
		 };
		 
		 resizeChartContainer(chartContainer,"radarChart"); 
	     var myChart = echarts.init(chartContainer);
	     var option = {
	    		tooltip: {},
	    	    legend: {
	    	        data: ['预算分配）', '实际开销']
	    	    },
	    	    radar: {
	    	        indicator: [
	    	           { name: '销售', max: 6500},
	    	           { name: '管理', max: 16000},
	    	           { name: '信息技术', max: 30000},
	    	           { name: '客服', max: 38000},
	    	           { name: '研发', max: 52000},
	    	           { name: '市场', max: 25000}
	    	        ]
	    	    },
	    	    series: [{
	    	        name: '预算 vs 开销（Budget vs spending）',
	    	        type: 'radar',
	    	        data : [
	    	            {
	    	                value : [4300, 10000, 28000, 35000, 50000, 19000],
	    	                name : '预算分配'
	    	            },
	    	             {
	    	                value : [5000, 14000, 28000, 31000, 42000, 21000],
	    	                name : '实际开销'
	    	            }
	    	        ]
	    	    }]
	    };
		// 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);  
        var chartContainer1 = document.getElementById('customRadar');
		resizeChartContainer(chartContainer,"customRadar"); 
	    var customRadar = echarts.init(chartContainer1);
		
        var option = {
       		legend: {
       	        data: ['图一'],
       	    },
       	    radar: {
       	        indicator: [
       	            { text: '指标一' },
       	            { text: '指标二' },
       	            { text: '指标三' },
       	            { text: '指标四' },
       	            { text: '指标五' }
       	        ],
       	        center: ['50%', '50%'],   //圆心的位置
       	        radius: '80%',
       	        startAngle: 90,
       	        splitNumber: 4,
       	        shape: 'circle',          //雷达图的形状，默认为polygon(多边形)
       	        name: {
       	            formatter:'【{value}】',
       	            textStyle: {
       	                color:'#72ACD1'
       	            }
       	        },
       	        splitArea: {             //分割区域
       	            areaStyle: {
       	                color: ['#B8D3E4', '#96C5E3', '#7DB5DA', '#72ACD1']
       	            }
       	        },
       	        axisTick: {              //坐标轴刻度设置
       	            show: true,
       	            lineStyle: {
       	                color: 'rgba(255, 255, 255, 0.8)'
       	            }
       	        },
       	        axisLabel: {             //坐标轴刻度标签的相关设置。
       	            show: true,
       	            textStyle: {
       	                color: 'white'
       	            }
       	        },
       	        axisLine: {
       	            lineStyle: {
       	                color: 'rgba(255, 255, 255, 0.4)'
       	            }
       	        },
       	        splitLine: {              //坐标轴在 grid 区域中的分隔线。
       	            lineStyle: {
       	                color: 'rgba(255, 255, 255, 0.4)'
       	            }
       	        }
       	    },
       	    series:{
 	              name: '雷达图',
 	              type: 'radar',
 	              data: [
 	                  {
 	                      value: [100, 8, 0.40, -80, 2000],
 	                      name: '图一',
 	                      symbol: 'rect',   //单个数据标记的图形。
 	                      symbolSize: 5,
 	                      lineStyle: {
 	                          normal: {
 	                              type: 'dashed'
 	                          }
 	                      }
 	                  },
 	              ]
 	          },
        };
        customRadar.setOption(option);
        
        window.onresize = function () {
		    //重置容器高宽
		    resizeChartContainer(chartContainer,"radarChart"); 
		    resizeChartContainer(chartContainer1,"customRadar"); 
		    myChart.resize();
		    customRadar.resize();
		}; 
	</script>
</body>
