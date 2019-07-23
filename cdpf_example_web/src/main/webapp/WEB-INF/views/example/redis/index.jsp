<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp"%>
<head>
<title>Redis</title>
<critc-css>
<style type="text/css">
.portlet-body {
	margin-left: 40px;
}
</style>
</critc-css>
</head>

<body>
	<!-- BEGIN PAGE BAR -->
	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a></li>
			<li>>代码示例</li>
			<li>>Redis</li>
		</ul>
	</div>
	<h1 class="page-title">Redis介绍：</h1>
	<h5>Redis是一个开源（BSD许可），内存存储的数据结构服务器，可用作数据库，高速缓存和消息队列代理。</h5>
	<h5>它支持字符串、哈希表、列表、集合、有序集合，位图，hyperloglogs等数据类型。</h5>
	<h5>内置复制、Lua脚本、LRU收回、事务以及不同级别磁盘持久化功能，同时通过Redis Sentinel提供高可用，通过Redis Cluster提供自动分区。</h5>
	<div class="row">
		<div class="col-md-12">
			<div class="portlet light portlet-fit portlet-form bordered">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-hand-o-right"></i><b>第一部分：Redis服务器端安装及配置</b>
					</div>
					<div class="tools">
						<a href="javascript:;" class="collapse"> </a>
					</div>
				</div>
				<div class="portlet-body">
					<p>1.Redis官网：https://redis.io/</p>
					<p>2.Redis中文网站： http://www.redis.net.cn/</p>
					<p>3.Redis下载：http://www.redis.net.cn/download/</p>
					<p>4.Redis安装方式(Windows下)：解压到制定目录</p>
					<p>5.将Redis配置成Windows服务：</p>
					<pre>1,下载redis并解压到一个目录下，然后切换到该目录下，也就是redis-server.exe文件所在的目录
				
2,在cmd下执行 redis-server --service-install redis-windows-conf

3,服务安装成功后启动服务 redis-server --service-start</pre>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="portlet light portlet-fit portlet-form bordered">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-hand-o-right"></i><b>第二部分：Redis的客户端环境配置(基于Spring)</b>
					</div>
					<div class="tools">
						<a href="javascript:;" class="collapse"> </a>
					</div>
				</div>
				<div class="portlet-body">
					<h4>第一步：在pom.xml中添加Redis相关依赖</h4>
					<pre>&lt;!-- Redis的java版本的客户端实现 -->
&lt;dependency>
       &lt;groupId>redis.clients&lt;/groupId>
       	&lt;artifactId>jedis&lt;/artifactId>
&lt;/dependency>
&lt;!-- Redis与Spring整合需要的包 -->
&lt;dependency>
    &lt;groupId>org.springframework.data&lt;/groupId>
    &lt;artifactId>spring-data-redis&lt;/artifactId>
&lt;/dependency></pre>
					<h4>第二步：添加redis参数配置文件</h4>
					<pre>redis.host=127.0.0.1#redis主机地址
redis.port=6379#redis主机端口号
redis.pass=#授权密码
redis.maxIdle=300#最大空闲数：空闲链接数大于maxIdle时，将进行回收
redis.maxActive=600#最大连接数：能够同时建立的“最大链接个数”  
redis.maxWait=1000#最大等待时间：单位ms
redis.testOnBorrow=true#使用连接时，检测连接是否成功 </pre>
					<h4>第三步：在applicationContext.xml文件中配置redis并创建redis操作对象</h4>
					<pre>&lt;!-- 配置Redis连接池参数 -->
&lt;bean id="redisPoolConfig" class="redis.clients.jedis.JedisPoolConfig">
    &lt;property name="maxIdle" value="\${redis.maxIdle}"/>
    &lt;property name="maxWaitMillis" value="\${redis.maxWait}"/>
    &lt;property name="testOnBorrow" value="\${redis.testOnBorrow}"/>
&lt;/bean>
&lt;!-- Redis连接工厂 -->
&lt;bean id="redisConnectionFactory" class="org.springframework.data.redis.connection.jedis.JedisConnectionFactory" destroy-method="destroy">
    &lt;property name="usePool" value="true"/>
    &lt;!-- 连接池配置 -->
    &lt;property name="poolConfig" ref="redisPoolConfig"/>
    &lt;property name="port" value="\${redis.port}"/>
    &lt;property name="hostName" value="\${redis.host}"/>
    &lt;property name="password" value="\${redis.pass}"/>
&lt;/bean>
&lt;!-- 操作Redis的模板类 -->
&lt;bean id="redisTemplate" class="org.springframework.data.redis.core.StringRedisTemplate">
    &lt;property name="connectionFactory" ref="redisConnectionFactory"/>
    &lt;property name="hashValueSerializer">
        &lt;bean class="org.springframework.data.redis.serializer.JdkSerializationRedisSerializer"/>
    &lt;/property>
&lt;/bean></pre>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="portlet light portlet-fit portlet-form bordered">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-hand-o-right"></i><b>第三部分：Redis支持的数据类型及使用方法</b>
					</div>
					<div class="tools">
						<a href="javascript:;" class="collapse"> </a>
					</div>
				</div>
				<div class="portlet-body">
					<p>1.字符串类型</p>
					<pre>字符串是Redis中最基本的数据类型，它能够存储任何类型的字符串，包含二进制数据。
具体使用代码参见：example/src/test/java/com/critc/example/TestRedis.java</pre>
					<p>2.Hash散列类型</p>
					<pre>散列类型相当于Java中的HashMap，他的值是一个字典，保存很多key，value对，每对key，value的值个键都是字符串类型，换句话说，散列类型不能嵌套其他数据类型。
具体使用代码参见：example/src/test/java/com/critc/example/TestRedis.java</pre>
					<p>3.List列表类型</p>
					<pre>列表类型(list)用于存储一个有序的字符串列表，常用的操作是向队列两端添加元素或者获得列表的某一片段。
列表内部使用的是双向链表（double linked list）实现的，所以向列表两端添加元素的时间复杂度是O(1),获取越接近列表两端的元素的速度越快。
但是缺点是使用列表通过索引访问元素的效率太低（需要从端点开始遍历元素）。
具体使用代码参见：example/src/test/java/com/critc/example/TestRedis.java</pre>
					<p>4.Set集合类型</p>
					<pre>集合中每个元素都是不同的，集合中的元素个数最多为2的32次方-1个，集合中的元素师没有顺序的。
具体使用代码参见：example/src/test/java/com/critc/example/TestRedis.java</pre>
					<p>5.ZSet有序集合类型</p>
					<pre>有序集合类型与集合类型的区别就是他是有序的。
有序集合是在集合的基础上为每一个元素关联一个分数，这就让有序集合不仅支持插入，删除，判断元素是否存在等操作外，还支持获取分数最高/最低的前N个元素。
有序集合中的每个元素是不同的，但是分数却可以相同。
具体使用代码参见：example/src/test/java/com/critc/example/TestRedis.java</pre>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
