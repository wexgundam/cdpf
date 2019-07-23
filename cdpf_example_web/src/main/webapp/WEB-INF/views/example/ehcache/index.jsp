<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>EhCache</title>
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
            >EhCache
        </li>
    </ul>
</div>
<div class="row" style="position: relative; top:0px;"> 
	<div class="col-xs-12 col-xs-12">
		<div class="portlet-body">
				<div class="content">
					<h4><b>EhCache内容概要：</b></h4>
					<p>EhCache 是一个纯Java的进程内缓存框架，具有快速、精干等特点。它是Hibernate中的默认缓存框架，和Spring也能很好的整合到一起。</p>
					<p>本篇分三部分来对EhCache进行讲解：</p>
					<p>第一部分：介绍EhCache的主要特性。</p>
					<p>第二部分：介绍EhCache的具体使用方式。</p>
					<p>第三部分：介绍EhCache的应用场景。</p>
				</div>
		</div>
		<div class="portlet light portlet-fit portlet-form bordered ">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-hand-o-right"></i><b>第一部分：EhCache的主要特性</b>
					</div>
					<div class="tools">
		            	<a href="javascript:;" class="collapse"> </a>
		        	</div>
				</div>
				<div class="portlet-body">
					<p>1、快速</p>
					<p>2、简单</p>
					<p>3、多种缓存策略</p>
					<p>4、缓存数据有两级：内存和磁盘，因此无需担心容量问题</p>
					<p>5、缓存数据会在虚拟机重启的过程中写入磁盘</p>
					<p>6、可以通过RMI、可插入API等方式进行分布式缓存</p>
					<p>7、具有缓存和缓存管理器的侦听接口</p>
					<p>8、支持多缓存管理器实例，以及一个实例的多个缓存区域</p>
					<p>9、提供Hibernate的缓存实现</p>
				</div>
			</div>
		<div class="portlet light portlet-fit portlet-form bordered ">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-hand-o-right"></i><b>第二部分：EhCache的具体使用方式</b>
					</div>
					<div class="tools">
		            	<a href="javascript:;" class="collapse"> </a>
		        	</div>
				</div>
				<div class="portlet-body">
					<div class="content">
						<h4>第一步：在pom.xml中添加ehcache相关依赖</h4>
						<pre>&lt;dependency>
     &lt;groupId>net.sf.ehcache&lt;/groupId>
     &lt;artifactId>ehcache&lt;/artifactId>
     &lt;version>2.10.2&lt;/version>
 &lt;/dependency></pre>
						<h4>第二步:添加EhCache相关配置：ehcache.xml配置文件</h4>
						<pre>&lt;?xml version="1.0" encoding="gbk"?>
&lt;ehcache xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="ehcache.xsd">
	&lt;!-- 指定一个文件目录，当EHCache把数据写到硬盘上时，将把数据写到这个文件目录下 -->
	&lt;diskStore path="java.io.tmpdir"/>
	&lt;!-- 设定缓存的默认数据过期策略 -->
	&lt;defaultCache maxElementsInMemory="10000" eternal="false" timeToIdleSeconds="30" timeToLiveSeconds="30" overflowToDisk="false"/>
	&lt;!-- 
		配置自定义缓存
		maxElementsInMemory：缓存中允许创建的最大对象数
		eternal：缓存中对象是否为永久的，如果是，超时设置将被忽略，对象从不过期。
		timeToIdleSeconds：缓存数据的钝化时间，也就是在一个元素消亡之前，
					两次访问时间的最大时间间隔值，这只能在元素不是永久驻留时有效，
					如果该值是 0 就意味着元素可以停顿无穷长的时间。
		timeToLiveSeconds：缓存数据的生存时间，也就是一个元素从构建到消亡的最大时间间隔值，
					这只能在元素不是永久驻留时有效，如果该值是0就意味着元素可以停顿无穷长的时间。
		overflowToDisk：内存不足时，是否启用磁盘缓存。
		memoryStoreEvictionPolicy：缓存满了之后的淘汰算法。可选策略有：LRU（最近最少使用，默认策略）、FIFO（先进先出）、LFU（最少访问次数）。
	-->
	&lt;cache name="sysCache" 
		maxElementsInMemory="10"
		eternal="false"
		overflowToDisk="false" 
		timeToIdleSeconds="900" 
		timeToLiveSeconds="1800"
		memoryStoreEvictionPolicy="LFU" />
 
