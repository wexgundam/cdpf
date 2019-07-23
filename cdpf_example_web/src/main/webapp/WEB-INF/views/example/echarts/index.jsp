<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp" %>
<head>
   <meta charset="utf-8" />
   <title>Echarts 代码示例</title>
   <script type="text/javascript">
   
   </script>
   <!-- 
         1、入门示例
         2、正常加载数据
         3、ajax异步加载数据
         4、柱状图
         5、累积柱状图
         6、饼图
         7、折线图
         8、折现柱状组合图
         9、仪表盘
         10、雷达图
    -->
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
		<h1 class="page-title">
			Echarts 图标组件的使用示例
		</h1>
		<div class="row"> 
			<div class="col-md-3">
				<div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
						   <div class="mt-title">
                                 <i class="icon-directions font-green hide"></i> 
							  <span class="caption-subject font-dark uppercase">快速入门</span>
                              </div>
						</div>
					</div>
					<div class="portlet-body">
					    <div class="mt-avatar">
                                <img style="height: 175px; display: inline;" src="${staticServer}/assets/example/echarts/image/simple-start.png"/>
                           </div>
                           <br/>
					    <div class="mt-content border-grey-steel">
                               <a href="toSimpleStart.htm" class="btn default">查看详情</a>
                           </div>
					</div>
					
				</div>
			</div>
			<div class="col-md-3">
				<div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
						   <div class="mt-title">
                                 <i class="icon-directions font-green hide"></i> 
							  <span class="caption-subject font-dark uppercase">ajax异步加载数据</span>
                              </div>
						</div>
					</div>
					<div class="portlet-body">
					    <div class="mt-avatar">
					        <!--  <a class="preview" href="toAsyncData.htm"> -->
                                <img style="height: 175px; display: inline;" src="${staticServer}/assets/example/echarts/image/asyncData.png"/>
                           </div>
                            <br/>
					    <div class="mt-content border-grey-steel">
                               <a href="toAsyncData.htm" class="btn default">查看详情</a>
                           </div>
					</div>
					
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
						   <div class="mt-title">
                                 <i class="icon-directions font-green hide"></i> 
							  <span class="caption-subject font-dark uppercase">柱状图</span>
                              </div>
						</div>
					</div>
					<div class="portlet-body">
					    <div class="mt-avatar">
                                <img style="height: 175px; display: inline;" src="${staticServer}/assets/example/echarts/image/bar.png"/>
                           </div>
                            <br/>
					    <div class="mt-content border-grey-steel">
                               <a href="toBarChart.htm" class="btn default">查看详情</a>
                           </div>
					</div>
					
				</div>
			</div>
			<div class="col-md-3">
				<div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
						   <div class="mt-title">
                                 <i class="icon-directions font-green hide"></i> 
							  <span class="caption-subject font-dark uppercase">饼图</span>
                              </div>
						</div>
					</div>
					<div class="portlet-body">
					    <div class="mt-avatar">
					         <%-- <a class="preview" href="${staticServer}/assets/example/echarts/image/pie.png""> --%>
                                <img style="height: 175px; display: inline;" src="${staticServer}/assets/example/echarts/image/pie.png"/>
                           </div>
                            <br/>
					    <div class="mt-content border-grey-steel">
                               <a href="toPieChart.htm" class="btn default">查看详情</a>
                           </div>
					</div>
					
				</div>
			</div>
		</div>
		
		
		<div class="row"> 
			<div class="col-md-3">
				<div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
						   <div class="mt-title">
                                 <i class="icon-directions font-green hide"></i> 
							  <span class="caption-subject font-dark uppercase">折线图</span>
                              </div>
						</div>
					</div>
					<div class="portlet-body">
					    <div class="mt-avatar">
					         <%-- <a class="preview" href="${staticServer}/assets/example/echarts/image/line.png""> --%>
                                <img style="height: 175px; display: inline;" src="${staticServer}/assets/example/echarts/image/line.png"/>
                           </div>
                            <br/>
					    <div class="mt-content border-grey-steel">
                               <a href="toLineChart.htm" class="btn default">查看详情</a>
                           </div>
					</div>
					
				</div>
			</div>
			<div class="col-md-3">
				<div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
						   <div class="mt-title">
                                 <i class="icon-directions font-green hide"></i> 
							  <span class="caption-subject font-dark uppercase">仪表盘</span>
                              </div>
						</div>
					</div>
					<div class="portlet-body">
					    <div class="mt-avatar">
					        <%--  <a class="preview" href="${staticServer}/assets/example/echarts/image/gauge.png""> --%>
                                <img style="height: 175px; display: inline;" src="${staticServer}/assets/example/echarts/image/gauge.png"/>
                           </div>
                            <br/>
					    <div class="mt-content border-grey-steel">
                               <a href="toGauge.htm" class="btn default">查看详情</a>
                           </div>
					</div>
					
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
						   <div class="mt-title">
                                 <i class="icon-directions font-green hide"></i> 
							  <span class="caption-subject font-dark uppercase">雷达图</span>
                              </div>
						</div>
					</div>
					<div class="portlet-body">
					    <div class="mt-avatar">
                                <img style="height: 175px; display: inline;" src="${staticServer}/assets/example/echarts/image/radar.png"/>
                           </div>
                            <br/>
					    <div class="mt-content border-grey-steel">
                               <a href="toRadar.htm" class="btn default">查看详情</a>
                        </div>
					</div>
					
				</div>
			</div>
			<div class="col-md-3">
				<div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
						   <div class="mt-title">
                                 <i class="icon-directions font-green hide"></i> 
							  <span class="caption-subject font-dark uppercase">自定义</span>
                              </div>
						</div>
					</div>
					<div class="portlet-body">
					    <div class="mt-avatar">
                                <img style="height: 175px; display: inline;" src="${staticServer}/assets/example/echarts/image/custom.png"/>
                           </div>
                            <br/>
					    <div class="mt-content border-grey-steel">
                               <a href="toCustom.htm" class="btn default">查看详情</a>
                        </div>
					</div>
					
				</div>
			</div>
		</div>
		
	</div>
</body>
