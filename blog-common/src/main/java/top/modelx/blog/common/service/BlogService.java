package top.modelx.blog.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.modelx.blog.common.dao.BlogDao;
import top.modelx.blog.common.table.entity.BlogCategories;
import top.modelx.blog.common.vo.BlogCategoriesVo;
import top.modelx.blog.common.vo.BlogVo;

import java.util.List;

/**
 * @author zhehua
 * @date 2024/11/22 22:34
 */
@Service
public class BlogService {

    @Autowired
    BlogDao blogDao;

    /**
     * 获取博客列表
     * @return
     */
    public List<BlogVo> list(Integer categoriesId) {
        return blogDao.blogList(categoriesId);
    }

    /**
     * 分类列表 带统计数量字段
     * @return
     */
    public List<BlogCategoriesVo> getCategoriesList() {
        return blogDao.getCategoriesList();
    }

    /**
     * 获取文章标签
     * @param id
     * @return
     */
    public List getTagsBy(Integer id) {
        return blogDao.getTagsList(id);
    }

    /**
     * 获取 1 个博客详细资料
     * @param blogId
     * @return
     */
    public BlogVo getBlogBy(Long blogId) {

        return blogDao.getBlogBy(blogId);
    }
}
