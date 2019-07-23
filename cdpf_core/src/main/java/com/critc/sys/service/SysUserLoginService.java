/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:core
 */
package com.critc.sys.service;

import com.critc.sys.dao.SysUserLoginDao;
import com.critc.sys.vo.SysUserLoginSearchVO;
import com.critc.sys.model.SysUserLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 系统登录Service
 *
 * @author 孔垂云
 * @date 2017-06-13
 */
@Service
public class SysUserLoginService {
    @Autowired
    private SysUserLoginDao sysUserLoginDao;

    /**
     * 
     * what: 登录时新增登录信息
     * 
     * @param sysUserLogin
     *
     * @author 孔垂云 created on 2017年6月13日
     */
    @Async
    public void add(SysUserLogin sysUserLogin) {
        sysUserLoginDao.add(sysUserLogin);
    }

   /**
    * 
    * what: 取得最后登录信息
    * 
    * @param user_id
    * @return
    *
    * @author 孔垂云 created on 2017年6月13日
    */
    public SysUserLogin getLastLogin(int user_id) {
        return sysUserLoginDao.getLastLogin(user_id);
    }

    public List<SysUserLogin> list(SysUserLoginSearchVO sysUserloginSearchVO) {
        return sysUserLoginDao.list(sysUserloginSearchVO);
    }

   /**
    * 
    * what: 查询用户登录总数
    * 
    * @param sysUserloginSearchVO 用户登录信息搜索VO
    * @return int
    *
    * @author 孔垂云 created on 2017年6月13日
    */
    public int count(SysUserLoginSearchVO sysUserloginSearchVO) {
        return sysUserLoginDao.count(sysUserloginSearchVO);
    }

}
