/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:web
 */
package com.critc.example.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.critc.util.json.JsonUtil;
import com.critc.util.web.WebUtil;

/**
 * 
 * what:    表单验证示例Controller
 * 
 *
 * @author 杨超凡 created on 2017年11月2日
 */
@RequestMapping("/example/validation")
@Controller
public class ExampleValidationController {
/**
 * 
 * what:    表单验证主页
 * when:    请求访问表单验证主页时
 * 
 * @return index
 *
 * @author 杨超凡 created on 2017年11月2日
 */
	@RequestMapping("/index")
	private String index() {
		return "example/validation/index";
	}
	/**
	 * 
	 * what:    表单异步数据校验
	 * when:    前台发起异步请求时
	 * 
	 * @param response response
	 * @param data 匹配数据
	 *
	 * @author 杨超凡 created on 2017年11月2日
	 */
	@RequestMapping("/ajaxcheck")
	private void ajaxcheck(HttpServletResponse response, String data) {
		String[] answer = {"work", "look", "play"};
		int flag = 0;
		for (String string : answer) {
			if (data.trim().equals(string)) {
				flag++;
			}
		}
		if (flag > 0) {
			WebUtil.out(response, JsonUtil.createOperaStr(true, "验证通过"));
		}
		else {
			WebUtil.out(response, JsonUtil.createOperaStr(true, "验证失败"));
		}
	}
}
