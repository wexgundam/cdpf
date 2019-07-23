package com.critc.example.vo;


import java.util.List;

import com.critc.util.page.PageSearchVO;

/**
 * 学生表查询VO
 *
 * @author 李红
 * @date 2017-09-29
 */
/**
 * 
 * what:    学生表查询条件
 * 
 *
 * @author 李红 created on 2017年11月14日
 */
public class ExampleStudentSearchVO extends PageSearchVO {
	/**
	 * 学号
	 */
	private String no;
	/**
	 * 姓名
	 */
	private String name;
	/**
	 * 导出是复选框，存数组
	 */
    private List<String> students;
    /**
     * 学院编号
     */
    private String collegeNo;
    /**
     * 专业编号
     */
	private String majorNo;
    public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	//姓名模糊查询
	public String getNameStr() {
	    return "%" + name + "%";
	}

	public List<String> getStudents() {
		return students;
	}

	public void setStudents(List<String> students) {
		this.students = students;
	}

	public String getCollegeNo() {
		return collegeNo;
	}

	public void setCollegeNo(String collegeNo) {
		this.collegeNo = collegeNo;
	}

	public String getMajorNo() {
		return majorNo;
	}

	public void setMajorNo(String majorNo) {
		this.majorNo = majorNo;
	}

	@Override
	public String toString() {
		return "ExampleStudentSearchVO {"
				+ "no='" + no +  '\''
				+ ", name='" + name + '\''
				+ ", collegeNo='" + collegeNo + '\''
				+ ", majorNo='" + majorNo + '\''
				+ '}';
	}
  
}
