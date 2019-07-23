package com.critc.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.critc.core.pub.PubConfig;
import com.critc.example.model.ExampleStudent;
import com.critc.example.service.ExampleStudentService;
import com.critc.example.vo.ExampleStudentSearchVO;
import com.critc.util.json.JsonUtil;
import com.critc.util.page.PageNavigate;
import com.critc.util.string.BackUrlUtil;
import com.critc.util.string.StringUtil;
import com.critc.util.web.WebUtil;

/**
 * 
 * what: EXCEL导出Controller
 * 
 *
 * @author 李红 created on 2017年10月30日
 */
@RequestMapping("/example/excelExport")
@Controller
public class ExampleExcelExportController {
	/**
	 * 全局参数配置
	 */
	@Autowired
	private PubConfig pubConfig;
	/**
	 * 学生Service
	 */
	@Autowired
	private ExampleStudentService exampleStudentService;
	/**
	 * 
	 * what: 进入Excel导出首页
	 * 
	 * @param request request
	 * @param response response
	 * @param exampleStudentSearchVO 学生查询VO
	 * @return Excel导出首页
	 *
	 * @author 李红 created on 2017年11月13日
	 */
	@RequestMapping("/index")
	private ModelAndView index(HttpServletRequest request, HttpServletResponse response, ExampleStudentSearchVO exampleStudentSearchVO) {
		ModelAndView mv = new ModelAndView();
		List<ExampleStudent> list = exampleStudentService.list(exampleStudentSearchVO);
		mv.setViewName("/example/excelexport/index");
		// 把获取的记录放到mv里面
		mv.addObject("list", list);
		mv.addObject("listCollege", exampleStudentService.listCollege());
		mv.addObject("listMajor", exampleStudentService.listMajor(exampleStudentSearchVO.getCollegeNo()));
		String url = createUrl(exampleStudentSearchVO);
		// 分页
		// 获取查询总数
		int recordCount = exampleStudentService.count(exampleStudentSearchVO);
		// 定义分页对象
		PageNavigate pageNavigate = new PageNavigate(url, exampleStudentSearchVO.getPageIndex(), recordCount);
		// 设置分页的变量
		mv.addObject("pageNavigate", pageNavigate);
		// 设置返回url
		BackUrlUtil.createBackUrl(mv, request, url);
		return mv;
	}

	/**
	 * 
	 * what: 设置分页url，一般有查询条件的才会用到
	 * 
	 * @param exampleStudentSearchVO 学生查询VO
	 * @return url
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	private String createUrl(ExampleStudentSearchVO exampleStudentSearchVO) {
		String url = pubConfig.getDynamicServer() + "/example/excelexport/index.htm?";
		if (StringUtil.isNotNullOrEmpty(exampleStudentSearchVO.getNo())) {
			url += "&no=" + exampleStudentSearchVO.getNo();
		}
		// 如果为模糊查询，要把该字段encode
		if (StringUtil.isNotNullOrEmpty(exampleStudentSearchVO.getName())) {
			url += "&name=" + exampleStudentSearchVO.getName();
		}
		if (StringUtil.isNotNullOrEmpty(exampleStudentSearchVO.getCollegeNo())) {
			url += "&collegeNo=" + exampleStudentSearchVO.getCollegeNo();
		}
		if (StringUtil.isNotNullOrEmpty(exampleStudentSearchVO.getMajorNo())) {
			url += "&majorNo=" + exampleStudentSearchVO.getMajorNo();
		}
		return url;
	}

	/**
	 * 
	 * what: 二级联动，根据学院查询专业
	 * 
	 * @param request request
	 * @param response response
	 * @param collegeNo 学院编号
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	@RequestMapping(value = "/listMajor")
	@ResponseBody
	private void listMajor(HttpServletRequest request, HttpServletResponse response, String collegeNo) {
		WebUtil.out(response, JsonUtil.toStr(exampleStudentService.listMajor(collegeNo)));
	}

	/**
	 * 
	 * what: EXCEL导出
	 * 
	 * @param request request
	 * @param response response
	 * @param exampleStudentSearchVO 学生查询VO
	 * @param student_ids 选中的学生id数组
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	@RequestMapping("/exportList")
	public void exportList(HttpServletRequest request, HttpServletResponse response,
			ExampleStudentSearchVO exampleStudentSearchVO, String[] student_ids) {
		exampleStudentService.exportList(request, response, exampleStudentSearchVO, student_ids);
	}
}
