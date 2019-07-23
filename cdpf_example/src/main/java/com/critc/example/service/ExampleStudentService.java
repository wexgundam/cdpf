package com.critc.example.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

import com.critc.example.dao.ExampleStudentDao;
import com.critc.example.model.ExampleStudent;
import com.critc.example.vo.ExampleStudentSearchVO;
import com.critc.util.date.DateUtil;
import com.critc.util.excel.Excel2007Util;
import com.critc.util.model.ComboboxVO;
import com.critc.util.string.RegexUtil;
import com.critc.util.string.StringUtil;
import com.critc.util.validate.ValidateUtil;
import com.critc.util.web.WebUtil;

/**
 * 
 * what: 学生表Service
 * 
 *
 * @author 李红 created on 2017年10月30日
 */
@Service
@Configuration
@EnableAsync
public class ExampleStudentService {
	/**
	 * 学生Dao
	 */
	@Autowired
	private ExampleStudentDao exampleStudentDao;

	/**
	 * 
	 * what: 学生列表
	 * 
	 * @param exampleStudentSearchVO 学生查询VO
	 * @return list
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public List<ExampleStudent> list(ExampleStudentSearchVO exampleStudentSearchVO) {
		List<ExampleStudent> list = exampleStudentDao.list(exampleStudentSearchVO);
		return list;
	}

	/**
	 * 
	 * what: 学生列表总数
	 * 
	 * @param exampleStudentSearchVO 学生查询VO
	 * @return int
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public int count(ExampleStudentSearchVO exampleStudentSearchVO) {
		return exampleStudentDao.count(exampleStudentSearchVO);
	}

	/**
	 * 
	 * what: 新增
	 * 
	 * @param exampleStudent exampleStudent
	 * @return flag 0、失败，1、成功，2、学号已经存在
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public int add(@Valid ExampleStudent exampleStudent) {
		int flag = 0;
		int exampleStudentCount = exampleStudentDao.getNoNum(exampleStudent.getNo());
		if (exampleStudentCount > 0) {
			flag = 2;
		} else {
			exampleStudentDao.add(exampleStudent);
			flag = 1;
		}
		return flag;
	}

	/**
	 * 
	 * what: 删除
	 * 
	 * @param isDelete 是否删除（N/Y）
	 * @return int
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public int delete(String isDelete) {
		return exampleStudentDao.delete(isDelete);
	}

	/**
	 * 
	 * what: 校验 校验文件 如果返回为空，则校验成功，否则把错误信息列出来 1、先校验表头是否一致
	 * 2、再校验数据格式是否一致，主要校验：（能否为空、数据长度、数据类型整数小数、字典项是否正确）
	 * 校验的时候如果表头错误，直接返回，如果数据有错，则继续校验，数据要校验所有行
	 * 
	 * @param uploadFilePath 上传路径
	 * @return 检验结果
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public String validateFile(String uploadFilePath) {
		// TODO Auto-generated method stub
		Map<String, String> collegemap = new HashMap<>();
		ExampleStudent exampleStudent = new ExampleStudent();
		List<ComboboxVO> collegelist = exampleStudentDao.listCollege();
		// 存入map，页面匹配得到对应id用
		for (ComboboxVO c : collegelist) {
			collegemap.put(c.getValue(), c.getContent());
		}
		// 获取上传文件表头
		String[] fileTitle = Excel2007Util.readExcelTitle(uploadFilePath, 1);
		// 定义模板表头
		String[] modelTitle = new String[] {"编号", "学号", "姓名", "性别", "身份证号", "学院--专业", "备注"};
		// 定义数据行从哪一行开始
		int dataStart = 2;
		if (fileTitle == null) {
			return "上传的为空文件！";
		}
		// 校验表头
		if (!Arrays.equals(fileTitle, modelTitle)) {
			return "上传文件与模板格式不一致！";
		}
		StringBuffer sb = new StringBuffer("");
		List<String[]> list = Excel2007Util.readExcelContent(uploadFilePath, dataStart); // 读excel数据
		if (list.size() == 0) {
			return "上传文件为空模板！";
		}
		// 定义数据行号
		int i = dataStart;
		ValidateUtil.excelOnly(list, sb, "学号");
		for (String[] str : list) {
			// 能否为空
			if (StringUtil.isNullOrEmpty(str[1])) {
				sb.append(ValidateUtil.retValidateEmpty(i, "学号", str[1]));
			}
			if (StringUtil.isNullOrEmpty(str[2])) {
				sb.append(ValidateUtil.retValidateEmpty(i, "姓名", str[2]));
			}
			// 检验学号
			// 学号是否过长
			if (str[1].length() > 12) {
				sb.append(ValidateUtil.retValidateLength(i, "学号", str[1]));
			}
			// 学号是否过短
			if (str[1].length() < 12) {
				sb.append(ValidateUtil.retValidateLength2(i, "学号", str[1]));
			}
			if (str[1].length() == 12) {
				// 学号是否合法
				if (!RegexUtil.validateStno((str[1]))) {
					sb.append(ValidateUtil.retValidateNotFormat(i, "学号", str[1]));
				} else {
					// 学号合法数字，检验是否唯一
					exampleStudent.setNo(str[1]);
					int stuCount = exampleStudentDao.getNoNum(exampleStudent.getNo());
					if (stuCount == 1) {
						sb.append(ValidateUtil.retValidateNotOnly(i, "学号", str[1]));
					}
				}
			}

			// 检验性别
			if (!(str[3].equals("男") || str[3].equals("女"))) {
				sb.append(ValidateUtil.retValiisSex(i, "性别", str[3]));
			}
			// 检验身份证号
			if (StringUtil.isNotNullOrEmpty(str[4])) {
				// 身份证号是否过长
				if (str[4].length() > 18) {
					sb.append(ValidateUtil.retValidateLength(i, "身份证号", str[4]));
				}
				// 身份证号是否过短
				if (str[4].length() < 18) {
					sb.append(ValidateUtil.retValidateLength2(i, "身份证号", str[4]));
				}
				// 身份证号是否符合规则
				if (!RegexUtil.validateIdCard(str[4])) {
					sb.append(ValidateUtil.retValidateNotFormat(i, "身份证号", str[4]));
				}
			}
			// 检验学院--专业
			if (StringUtil.isNotNullOrEmpty(str[5])) {
				// 检验学院--专业有没有“--”
				if ((str[5].indexOf("--") == -1)) {
					// 学院--专业没有“--”
					sb.append(ValidateUtil.retValisStationNotFormat(i, "学院--专业", str[5]));
				}
				// 检验学院是否存在
				if ((str[5].indexOf("--") != -1)) {
					String collegeName = str[5].substring(0, str[5].indexOf("--"));
					boolean college = collegemap.containsValue(collegeName);
					// 如果学院不存在
					if (!college) {
						sb.append(ValidateUtil.retValidateNotDw(i, "学院--专业", collegeName));
					} else {
						// 如果学院存在检查专业是否存在
						// 获取专业名称
						String majorName = str[5].substring(str[5].indexOf("--") + 2);
						// 查询学院下是否有此专业
						exampleStudent.setCollegeName(collegeName);
						exampleStudent.setMajorName(majorName);
						int count = exampleStudentDao.getMajorNumCount(exampleStudent);
						if (count == 0) {
							sb.append(ValidateUtil.retValidateNotDw(i, "学院--专业", majorName));
						}
					}
				}
			}
			i++;
		}
		return sb.toString();
	}

	/**
	 * 
	 * what: 导入
	 * 
	 * @param exampleStudentSearchVO 学生查询VO
	 * @param uploadFilePath 上传路径
	 * @return map（存放两个list，一个新添加的list，一个是添加前的list）
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	@SuppressWarnings({ "rawtypes" })
	public Map<String, Object> importFile(ExampleStudentSearchVO exampleStudentSearchVO, String uploadFilePath) {
		// TODO Auto-generated method stub
		Map<String, String> collegeMap = new HashMap<>();
		List<ComboboxVO> collegeList = exampleStudentDao.listCollege();
		// 存入map，页面匹配得到对应id用
		for (ComboboxVO c : collegeList) {
			collegeMap.put(c.getValue(), c.getContent());
		}
		// 读excel数据
		List<String[]> list = Excel2007Util.readExcelContent(uploadFilePath, 2);
		// 存放新增的学生数据
		List<ExampleStudent> listAdd = new ArrayList<>();
		// map存放要放回的数据
		Map<String, Object> map = new HashMap<>();
		//重新查一下此次导入前的列表
		List<ExampleStudent> listBefore = new ArrayList<>();
		listBefore = list(exampleStudentSearchVO);
		map.put("listBefore", listBefore);
		for (String[] str : list) {
			ExampleStudent exampleStudent = new ExampleStudent();
			// 学号
			exampleStudent.setNo(str[1]);
			// 姓名
			exampleStudent.setName(str[2]);
			// 性别
			if ("男".equals(str[3])) {
				exampleStudent.setSex("0");
			}
			if ("女".equals(str[3])) {
				exampleStudent.setSex("1");
			}
			// 身份证号
			exampleStudent.setIdcardNo(str[4]);
			// 学院
			String collegeName = str[5].substring(0, str[5].indexOf("--"));
			String collegeNo = "";
			for (Map.Entry entry : collegeMap.entrySet()) {
				if (collegeName.equals(entry.getValue())) {
					collegeNo = (String) entry.getKey();
				}
			}
			exampleStudent.setCollegeNo(collegeNo);
			// 专业
			String majorName = str[5].substring(str[5].indexOf("--") + 2);
			String majorNo = exampleStudentDao.getMajornoByMajorname(majorName);
			exampleStudent.setMajorNo(majorNo);
			exampleStudent.setCollegenameMajorname(collegeName + "--" + majorName);
			// 备注
			exampleStudent.setRemark(str[6]);
			//是否能删除
			exampleStudent.setIsDelete("Y");
			
			add(exampleStudent);
			listAdd.add(exampleStudent);
		}
		map.put("listAdd", listAdd);
		return map;
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
	public void exportList(HttpServletRequest request, HttpServletResponse response,
			ExampleStudentSearchVO exampleStudentSearchVO, String[] student_ids) {
		List<ExampleStudent> list = exampleStudentDao.deliveryList(exampleStudentSearchVO, student_ids);

		String[][] datas = new String[list.size() + 1][7];
		datas[0][0] = "编号";
		datas[0][1] = "学号";
		datas[0][2] = "姓名";
		datas[0][3] = "性别";
		datas[0][4] = "身份证号";
		datas[0][5] = "学院--专业";
		datas[0][6] = "备注";
		int i = 1;
		for (ExampleStudent exampleStudent : list) {
			datas[i][0] = i + "";
			datas[i][1] = WebUtil.getSafeStr(exampleStudent.getNo());
			datas[i][2] = WebUtil.getSafeStr(exampleStudent.getName());
			datas[i][3] = WebUtil.getSafeStr(exampleStudent.getSex().equals("0") ? "男" : "女");
			datas[i][4] = WebUtil.getSafeStr(exampleStudent.getIdcardNo());
			datas[i][5] = WebUtil.getSafeStr(exampleStudent.getCollegenameMajorname());
			datas[i][6] = WebUtil.getSafeStr(exampleStudent.getRemark());
			i++;
		}
		String report_name = "";
		report_name = DateUtil.getSystemDate() + "学生信息汇总";
		Excel2007Util.writeExcel(datas, report_name, response);
	}

	/**
	 * 
	 * what: 查询学院列表
	 * 
	 * @return list
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public List<ComboboxVO> listCollege() {
		return exampleStudentDao.listCollege();
	}

	/**
	 * 
	 * what: 根据学院编号查询专业列表
	 * 
	 * @param collegeNo 学院编号
	 * @return list
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public List<ComboboxVO> listMajor(String collegeNo) {
		return exampleStudentDao.listMajor(collegeNo);
	}

}
