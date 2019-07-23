package com.critc.example.dao;

import com.critc.core.dao.BaseDao;
import com.critc.example.model.ExampleTreeGrid;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * TreeGrid示例Dao
 *
 * @author 马丽静
 * @date 2017年9月29日
 */
@Repository
public class ExampleTreeGridDao extends BaseDao<ExampleTreeGrid, ExampleTreeGrid> {

    /**
     * 新增
     *
     * @param exampleTreeGrid
     * @return
     */
    public int add(ExampleTreeGrid exampleTreeGrid) {
        String sql = "insert into t_tree_grid(id,name,code,parent_id,display_order,description,col1,col2)" +
                " values(seq_t_tree_grid.nextval,:name,:code,:parentId,:displayOrder,:description,:col1,:col2)";
        return insert(sql, exampleTreeGrid);
    }

    /**
     * 修改
     *
     * @param exampleTreeGrid
     * @return
     */
    public int update(ExampleTreeGrid exampleTreeGrid) {
        String sql = "update t_tree_grid set name=:name,code=:code,parent_id=:parentId,display_order=:displayOrder,description=:description,col1=:col1,col2=:col2 where id=:id";
        return update(sql, exampleTreeGrid);
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    public int delete(int id) {
        String sql = "delete from t_tree_grid where id=?";
        return delete(sql, id);
    }

 

    /**
     * 根据id获取
     *
     * @param id
     * @return
     */
    public ExampleTreeGrid get(int id) {
        String sql = "select t.id,t.name,t.code,t.parent_id,t.display_order,t.description,col1,col2,(select name from t_tree_grid where id=t.parent_id) parent_name from t_tree_grid t where id=?";
        return get(sql, id);
    }

    /**
     * 获取所有节点
     *
     * @return
     */
    public List<ExampleTreeGrid> list() {
        String sql = "select t.id,t.name,t.code,t.parent_id,t.col1,t.col2,t.display_order,t.description,(select count(*) from t_tree_grid where parent_id=t.id) cnt,(select name from t_tree_grid where id=t.parent_id)parentName" +
                " from t_tree_grid t order by parent_id, display_order";
        return list(sql);
    }

    /**
     * 获取下级节点总数
     *
     * @param id
     * @return
     */
    public int getChildCount(int id) {
        String sql = "select count(*) from t_tree_grid where parent_id=? ";
        return count(sql, id);
    }


    /**
     * 根据节点代码获取节点信息
     *
     * @param code
     * @return
     */
    public ExampleTreeGrid getByModuleCode(String code) {
        String sql = "select t.id,t.name,t.code,t.parent_id,t.display_order,t.description from t_tree_grid t where code=?";
        return get(sql, code);
    }



}
