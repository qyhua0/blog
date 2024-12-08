package top.modelx.blog.common.table.service.impl;

import top.modelx.blog.common.table.entity.BlogViewLog;
import top.modelx.blog.common.table.dao.BlogViewLogMapper;
import top.modelx.blog.common.table.service.IBlogViewLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 浏览记录表 服务实现类
 * </p>
 *
 * @author zhenhua
 * @since 2024-12-05
 */
@Service
public class BlogViewLogServiceImpl extends ServiceImpl<BlogViewLogMapper, BlogViewLog> implements IBlogViewLogService {

}
