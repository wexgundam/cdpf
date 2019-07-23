/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:cdpf_example
 */
package com.critc.example.service;

import org.springframework.stereotype.Service;

import com.critc.util.file.FileUtil;

/**
 * 
 * what: Ztree示例Service. <br/>
 * 
 * 
 * @author 刘正荣 created on 2017年11月3日
 */
@Service
public class ExampleZtreeService {

	/**
	 * 
	 * what: 从asyncData.json中读取节点数据 <br/>
	 * 
	 * @return 返回读取的数据
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public String getAsyncData() {
		String realPath = FileUtil.class.getResource("/file/example/ztree/asyncData.json").getPath();
		return FileUtil.readFile(realPath); // 所有节点;
	}

}
