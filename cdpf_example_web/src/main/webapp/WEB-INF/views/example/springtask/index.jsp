<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>定时任务</title>
    <critc-css>
        <link href="${staticServer}/assets/treetable/treeTable.min.css?version=${versionNo}" rel="stylesheet"
              type="text/css"/>
    </critc-css>
     <style type="text/css">
    	.portlet-body{
    		margin-left: 40px;
    	}
    </style>
</head>

<body>
<!-- BEGIN PAGE BAR -->
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li>
            <i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a>
        </li>
        <li>
            >代码示例
        </li>
        <li>
            >定时任务    
        </li>
    </ul>
</div>
<div class="row" style="position: relative; top:0px;"> 
	<div class="col-xs-12 col-xs-12">
		<div class="portlet-body">
				<div class="content">
					<h4><b>Spring-task内容概要：</b></h4>
					<p>本文介绍Spring3.0以后自主开发的定时任务工具，spring task，可以将它比作一个轻量级的Quartz，而且使用起来很简单，除spring相关的包外不需要额外的包。</p>
					<p>Spring-task定时任务，主要分为两种方式实现：</p>
					<p>1、通过注解方式实现定时任务。</p>
					<p>2、通过配置文件实现定时任务。</p>
					<p>本篇文章还将详细介绍Cron表达式的配置规则.</p>
				</div>
		</div>
		<div class="portlet light portlet-fit portlet-form bordered ">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-hand-o-right"></i><b>第一种：通过注解方式实现定时任务</b>
					</div>
					<div class="tools">
		            	<a href="javascript:;" class="collapse"> </a>
		        	</div>
				</div>
				<div class="portlet-body">
					<div class="content">
						<p>Spring在3.0版本后集成了Spring-task，可以简单实现定时任务。</p>
						<p>task的主要依赖在spring-context这个jar包中。</p>
						<h4>第一步 编写：SpringTaskByAnnotation.java</h4>
						<i>（代码路径：/example/src/test/java/com/critc/example/service/SpringTaskByAnnotation.java）</i>
						<pre>@Component
public class SpringTaskByAnnotation {
	/**
	 * 通过注解定时运行该方法
	 */
	@Scheduled(cron = "0/5 * * * * ?")//每5秒执行一次
	public void executeJobByAnnotation() {
		System.out.println("（注解定时器）spring-task正在执行："+new Date());
	}
}</pre>
						<h4>第二步 添加task相关配置：applicationContext-task-byAnnotation.xml</h4>
						<i>(代码路径/example/src/test/resources/spring/applicationContext-task-byAnnotation.xml)</i>
						<pre>&lt;?xml version="1.0" encoding="UTF-8"?>
&lt;beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:context="http://www.springframework.org/schema/context"
	xmlns:task="http://www.springframework.org/schema/task"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
	http://www.springframework.org/schema/beans/spring-beans.xsd
	http://www.springframework.org/schema/context
	http://www.springframework.org/schema/context/spring-context.xsd
	http://www.springframework.org/schema/task
	http://www.springframework.org/schema/task/spring-task.xsd">

	&lt;!-- 自动扫描的包名 resource-pattern包扫描需要具体到本级目录-->
	&lt;context:component-scan base-package="com.critc.example.service"
		resource-pattern="*Task*" />
	&lt;!-- 开启这个配置，spring才能识别 @Scheduled注解 -->
	&lt;task:annotation-driven />

&lt;/beans>
</pre>
						<h4>第三步 编写单元测试 TestSpringTaskByAnnotation.java</h4>
						<i>(代码路径：/example/src/test/java/com/critc/example/TestSpringTaskByAnnotation.java)</i>
						<pre>@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"/spring/applicationContext-task-byAnnotation.xml"})
public class TestSpringTaskByAnnotation {
	/**
	 * 测试 通过注解实现定时任务
	 * @throws InterruptedException
	 */
	@Test(timeout=20000)//控制运行总时间为20秒
	public void testExecuteJobByAnnotation() throws InterruptedException{
		while(true){
			Thread.sleep(1000);
		}
	}
}</pre>
					</div>
				</div>
		</div>
		<div class="portlet light portlet-fit portlet-form bordered ">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-hand-o-right"></i><b>第二种：通过配置文件实现定时任务</b>
					</div>
					<div class="tools">
		            	<a href="javascript:;" class="collapse"> </a>
		        	</div>
				</div>
				<div class="portlet-body">
					<h4>第一步编写：SpringTaskByConfiguration.java</h4>
					<i>(代码路径：/example/src/test/java/com/critc/example/service/SpringTaskByConfiguration.java)</i>
					<pre>public class SpringTaskByConfiguration {
	/**
	 * 通过配置文件时定时运行该方法
	 */
	public void executeJobByConfiguration() {
		System.out.printf("（配置文件定时器）Task: %s, Current time: %s\n", 1, LocalDateTime.now());
	}
}</pre>
    			<h4>第二步：添加task相关配置：applicationContext-task-byConfiguration.xml</h4>
    			<pre>&lt;?xml version="1.0" encoding="UTF-8"?>
