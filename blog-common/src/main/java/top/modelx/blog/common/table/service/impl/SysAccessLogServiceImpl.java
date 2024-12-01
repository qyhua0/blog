package top.modelx.blog.common.table.service.impl;

import top.modelx.blog.common.table.entity.SysAccessLog;
import top.modelx.blog.common.table.dao.SysAccessLogMapper;
import top.modelx.blog.common.table.service.ISysAccessLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统访问日志记录表 服务实现类
 * </p>
 *
 * @author zhenhua
 * @since 2024-12-01
 */
@Service
public class SysAccessLogServiceImpl extends ServiceImpl<SysAccessLogMapper, SysAccessLog> implements ISysAccessLogService {

}
