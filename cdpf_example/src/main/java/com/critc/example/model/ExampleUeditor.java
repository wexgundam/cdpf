/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:example
 */
package com.critc.example.model;

/**
 * 
 * what: ueditor 示例. <br/>
 *
 * @author 刘正荣 created on 2017年11月3日
 */
public class ExampleUeditor {

	private int id; // 主键

	private String description; // 描述

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "ExampleUeditor [id=" + id + ", description=" + description + "]";
	}

}
