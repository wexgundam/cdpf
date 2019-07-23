package com.critc.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.critc.core.pub.PubConfig;
import com.critc.example.service.ExampleChineseToPinYinService;
import com.critc.util.json.JsonUtil;
import com.critc.util.string.StringUtil;
import com.critc.util.web.WebUtil;

/**
 * what:    汉字转拼音Controller
 *
 * @author 刘艳超 created on 2017年10月26日
 */
@RequestMapping("/example/chinesetopinyin")
@Controller
public class ExampleChineseToPinYinController {
	@Autowired
	private PubConfig pubConfig;
	@Autowired
	private ExampleChineseToPinYinService exampleChineseToPinYinService;
	/**
	 * what:    进入汉字转拼音首页
	 * 
	 * @param request
	 * @param response
	 * @return
	 *
	 * @author 刘艳超 created on 2017年10月26日
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("example/chinesetopinyin/index");
		String url = pubConfig.getDynamicServer()+"/example/chinesetopinyin/index.htm?";
		mv.addObject("backUrl", StringUtil.encodeUrl(url));
		return mv;
	}
	/**
	 * 
	 * what:  汉字转全拼音
	 * 
	 * @param request
	 * @param response
	 * @param hanZi  文本框中的汉字
	 *
	 * @author 刘艳超 created on 2017年10月26日
	 */
	@RequestMapping("/convertToAllPinYin")
	public void convertToAllPinYin(HttpServletRequest request,HttpServletResponse response,String hanZi){
		String pinYin = exampleChineseToPinYinService.getPinYinAll(hanZi);
		WebUtil.out(response, JsonUtil.toStr(pinYin));
	}
	/**
	 * 
	 * what:   汉字转拼音首字母大写
	 * 
	 * @param request
	 * @param response
	 * @param hanZi 文本框中的汉字
	 *
	 * @author 刘艳超 created on 2017年10月31日
	 */
	@RequestMapping("/convertToFirstPinYin")
	public void convert(HttpServletRequest request,HttpServletResponse response,String hanZi){
		String pinYin = exampleChineseToPinYinService.getPinYinHeadUpCase(hanZi);
		WebUtil.out(response, JsonUtil.toStr(pinYin));
	}
	
}