&lt;/ehcache></pre>
						<h4>第三步：定义EhCacheUtil工具类<i> (代码路径：/core/src/main/java/com/critc/util/cache/EhCacheUtil.java)</i></h4>
						<p>1、利用单例模式初始化CacheManager</p>
						<pre>private static volatile EhCacheUtil ehCacheUtil;
private static volatile CacheManager cacheManager;
private static Logger log = LoggerFactory.getLogger(EhCacheUtil.class);
private static String confPath = "/ehcache.xml";//定义配置文件路径

public static EhCacheUtil getInstance() {
    if (null == ehCacheUtil) {
        synchronized (EhCacheUtil.class) {
            if (null == ehCacheUtil) {
                ehCacheUtil = new EhCacheUtil();
            }
        }
    }
    return ehCacheUtil;
}

static {
    try {
        URL url = EhCacheUtil.class.getResource(confPath);
        cacheManager = CacheManager.create(url);
        log.info("ehcache初始化");
    } catch (Exception e) {
        e.printStackTrace();
        log.info("ehcache初始化失败");
    }
}</pre>
    					<p>2、根据cache的区域获取对应的cache</p>
    					<pre>static Cache getOrAddCache(String cacheName) {
        Cache cache = cacheManager.getCache(cacheName);
        if (cache == null) {
            synchronized (cacheManager) {
                cache = cacheManager.getCache(cacheName);
                if (cache == null) {
                    log.warn("Could not find cache config [" + cacheName + "], using default.");
                    cacheManager.addCacheIfAbsent(cacheName);
                    cache = cacheManager.getCache(cacheName);
                    log.info("Cache [" + cacheName + "] started.");
                }
            }
        }
        return cache;
    }</pre>
    					<p>3、以下几个方法就是把对象放入缓存，根据key来获取缓存，按照区域清空缓存。</p>
    					<pre>public static void put(String cacheName, Object key, Object value) {
        getOrAddCache(cacheName).put(new Element(key, value));
    }

    @SuppressWarnings("unchecked")
    public static <T> T get(String cacheName, Object key) {
        Element element = getOrAddCache(cacheName).get(key);
        return element != null ? (T) element.getObjectValue() : null;
    }

    @SuppressWarnings("rawtypes")
    public static List getKeys(String cacheName) {
        return getOrAddCache(cacheName).getKeys();
    }

    public static void remove(String cacheName, Object key) {
        getOrAddCache(cacheName).remove(key);
    }

    public static void removeAll(String cacheName) {
        getOrAddCache(cacheName).removeAll();
    }	</pre>
    					<p>4、EhCache的使用(初始化一个sysCache的区域，key是cache，value是Hello EhCache)</p>
    					<pre> public static void main(String[] args) {
        EhCacheUtil.put("sysCache", "cache", "Hello EhCache");
        String value = EhCacheUtil.get("sysCache", "cache");
        System.out.println(value);
    }</pre>
					</div>
				</div>
		</div>
		<div class="portlet light portlet-fit portlet-form bordered ">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-hand-o-right"></i><b>第三部分：EhCache的应用场景</b>
					</div>
					<div class="tools">
		            	<a href="javascript:;" class="collapse"> </a>
		        	</div>
				</div>
				<div class="portlet-body">
					<p><b>1、首先最主要就是页面缓存。</b></p>
					<p>网站页面的数据来源非常广泛的，大多数来自不同的对象，而且有可能来自不同的db，所以给页面做缓存是一个不错的主意。</p>
					<p><b>2、常用数据的缓存</b></p>
					<p>一些配置信息，如后台的某些不经常改变的设置都可以缓存起来。</p>
					<p><b>3、比较少的更新数据表的情况</b></p>
					<p><b>4、对并发要求不是很严格的情况</b></p>
					<p>多台应用服务器中的缓存是不能进行实时同步的。</p>
					<p><b>5、对一致性要求不高的情况下</b></p>
					<p>因为Ehcache本地缓存的特性，目前无法很好的解决不同服务器间缓存同步的问题，所以我们在一致性要求非常高的场合下，尽量使用Redis、Memcached等集中式缓存。</p>
				</div>
			</div>
		</div>
</div>
</body>
