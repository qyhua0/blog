package top.modelx.blog.web.config.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import top.modelx.blog.common.service.RedisService;
import top.modelx.blog.common.table.entity.SysUser;
import top.modelx.blog.common.util.RedisKeyUtil;
import top.modelx.blog.common.util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author zhehua
 * @date 2024-12-1
 * 权限或登陆检测
 */
@Component
public class AccessInterceptor implements HandlerInterceptor {

    @Autowired
    RedisService redisService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        // 验证用户是否登录或有权限
        if (!isAuthenticated(request)) {
            // 重定向到登录页面
            response.sendRedirect("/login");
            return false;
        }
        return true;


    }

    private boolean isAuthenticated(HttpServletRequest request) {

        String token = request.getHeader("x-token");
        if(token==null||token.length()==0){
            return false;
        }

        String key=RedisKeyUtil.getLoginTokenKey(token);
        SysUser sysUser =  redisService.getUserByToken(key);
        if(sysUser==null){
            return false;
        }

        SessionUtil.setLoginUser(request,sysUser);

        return true;
    }

}
