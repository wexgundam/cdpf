/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:cdpf_example
 */
package com.critc.example.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.critc.example.dao.ExampleUeditorDao;
import com.critc.example.model.ExampleUeditor;
import com.critc.util.date.DateUtil;
import com.critc.util.file.FileUtil;
import com.critc.util.string.StringUtil;

/**
 * what: ExampleUeditorService. <br/>
 * 
 * @author 刘正荣 created on 2017年11月3日
 */

@Service
public class ExampleUeditorService {

	/**
	 * exampleUeditorDao
	 */
	@Autowired
	private ExampleUeditorDao exampleUeditorDao;

	/**
	 * what: 保存或者更新. <br/>
	 * 
	 * @param exampleUeditor exampleUeditor
	 * @param basePath 基本路径
	 * @param content 保存的内容
	 * @return 0 表示添加或更新失败，1表示成功，2表示创建的文件个数大于10
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public int saveOrUpdate(ExampleUeditor exampleUeditor, String basePath, String content) {
		int flag = 0;
		if (exampleUeditor == null) {
			return 0;
		}

		if (exampleUeditor.getId() != 0) {
			flag = FileUtil.writeFile(basePath + exampleUeditor.getDescription(), content);
			if (flag == 1 && exampleUeditorDao.update(exampleUeditor) == 1) {
				return 1;
			}
		} else {
			String path = "\\\\example\\\\ueditor\\\\" + DateUtil.dateToString(new Date(), "yyyyMMddhhmmss") + ".txt";
			flag = FileUtil.writeFile(basePath + path, content);
			exampleUeditor.setDescription(path);
			int count = exampleUeditorDao.count(exampleUeditor);
			if (count < 9) {
				if (flag == 1 && exampleUeditorDao.add(exampleUeditor) == 1) {
					return 1;
				}
			} else {
				return 2;
			}
		}

		return 0;

	}

	/**
	 * what: 根据id删除ExampleUeditor. <br/>
	 * 
	 * @param id id
	 * @return 0表示失败，1表示成功
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public int delete(int id) {
		return exampleUeditorDao.delete(id);

	}

	/**
	 * what: 获取所有ExampleUeditor. <br/>
	 * 
	 * @return 返回结果集
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public List<ExampleUeditor> list() {
		return exampleUeditorDao.list();
	}

	/**
	 * what: 读取文件. <br/>
	 * 
	 * @param base 基本路径
	 * @param path 文件路径
	 * @param request request
	 *
	 * @return 返回读取的文件内容
	 * @author 刘正荣 created on 2017年11月3日
	 *
	 */
	public String readFile(String base, String path, HttpServletRequest request) {
		String basePath = null;
		if (StringUtil.isNullOrEmpty(path)) {
			return "NOT EXIST";
		}

		if (!path.equals("template.txt")) {
			basePath = base + "\\" + path;
		} else {
			basePath = request.getServletContext().getRealPath("/template/example/ueditor/template.txt");
		}

		return FileUtil.readFile(basePath);
	}

}
