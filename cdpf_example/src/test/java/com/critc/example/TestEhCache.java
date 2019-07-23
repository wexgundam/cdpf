package com.critc.example;

import java.util.List;

import org.junit.Test;

import com.critc.util.cache.EhCacheUtil;

/**
 * what:    EhCache的Demo
 * when:    常用于 角色缓存，用户权限
 * 
 * @author 刘艳超 created on 2017年10月23日
 */
public class TestEhCache {
	/**
	 * what:   向EhCache缓存中存放数据
	 * when:   向testCache中存放key为cacheKey，value为Hello EhCache对象
	 * 
	 * @author 刘艳超 created on 2017年10月23日
	 */
	@Test
	public void put(){
		EhCacheUtil.put("testCache", "cacheKey", "Hello EhCache");
	}
	
	/**
	 * what:    从缓存中获取数据
	 * when:    从testCache中取出key=cacheKey的value
	 *
	 * @author 刘艳超 created on 2017年10月23日
	 */
	@Test
	public void get(){
		EhCacheUtil.put("testCache", "cacheKey", "Hello EhCache");
        String value = EhCacheUtil.get("testCache", "cacheKey");
        System.out.println(value);
        value = EhCacheUtil.get("testCache", "cacheKey2");
        if (value==null) {
			System.out.println("该缓存为空");
			EhCacheUtil.put("testCache", "cacheKey2", "Hello EhCache2");
			value = EhCacheUtil.get("testCache", "cacheKey2");
		}
        System.out.println(value);
	}
	/**
	 * what:    根据缓存名称取出所有的key值
	 * how:      取出testCache中的所有key值
	 *
	 * @author 刘艳超 created on 2017年10月23日
	 */
	@Test
	public void getKeys(){
		EhCacheUtil.put("testCache", "cacheKey1", "Hello EhCache");
		EhCacheUtil.put("testCache", "cacheKey2", "Hello EhCache");
		EhCacheUtil.put("testCache", "cacheKey3", "Hello EhCache");
		List list = EhCacheUtil.getKeys("testCache");
		for (Object key : list) {
			System.out.println((String)key);
		}
		EhCacheUtil.get("testCache", "cacheKey2");
		System.out.println("超出缓存个数后：-------");
		EhCacheUtil.put("testCache", "cacheKey4", "Hello EhCache");
		list = EhCacheUtil.getKeys("testCache");
		for (Object key : list) {
			System.out.println((String)key);
		}
	}
	/**
	 * what:    根据key值删除缓存
	 *
	 * @author 刘艳超 created on 2017年10月23日
	 */
	@Test
	public void remove(){
		EhCacheUtil.put("testCache", "cacheKey1", "Hello EhCache");
		EhCacheUtil.put("testCache", "cacheKey2", "Hello EhCache");
		EhCacheUtil.put("testCache", "cacheKey3", "Hello EhCache");
		List list = EhCacheUtil.getKeys("testCache");
		for (Object key : list) {
			System.out.println((String)key);
		}
		EhCacheUtil.remove("testCache", "cacheKey1");
		System.out.println("删除后------");
		list = EhCacheUtil.getKeys("testCache");
		for (Object key : list) {
			System.out.println((String)key);
		}
	}
	/**
	 * what:    根据cache名称批量删除对象
	 * 
	 * @author 刘艳超 created on 2017年10月23日
	 */
	@Test
	public void removeAll(){
		EhCacheUtil.put("testCache", "cacheKey1", "Hello EhCache");
		EhCacheUtil.put("testCache", "cacheKey2", "Hello EhCache");
		EhCacheUtil.put("testCache", "cacheKey3", "Hello EhCache");
		List list = EhCacheUtil.getKeys("testCache");
		System.out.println("testCache个数:"+list.size());
		for (Object key : list) {
			System.out.println((String)key);
		}
		EhCacheUtil.removeAll("testCache");
		System.out.println("删除后------");
		list = EhCacheUtil.getKeys("testCache");
		System.out.println("testCache个数:"+list.size());
	}
	/**
	 * 
	 * what:    测试超时
	 * 
	 * @throws InterruptedException
	 *
	 * @author 刘艳超 created on 2017年10月25日
	 */
	@Test
	public void testGet() throws InterruptedException{
		EhCacheUtil.put("testCache", "key1", "value1");
		System.out.println("放入");
		String	v = EhCacheUtil.get("testCache", "key1");
		System.out.println(v);
		Thread.sleep(3000);
		System.out.println("--------");
		v = EhCacheUtil.get("testCache", "key1");
		if (v==null) {
			System.out.println("缓存为空！");
		}else{
			System.out.println("缓存有值：v="+v);
		}
	}
	
	/**
	 * what:     测试 开启磁盘 在testCache中存储超过最大内存个数
	 * when:	  当overflowToDisk="true" 时使用
	 * how:	   	   在testCache缓存中存储key和value
	 *
	 * @author 刘艳超 created on 2017年10月25日
	 */
	@Test
	public void puts(){
		for(int i=0;i<5;i++){
			EhCacheUtil.put("testCache", "key"+i, "value"+i);
		}
		List keys = EhCacheUtil.getKeys("testCache");
		for (Object key : keys) {
			System.out.println((String)key);
		}
	}
	
	
	

}
