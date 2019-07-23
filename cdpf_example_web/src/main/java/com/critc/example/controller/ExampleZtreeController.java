/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:cdpf_exmaple_web
 */
package com.critc.example.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.critc.example.model.ZtreeNode;
import com.critc.example.service.ExampleZtreeService;
import com.critc.util.json.JsonUtil;
import com.critc.util.web.WebUtil;

/**
 * 
 * what: ExampleZtreeController. <br/>
 * 
 * @author 刘正荣 created on 2017年11月3日
 */
@Controller
@RequestMapping("/example/ztree")
public class ExampleZtreeController {

	/**
	 * exampleZtreeService
	 */
	@Autowired
	private ExampleZtreeService exampleZtreeService;

	/**
	 * 
	 * what: 跳转到index页面. <br/>
	 * 
	 * @return 返回视图
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/ztree/index");
		return mv;
	}

	/**
	 * 
	 * what: 测试ztree异步加载. <br/>
	 * 
	 * @return 返回视图
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	@RequestMapping("/async")
	public ModelAndView async() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/ztree/async");
		return mv;
	}

	/**
	 * 
	 * what: 异步加载的数据. <br/>
	 * 
	 * @param response response
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	@RequestMapping("/asyncData")
	public void asyncData(HttpServletResponse response) {

		String ztreeData = exampleZtreeService.getAsyncData();

		WebUtil.out(response, ztreeData);

	}

	/**
	 * 
	 * what: 跳转到异步加载节点的页面. <br/>
	 * 
	 * @return 返回视图
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	@RequestMapping("/diyAsync")
	public ModelAndView diyAsync() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/ztree/diyAsync");
		return mv;
	}

	/**
	 * 
	 * what: 主要用于异步加载节点使用. <br/>
	 * 
	 * @param response response
	 * @param idKey ztreeNode主键
	 * @param count 加载的数量
	 * @param baseCount 基数
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	@RequestMapping("/getNodesForBigData")
	public void getNodesForBigData(HttpServletResponse response, Integer idKey, int count, int baseCount) {
		List<ZtreeNode> createZtreeNode = createZtreeNode(idKey, count, baseCount);
		WebUtil.out(response, JsonUtil.toStr(createZtreeNode));
	}

	/**
	 * 
	 * what: checkbox tree的使用. <br/>
	 * 
	 * @return 跳转到视图
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	@RequestMapping("/checkboxTree")
	public ModelAndView checkboxTree() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/ztree/checkboxTree");
		return mv;
	}

	/**
	 * 
	 * what: 用于生成多个数据节点. <br/>
	 * 
	 * @param id 需要异步加载的父节点的id
	 * @param count 每次加载的节点数量
	 * @param baseCount 当前加载的开始位置
	 * @return 返回结果集
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public List<ZtreeNode> createZtreeNode(Integer id, int count, int baseCount) {
		List<ZtreeNode> ztreeNodeList = new ArrayList<>();
		if (id != null && count != 0) {
			// 真实场景下需要到数据库中根据id查找
			for (int i = 0; i < count; i++) {
				ZtreeNode node = new ZtreeNode(Integer.valueOf(id), "子节点" + (baseCount + i));
				ztreeNodeList.add(node);
			}
		}
		return ztreeNodeList;
	}

}
