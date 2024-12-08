package top.modelx.blog.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.modelx.blog.common.table.entity.SysUser;
import top.modelx.blog.common.table.service.impl.SysUserServiceImpl;
import top.modelx.blog.common.util.MD5Util;

/**
 * @author zhehua
 * @date 2024/12/6
 */
@Service
public class LoginService {

    @Autowired
    SysUserServiceImpl sysUserService;


    /**
     * 登陆
     * @param username
     * @param password
     * @return
     */
    public SysUser login(String username, String password) {
        password = MD5Util.generateMD5(password);

        SysUser sysUser =sysUserService.lambdaQuery().eq(SysUser::getEmail,username)
                .eq(SysUser::getPassword,password).last("limit 1").one();
        return  sysUser;
    }
}
