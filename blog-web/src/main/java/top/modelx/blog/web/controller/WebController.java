package top.modelx.blog.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import top.modelx.blog.common.service.BlogService;
import top.modelx.blog.common.table.entity.BlogArticle;
import top.modelx.blog.common.table.entity.BlogArticleContent;
import top.modelx.blog.common.table.service.impl.BlogArticleContentServiceImpl;
import top.modelx.blog.common.table.service.impl.BlogArticleServiceImpl;
import top.modelx.blog.common.vo.BlogVo;

import java.util.List;

/**
 *
 * @author zhenhua
 * @date 2024/11/17
 *
 */
@Controller
public class WebController {

    @Autowired
    BlogArticleServiceImpl blogArticleService;

    @Autowired
    BlogArticleContentServiceImpl blogArticleContentService;

    @Autowired
    BlogService blogService;

    //首页
    @GetMapping("/")
    public ModelAndView index() {

        List<BlogVo> list= blogService.list();

        // 创建 ModelAndView 并添加数据
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("blog_list", list);

        return modelAndView; // 返回 ModelAndView
    }



    //文章详情
    @GetMapping("/view/{blogId}")
    public ModelAndView view(@PathVariable Long blogId) {

        BlogArticle blogArticle=blogArticleService.getById(blogId);
        BlogArticleContent content= blogArticleContentService.lambdaQuery().eq(BlogArticleContent::getBlogId, blogId).one();

        // 创建 ModelAndView 并添加数据
        ModelAndView modelAndView = new ModelAndView("view");
        modelAndView.addObject("blog_content", content);
        modelAndView.addObject("blog", blogArticle);

        return modelAndView; // 返回 ModelAndView
    }

    //json格式化工具
    @GetMapping("/json")
    public String json() {
        return "json";
    }

    //关于页面
    @GetMapping("/abort")
    public String abort() {
        return "abort";
    }



}
