package com.critc.example.service;

import com.critc.example.dao.ExampleTreeGridDao;
import com.critc.example.model.ExampleTreeGrid;
import com.critc.util.string.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * TreeGrid示例Service
 *
 * @author 马丽静
 * @date 2017年10月12日
 */
@Service
public class ExampleTreeGridService {

	@Autowired
	private ExampleTreeGridDao exampleTreeGridDao;

	/**
	 * 新增前判断代码是否唯一
	 *
	 * @param exampleTreeGrid
	 * @return
	 */
	public int add(ExampleTreeGrid exampleTreeGrid) {
		// 判断代码是否一致
		ExampleTreeGrid exist = exampleTreeGridDao.getByModuleCode(exampleTreeGrid.getCode());
		if (exist != null)
			return 2;
		else
			return exampleTreeGridDao.add(exampleTreeGrid);
	}

	public int update(ExampleTreeGrid exampleTreeGrid) {
		return exampleTreeGridDao.update(exampleTreeGrid);
	}

	/**
	 * 删除节点，先判断是否有下级节点，有的话提示不允许删除
	 *
	 * @param id
	 * @return
	 */
	public int delete(int id) {
		if (exampleTreeGridDao.getChildCount(id) > 0)
			return 2;
		else {
			return exampleTreeGridDao.delete(id);
		}
	}

	public ExampleTreeGrid get(int id) {
		return exampleTreeGridDao.get(id);
	}

	/**
	 * 生成树结构，用于显示treeGrid
	 *
	 * @return
	 */
	public List<ExampleTreeGrid> list() {
		List<ExampleTreeGrid> list = exampleTreeGridDao.list();// 获取所有模块
		List<ExampleTreeGrid> listRet = new ArrayList<>();
		listRet = createModuleList(list, listRet, 0);
		return listRet;
	}

	private List<ExampleTreeGrid> createModuleList(List<ExampleTreeGrid> list, List<ExampleTreeGrid> listRet,
			int parentId) {
		for (ExampleTreeGrid sysModule : list) {
			if (sysModule.getParentId() == parentId) {
				listRet.add(sysModule);
				if (sysModule.getCnt() > 0) {
					listRet = createModuleList(list, listRet, sysModule.getId());
				}
			}
		}
		return listRet;
	}

	/**
	 * 根据父节点获取子节点个数
	 * 
	 * @param id
	 * @return
	 */
	public int getChildCount(int id) {
		return exampleTreeGridDao.getChildCount(id);
	}


	/**
	 * 生成Ztree的树节点,新增模块时使用，只有模块上下级
	 *
	 * @return
	 */
	public String createZtreeByModule() {
		List<ExampleTreeGrid> listModule = exampleTreeGridDao.list();// 模块列表
		StringBuilder sb = new StringBuilder();
		for (ExampleTreeGrid sysModule : listModule) {
			sb.append("{id : \"" + sysModule.getId() + "\",pId :\"" + sysModule.getParentId() + "\",name :\""
					+ sysModule.getName() + "\",open : false");
			sb.append("},");
		}
		return StringUtil.subTract(sb.toString());
	}

}
