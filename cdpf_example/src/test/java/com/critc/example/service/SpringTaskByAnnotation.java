package com.critc.example.service;

import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * what:    SpringTaskByAnno的定时任务
 *
 * @author 刘艳超 created on 2017年10月24日
 */
@Component
public class SpringTaskByAnnotation {
	/**
	 * what:    通过注解定时运行该方法
	 *
	 * @author 刘艳超 created on 2017年10月24日
	 */
	@Scheduled(cron = "0/5 * * * * ?")//每5秒执行一次
	public void executeJobByAnnotation() {
		System.out.println("（注解定时器）spring-task正在执行："+new Date()+" -1- "+Thread.currentThread().getName());
	}
	/**
	 * what:    通过注解定时运行该方法,该方法和上面的方法同时测定时任务多线程
	 *
	 * @author 刘艳超 created on 2017年10月24日
	 */
	@Scheduled(cron = "0/5 * * * * ?")//每5秒执行一次
	public void executeJobByAnnotation2() {
		System.out.println("（注解定时器）spring-task正在执行："+new Date()+" -2- "+Thread.currentThread().getName());
	}
}
