package com.critc.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.critc.example.model.ExampleTreeGrid;
import com.critc.example.service.ExampleTreeGridService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.critc.core.pub.PubConfig;
import com.critc.util.code.GlobalCode;
import com.critc.util.string.BackUrlUtil;
import com.critc.util.string.StringUtil;

/**
 * TreeGrid示例Controller
 *
 * @author 马丽静
 * @date 2017年9月29日
 */
@Controller
@RequestMapping("/example/treegrid")
public class ExampleTreeGridController {
	@Autowired
	private PubConfig pubConfig;
	@Autowired
	private ExampleTreeGridService exampleTreeGridService;

	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("example/treegrid/index");
		List<ExampleTreeGrid> list = exampleTreeGridService.list();
		mv.addObject("list", list);// 把获取的记录放到mv里面
		String url = pubConfig.getDynamicServer() + "/example/treegrid/index.htm?";
		mv.addObject("backUrl", StringUtil.encodeUrl(url));
		return mv;
	}

	/**
	 * 跳转至新增节点页面
	 *
	 * @param request
	 * @param response
	 * @param exampleTreeGrid
	 * @return
	 */
	@RequestMapping("/toAdd")
	public ModelAndView toAdd(HttpServletRequest request, HttpServletResponse response,
			ExampleTreeGrid exampleTreeGrid) {
		ModelAndView mv = new ModelAndView();
		String ztree = exampleTreeGridService.createZtreeByModule();// 节点列表
		mv.addObject("ztree", ztree);
		if (exampleTreeGrid.getParentId() != null && exampleTreeGrid.getParentId() != 0) {
			ExampleTreeGrid parent = exampleTreeGridService.get(exampleTreeGrid.getParentId());
			exampleTreeGrid.setParentName(parent.getName());
		}
		mv.addObject("TreeGrid", exampleTreeGrid);
		mv.setViewName("example/treegrid/add");
		BackUrlUtil.setBackUrl(mv, request);// 设置返回的url
		return mv;
	}

	/**
	 * 跳转至修改节点页面
	 *
	 * @param request
	 * @param response
	 * @param id
	 * @return
	 */
	@RequestMapping("/toUpdate")
	public ModelAndView toUpdate(HttpServletRequest request, HttpServletResponse response, int id) {
		ModelAndView mv = new ModelAndView();
		ExampleTreeGrid exampleTreeGrid = exampleTreeGridService.get(id);
		String ztree = exampleTreeGridService.createZtreeByModule();
		mv.addObject("ztree", ztree);
		mv.addObject("TreeGrid", exampleTreeGrid);
		mv.setViewName("example/treegrid/update");
		BackUrlUtil.setBackUrl(mv, request);// 设置返回的url
		return mv;
	}

	/**
	 * 保存新增节点
	 * 
	 * @param request
	 * @param response
	 * @param exampleTreeGrid
	 * @return
	 */
	@RequestMapping("/add")
	public String add(HttpServletRequest request, HttpServletResponse response, ExampleTreeGrid exampleTreeGrid) {
		if (exampleTreeGrid.getParentId() == null)
			exampleTreeGrid.setParentId(0);
		int flag = exampleTreeGridService.add(exampleTreeGrid);
		if (flag == 0)
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		else if (flag == 2)
			return "forward:/error.htm?resultCode=" + GlobalCode.CODEEXIST_FAILURE;
		else
			return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;
	}

	/**
	 * 保存修改节点
	 *
	 * @param request
	 * @param response
	 * @param exampleTreeGrid
	 * @return
	 */
	@RequestMapping("/update")
	public String update(HttpServletRequest request, HttpServletResponse response, ExampleTreeGrid exampleTreeGrid) {
		if (exampleTreeGrid.getParentId() == null)
			exampleTreeGrid.setParentId(1);
		if (exampleTreeGrid.getId() == exampleTreeGrid.getParentId()) {
			return "forward:/error.htm?resultCode=20101";// 不能和上级节点一样
		} else {
			int flag = exampleTreeGridService.update(exampleTreeGrid);
			if (flag == 0)
				return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;// 修改失败
			else if (flag == 2)
				return "forward:/error.htm?resultCode=20102";// 上级节点不存在
			else
				return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;// 修改成功
		}
	}

	/**
	 * 删除节点
	 *
	 * @param request
	 * @param response
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, HttpServletResponse response, int id) {
		int flag = exampleTreeGridService.delete(id);
		if (flag == 0)
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;// 删除失败
		else if (flag == 2)
			return "forward:/error.htm?resultCode=20103";// 还有下级节点，不能删除
		else
			return "forward:/success.htm?resultCode=" + GlobalCode.DELETE_SUCCESS;// 删除成功
	}

}
