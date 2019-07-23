/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:example
 */
package com.critc.example.model;

/**
 * 
 * what: 基本的ztree 节点. <br/>
 *
 * @author 刘正荣 created on 2017年11月3日
 */
public class ZtreeNode {

	private int id; // 主键
	private int pId; // 父节点
	private String name; // 名称

	public ZtreeNode() {
	}

	public ZtreeNode(int id, int pId, String name) {
		super();
		this.id = id;
		this.pId = pId;
		this.name = name;
	}

	public ZtreeNode(int pId, String name) {
		super();
		this.pId = pId;
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "ZtreeNode [id=" + id + ", pId=" + pId + ", name=" + name + "]";
	}

}
