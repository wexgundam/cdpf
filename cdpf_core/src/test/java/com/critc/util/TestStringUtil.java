package com.critc.util;

import com.critc.util.string.StringUtil;
import org.junit.Assert;
import org.junit.Test;

/**
 * Description: 测试字符串工具
 *
 * @Author: 靳磊
 * @Date: 2017/10/24 16:54
 */
public class TestStringUtil {

    @Test
    public void testPinyin() {
        Assert.assertEquals("BJ", StringUtil.getPinYinHeadUpCase("北京"));
        Assert.assertEquals("ABJ", StringUtil.getPinYinHeadUpCase("A北京"));
        Assert.assertEquals("0BJ", StringUtil.getPinYinHeadUpCase("0北京"));
    }
}
