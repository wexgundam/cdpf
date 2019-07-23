package com.critc.example.service;


import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;



/**
 * 
 * what:    DataTable service
 * 
 *
 * @author 郭飞 created on 2017年11月2日
 */
@Service
public class ExampleDataTableService {

	/**
	 * 全局静态类，用来存储数据
	 */
	private static ArrayList<Map<String, Object>>  data = null;


	public ExampleDataTableService() {
		data = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", "1");
		map.put("name", "张三");
		map.put("roleName", "管理员");
		map.put("partement", "决策部");
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("id", "2");
		map2.put("name", "王申");
		map2.put("roleName", "普通用户");
		map2.put("partement", "调度部");
	
		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("id", "3");
		map3.put("name", "海燕");
		map3.put("roleName", "管理员");
		map3.put("partement", "生产部");
	
		Map<String, Object> map4 = new HashMap<String, Object>();
		map4.put("id", "4");
		map4.put("name", "李大钊");
		map4.put("roleName", "管理员");
		map4.put("partement", "运输部");
	
		Map<String, Object> map5 = new HashMap<String, Object>();
		map5.put("id", "5");
		map5.put("name", "张胜利");
		map5.put("roleName", "普通用户");
		map5.put("partement", "财务部");
		
		Map<String, Object> map6 = new HashMap<String, Object>();
		map6.put("id", "6");
		map6.put("name", "郭刚");
		map6.put("roleName", "管理员");
		map6.put("partement", "技术支持部");
	
		data.add(map);
		data.add(map2);
		data.add(map3);
		data.add(map4);
		data.add(map5);
		data.add(map6);
	}
	/**
	 * 
	 * what:   初始化数据
	 * 
	 * @return ArrayList
	 *
	 * @author 郭飞 created on 2017年11月2日
	 */
	public ArrayList<Map<String, Object>>  getData() {
	
		return data;
	}
	/**
	 *
	 * what:   删除数据
	 *@param id  对象id
	 * @return boolean
	 *
	 * @author 郭飞 created on 2017年11月17日
	 */
	public boolean  deleteData(String id) {
		boolean flag = false;
		int num = 0;
		for (int i = 0; i < data.size(); i++) {
			if (id.equals(data.get(i).get("id"))) {
				num = i;
			}
		}
		flag = data.remove(data.get(num));
		return flag;
	}
	/**
	 *
	 * what:   更新数据
	 * @param id  对象id
	 * @param oldId oldId
	 * @param name name
	 * @param roleName roleName
	 * @param partement partement
	 * @return boolean
	 * @author 郭飞 created on 2017年11月17日
	 */
	public boolean updateData(String oldId, String id, String name, String roleName, String partement) {
		int num = 0;
		for (int i = 0; i < data.size(); i++) {
			if (oldId.equals(data.get(i).get("id"))) {
				num = i;
			}
		}
		data.remove(data.get(num));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("name", name);
		map.put("roleName", roleName);
		map.put("partement", partement);
		data.add(map);
	  
		return true;
	}
	
}
