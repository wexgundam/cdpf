/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:web
 */
package com.critc.example.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import com.critc.core.pub.PubConfig;
import com.critc.util.json.JsonUtil;
import com.critc.util.web.WebUtil;

/**
 * 
 * what:    文件上传controller.
 * 
 *
 * @author 杨超凡 created on 2017年10月11日
 */
@RequestMapping("/example/fileupload")
@Controller
public class ExampleFileUploadController {
	/**
	 * 路径配置类
	 */
	@Autowired
	 private PubConfig pubConfig;
	/**
	 * 
	 * what:    多图片上传主页
	 * when:    请求多图片上传主页时
	 * 
	 * @return uploadImgMulti
	 *
	 * @author 杨超凡 created on 2017年10月11日
	 */
	@RequestMapping("/uploadImgMulti")
	private String uploadImgMulti() {
		return "example/fileupload/uploadImgMulti";
	}

	/**
	 * 
	 * what:    单张图片上传主页
	 * when:    请求单张图片上传主页时
	 * 
	 * @return uploadImg
	 *
	 * @author 杨超凡 created on 2017年11月2日
	 */
	@RequestMapping("/uploadImg")
	private String uploadImg() {
		return "example/fileupload/uploadImg";
	}

	/**
	 * 
	 * what:    拖拽上传主页
	 * when:    请求拖拽上传主页时
	 * 
	 * @return uploadStream
	 *
	 * @author 杨超凡 created on 2017年11月2日
	 */
	@RequestMapping("/uploadStream")
	private String uploadStream() {
		return "example/fileupload/uploadStream";
	}

	/**
	 * 
	 * what:    上传文件接收方法
	 * when:    前台上传文件时
	 * how:     传入request response即可
	 * warning: 存储默认路径为图片上传路径
	 * 
	 * @param request request
	 * @param response response
	 * @throws IllegalStateException IllegalStateException
	 * @throws IOException IOException
	 *
	 * @author 杨超凡 created on 2017年11月2日
	 */
	@RequestMapping("/upload")
	public void upload(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		
		long startTime = System.currentTimeMillis();
		// 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		// 检查form中是否有enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {
			// 将request变成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 获取multiRequest 中所有的文件名
			Iterator<String> iter = multiRequest.getFileNames();

			while (iter.hasNext()) {
				// 一次遍历所有文件
				MultipartFile file = multiRequest.getFile(iter.next().toString());
				if (file != null) {
					String path = pubConfig.getImageUploadPath() + "\\example\\fileupload\\" + new Date().getTime() + file.getOriginalFilename();
					File f = new File(path);
					if (!f.exists()) {
						f.mkdirs();
					}
					// 上传
					file.transferTo(new File(path));
				}
			}
		}
		long endTime = System.currentTimeMillis();
		WebUtil.out(response, JsonUtil.createOperaStr(false, "文件上传成功！用时" + String.valueOf(endTime - startTime) + "ms"));
	}
}