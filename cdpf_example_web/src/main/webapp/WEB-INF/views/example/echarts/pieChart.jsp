<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp" %>
<head>
   <meta charset="utf-8" />
   <title>Echarts 饼图示例</title>
   
  
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
                         <span class="caption-subject font-dark bold uppercase">某站点用户访问来源</span>
                     </div>
                 </div>
               
               <div class="portlet-body">
                   <!--      一个用于绘图的 DOM 容器  -->
                   <div id="pieChart" style="height:400px;"></div>
                   <div>
                       <br/>
                       <br/>
                       <p style="font-size: 18px;">
                          <span> 完整代码详见：[ /web/src/main/webapp/WEB-INF/views/example/echarts/pieChart.jsp ]<br/></span>                                        
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
	
		var chartContainer = document.getElementById('pieChart');
		
		var resizeChartContainer = function () {
			chartContainer.style.width = $("#pieChart").parent().css("width");
			chartContainer.style.height = $("#pieChart").parent().css("hieght");
		};
		
		resizeChartContainer(); 
		var myChart = echarts.init(chartContainer);
		var option = {
			    title : {
			        text: '某站点用户访问来源',
			        x:'center'
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
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        left: 'left',
			        data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
			    },
			    series : [
			        {
			            name: '访问来源',
			            type: 'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:[
			                {value:335, name:'直接访问'},
			                {value:310, name:'邮件营销'},
			                {value:234, name:'联盟广告'},
			                {value:135, name:'视频广告'},
			                {value:1548, name:'搜索引擎'}
			            ],
			            itemStyle: {
			                emphasis: {
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
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
