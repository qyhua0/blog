package top.modelx.blog.common.table.service.impl;

import top.modelx.blog.common.table.entity.BlogCategories;
import top.modelx.blog.common.table.dao.BlogCategoriesMapper;
import top.modelx.blog.common.table.service.IBlogCategoriesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 分类表 服务实现类
 * </p>
 *
 * @author zhenhua
 * @since 2024-11-24
 */
@Service
public class BlogCategoriesServiceImpl extends ServiceImpl<BlogCategoriesMapper, BlogCategories> implements IBlogCategoriesService {

}
