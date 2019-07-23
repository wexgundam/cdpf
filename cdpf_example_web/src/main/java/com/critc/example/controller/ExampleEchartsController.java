/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:cdpf_example
 */
package com.critc.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.critc.example.service.ExampleEchartsService;
import com.critc.util.json.JsonUtil;
import com.critc.util.web.WebUtil;

/**
 * 
 * what: EchartsController. <br/>
 * 
 *
 * @author 刘正荣 created on 2017年11月16日
 */
@Controller
@RequestMapping("/example/echarts")
public class ExampleEchartsController {

	/**
	 * exampleEchartSevice
	 */
	@Autowired
	private ExampleEchartsService exampleEchartSevice;

	/**
	 * 
	 * what: 跳转到echarts入门示例主页. <br/>
	 * 
	 * @return 跳转视图
	 *
	 * @author 刘正荣 created on 2017年11月16日
	 */
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/index");
		return mv;
	}

	/**
	 * 
	 * what: 跳转到快速入门示例页面. <br/>
	 * 
	 * @return 跳转视图
	 *
	 * @author 刘正荣 created on 2017年11月16日
	 */
	@RequestMapping("/toSimpleStart")
	public ModelAndView simpleStart() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/simpleStart");
		return mv;
	}

	/**
	 * 
	 * what: 跳转到异步加载数据页面. <br/>
	 * 
	 * @return 跳转视图
	 * 
	 * @author 刘正荣 created on 2017年11月16日
	 */
	@RequestMapping("/toAsyncData")
	public ModelAndView toAsyncData() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/asyncData");
		return mv;
	}

	/**
	 * 
	 * what: 异步加载数据. <br/>
	 * 
	 * @param request request
	 * @param response response
	 *
	 * @author 刘正荣 created on 2017年11月16日
	 */
	@RequestMapping("/getAsyncData")
	public void getData(HttpServletRequest request, HttpServletResponse response) {
		WebUtil.out(response, JsonUtil.toStr(exampleEchartSevice.getData()));
	}

	/**
	 * 
	 * what: 跳转到柱状图页面. <br/>
	 * 
	 * @return 跳转视图
	 *
	 * @author 刘正荣 created on 2017年11月16日
	 */
	@RequestMapping("/toBarChart")
	public ModelAndView toBarChart() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/barChart");
		return mv;
	}

	/**
	 * 
	 * what: 跳转到饼图页面. <br/>
	 * 
	 * @return 跳转视图
	 *
	 * @author 刘正荣 created on 2017年11月16日
	 */
	@RequestMapping("/toPieChart")
	public ModelAndView toPieChart() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/pieChart");
		return mv;
	}

	/**
	 * 
	 * what: 跳转到折线图页面. <br/>
	 * 
	 * @return 跳转视图
	 *
	 * @author 刘正荣 created on 2017年11月16日
	 */
	@RequestMapping("/toLineChart")
	public ModelAndView tolineChart() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/lineChart");
		return mv;
	}

	/**
	 * 
	 * what: 跳转到仪表盘页面. <br/>
	 * 
	 * @param request request
	 * @param response response
	 * @return 跳转视图
	 *
	 * @author 刘正荣 created on 2017年11月16日
	 */
	@RequestMapping("/toGauge")
	public ModelAndView toGauge(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/gauge");
		return mv;
	}

	/**
	 * 
	 * what: 跳转到雷达图页面. <br/>
	 * 
	 * @return 跳转视图
	 *
	 * @author 刘正荣 created on 2017年11月16日
	 */
	@RequestMapping("/toRadar")
	public ModelAndView toRadar() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/radar");
		return mv;
	}

	/**
	 * 
	 * what: 跳转到自定义图标页面. <br/>
	 * 
	 * @return 跳转视图
	 *
	 * @author 刘正荣 created on 2017年11月16日
	 */
	@RequestMapping("/toCustom")
	public ModelAndView toCustom() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/customChart");
		return mv;
	}

}
