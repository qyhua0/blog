package top.modelx.blog.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.modelx.blog.common.dao.BlogDao;
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
    public List<BlogVo> list() {
        return blogDao.blogList();
    }
}
