/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:core
 */
package com.critc.core.interceptor;

import com.critc.util.json.JsonUtil;
import com.critc.util.session.SessionUtil;
import com.critc.util.session.UserSession;
import com.critc.util.string.StringUtil;
import com.critc.util.web.WebUtil;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * what: 校验是否登录的拦截器,未登录直接跳转至登录页面
 * 
 *
 * @author 孔垂云 created on 2017年6月13日
 */
public class CheckLoginInterceptor implements HandlerInterceptor {
    /**
     * 
     * why:  接口实现类
     * how:  操作前先判断是否登录，未登录跳转到登录界面
     * @see org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)
     *
     * @param request request
     * @param response response
     * @param handler 处理器
     * @return boolean
     * @throws Exception Exception
     *
     * @author 孔垂云 created on 2017年6月13日
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        UserSession userSession = SessionUtil.getUserSession(request);
        if (userSession == null) {
            boolean isAjaxRequest = StringUtil.checkAjaxRequest(request);
            if (isAjaxRequest) {
                WebUtil.out(response, JsonUtil.createOperaStr(false, "连接超时，请重新登录!"));
            } else {
                String str = "<script>top.location.href='" + request.getContextPath() + "/'</script>";
                WebUtil.out(response, str);
            }
            return false;
        } else {
            return true;
        }

    }
    
    /**
	 * 
	 * why:继承接口实现类
	 * @see org.springframework.web.servlet.HandlerInterceptor#postHandle(javax.servlet.http.HttpServletRequest, 
	 * javax.servlet.http.HttpServletResponse, java.lang.Object, org.springframework.web.servlet.ModelAndView)
	 *
	 * @param request request
	 * @param response response
	 * @param handler handler
	 * @param modelAndView modelAndView
	 * @throws Exception Exception
	 *
	 * @author 孔垂云 created on 2017年11月14日
	 */
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    /**
	 * 
	 * why: 继承接口实现类
	 * @see org.springframework.web.servlet.HandlerInterceptor#afterCompletion(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, java.lang.Exception)
	 *
	 * @param request request
	 * @param response response
	 * @param handler handler
	 * @param ex ex
	 * @throws Exception Exception
	 *
	 * @author 孔垂云 created on 2017年6月13日
	 */
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }

}
