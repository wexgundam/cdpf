/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:cdpf_example
 */
package com.critc.example.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.critc.example.model.Series;
import com.critc.example.model.SeriesData;
import com.critc.util.date.DateUtil;

/**
 * what: ExampleEchart Service . <br/>
 * 
 * @author 刘正荣 created on 2017年11月3日
 */

@Service
public class ExampleEchartsService {

	/**
	 * 
	 * what: 异步加载数据. <br/>
	 * when: 用于异步加载数据页面数据的展示.<br/>
	 * warning: 此处的数据为模拟数据，在使用的过程中应根据真实的数据构造.<br/>
	 * 
	 * @return 返回结果集
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public Map<String, Object> getData() {
		Map<String, Object> dataMap = new HashMap<>();
		List<SeriesData> lineData = new ArrayList<>(); // 用于存放连续数据集
		List<String> categorys = new ArrayList<>(); // 存放类别集合

		for (int i = 0; i < 100; i++) {
			Calendar calendar = Calendar.getInstance();
			calendar.set(1968 + i, 3, 2 + i);
			SeriesData seriesData = new SeriesData();
			String name = DateUtil.dateToString(calendar.getTime(), "yyyy-MM-dd");
			String value[] = { name, String.valueOf(Math.random() % 100) };
			seriesData.setName(name);
			seriesData.setValue(value);
			categorys.add(name);
			lineData.add(seriesData);
		}

		// series 表示一个系列
		Series<SeriesData> series = new Series<>();
		series.setName("测试数据");
		series.setType("line");
		series.setData(lineData);

		dataMap.put("category", categorys);
		dataMap.put("lineData", series);

		return dataMap;
	}

}