&lt;beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:task="http://www.springframework.org/schema/task"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
	http://www.springframework.org/schema/beans/spring-beans.xsd
	http://www.springframework.org/schema/context
	http://www.springframework.org/schema/context/spring-context.xsd
	http://www.springframework.org/schema/task
	http://www.springframework.org/schema/task/spring-task.xsd"
       default-autowire="byName" default-lazy-init="true">

    &lt;!--定时任务  通过配置文件的方式-->
    &lt;bean id="springTaskByConfiguration" class="com.critc.example.model.SpringTaskByConfiguration"/>
	&lt;!--配置线程池数量  -->
    &lt;task:scheduler id="taskScheduler" pool-size="100" />

    &lt;task:scheduled-tasks scheduler="taskScheduler">
	    &lt;!-- 每2秒触发任务 -->
	    &lt;task:scheduled ref="springTaskByConfiguration" method="executeJobByConfiguration" cron="0/2 * * * * ?"/>
     &lt;/task:scheduled-tasks>
&lt;/beans>
    			</pre>
    			<div class="content">
					<p>说明：ref参数指定的即任务类，method指定的即需要运行的方法，cron及cronExpression表达式。</p>
				</div>
    			<h4>第三步：编写单元测试 TestSpringTaskByConfiguration.java</h4>
    			<i>(代码路径：/example/src/test/java/com/critc/example/TestSpringTaskByConfiguration.java)</i>
    			<pre>@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/applicationContext-task-byConfiguration.xml")
public class TestSpringTaskByConfiguration {
	/**
	 * 测试 通过配置文件实现定时任务
	 * @throws InterruptedException
	 */
	@Test(timeout=10000)//控制运行时间总长未10秒
	public void testExecuteJobByConfiguration() throws  InterruptedException {
		while(true){
			//停顿一秒，防止线程直接结束
			Thread.sleep(1000);
		}
    }
}</pre>
				</div>
				<div class="portlet-body">
				
		</div>
		</div>
		<div class="portlet light portlet-fit portlet-form bordered ">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-hand-o-right"></i><b>Cron表达式的配置规则</b>
					</div>
					<div class="tools">
		            	<a href="javascript:;" class="collapse"> </a>
		        	</div>
				</div>
				<div class="portlet-body">
					<pre>对于CornExpress讲解如下： 
字段   允许值   允许的特殊字符    
秒    0-59    , - * /    
分    0-59    , - * /    
小时    0-23    , - * /    
日期    1-31    , - * ? / L W C    
月份    1-12 或者 JAN-DEC    , - * /    
星期    1-7 或者 SUN-SAT    , - * ? / L C #    
年（可选）    留空, 1970-2099    , - * /    

表达式   意义    
"0 0 12 * * ?"    每天中午12点触发    
"0 15 10 ? * *"    每天上午10:15触发    
"0 15 10 * * ?"    每天上午10:15触发    
"0 15 10 * * ? *"    每天上午10:15触发    
"0 15 10 * * ? 2005"    2005年的每天上午10:15触发    
"0 * 14 * * ?"    在每天下午2点到下午2:59期间的每1分钟触发    
"0 0/5 14 * * ?"    在每天下午2点到下午2:55期间的每5分钟触发     
"0 0/5 14,18 * * ?"    在每天下午2点到2:55期间和下午6点到6:55期间的每5分钟触发     
"0 0-5 14 * * ?"    在每天下午2点到下午2:05期间的每1分钟触发    
"0 10,44 14 ? 3 WED"    每年三月的星期三的下午2:10和2:44触发    
"0 15 10 ? * MON-FRI"    周一至周五的上午10:15触发    
"0 15 10 15 * ?"    每月15日上午10:15触发    
"0 15 10 L * ?"    每月最后一日的上午10:15触发    
"0 15 10 ? * 6L"    每月的最后一个星期五上午10:15触发      
"0 15 10 ? * 6L 2002-2005"    2002年至2005年的每月的最后一个星期五上午10:15触发    
"0 15 10 ? * 6#3"    每月的第三个星期五上午10:15触发     

特殊字符   意义    
*    表示所有值；    
?    表示未说明的值，即不关心它为何值；    
-    表示一个指定的范围；    
,    表示附加一个可能值；    
/    符号前表示开始时间，符号后表示每次递增的值；    
L("last")   ("last") "L" 用在day-of-month字段意思是 "这个月最后一天"；用在 day-of-week字段, 它简单意思是 "7" or "SAT"。
	 如果在day-of-week字段里和数字联合使用，它的意思就是 "这个月的最后一个星期几" – 例如： "6L" means "这个月的最后一个星期五". 
 	当我们用“L”时，不指明一个列表值或者范围是很重要的，不然的话，我们会得到一些意想不到的结果。    
W("weekday") 只能用在day-of-month字段。用来描叙最接近指定天的工作日（周一到周五）。
 	例如：在day-of-month字段用“15W”指“最接近这个月第15天的工作日”，即如果这个月第15天是周六，那么触发器将会在这个月第14天即周五触发；
	如果这个月第15天是周日，那么触发器将会在这个月第16天即周一触发；如果这个月第15天是周二，那么就在触发器这天触发。注意一点：这个用法只会在当前月计算值，不会越过当前月。
	“W”字符仅能在day-of-month指明一天，不能是一个范围或列表。也可以用“LW”来指定这个月的最后一个工作日。     
#   只能用在day-of-week字段。用来指定这个月的第几个周几。例：在day-of-week字段用"6#3"指这个月第3个周五（6指周五，3指第3个）。如果指定的日期不存在，触发器就不会触发。     
C   指和calendar联系后计算过的值。例：在day-of-month 字段用“5C”指在这个月第5天或之后包括calendar的第一天；在day-of-week字段用“1C”指在这周日或之后包括calendar的第一天</pre>
				</div>
		</div>
		</div>
</div>
</body>
