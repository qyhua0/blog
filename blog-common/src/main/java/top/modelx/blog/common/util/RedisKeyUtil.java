package top.modelx.blog.common.util;

/**
 * 全局redis key 管理
 * @author: zhenhua
 * @date: 2024/11/17
 */
public class RedisKeyUtil {

    /**
     * 登录用户token
     */
    public static final String LOGIN_USER_TOKEN = "login:user:token:";

    /**
     * 登录用户token过期时间
     */
    public static final int LOGIN_USER_TOKEN_EXPIRE_TIME = 60 * 60 * 24 * 3;

    /**
     * 获取登录用户token
     * @param x_token
     * @return
     */
    public static String getLoginTokenKey(String x_token) {
        return LOGIN_USER_TOKEN + x_token;
    }
}
