package com.critc.example.service;

import java.time.LocalDateTime;

/**
 * what:    SpringTaskByConfig的定时任务
 *
 * @author 刘艳超 created on 2017年10月24日
 */
public class SpringTaskByConfiguration {
	/**
	 * what:    启动配置文件时定时运行该方法
	 * 
	 * @author 刘艳超 created on 2017年10月24日
	 */
	public void executeJobByConfiguration() {
		System.out.printf("（配置文件定时器）Task: %s, Current time: %s\n", 1, LocalDateTime.now());
	}

}
