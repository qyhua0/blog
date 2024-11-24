package top.modelx.blog.common.table.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 文章
 * </p>
 *
 * @author zhenhua
 * @since 2024-11-24
 */
@TableName("blog_article")
public class BlogArticle implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 文章标题
     */
    @TableField("title")
    private String title;

    /**
     * 文章摘要 最多100字，默认抽取文章最前面的字数
     */
    @TableField("summary")
    private String summary;

    /**
     * 作者ID
     */
    @TableField("author_id")
    private Integer authorId;

    /**
     * 分类ID
     */
    @TableField("category_id")
    private Integer categoryId;

    /**
     * 文章封面图片
     */
    @TableField("head_img")
    private String headImg;

    /**
     * 是否置顶 
     */
    @TableField("top_flag")
    private String topFlag;

    /**
     * 状态 D草稿 P已发布
     */
    @TableField("status")
    private String status;

    /**
     * 文章私密访问时的
     */
    @TableField("password")
    private String password;

    /**
     * 文章来源：O原创,C 翻译, L 转载
     */
    @TableField("src_flag")
    private String srcFlag;

    /**
     * 是否评论 Y可以评论 N 不可以评论
     */
    @TableField("comment_flag")
    private String commentFlag;

    /**
     * 登录后才可访问
     */
    @TableField("req_auth")
    private String reqAuth;

    /**
     * 浏览次数
     */
    @TableField("view_count")
    private Integer viewCount;

    /**
     * 点赞次数
     */
    @TableField("like_count")
    private Integer likeCount;

    /**
     * 评论次数
     */
    @TableField("comment_count")
    private Integer commentCount;

    /**
     * 添加时间
     */
    @TableField("create_time")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField("update_time")
    private LocalDateTime updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg;
    }

    public String getTopFlag() {
        return topFlag;
    }

    public void setTopFlag(String topFlag) {
        this.topFlag = topFlag;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSrcFlag() {
        return srcFlag;
    }

    public void setSrcFlag(String srcFlag) {
        this.srcFlag = srcFlag;
    }

    public String getCommentFlag() {
        return commentFlag;
    }

    public void setCommentFlag(String commentFlag) {
        this.commentFlag = commentFlag;
    }

    public String getReqAuth() {
        return reqAuth;
    }

    public void setReqAuth(String reqAuth) {
        this.reqAuth = reqAuth;
    }

    public Integer getViewCount() {
        return viewCount;
    }

    public void setViewCount(Integer viewCount) {
        this.viewCount = viewCount;
    }

    public Integer getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(Integer likeCount) {
        this.likeCount = likeCount;
    }

    public Integer getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(Integer commentCount) {
        this.commentCount = commentCount;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public LocalDateTime getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "BlogArticle{" +
            "id = " + id +
            ", title = " + title +
            ", summary = " + summary +
            ", authorId = " + authorId +
            ", categoryId = " + categoryId +
            ", headImg = " + headImg +
            ", topFlag = " + topFlag +
            ", status = " + status +
            ", password = " + password +
            ", srcFlag = " + srcFlag +
            ", commentFlag = " + commentFlag +
            ", reqAuth = " + reqAuth +
            ", viewCount = " + viewCount +
            ", likeCount = " + likeCount +
            ", commentCount = " + commentCount +
            ", createTime = " + createTime +
            ", updateTime = " + updateTime +
        "}";
    }
}
