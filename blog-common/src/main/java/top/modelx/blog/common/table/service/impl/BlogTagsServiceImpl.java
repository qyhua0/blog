package top.modelx.blog.common.table.service.impl;

import top.modelx.blog.common.table.entity.BlogTags;
import top.modelx.blog.common.table.dao.BlogTagsMapper;
import top.modelx.blog.common.table.service.IBlogTagsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 标签表 服务实现类
 * </p>
 *
 * @author zhenhua
 * @since 2024-11-24
 */
@Service
public class BlogTagsServiceImpl extends ServiceImpl<BlogTagsMapper, BlogTags> implements IBlogTagsService {

}
