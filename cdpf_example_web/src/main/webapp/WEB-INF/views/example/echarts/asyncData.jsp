<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp" %>
<head>
   <meta charset="utf-8" />
   <title>Echarts 异步加载数据示例</title>
   
  
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
         <div class="col-md-12">
             <div class="portlet light bordered">
                 <div class="portlet-title">
                     <div class="caption">
                         <i class="icon-bar-chart font-dark hide"></i>
                         <span class="caption-subject font-dark bold uppercase">Echarts 异步加载示例</span>
                     </div>
                 </div>
                
                <div class="portlet-body">
                    <!--      一个用于绘图的 DOM 容器  -->
                    <div id="asyncData" style="height:400px;"></div>
                    <div>
                        <br/>
                        <br/>
                        <p style="font-size: 18px;">
                           <span> 完整代码详见：[ /web/src/main/webapp/WEB-INF/views/example/echarts/asyncData.jsp ]<br/></span>                                        
                        </p>
                    </div> 
                </div>
                </div>
            
         </div>
         <button type="button" class="btn" style="position: relative; left:12px;" onclick="window.location='index.htm'">
                            <i class="ace-icon fa fa-undo bigger-110"></i>返回
        </button>
	</div>
	<script type="text/javascript" src="${staticServer}/assets/example/echarts/js/echarts.min.js"></script>
	<script>
	    var chartContainer = document.getElementById('asyncData');
		
		var resizeChartContainer = function () {
			chartContainer.style.width = $("#asyncData").parent().css("width");
			chartContainer.style.height = $("#asyncData").parent().css("hieght");
		};
		
		resizeChartContainer(); 
		var myChart = echarts.init(chartContainer);
		// 指定图表的配置项和数据
        var option = {
    		    title: {
    		        text: '异步加载数据',
    		    },
    		    tooltip:{
    		    	trigger : 'axis',
    		    },
    		    toolbox: {
    		        feature: {
    		            dataView:{
    		            	show:true
    		            },
    		            restore: {},
    		            saveAsImage: {}
    		        }
    		    }, 
    		    xAxis: {
    		        type: 'category',   
    		        data: []
    		    },
    		    yAxis: {
    		        type: 'value',    //type类型有：value(适用于连续数据), time(适用于连续的时序数据),category(适用于离散数据) 
    		    },
    		   
    		    series: [
    		        {
    		            name:'模拟数据',
    		            type:'line',
    		            smooth:true,           //是否平滑
    		            itemStyle: {
    		                normal: {
    		                    color: 'rgb(255, 70, 131)'
    		                }
    		            },
    		            areaStyle: {         //区域填充样式。
    		                normal: {
    		                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
    		                        offset: 0,
    		                        color: 'rgb(255, 158, 68)'
    		                    }, {
    		                        offset: 1,
    		                        color: 'rgb(255, 70, 131)'
    		                    }])
    		                }
    		            }, 
    		            data: []
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
        
        $.get('getAsyncData.htm').done(function (json) {

            var data = JSON.parse(json);    //将后台的数据转为json

  	        // 填入数据
  	        myChart.setOption({
 	           xAxis: {
 	              data: data.category
 	           },
 	           series: data.lineData
  	      });

        });
	</script>
</body>
