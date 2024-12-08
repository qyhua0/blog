package top.modelx.blog.common.util;

import top.modelx.blog.common.table.entity.SysUser;

import javax.servlet.http.HttpServletRequest;

/**
 * @author zhehua
 * @date 2024-12-1
 */
public class SessionUtil {

    /**
     * 获取登陆ID
     * @param request
     * @return
     */
    public static Integer getUserId(HttpServletRequest request) {
        Object u=request.getAttribute("userId");
        if(u!=null){
            return (Integer) u;
        }
        return null;
    }

    /**
     * 获取登陆用户
     * @param request
     * @return
     */
    public static SysUser getLoginUser(HttpServletRequest request) {
        Object u=request.getAttribute("loginUser");
        if(u!=null){
            return (SysUser) u;
        }
        return null;
    }

    /**
     * 在拦截器注入
     * @param request
     * @param sysUser
     */
    public static void setLoginUser(HttpServletRequest request, SysUser sysUser) {
        request.setAttribute("userId", sysUser.getId());
        request.setAttribute("loginUser", sysUser);
    }
}
