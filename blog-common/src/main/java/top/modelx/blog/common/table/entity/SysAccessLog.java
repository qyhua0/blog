package top.modelx.blog.common.table.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 系统访问日志记录表
 * </p>
 *
 * @author zhenhua
 * @since 2024-12-28
 */
@TableName("sys_access_log")
public class SysAccessLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 访问IP地址
     */
    @TableField("ip_address")
    private String ipAddress;

    /**
     * 请求URL
     */
    @TableField("url")
    private String url;

    /**
     * 请求方法（GET/POST等）
     */
    @TableField("method")
    private String method;

    /**
     * 访问时间
     */
    @TableField("access_time")
    private LocalDateTime accessTime;

    /**
     * 用户代理信息
     */
    @TableField("user_agent")
    private String userAgent;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public LocalDateTime getAccessTime() {
        return accessTime;
    }

    public void setAccessTime(LocalDateTime accessTime) {
        this.accessTime = accessTime;
    }

    public String getUserAgent() {
        return userAgent;
    }

    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent;
    }

    @Override
    public String toString() {
        return "SysAccessLog{" +
            "id = " + id +
            ", ipAddress = " + ipAddress +
            ", url = " + url +
            ", method = " + method +
            ", accessTime = " + accessTime +
            ", userAgent = " + userAgent +
        "}";
    }
}
