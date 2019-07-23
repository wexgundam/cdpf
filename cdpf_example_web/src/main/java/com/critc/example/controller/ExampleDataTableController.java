package com.critc.example.controller;

import com.critc.core.pub.PubConfig;
import com.critc.example.service.ExampleDataTableService;
import com.critc.util.json.JsonUtil;
import com.critc.util.string.StringUtil;
import com.critc.util.web.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * 
 * what: DataTable代码示例
 * 
 *
 * @author 郭飞 created on 2017年11月2日
 */
@Controller
@RequestMapping("/example/datatable")
public class ExampleDataTableController {
	/**
	 *   ExampleDataTableService
	 */
	@Autowired
	private ExampleDataTableService exampleDataTableService;
	/**
	 * 全局配置类
	 */
	@Autowired
	private PubConfig pubConfig;

	/**
	 * 
	 * what: 进入首页
	 * @return ModelAndView
	 * @param  request request
	 * @author 郭飞 created on 2017年11月2日
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("/example/datatable/index");	
		String backUrl = pubConfig.getDynamicServer() + "/example/datatable/index.htm?";			
		String url = pubConfig.getDynamicServer() + "/example/datatable/index.htm?";
		mv.addObject("backUrl", StringUtil.encodeUrl(url));
		return mv;
	}

	/**
	 *  获取数据
	 * @param request request
	 * @param response response
	 * @author 郭飞 created on 2017年11月17日
	 */
	@RequestMapping("/getData")
	public void   getData(HttpServletRequest request, HttpServletResponse response) {
	
		ArrayList<Map<String, Object>> data = exampleDataTableService.getData();		
		String json = JsonUtil.toStr(data);
	    String json2 = "{ \"data\": " + json + "}";
		WebUtil.out(response, json2);
		
	}
	/**
	 * 
	 * what: 删除数据
	 * 
	 * @param request request
	 * @param id 删除对象id
	 * @param response response
	 * @return
	 *
	 * @author 郭飞 created on 2017年11月2日
	 */
	@RequestMapping("/deleteData")
	public void deleteData(HttpServletRequest request, HttpServletResponse response, String id) {

		if (exampleDataTableService.deleteData(id)) {
			WebUtil.out(response, "删除成功");
		}

	}
   
	/**
	 * 
	 * what:    添加数据
	 * 
	 * @param request request
	 * @param response response
	 *
	 * @author 郭飞 created on 2017年11月9日
	 */
	@RequestMapping("/addData")
	public void addData(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String roleName = request.getParameter("roleName");
		String partement = request.getParameter("partement");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("name", name);
		map.put("roleName", roleName);
		map.put("partement", partement);
		exampleDataTableService.getData().add(map);
		WebUtil.out(response, "保存成功");

	}

	/**
	 * 
	 * what:   修改数据
	 * 
	 * @param request request
	 * @param response response
	 *
	 * @author 郭飞 created on 2017年11月9日
	 */
	@RequestMapping("/updateData")
	public void updateData(HttpServletRequest request, HttpServletResponse response) {
		String oldId = request.getParameter("oldId");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String roleName = request.getParameter("roleName");
		String partement = request.getParameter("partement");

		exampleDataTableService.updateData(oldId, id, name, roleName, partement);
		WebUtil.out(response, "修改成功");

	}
}
