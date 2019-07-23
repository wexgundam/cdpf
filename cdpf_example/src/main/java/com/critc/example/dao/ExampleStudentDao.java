package com.critc.example.dao;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.critc.core.dao.BaseDao;
import com.critc.example.model.ExampleStudent;
import com.critc.example.vo.ExampleStudentSearchVO;
import com.critc.util.model.ComboboxVO;
import com.critc.util.page.PageUtil;
import com.critc.util.string.StringUtil;

/**
 * 
 * what: 学生表Dao
 * 
 *
 * @author 李红 created on 2017年10月30日
 */
@Repository
public class ExampleStudentDao extends BaseDao<ExampleStudent, ExampleStudentSearchVO> {

	/**
	 * 
	 * what: 查询
	 * 
	 * @param exampleStudentSearchVO 学生查询VO
	 * @return list
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public List<ExampleStudent> list(ExampleStudentSearchVO exampleStudentSearchVO) {
		String sql = "select t.* ,(select m.college_name ||'--'|| m.name from t_example_major m where m.no = t.major_no) collegenameMajorname"
				+ " from t_example_student t  where 1 = 1";
		sql += createSearchSql(exampleStudentSearchVO);
		sql += " order by id desc";
		sql = PageUtil.createOraclePageSQL(sql, exampleStudentSearchVO.getPageIndex());
		return list(sql, exampleStudentSearchVO);
	}

	/**
	 * 
	 * what: 按学号查询
	 * 
	 * @param no 学号
	 * @return int
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public int getNoNum(String no) {
		String sql = "select count(*) from t_example_student t where t.no = ?";
		return count(sql, no);
	}

	/**
	 * 
	 * what: 查询总数
	 * 
	 * @param exampleStudentSearchVO 学生查询VO
	 * @return int
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public int count(ExampleStudentSearchVO exampleStudentSearchVO) {
		String sql = "select count(*) from t_example_student where 1=1 ";
		sql += createSearchSql(exampleStudentSearchVO);
		return count(sql, exampleStudentSearchVO);
	}

	/**
	 * 
	 * what: 新增
	 * 
	 * @param exampleStudent exampleStudent
	 * @return int
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public int add(ExampleStudent exampleStudent) {
		String sql = "insert into t_example_student(id,no,name,sex,idcard_no,college_no,major_no,remark,isDelete)"
				+ " values(seq_t_example_student.nextval,:no,:name,:sex,:idcardNo,:collegeNo,:majorNo,:remark,:isDelete)";
		return insert(sql, exampleStudent);
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
		String sql = "delete from t_example_student where isDelete = ? ";
		return delete(sql, isDelete);
	}

	/**
	 * 
	 * what: 判断查询条件
	 * 
	 * @param exampleStudentSearchVO 学生查询VO
	 * @return sql
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	private String createSearchSql(ExampleStudentSearchVO exampleStudentSearchVO) {
		String sql = "";
		if (StringUtil.isNotNullOrEmpty(exampleStudentSearchVO.getNo())) {
			sql += " and no = :no";
		}
		if (StringUtil.isNotNullOrEmpty(exampleStudentSearchVO.getName())) {
			sql += " and name like :nameStr";
		}
		if (StringUtil.isNotNullOrEmpty(exampleStudentSearchVO.getCollegeNo())) {
			sql += " and college_no = :collegeNo";
		}
		if (StringUtil.isNotNullOrEmpty(exampleStudentSearchVO.getMajorNo())) {
			sql += " and major_no = :majorNo";
		}
		return sql;
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
		String sql = "select no value, name content from t_example_college";
		return listCombobox(sql);
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
		String sql = "select no value, name content from t_example_major where college_no = ?";
		return listCombobox(sql, collegeNo);
	}

	/**
	 * 
	 * what: 根据学院编号，专业名称查询专业编号
	 * 
	 * @param majorName 专业名称
	 * @return 专业编号
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public String getMajornoByMajorname(String majorName) {
		String sql = "select no from t_example_major where name = ?";
		return get(sql, majorName).getNo();
	}

	/**
	 * 
	 * what: 根据学院名称查询是否有此专业
	 * 
	 * @param exampleStudent exampleStudent
	 * @return int
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public int getMajorNumCount(ExampleStudent exampleStudent) {
		String sql = "select count(*) from t_example_major where college_name = ? and name = ?";
		Object[] objects = new Object[] {exampleStudent.getCollegeName(), exampleStudent.getMajorName() };
		return count(sql, objects);

	}

	/**
	 * 
	 * what: Excel导出 查询
	 * 
	 * @param exampleStudentSearchVO 学生查询VO
	 * @param student_ids 选中的学生id数组
	 * @return list
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public List<ExampleStudent> deliveryList(ExampleStudentSearchVO exampleStudentSearchVO, String[] student_ids) {
		String sql = "select t.* ,(select m.college_name ||'--'|| m.name from t_example_major m where m.no = t.major_no) collegenameMajorname"
				+ " from t_example_student t  where 1 = 1";
		if (student_ids != null && student_ids.length > 0) {
			exampleStudentSearchVO.setStudents(Arrays.asList(student_ids));
			sql += " and t.no in (:students)";
		}
		sql += createSearchSql(exampleStudentSearchVO);
		sql += " order by id desc";
		sql = PageUtil.createOraclePageSQL(sql, exampleStudentSearchVO.getPageIndex());
		return list(sql, exampleStudentSearchVO);
	}
}
