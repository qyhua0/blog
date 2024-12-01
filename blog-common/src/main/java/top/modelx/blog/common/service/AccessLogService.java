package top.modelx.blog.common.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.modelx.blog.common.table.entity.SysAccessLog;
import top.modelx.blog.common.table.service.impl.SysAccessLogServiceImpl;

/**
 * @author zhehua
 * @date 2024/12/1
 */
@Service
public class AccessLogService {
    private static final Logger logger = LoggerFactory.getLogger(AccessLogService.class);

    @Autowired
    SysAccessLogServiceImpl sysAccessLogService;

    @Async
    @Transactional
    public void save(SysAccessLog accessLog) {

        try {
            // 异步保存日志
            sysAccessLogService.save(accessLog);

            // 可选：添加日志记录
            logger.info("Access log saved: {} - {}",
                    accessLog.getIpAddress(),
                    accessLog.getUrl());
        } catch (Exception e) {
            // 记录保存失败的异常
            logger.error("Failed to save access log", e);
        }
    }
}