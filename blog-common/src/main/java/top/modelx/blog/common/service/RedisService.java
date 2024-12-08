package top.modelx.blog.common.service;

import com.alibaba.fastjson2.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import top.modelx.blog.common.table.entity.SysUser;
import top.modelx.blog.common.util.RedisKeyUtil;

import java.util.concurrent.TimeUnit;

/**
 * @author: zhenhua
 * @date: 2024/12/8
 * @description:
 */
@Service
public class RedisService {

    @Autowired
    RedisTemplate redisTemplate;


    public void saveLoginToken(String token, SysUser sysUser) {
        // 保存登录信息到Redis，设置3天过期
        String key = RedisKeyUtil.getLoginTokenKey(token);
        String value= JSONObject.toJSONString(sysUser);
        redisTemplate.opsForValue().set(key, value, 3, TimeUnit.DAYS);
    }

    /**
     * 根据key获取用户信息
     * @param key
     * @return
     */
    public SysUser getUserByToken(String key) {
        if(redisTemplate.hasKey(key)){
            return JSONObject.parseObject(redisTemplate.opsForValue().get(key).toString(), SysUser.class);
        }else{
            return null;
        }

    }
}
