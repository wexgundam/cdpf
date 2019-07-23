/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:example
 */
package com.critc.example.model;

import java.util.Arrays;

/**
 * 
 * what: 连续数据 . <br/>
 *
 * @author 刘正荣 created on 2017年11月3日
 */
public class SeriesData {

	private String name; // 数据项名称

	private String[] value; // [0] 表示数据项名称，[1] 表示数据项数值

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String[] getValue() {
		return value;
	}

	public void setValue(String[] value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "SeriesData [name=" + name + ", value=" + Arrays.toString(value) + "]";
	}

}
