package com.critc.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 
 * what:  redis代码示例
 *
 * @author 孙超 created on 2017年10月31日
 */
@Controller
@RequestMapping("/example/redis")
public class ExampleRedisController  {
	/**
	 * 
	 * what: 页面跳转
	 * 
	 * @param request
	 * @param response
	 * @return
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("example/redis/index");
		return mv;
	}

}
