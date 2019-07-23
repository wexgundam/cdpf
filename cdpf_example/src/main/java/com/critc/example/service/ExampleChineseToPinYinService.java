package com.critc.example.service;

import org.springframework.stereotype.Service;

import com.critc.util.string.StringUtil;

/**
 * 
 * what:    汉字转拼音的Service
 * how:      例如：北京--->beijing
 * warning: 多音字场景下不适用
 * 
 * @author 刘艳超 created on 2017年10月31日
 */
@Service
public class ExampleChineseToPinYinService {

	/**
	 * 
	 * what:     汉字转全拼音
	 * when:     例如：北京--->beijing
	 * warning: 多音字场景下不适用
	 * 
	 * @param hanZi 文本框中的汉字
	 * @return
	 *
	 * @author 刘艳超 created on 2017年10月31日
	 */
	public String getPinYinAll(String hanZi) {
		
		return StringUtil.getPinYinAll(hanZi);
	}

	/**
	 * 
	 * what:    汉字转拼音首字母大写
	 * when:     例如：北京--->BJ
	 * warning: 多音字场景下不适用
	 * 
	 * @param hanZi 文本框中的汉字
	 * @return
	 *
	 * @author 刘艳超 created on 2017年10月31日
	 */
	public String getPinYinHeadUpCase(String hanZi) {
		
		return StringUtil.getPinYinHeadUpCase(hanZi);
	}

}
