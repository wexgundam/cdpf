package com.critc.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * what:   EhCache代码示例Controller
 * 
 * @author 刘艳超 created on 2017年9月29日
 */
@RequestMapping("/example/ehcache")
@Controller
public class ExampleEhCacheController {
	@RequestMapping("/index")
	public String index(){
		return "example/ehcache/index";
	}

}
