package top.modelx.blog.common.util;

import javax.servlet.http.HttpServletRequest;

/**
 * @author zhehua
 * @date 2024-12-1
 */
public class SessionUtil {

    /**
     * 在拦截器注入
     * @param request
     * @return
     */
    public static String getUserId(HttpServletRequest request) {
        return (String) request.getAttribute("userId");
    }
}
