package top.modelx.blog.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import top.modelx.blog.common.dao.BlogDao;
import top.modelx.blog.common.table.entity.*;
import top.modelx.blog.common.table.service.impl.BlogArticleServiceImpl;
import top.modelx.blog.common.table.service.impl.BlogCategoriesServiceImpl;
import top.modelx.blog.common.table.service.impl.BlogTagsServiceImpl;
import top.modelx.blog.common.table.service.impl.BlogViewLogServiceImpl;
import top.modelx.blog.common.vo.BlogCategoriesVo;
import top.modelx.blog.common.vo.BlogVo;

import java.beans.Transient;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author zhehua
 * @date 2024/11/22 22:34
 */
@Service
public class BlogService {

    @Autowired
    BlogDao blogDao;

    @Autowired
    BlogArticleServiceImpl blogArticleService;

    @Autowired
    BlogViewLogServiceImpl blogViewLogService;

    @Autowired
    BlogCategoriesServiceImpl blogCategoriesService;

    @Autowired
    BlogTagsServiceImpl blogTagsService;



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
    public BlogVo getBlogBy(Integer blogId) {

        return blogDao.getBlogBy(blogId);
    }

    @Transactional(rollbackFor = Exception.class)
    public void saveBlog(BlogArticle b, String content, List<String> tags,  String ip, Integer userId) {

        LocalDateTime now=LocalDateTime.now();

        b.setUpdateTime(now);
        b.setAuthorId(userId);

        blogArticleService.save(b);


        BlogArticleContent content1=new BlogArticleContent();
        content1.setBlogId(b.getId());
        content1.setContent(content);
        b.setUpdateTime(now);

        for(String tag :tags){
        }

    }

    public void logView(String ip, Integer userId, Integer blogId,int tatal) {

        BlogViewLog log=new BlogViewLog();
        if(userId!=null){
            log.setUserId(userId);
        }
        log.setArticleId(blogId);
        log.setCreatedTime(LocalDateTime.now());
        log.setIpAddr(ip);
        blogViewLogService.save(log);

        blogArticleService.lambdaUpdate().eq(BlogArticle::getId,blogId).set(BlogArticle::getViewCount,tatal).update();


    }

    public List<BlogCategories> allBlogCategoriesList() {

       return  blogCategoriesService.list();
    }

    public List<BlogTags> allBlogTagList() {
        return blogTagsService.list();
    }
}
