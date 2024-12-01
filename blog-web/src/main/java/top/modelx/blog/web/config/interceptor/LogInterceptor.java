package top.modelx.blog.web.config.interceptor;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import top.modelx.blog.common.service.AccessLogService;
import top.modelx.blog.common.table.entity.SysAccessLog;
import top.modelx.blog.common.table.service.impl.SysAccessLogServiceImpl;
import top.modelx.blog.common.util.IpUtil;
import top.modelx.blog.common.util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author zhehua
 * @date 2024-12-1
 * 日记记录
 */
@Component
public class LogInterceptor implements HandlerInterceptor {


    @Autowired
    AccessLogService  accessLogService;

    private static final Logger logger = LoggerFactory.getLogger(LogInterceptor.class);


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        String url= request.getRequestURI();
        String ip= IpUtil.getClientIpAddress(request);

        System.out.println("log -> "+ip+":"+url);


        // 创建访问日志对象
        SysAccessLog accessLog = new SysAccessLog();

        // 获取IP地址
        accessLog.setIpAddress(ip);

        // 获取请求URL
        accessLog.setUrl(request.getRequestURI());

        // 获取请求方法
        accessLog.setMethod(request.getMethod());

        // 获取User-Agent
        accessLog.setUserAgent(request.getHeader("User-Agent"));

        // 保存日志
        accessLogService.save(accessLog);

        logger.info("Access Log - IP: {}, URL: {}, Method: {}",
                ip,
                request.getRequestURI(),
                request.getMethod());


        return true;
    }
}
