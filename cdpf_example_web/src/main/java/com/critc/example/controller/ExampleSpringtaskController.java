package com.critc.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.critc.core.pub.PubConfig;
import com.critc.util.string.StringUtil;

/** 
 * spring-task的controller
 * @author 刘艳超 
 * @date 2017年10月9日
 * 定时任务实现分为两种方式一种是通过注解的方式，另一种方式通过配置文件的实现
 */
@Controller
@RequestMapping("/example/springTask")
public class ExampleSpringtaskController {
	@Autowired
	private PubConfig pubConfig;
	
	@RequestMapping("/index")
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("example/springtask/index");
		String url = pubConfig.getDynamicServer() + "/example/springtask/index.htm?";
		mv.addObject("backUrl", StringUtil.encodeUrl(url));
		return mv;
	}
	

}
