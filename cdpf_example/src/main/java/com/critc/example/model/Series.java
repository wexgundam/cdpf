/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:example
 */
package com.critc.example.model;

import java.util.List;

/**
 * 
 * what: 系列,每个系列通过 type决定自己的图表类型. <br/>
 * 
 * @param <T>
 *
 * @author 刘正荣 created on 2017年11月3日
 */
public class Series<T> {

	private String name; // 类别名称

	private String type; // 折线图类型

	private boolean smooth; // 是否平滑
	private int symbolSize; // 节点的大小

	private List<T> data; // 值

	public Series() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public boolean isSmooth() {
		return smooth;
	}

	public void setSmooth(boolean smooth) {
		this.smooth = smooth;
	}

	public int getSymbolSize() {
		return symbolSize;
	}

	public void setSymbolSize(int symbolSize) {
		this.symbolSize = symbolSize;
	}

	@Override
	public String toString() {
		return "Series [name=" + name + ", type=" + type + ", smooth=" + smooth + ", symbolSize=" + symbolSize
				+ ", data=" + data + "]";
	}

}
