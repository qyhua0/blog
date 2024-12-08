package top.modelx.blog.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import top.modelx.blog.common.service.BlogService;
import top.modelx.blog.common.table.entity.BlogArticle;
import top.modelx.blog.common.util.FileUploadUtil;
import top.modelx.blog.common.util.IpUtil;
import top.modelx.blog.common.util.SessionUtil;
import top.modelx.blog.common.vo.BlogVo;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * 管理员操作
 * @author zhehua
 */
@Controller
public class AdminController {

    @Autowired
    BlogService blogService;


    // 从配置文件读取上传目录
    @Value("${file.upload.dir}")
    private String uploadDir;


    @GetMapping("/admin/add")
    public ModelAndView add() {
        ModelAndView modelAndView = new ModelAndView("edit");
        return modelAndView;
    }

    @PostMapping(value = "/save", consumes = {"multipart/form-data"})
    public ResponseEntity<?> save(
            HttpServletRequest request,
            @RequestParam("title") String title,
            @RequestParam("category") Integer category,
            @RequestParam("content") String content,
            @RequestParam("tags") List<String> tags,
            @RequestParam(value = "thumbnail", required = false) MultipartFile thumbnail
    ) {

        String ip= IpUtil.getClientIpAddress(request);
        Integer userId= SessionUtil.getUserId(request);

        try {
            BlogArticle b = new BlogArticle();
            b.setTitle(title);
            b.setCategoryId(category);

            String fileName=FileUploadUtil.saveFile(thumbnail,uploadDir);
            b.setHeadImg(fileName);

            blogService.saveBlog(b,content,tags,ip,userId);
            return ResponseEntity.ok(b);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("文章保存失败：" + e.getMessage());
        }
    }

}
