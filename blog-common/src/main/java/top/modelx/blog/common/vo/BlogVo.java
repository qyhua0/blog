package top.modelx.blog.common.vo;

import org.springframework.web.multipart.MultipartFile;
import top.modelx.blog.common.table.entity.BlogArticle;

import java.util.List;

/**
 * @author zhehua
 * @date 2024/11/22 22:44
 */
public class BlogVo extends BlogArticle {

    /**
     * 作者名称
     */
    private String authorName;

    /**
     * 分类名称
     */
    private String categoryName;

    /**
     * 标签列表
     */
    private List tags;

    /**
     * 内容
     */
    private String content;


    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public List getTags() {
        return tags;
    }

    public void setTags(List tags) {
        this.tags = tags;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
