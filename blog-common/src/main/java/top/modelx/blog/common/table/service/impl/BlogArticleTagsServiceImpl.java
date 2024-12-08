package top.modelx.blog.common.table.service.impl;

import top.modelx.blog.common.table.entity.BlogArticleTags;
import top.modelx.blog.common.table.dao.BlogArticleTagsMapper;
import top.modelx.blog.common.table.service.IBlogArticleTagsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 文章标签关联表 服务实现类
 * </p>
 *
 * @author zhenhua
 * @since 2024-12-05
 */
@Service
public class BlogArticleTagsServiceImpl extends ServiceImpl<BlogArticleTagsMapper, BlogArticleTags> implements IBlogArticleTagsService {

}
