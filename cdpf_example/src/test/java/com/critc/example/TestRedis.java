package com.critc.example;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.TimeUnit;
import java.util.Set;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.Cursor;
import org.springframework.data.redis.core.DefaultTypedTuple;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ScanOptions;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.data.redis.core.ZSetOperations.TypedTuple;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 
 * what: Redis的测试类，进行CRUD操作
 * 
 * @author 孙超 created on 2017年10月30日
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/applicationContext-redis.xml")
public class TestRedis {
	@Autowired
	private RedisTemplate<Object, Object> redisTemplate;

	private ValueOperations<Object, Object> stringOps;
	private ListOperations<Object, Object> listOps;
	private SetOperations<Object, Object> setOps;
	private HashOperations<Object, Object, Object> hashOps;
	private ZSetOperations<Object, Object> zsetOps;

	@Before
	public void setOps() {
		stringOps = redisTemplate.opsForValue();
		listOps = redisTemplate.opsForList();
		setOps = redisTemplate.opsForSet();
		hashOps = redisTemplate.opsForHash();
		zsetOps = redisTemplate.opsForZSet();
	}

	/**
	 * 
	 * what: 添加String数据
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void addString() {
		String key = "StringKey";
		String value = "StringValue";
		stringOps.set(key, value);
		String getValue = (String) stringOps.get(key);// 取出String数据
		Assert.assertEquals(getValue, value);
		System.out.println("StringValue已存入Redis");
	}

	/**
	 * 
	 * what: 删除String数据
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void delString() {
		String key = "StringKey";
		redisTemplate.delete(key);
		String getValue = (String) stringOps.get(key);// 取出String数据
		Assert.assertNull(getValue);
		System.out.println("StringKey的值已从Redis删除");
	}

	/**
	 * 
	 * what: 存入List数据
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void setList() {
		String key = "ListKey";
		redisTemplate.delete(key);
		// 单个存入
		int listValue1 = 1;
		String listValue2 = "2";
		Integer listValue3 = 3;
		listOps.leftPush(key, listValue1);
		listOps.leftPush(key, listValue2);
		listOps.leftPush(key, listValue3);
		long size = listOps.size(key);
		Assert.assertEquals(3, size);
		System.out.println("ListKey存有" + size + "个");
		for (int i = 0; i < size; i++) {
			System.out.println(listOps.index(key, i));
		}
		// 存入集合(集合作为一个整体存入)
		List<String> list = new ArrayList<>();
		list.add("4");
		list.add("5");
		list.add("6");
		listOps.leftPushAll(key, list);
		size = listOps.size(key);
		Assert.assertEquals(4, size);
		System.out.println("ListKey存有" + size + "个");
		for (int i = 0; i < size; i++) {
			System.out.println(listOps.index(key, i));
		}
		// 存入数组(相当于单个存入)
		listOps.leftPushAll(key, "7", 8, 9);
		size = listOps.size(key);
		Assert.assertEquals(7, size);
		System.out.println("ListKey存有" + size + "个");
		for (int i = 0; i < size; i++) {
			System.out.println(listOps.index(key, i));
		}
		System.out.println("ListKey的值已存入Redis");
	}

	/**
	 * 
	 * what: 修改List数据
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void updateList() {
		String key = "ListKey";
		System.out.println("---------------修改之前的数据----------------------");
		long size = listOps.size(key);
		Assert.assertEquals(7, size);
		System.out.println("ListKey存有" + size + "个");
		for (int i = 0; i < size; i++) {
			System.out.println(listOps.index(key, i));
		}
		listOps.set(key, 0, "s");
		listOps.set(key, 1, 7);
		listOps.set(key, 2, 5);
		System.out.println("---------------修改之后的数据----------------------");
		size = listOps.size(key);
		Assert.assertEquals(7, size);
		System.out.println("ListKey存有" + size + "个");
		for (int i = 0; i < size; i++) {
			System.out.println(listOps.index(key, i));
		}
	}

	/**
	 * 
	 * what: 删除List数据
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void delList() {
		String key = "ListKey";
		redisTemplate.delete(key);
		Object value = listOps.index(key, 0);
		Assert.assertNull(value);
		System.out.println("删除成功");
	}

	/**
	 * 
	 * what: 移除List数据
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void removeList() {
		String key = "ListKey";
		System.out.println("---------------移除之前-------------------");
		long size = listOps.size(key);
		Assert.assertEquals(7, size);
		System.out.println("ListKey存有" + size + "个");
		for (int i = 0; i < size; i++) {
			System.out.println(listOps.index(key, i));
		}
		/**
		 * remove(key, count, value)
		 * Redis Lrem 根据参数 COUNT 的值，移除列表中与参数 VALUE 相等的元素。
		 * 
		 * 	COUNT 的值可以是以下几种：
		 * 	
		 * 	count > 0 : 从表头开始向表尾搜索，移除与 VALUE 相等的元素，数量为 COUNT 。
		 * 	count < 0 : 从表尾开始向表头搜索，移除与 VALUE 相等的元素，数量为 COUNT 的绝对值。
		 * 	count = 0 : 移除表中所有与 VALUE 相等的值。
		 */

