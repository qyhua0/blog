package top.modelx.blog.common.dao;

import org.springframework.stereotype.Repository;
import top.modelx.blog.common.vo.BlogVo;

import java.util.List;

/**
 * @author zhehua
 * @date 2024/11/22 22:35
 */
@Repository
public interface BlogDao {

    List<BlogVo> blogList();

}
