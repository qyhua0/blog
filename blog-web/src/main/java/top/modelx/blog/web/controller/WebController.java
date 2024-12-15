package top.modelx.blog.web.controller;

import com.alibaba.fastjson2.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import top.modelx.blog.common.service.BlogService;
import top.modelx.blog.common.service.LoginService;
import top.modelx.blog.common.service.RedisService;
import top.modelx.blog.common.table.entity.BlogArticleContent;
import top.modelx.blog.common.table.entity.SysUser;
import top.modelx.blog.common.table.service.impl.BlogArticleContentServiceImpl;
import top.modelx.blog.common.table.service.impl.BlogArticleServiceImpl;
import top.modelx.blog.common.table.service.impl.SysUserServiceImpl;
import top.modelx.blog.common.util.IpUtil;
import top.modelx.blog.common.util.SessionUtil;
import top.modelx.blog.common.vo.BlogCategoriesVo;
import top.modelx.blog.common.vo.BlogVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.UUID;

/**
 * @author zhenhua
 * @date 2024/11/17
 */
@Controller
public class WebController {

    @Autowired
    BlogArticleServiceImpl blogArticleService;

    @Autowired
    BlogArticleContentServiceImpl blogArticleContentService;

    @Autowired
    BlogService blogService;

    @Autowired
    SysUserServiceImpl sysUserService;

    @Autowired
    LoginService loginService;


    @Autowired
    RedisService redisService;


    /**
     * 首页
     *
     * @return
     */
    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView modelAndView = getIndexPage(null);
        return modelAndView;
    }

    /**
     * 首页+分类
     *
     * @param categories_id
     * @return
     */
    @GetMapping("/{categories_id}")
    public ModelAndView index(@PathVariable Integer categories_id) {


        ModelAndView modelAndView = getIndexPage(categories_id);

        return modelAndView;
    }

    private ModelAndView getIndexPage(Integer categories_id) {
        ModelAndView modelAndView = new ModelAndView("index");

        //分类
        List<BlogCategoriesVo> categoriesList = blogService.getCategoriesList();
        modelAndView.addObject("categories_list", categoriesList);

        //博客列表
        List<BlogVo> list = blogService.list(categories_id);
        for (int i = 0; i < list.size(); i++) {
            BlogVo vo = list.get(i);
            vo.setTags(blogService.getTagsBy(vo.getId()));
        }

        modelAndView.addObject("blog_list", list);
        return modelAndView;
    }


    /**
     * 文章详情
     *
     * @param blogId
     * @return
     */
    @GetMapping("/view/{blogId}")
    public ModelAndView view(HttpServletRequest request, @PathVariable Integer blogId) {


        BlogVo blogArticle = blogService.getBlogBy(blogId);
        BlogArticleContent content = blogArticleContentService.lambdaQuery().eq(BlogArticleContent::getBlogId, blogId).one();

        String ip= IpUtil.getClientIpAddress(request);
        Integer userId=SessionUtil.getUserId(request);

        int total= blogArticle.getViewCount()+1;
        blogService.logView(ip,userId,blogId,total);

        // 创建 ModelAndView 并添加数据
        ModelAndView modelAndView = new ModelAndView("view");
        modelAndView.addObject("blog_content", content);
        modelAndView.addObject("blog", blogArticle);

        return modelAndView;
    }


    /**
     * json格式化工具
     *
     * @return
     */
    @GetMapping("/json")
    public String json() {
        return "json";
    }

    /**
     * 关于页面
     *
     * @return
     */
    @GetMapping("/abort")
    public String abort() {
        return "abort";
    }


    /**
     * 登录页面
     *
     * @return
     */
    @GetMapping("/login")
    public String login() {
        return "login";
    }


    /**
     * 登录
     *
     * @return
     */
    @PostMapping(value = "/doLogin")
    public ResponseEntity<?> doLogin(
            HttpServletRequest request,@RequestBody SysUser user) {

        JSONObject json= new JSONObject();

        String username=user.getEmail();
        String password=user.getPassword();



        if (username != null && password != null) {

            SysUser sysUser =loginService.login(username,password);

            if(sysUser!=null){

                json.put("code",200);
                json.put("msg","登陆成功");
                String token=UUID.randomUUID().toString();
                json.put("token", token);
                json.put("nickname", sysUser.getNickname());

                redisService.saveLoginToken(token,sysUser);

                return ResponseEntity.ok(json.toJSONString());
            }

        }


        json.put("code",401);
        json.put("msg","用名名称或密码错误！");

        return ResponseEntity.ok(json.toJSONString());

    }


}