		listOps.remove(key, 1, 1);
		System.out.println("---------------移除之后---------------：");
		size = listOps.size(key);
		Assert.assertEquals(6, size);
		System.out.println("ListKey存有" + size + "个");
		for (int i = 0; i < size; i++) {
			System.out.println(listOps.index(key, i));
		}
	}

	/**
	 * 
	 * what: 新增Set数据
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void setSet() {
		String key = "SetKey";
		redisTemplate.delete(key);
		setOps.add(key, 1);
		setOps.add(key, "2");
		setOps.add(key, 1);// 重复数据自动过滤掉，不在存储
		long size = setOps.size(key);
		Assert.assertEquals(2, size);
		System.out.println("SetKey对应的数据存入Redis");
	}

	/**
	 * 
	 * what: 获取Set数据
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	/*
	 * @Test public void getSet() { String key = "SetKey"; System.out.println("SetKey对应的数据"); System.out.println(setOps.members(key));// 获取所有的key值里面对应的数据 }
	 */

	/**
	 * 
	 * what: 判断数据时否在Set中
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void isMemberSet() {
		String key = "SetKey";
		int value = 1;
		boolean is = setOps.isMember(key, value);
		Assert.assertEquals(true, is);
		System.out.println("(int)1是否在SetKey中：" + is);
	}

	/**
	 * 
	 * what: 删除Set数据
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void delSet() {
		String key = "SetKey";
		redisTemplate.delete(key);
		Set<Object> setObj = setOps.members(key);
		Assert.assertEquals(0, setObj.size());
		System.out.println("删除成功");
	}

	/**
	 * 
	 * what: 移除Set数据
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void popSet() {
		String key = "SetKey";
		long removeSize = setOps.remove(key, 1, "2");
		Assert.assertEquals(2, removeSize);
		System.out.println("移除的数据个数：" + removeSize);
	}

	/**
	 * 
	 * what: 移动Set数据
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void moveSet() {
		String key = "SetKey";
		String desKey = "desKey";
		setOps.move(key, "2", desKey);// 将数据从set集合中移动到key值为desKey的set集合中
		long desSize = setOps.members(desKey).size();
		Assert.assertEquals(1, desSize);
		System.out.println("移动的数据：" + setOps.members(desKey));
	}

	/**
	 * 
	 * what: 迭代Set数据
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void scanSet() {
		String key = "SetKey";
		Cursor<Object> cursor = setOps.scan(key, ScanOptions.scanOptions().build());// 获取制定key的set数据游标，游标起始位置从0开始
		Assert.assertNotNull(cursor.hasNext());
		while (cursor.hasNext()) {
			System.out.println(cursor.next());
		}
	}

	/**
	 * 
	 * what: 求两个Set集合的差集（不保存到redis中）
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void diffSet() {
		String key1 = "SetKey1";
		String key2 = "SetKey2";
		redisTemplate.delete(key1);
		redisTemplate.delete(key2);
		setOps.add(key1, "1");
		setOps.add(key1, "2");
		setOps.add(key1, "3");
		setOps.add(key2, "4");
		setOps.add(key2, "3");
		setOps.add(key2, "5");
		Set<Object> assertSet = new HashSet<>();
		assertSet.add("1");
		assertSet.add("2");
		Assert.assertEquals(assertSet, setOps.difference(key1, key2));
		System.out.println("key1与key2的差集：");
		System.out.println(setOps.difference(key1, key2));// key1-(key2中存在的数据)
	}

	/**
	 * 
	 * what: 求两个Set集合的差集（保存到redis中）
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void diffAndStoreSet() {
		String setKey1 = "SetKey1";
		String setKey2 = "SetKey2";
		String setKeyTemp = "SetTemp";
		redisTemplate.delete(setKey1);
		redisTemplate.delete(setKey2);
		redisTemplate.delete(setKeyTemp);
		setOps.add(setKey1, "1");
		setOps.add(setKey1, "2");
		setOps.add(setKey1, "3");
		setOps.add(setKey2, "4");
		setOps.add(setKey2, "3");
		setOps.add(setKey2, "5");
		setOps.differenceAndStore(setKey1, setKey2, setKeyTemp);// key1-(key2中存在的数据)的数量
		Set<Object> assertSet = new HashSet<>();
		assertSet.add("1");
		assertSet.add("2");
		Assert.assertEquals(assertSet, setOps.members(setKeyTemp));
		System.out.println("key1与key2的差集,keyTemp中的数据：" + setOps.members(setKeyTemp));
	}

	/**
	 * 
	 * what: 求两个Set集合的交集（不保存到redis中）
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void interSet() {
		String setKey1 = "SetKey1";
		String setKey2 = "SetKey2";
		redisTemplate.delete(setKey1);
		redisTemplate.delete(setKey2);
		setOps.add(setKey1, "1");
		setOps.add(setKey1, "2");
		setOps.add(setKey1, "3");
		setOps.add(setKey2, "4");
		setOps.add(setKey2, "3");
		setOps.add(setKey2, "5");
		Set<Object> assertSet = new HashSet<>();
		assertSet.add("3");
		Assert.assertEquals(assertSet, setOps.intersect(setKey1, setKey2));
		System.out.println("key1与key2的交集：");
		System.out.println(setOps.intersect(setKey1, setKey2));// key1与key2中都存在的数据
	}

	/**
	 * 
	 * what: 求两个Set集合的交集（保存到redis中）
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void interAndStoreSet() {
		String setKey1 = "SetKey1";
		String setKey2 = "SetKey2";
		String setKeyTemp = "SetTemp";
		redisTemplate.delete(setKey1);
		redisTemplate.delete(setKey2);
		redisTemplate.delete(setKeyTemp);
		setOps.add(setKey1, "1");
		setOps.add(setKey1, "2");
		setOps.add(setKey1, "3");
		setOps.add(setKey2, "4");
		setOps.add(setKey2, "3");
		setOps.add(setKey2, "5");
		setOps.intersectAndStore(setKey1, setKey2, setKeyTemp);// key1与key2中都存在的数据的数量
		Set<Object> assertSet = new HashSet<>();
		assertSet.add("3");
		Assert.assertEquals(assertSet, setOps.members(setKeyTemp));
		System.out.println("key1与key2的交集，keyTemp中的数据：" + setOps.members(setKeyTemp));
	}

	/**
	 * 
	 * what: 求两个Set集合的并集（不保存到redis中）
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void unionSet() {
		String key1 = "SetKey1";
		String key2 = "SetKey2";
		redisTemplate.delete(key1);
		redisTemplate.delete(key2);
		setOps.add(key1, "1");
		setOps.add(key1, "2");
		setOps.add(key1, "3");
		setOps.add(key2, "4");
		setOps.add(key2, "3");
		setOps.add(key2, "5");
		System.out.println("key1与key2的并集：");
		Set<Object> assertSet = new HashSet<>();
		assertSet.add("1");
		assertSet.add("2");
		assertSet.add("3");
		assertSet.add("4");
		assertSet.add("5");
		Assert.assertEquals(assertSet, setOps.union(key1, key2));
		System.out.println(setOps.union(key1, key2));// key1+key2中存在的数据，去除重复的
	}

	/**
	 * 
	 * what: 求两个Set集合的并集（保存到redis中）
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void unionAndStoreSet() {
		String setKey1 = "SetKey1";
		String setKey2 = "SetKey2";
		String setKeyTemp = "SetTemp";
		redisTemplate.delete(setKey1);
		redisTemplate.delete(setKey2);
		redisTemplate.delete(setKeyTemp);
		setOps.add(setKey1, "1");
		setOps.add(setKey1, "2");
		setOps.add(setKey1, "3");
		setOps.add(setKey2, "4");
		setOps.add(setKey2, "3");
		setOps.add(setKey2, "5");
		Set<Object> assertSet = new HashSet<>();
		assertSet.add("1");
		assertSet.add("2");
		assertSet.add("3");
		assertSet.add("4");
		assertSet.add("5");
		setOps.unionAndStore(setKey1, setKey2, setKeyTemp);// key1+key2中存在的数据的数量
		Assert.assertEquals(assertSet, setOps.members(setKeyTemp));
		System.out.println("key1与key2的并集，keyTemp中的数据：" + setOps.members(setKeyTemp));
	}

	/**
	 * 
	 * what: 设置Hash表值
	 * warning: 对redisHashKey中hashKey的值进行重复添加则可达到修改的作用
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void setHash() {
		String redisHashKey = "RedisHashKey";
		String hashKey = "HashKey";
		String hashValue = "hash";
		// 单个添加，将对应的reidsKey与hashKey和value添加到hash表中
		hashOps.put(redisHashKey, hashKey, hashValue);
		long size = hashOps.size(redisHashKey);
		Assert.assertEquals(1, size);
		// 将一个map添加到hash表中
		Map<Object, Object> hashMap = new HashMap<>();
		hashMap.put("HashKey1", "hash1");
		hashMap.put("HashKey2", "hash2");
		hashOps.putAll(redisHashKey, hashMap);
		size = hashOps.size(redisHashKey);
		Assert.assertEquals(3, size);
		// 只在hash表中不存在对应hashkey的值时添加
		hashOps.putIfAbsent(redisHashKey, hashKey, "hash3");
		size = hashOps.size(redisHashKey);
		Assert.assertEquals(3, size);
		System.out.println("添加成功");
	}

	/**
	 * 
	 * what: 获取Hash表的值
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void getHash() {
		String redisHashKey = "RedisHashKey";
		String hashKey = "HashKey";
		Set<Object> assertSet = new HashSet<Object>();
		Assert.assertNotEquals(assertSet, hashOps.keys(redisHashKey));
		System.out.println("RedisHashKey中的所有的key的值：" + hashOps.keys(redisHashKey));

		Assert.assertNotEquals(assertSet, hashOps.values(redisHashKey));
		System.out.println("RedisHashKey中的所有的value的值：" + hashOps.values(redisHashKey));

		Assert.assertNotEquals(0l, (long) hashOps.size(redisHashKey));
		System.out.println("RedisHashKey的长度：" + hashOps.size(redisHashKey));

		Assert.assertNotNull(hashOps.get(redisHashKey, hashKey));
		System.out.println("RedisHashKey中HashKey对应的值：" + hashOps.get(redisHashKey, hashKey));

		Assert.assertNotNull(hashOps.entries(redisHashKey));
		System.out.println("RedisHashKey中所有数据的Map集合：" + hashOps.entries(redisHashKey));

		// 使用迭代方式获取Hash表中所数据
		Cursor<Entry<Object, Object>> cursor = hashOps.scan(redisHashKey, ScanOptions.NONE);
		Assert.assertNotNull(cursor);
		System.out.println("迭代方式获取RedisHashKey中的值：");
		while (cursor.hasNext()) {
			Entry<Object, Object> entry = cursor.next();
			System.out.println("[" + entry.getKey() + "," + entry.getValue() + "]");
		}

		List<Object> list = new ArrayList<>();
		list.add(hashKey);
		list.add("HashKey1");
		Assert.assertNotNull(hashOps.multiGet(redisHashKey, list));
		System.out.println("通过RedisHashKey中存放的key的值得集合来获得对应的value:" + hashOps.multiGet(redisHashKey, list));
	}

	/**
	 * 
	 * what: 删除Hash表
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void delHash() {
		String redisHashKey = "RedisHashKey";
		redisTemplate.delete(redisHashKey);
		Set<Object> assertSet = new HashSet<Object>();
		Assert.assertEquals(assertSet, hashOps.keys(redisHashKey));
		System.out.println("删除成功");
	}

	/**
	 * 
	 * what: 添加SortedSet值
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void setSortedSet() {
		String sortedSetKey = "SortedSetKey";
		// 单个录入，add(key, value, score)，score表示排序时所处的位置，越小越靠前，可以是整数或者浮点数,value值相同则修改score
		zsetOps.add(sortedSetKey, "sortedSet1", 1);
		zsetOps.add(sortedSetKey, "sortedSet2", 2);
		zsetOps.add(sortedSetKey, "sortedSet2", 3);
		// 整体录入
		Set<TypedTuple<Object>> set = new HashSet<>();
		TypedTuple<Object> tuple = new DefaultTypedTuple<Object>("sortedSet3", 4d);
		TypedTuple<Object> tuple1 = new DefaultTypedTuple<Object>("sortedSet4", 5d);
		TypedTuple<Object> tuple2 = new DefaultTypedTuple<Object>("sortedSet5", 6d);
		TypedTuple<Object> tuple3 = new DefaultTypedTuple<Object>("sortedSet6", 7d);
		TypedTuple<Object> tuple4 = new DefaultTypedTuple<Object>("sortedSet7", 8d);
		TypedTuple<Object> tuple5 = new DefaultTypedTuple<Object>("sortedSet8", 9d);
		TypedTuple<Object> tuple6 = new DefaultTypedTuple<Object>("sortedSet9", 10d);
		TypedTuple<Object> tuple7 = new DefaultTypedTuple<Object>("sortedSet10", 11d);
		TypedTuple<Object> tuple8 = new DefaultTypedTuple<Object>("sortedSet11", 12d);
		TypedTuple<Object> tuple9 = new DefaultTypedTuple<Object>("sortedSet12", 13d);
		set.add(tuple);
		set.add(tuple1);
		set.add(tuple2);
		set.add(tuple3);
		set.add(tuple4);
		set.add(tuple5);
		set.add(tuple6);
		set.add(tuple7);
		set.add(tuple8);
		set.add(tuple9);
		zsetOps.add(sortedSetKey, set);
		Assert.assertEquals(12, (long) zsetOps.size(sortedSetKey));
		System.out.println("录入条数：" + zsetOps.size(sortedSetKey));
	}

	/**
	 * 
	 * what: 获取SortedSet值
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void getSortedSet() {
		String sortedSetKey = "SortedSetKey";
		Set<Object> assertSet = new HashSet<Object>();
		Assert.assertNotEquals(assertSet, zsetOps.range(sortedSetKey, 0, 3));
		System.out.println("获取SortedSet中，在索引区间0-3的值：" + zsetOps.range(sortedSetKey, 0, 3));// 获取索引区间之内的数据

		assertSet = new HashSet<Object>();
		Assert.assertNotEquals(assertSet, zsetOps.rangeByScore(sortedSetKey, 0, 3));
		System.out.println("获取SortedSet中，在分数区间0-3的值(不带分数)：" + zsetOps.rangeByScore(sortedSetKey, 0, 3));

		assertSet = new HashSet<Object>();
		Assert.assertNotEquals(assertSet, zsetOps.rangeByScoreWithScores(sortedSetKey, 0, 3));
		System.out.println("获取SortedSet中，在分数区间0-3的值(带分数)：");
		Set<TypedTuple<Object>> set = zsetOps.rangeByScoreWithScores(sortedSetKey, 0, 3);// 获取分数区间之内的数据，包括起始和终止分数的数据
		for (TypedTuple<Object> typedTuple : set) {
			System.out.println("[vlaue:" + typedTuple.getValue() + ",score:" + typedTuple.getScore() + "]");
		}
		Assert.assertNotNull(zsetOps.rank(sortedSetKey, "sortedSet1"));
		System.out.println("获取SortedSet中，sortSet1的索引：" + zsetOps.rank(sortedSetKey, "sortedSet1"));

		Assert.assertNotEquals(assertSet, zsetOps.reverseRange(sortedSetKey, 0, 3));
		System.out.println("获取SortedSet中，0-3索引的数据，分数从高到低排序：" + zsetOps.reverseRange(sortedSetKey, 0, 3));// 返回有序集中指定区间内的成员，通过索引，分数从高到底

		Assert.assertNotEquals(assertSet, zsetOps.reverseRangeByScore(sortedSetKey, 0, 3));
		System.out.println("获取SortedSet中，0-3分数从高到低排序：" + zsetOps.reverseRangeByScore(sortedSetKey, 0, 3));// 返回有序集中指定分数区间内的成员，分数从高到低排序

		Assert.assertNotNull(zsetOps.reverseRank(sortedSetKey, "sortedSet1"));
		System.out.println("获取SortedSet中，sortSet1的排名：" + zsetOps.reverseRank(sortedSetKey, "sortedSet1"));// 返回有序集合中指定成员的排名（最大的排名为0），有序集成员按分数值递减(从大到小)排序

		Assert.assertNotNull(zsetOps.reverseRank(sortedSetKey, "sortedSet2"));
		System.out.println("获取SortedSet中，sortSet2的排名：" + zsetOps.reverseRank(sortedSetKey, "sortedSet2"));// 返回有序集合中指定成员的排名（最大的排名为0），有序集成员按分数值递减(从大到小)排序

		Assert.assertNotNull(zsetOps.score(sortedSetKey, "sortedSet1"));
		System.out.println("获取SortedSet中，sortSet1的分数值：" + zsetOps.score(sortedSetKey, "sortedSet1"));// 返回有序集中，成员的分数值
	}

	/**
	 * 
	 * what: 移除SortedSet中的数据
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void removeSortedSet() {
		String sortedSetKey = "SortedSetKey";
		Set<TypedTuple<Object>> set = zsetOps.rangeWithScores(sortedSetKey, 0, -1);
		for (TypedTuple<Object> typedTuple : set) {
			System.out.println("[vlaue:" + typedTuple.getValue() + ",score:" + typedTuple.getScore() + "]");
		}
		Assert.assertNotNull(zsetOps.remove(sortedSetKey, "sotredSet1", "sotredSet2"));// 移除有序集合中的一个或多个成员
		System.out.println("---------移除sotredSet1，sotredSet2之后：");
		set = zsetOps.rangeWithScores(sortedSetKey, 0, -1);
		for (TypedTuple<Object> typedTuple : set) {
			System.out.println("[vlaue:" + typedTuple.getValue() + ",score:" + typedTuple.getScore() + "]");
		}
		Assert.assertNotNull(zsetOps.removeRange(sortedSetKey, 9, 10));// Redis Zremrangebyrank 命令 移除有序集合中给定的排名区间的所有成员
		System.out.println("---------移除排名是第9和10之间的数据之后：");
		set = zsetOps.rangeWithScores(sortedSetKey, 0, -1);
		for (TypedTuple<Object> typedTuple : set) {
			System.out.println("[vlaue:" + typedTuple.getValue() + ",score:" + typedTuple.getScore() + "]");
		}
		Assert.assertNotNull(zsetOps.removeRangeByScore(sortedSetKey, 5, 6));// Redis Zremrangebyscore 命令 移除有序集合中给定的分数区间的所有成员
		System.out.println("---------移除分数是5和6之间的数据之后：");
		set = zsetOps.rangeWithScores(sortedSetKey, 0, -1);
		for (TypedTuple<Object> typedTuple : set) {
			System.out.println("[vlaue:" + typedTuple.getValue() + ",score:" + typedTuple.getScore() + "]");
		}
	}

	/**
	 * 
	 * what: 删除SortedSet数据
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@Test
	public void delSortedSet() {
		String sortedSetKey = "SortedSetKey";
		redisTemplate.delete(sortedSetKey);
		Set<TypedTuple<Object>> set = zsetOps.rangeWithScores(sortedSetKey, 0, -1);
		Set<Object> assertSet = new HashSet<>();
		Assert.assertEquals(assertSet, set);
		System.out.println("删除成功");
	}

	/**
	 * 
	 * what: 为数据设置过期时间
	 *
	 * @author 孙超 created on 2017年11月1日
	 */
	@Test
	public void setTimeout() {
		String sortedSetKey = "SortedSetKey";// 需要设置过期时间的redis数据key
		boolean b = redisTemplate.expire(sortedSetKey, 20, TimeUnit.SECONDS);// 第二个参时表示设置的过期时间，第三个参数表示设置的时间单位
		Assert.assertEquals(true, b);
		System.out.println("设置成功");
	}
}
