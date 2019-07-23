package com.critc.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.critc.core.dao.BaseDao;
import com.critc.sys.model.SysDepartment;
import com.critc.util.model.ComboboxVO;
import com.critc.util.string.StringUtil;

/**
 * 
 * what: 部门Dao
 * 
 *
 * @author 李红 created on 2017年10月30日
 */
@Repository
public class SysDepartmentDao extends BaseDao<SysDepartment, SysDepartment> {

	/**
	 * 
	 * what: 新增
	 * 
	 * @param SysDepartment sysDepartment
	 * @return int
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public int add(SysDepartment sysDepartment) {
		String sql = "insert into t_sys_department(id,name,parent_id,type,code,display_order,note,created_by,created_at,last_modified_by,last_modified_at)"
				+ " values(seq_t_sys_Department.nextval,:name,:parentId,:type,:code,:displayOrder,:note,:createdBy,sysdate,:lastModifiedBy,sysdate)";
		return insert(sql, sysDepartment);
	}

	/**
	 * 
	 * what: 修改
	 *  
	 * @param SysDepartment sysDepartment
	 * @return int
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public int update(SysDepartment sysDepartment) {
		String sql = "update t_sys_department set name=:name,parent_id=:parentId,type=:type,code=:code,"
				+ "display_order=:displayOrder,note=:note,last_modified_by=:lastModifiedBy,last_modified_at=sysdate where id=:id";
		return update(sql, sysDepartment);
	}

	/**
	 * 
	 * what: 删除
	 * 
	 * @param id 部门id
	 * @return int
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public int delete(int id) {
		String sql = "delete from t_sys_department where id=?";
		return delete(sql, id);
	}

	/**
	 * 
	 * what: 根据id获取
	 * 
	 * @param id 部门id
	 * @return  根据id查询的对象
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public SysDepartment get(int id) {
		String sql = "select t.id,t.name,t.parent_id,t.type,t.code,t.display_order,t.note,t.created_by,t.created_at,t.last_modified_by,t.last_modified_at,"
				+ "(select name from t_sys_department where id=t.parent_id) parentName,"
				+ "(select name from t_sys_dic where category='DEPARTMENT_TYPE' and code = type) typeName "
				+ "from t_sys_department t where id=?";
		return get(sql, id);
	}

	/**
	 * 
	 * what: 按部门名称查询
	 * 
	 * @param sysDepartment sysDepartment
	 * @return int
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public int getNameNum(SysDepartment sysDepartment) {
		String sql = "select count(*) from t_sys_department where name = :name";
		if (StringUtil.isNotNullOrEmpty(String.valueOf(sysDepartment.getId()))) {
			sql += " and id != :id";
		}
		return count(sql, sysDepartment);
	}

	/**
	 * 
	 * what: 获取所有部门
	 * 
	 * @return list
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public List<SysDepartment> list() {
		String sql = "select t.id,t.name,t.parent_id,t.type,t.code,t.display_order,t.note,t.created_by,t.created_at,t.last_modified_by,t.last_modified_at,"
				+ "(select count(*) from t_sys_department where parent_id=t.id) cnt,"
				+ "(select name from t_sys_department where id=t.parent_id)parentName,"
				+ "(select name from t_sys_dic where category='DEPARTMENT_TYPE' and code = type) typeName "
				+ " from t_sys_department t order by parent_id, display_order";
		return list(sql);
	}

	/**
	 * 
	 * what: 获取下级部门总数
	 * 
	 * @param id 部门id
	 * @return int
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	public int getChildCount(int id) {
		String sql = "select count(*) from t_sys_department where parent_id=?";
		return count(sql, id);
	}

}
