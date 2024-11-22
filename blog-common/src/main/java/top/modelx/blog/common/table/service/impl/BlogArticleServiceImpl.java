package top.modelx.blog.common.table.service.impl;

import top.modelx.blog.common.table.entity.BlogArticle;
import top.modelx.blog.common.table.dao.BlogArticleMapper;
import top.modelx.blog.common.table.service.IBlogArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 文章 服务实现类
 * </p>
 *
 * @author zhenhua
 * @since 2024-11-22
 */
@Service
public class BlogArticleServiceImpl extends ServiceImpl<BlogArticleMapper, BlogArticle> implements IBlogArticleService {

}
