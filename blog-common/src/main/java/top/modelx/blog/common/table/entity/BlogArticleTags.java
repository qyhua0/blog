package top.modelx.blog.common.table.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;

/**
 * <p>
 * 文章标签关联表
 * </p>
 *
 * @author zhenhua
 * @since 2024-12-05
 */
@TableName("blog_article_tags")
public class BlogArticleTags implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 文章ID
     */
    private Integer articleId;

    /**
     * 标签ID
     */
    private Integer tagId;

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getTagId() {
        return tagId;
    }

    public void setTagId(Integer tagId) {
        this.tagId = tagId;
    }

    @Override
    public String toString() {
        return "BlogArticleTags{" +
            "articleId = " + articleId +
            ", tagId = " + tagId +
        "}";
    }
}
