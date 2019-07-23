package com.critc.example.model;

/**
 * TreeGrid示例
 *
 * @author 马丽静
 * @date 2017年9月29日
 */
public class ExampleTreeGrid {
	private int id;// 编号
	private String name;// 节点名称
	private String code;// 节点代码
	private Integer parentId;// 上级节点id
	private String parentName;// 上级节点名称
	private String description;// 描述
	private int displayOrder;// 排序
	private int cnt;// 子节点数量
	private String col1;// 属性1
	private String col2;// 属性2

	@Override
	public String toString() {
		return "ExampleTreeGrid [id=" + id + ", name=" + name + ", code=" + code + ", parentId=" + parentId
				+ ", parentName=" + parentName + ", description=" + description + ", displayOrder=" + displayOrder
				+ ", cnt=" + cnt + ", col1=" + col1 + ", col2=" + col2 + "]";
	}

	public String getCol1() {
		return col1;
	}

	public void setCol1(String col1) {
		this.col1 = col1;
	}

	public String getCol2() {
		return col2;
	}

	public void setCol2(String col2) {
		this.col2 = col2;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
