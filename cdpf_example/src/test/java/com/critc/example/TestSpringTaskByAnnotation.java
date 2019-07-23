package com.critc.example;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * what:    定时任务Spring-task 通过注解实现
 * 
 * @author 刘艳超 created on 2017年10月13日
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"/spring/applicationContext-task-byAnnotation.xml"})
public class TestSpringTaskByAnnotation {
	/**
	 * what:    测试 通过注解实现定时任务
	 * 
	 * @throws InterruptedException
	 *
	 * @author 刘艳超 created on 2017年10月24日
	 */
	@Test(timeout=20000)//控制运行总时间为20秒
	public void testExecuteJobByAnnotation() throws InterruptedException{
		while(true){
			//停顿一秒，防止线程直接结束
			Thread.sleep(1000);
		}
	}
}
