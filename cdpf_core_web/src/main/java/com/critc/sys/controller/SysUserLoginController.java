/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:web
 */
package com.critc.sys.controller;

import com.critc.core.pub.PubConfig;
import com.critc.sys.service.SysUserLoginService;
import com.critc.sys.service.SysUserService;
import com.critc.util.string.BackUrlUtil;
import com.critc.sys.model.SysUserLogin;
import com.critc.sys.vo.SysUserLoginSearchVO;
import com.critc.util.date.DateUtil;
import com.critc.util.json.JsonUtil;
import com.critc.util.page.PageNavigate;
import com.critc.util.string.StringUtil;
import com.critc.util.web.WebUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;

/**
 * 
 * what:   用户登录记录查询Controller
 * 
 *
 * @author ycf created on 2017年10月19日
 */
@Controller
@RequestMapping("/sys/userlogin")
public class SysUserLoginController {
	/**
	 * 用户登录记录service
	 */
	@Autowired
	private SysUserLoginService sysUserLoginService;
	/**
	 * 全局参数配置
	 */
	@Autowired
	private PubConfig pubConfig;
	/**
	 * 系统用户service
	 */
	@Autowired
	private SysUserService sysUserService;

	/**
	 * 
	 * what:    进入用户登录记录主页
	 * 
	 * @param request request
	 * @param sysUserLoginSearchVO 用户登录记录查询VO
	 * @return index
	 *
	 * @author 杨超凡 created on 2017年10月19日
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, SysUserLoginSearchVO sysUserLoginSearchVO) {
		// 设置查询起始日期
		if (StringUtil.isNullOrEmpty(sysUserLoginSearchVO.getStartDate())) {
			sysUserLoginSearchVO.setStartDate(DateUtil.getOperaDate(DateUtil.getSystemDate(), -30));
		}
		// 设置截止日期
		if (StringUtil.isNullOrEmpty(sysUserLoginSearchVO.getEndDate())) {
			sysUserLoginSearchVO.setEndDate(DateUtil.getSystemDate());
			}
		ModelAndView mv = new ModelAndView();
		// 获取查询总数
		int recordCount = sysUserLoginService.count(sysUserLoginSearchVO);
		String url = createUrl(sysUserLoginSearchVO);
		PageNavigate pageNavigate = new PageNavigate(url, sysUserLoginSearchVO.getPageIndex(), recordCount);
		List<SysUserLogin> list = sysUserLoginService.list(sysUserLoginSearchVO);
		// 设置分页的变量
		mv.addObject("pageNavigate", pageNavigate);
		// 把获取的记录放到mv里面
		mv.addObject("list", list);
		// 跳转至指定页面
		mv.setViewName("/sys/userlogin/index");
		// 设置返回url
		BackUrlUtil.createBackUrl(mv, request, url);
		return mv;
	}
	/**
	 * 
	 * what:    异步请求用户登录信息
	 * 
	 * @param request request
	 * @param response response
	 * @param sysUserloginSearchVO 用户登陆记录查询VO
	 *
	 * @author 杨超凡 created on 2017年11月3日
	 */
	@RequestMapping("/searchUserLogin")
	public void searchUserLogin(HttpServletRequest request, HttpServletResponse response, SysUserLoginSearchVO sysUserloginSearchVO) {
		// 获取查询总数
		int recordCount = sysUserLoginService.count(sysUserloginSearchVO);
		List<SysUserLogin> list = sysUserLoginService.list(sysUserloginSearchVO);
		WebUtil.out(response, JsonUtil.createDataTablePageJson(sysUserloginSearchVO.getPageIndex(), recordCount, JsonUtil.toStr(list)));
	}

	/**
	 * 
	 * what:    自动补全账号数据列表
	 * 
	 * @param response response
	 *
	 * @author 杨超凡 created on 2017年10月19日
	 */
	@RequestMapping("/getAutoComplteList")
	public void getAutoComplteList(HttpServletResponse response) {
		WebUtil.out(response, JsonUtil.toStr(sysUserService.listAll()));
	}

	/**
	 * 
	 * what:    设置分页url
	 * 
	 * @param sysUserLoginSearchVO 用户登陆记录查询VO
	 * @return backUrl
	 *
	 * @author孔垂云 created on 2017年6月13日
	 */
	private String createUrl(SysUserLoginSearchVO sysUserLoginSearchVO) {
		String url = pubConfig.getDynamicServer() + "/sys/userlogin/index.htm?";
		if (StringUtil.isNotNullOrEmpty(sysUserLoginSearchVO.getUsername())) {
			url += "&username=" + sysUserLoginSearchVO.getUsername();
		}
		if (StringUtil.isNotNullOrEmpty(sysUserLoginSearchVO.getLoginIp())) {
			url += "&loginIp=" + sysUserLoginSearchVO.getLoginIp();
		}
		if (StringUtil.isNotNullOrEmpty(sysUserLoginSearchVO.getStartDate())) {
			url += "&startDate=" + sysUserLoginSearchVO.getStartDate();
		}
		if (StringUtil.isNotNullOrEmpty(sysUserLoginSearchVO.getEndDate())) {
			url += "&endDate=" + sysUserLoginSearchVO.getEndDate();
		}
		return url;
	}

}
