/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:cdpf_example
 */
package com.critc.example.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.critc.core.dao.BaseDao;
import com.critc.example.model.ExampleUeditor;

/**
 * what: ExampleUeditorDao. <br/>
 * 
 * @author 刘正荣 created on 2017年11月3日
 */
@Repository
public class ExampleUeditorDao extends BaseDao<ExampleUeditor, ExampleUeditor> {

	/**
	 * 
	 * what: 获取所有记录. <br/>
	 * 
	 * @return 返回结果集
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public List<ExampleUeditor> list() {
		String sql = "select id, description" + " from t_example_ueditor order by id";
		return list(sql);
	}

	/**
	 * 
	 * what: 新增. <br/>
	 * 
	 * @param exampleUeditor
	 * @return 0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public int add(ExampleUeditor exampleUeditor) {
		String sql = "insert into t_example_ueditor(id,description)"
				+ " values(seq_t_example_ueditor.nextval,:description)";
		return insert(sql, exampleUeditor);
	}

	/**
	 * 
	 * what: 获取指定id的记录. <br/>
	 * 
	 * @param id id
	 * @return 返回结果集
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public ExampleUeditor get(int id) {
		String sql = "select id, description from t_example_ueditor t where id=?";
		return get(sql, id);
	}

	/**
	 * 
	 * what: 更新. <br/>
	 * 
	 * @param exampleUeditor exampleUeditor
	 * @return 0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public int update(ExampleUeditor exampleUeditor) {
		String sql = "update t_example_ueditor set description=:description where id=:id";
		return update(sql, exampleUeditor);
	}

	/**
	 * 
	 * what: 删除. <br/>
	 * 
	 * @param id id
	 * @return 0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public int delete(int id) {
		String sql = "delete from t_example_ueditor where id=?";
		return delete(sql, id);
	}

	/**
	 * 
	 * what: 查数量. <br/>
	 * 
	 * @param exampleUeditor exampleUeditor
	 * @return 返回查询的结果
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public int count(ExampleUeditor exampleUeditor) {
		String sql = "select count(*) from t_example_ueditor where 1=1";
		return count(sql, exampleUeditor);
	}

}
