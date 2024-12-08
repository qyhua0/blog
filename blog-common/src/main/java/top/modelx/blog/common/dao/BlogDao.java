package top.modelx.blog.common.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.modelx.blog.common.table.entity.BlogTags;
import top.modelx.blog.common.vo.BlogCategoriesVo;
import top.modelx.blog.common.vo.BlogVo;

import java.util.List;

/**
 * @author zhehua
 * @date 2024/11/22 22:35
 */
@Repository
public interface BlogDao {

    List<BlogVo> blogList(@Param("categoriesId")Integer categoriesId);

    List<BlogTags> getTagsList(@Param("blogId") int blogId);

    List<BlogCategoriesVo> getCategoriesList();

    BlogVo getBlogBy(@Param("blogId")Integer blogId);
}
