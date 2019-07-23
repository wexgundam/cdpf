package com.critc.example.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.critc.util.code.RandomCodeUtil;
import com.critc.util.image.VerifyCodeUtil;
import com.critc.util.json.JsonUtil;
import com.critc.util.string.StringUtil;
import com.critc.util.web.WebUtil;

/**
 * 
 * what: 验证码示例代码跳转
 *
 * @author 孙超 created on 2017年10月31日
 */
@Controller
@RequestMapping("/example/identifyingcode")
public class ExampleIdentifyingCodeController {
	@Autowired
	private RedisTemplate<Object, Object> redisTemplate;

	/**
	 * 
	 * what: 随机生成一个验证码，存入Redis中，并返回给页面
	 * 
	 * @param response response 
	 * @throws Exception
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@RequestMapping("/identifyingCodeGet")
	public void identifyingCodeGet(HttpServletResponse response) throws Exception {
		int timeout = 20;
		String code = RandomCodeUtil.createRandomCode(6);
		redisTemplate.opsForValue().set("identifyingCode", code, timeout, TimeUnit.SECONDS);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "发送的验证码为：" + redisTemplate.opsForValue().get("identifyingCode"));
		WebUtil.out(response, JsonUtil.toStr(map));
	}

	/**
	 * 
	 * what: 将文本框中的数据作为key，从redis中获取验证码
	 * 
	 * @param data 前台文本框的值
	 * @param response
	 * @throws Exception
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@RequestMapping("/getMessage")
	public void getMessage(String data, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String code = (String) redisTemplate.opsForValue().get("identifyingCode");
		if (StringUtil.isNullOrEmpty(code)) {
			map.put("code", "");
		} else {
			map.put("code", code.equals(data));
		}
		WebUtil.out(response, JsonUtil.toStr(map));
	}

	/**
	 * 
	 * what: 跳转到验证码示例首页
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
		mv.setViewName("example/identifyingcode/index");
		return mv;
	}

	/**
	 * 
	 * what: 获取验证码图片
	 * 
	 * @param request
	 * @param response
	 * @param par 需要生成的验证码类型  1.字母+数字 2.字母 3.数字 4.汉字 5.算术
	 * @throws IOException
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@RequestMapping("/charactersIdentifying")
	public void charactersIdentifying(HttpServletRequest request, HttpServletResponse response, String par) throws IOException {
		int para = Integer.parseInt(par);
		// 生成随机字串
		String verifyCode = VerifyCodeUtil.generateVerifyCode(4, para);
		// 存入会话session
		HttpSession session = request.getSession(true);
		// 删除以前的
		if (para == 5) {
			session.removeAttribute("sumsIdentifying");
			session.setAttribute("sumsIdentifying", VerifyCodeUtil.getSumCode(verifyCode));
		} else if (para == 4) {
			session.removeAttribute("charactersIdentifying");
			session.setAttribute("charactersIdentifying", verifyCode.toLowerCase());
		} else if (para == 3) {
			session.removeAttribute("numberIdentifying");
			session.setAttribute("numberIdentifying", verifyCode.toLowerCase());
		} else if (para == 2) {
			session.removeAttribute("englishIdentifying");
			session.setAttribute("englishIdentifying", verifyCode.toLowerCase());
		} else if (para == 1) {
			session.removeAttribute("numberandenglishIdentifying");
			session.setAttribute("numberandenglishIdentifying", verifyCode.toLowerCase());
		}
		// 生成图片s
		int w = 300, h = 80;
		VerifyCodeUtil.outputImage(w, h, response.getOutputStream(), verifyCode);
	}

	/**
	 * 
	 * what: 验证码验证
	 * 
	 * @param para 验证码类型  1.字母+数字 2.字母 3.数字 4.汉字 5.算术
	 * @param code 文本框输入的值
	 * @param request
	 * @param response
	 *
	 * @author 孙超 created on 2017年10月31日
	 */
	@RequestMapping("/valicateCharIdentifying")
	public void valicateCharIdentifying(Integer para, String code, HttpServletRequest request, HttpServletResponse response) {
		String v_code = null;
		if (para == 5) {
			v_code = (String) request.getSession().getAttribute("sumsIdentifying");
		} else if (para == 4) {
			v_code = (String) request.getSession().getAttribute("charactersIdentifying");
		} else if (para == 3) {
			v_code = (String) request.getSession().getAttribute("numberIdentifying");
		} else if (para == 2) {
			v_code = ((String) request.getSession().getAttribute("englishIdentifying")).toLowerCase();
		} else if (para == 1) {
			v_code = ((String) request.getSession().getAttribute("numberandenglishIdentifying")).toLowerCase();
		}
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		if (StringUtil.isNotNullOrEmpty(v_code) && code != null) {
			if (v_code.equals(code.toLowerCase())) {
				jsonMap.put("result", true);
				WebUtil.out(response, JsonUtil.toStr(jsonMap));
			} else {
				jsonMap.put("result", false);
				WebUtil.out(response, JsonUtil.toStr(jsonMap));
			}
		} else {
			jsonMap.put("result", false);
			WebUtil.out(response, JsonUtil.toStr(jsonMap));
		}
	}

}
