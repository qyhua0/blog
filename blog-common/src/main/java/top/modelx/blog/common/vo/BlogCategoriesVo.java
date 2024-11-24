package top.modelx.blog.common.vo;

import top.modelx.blog.common.table.entity.BlogCategories;

public class BlogCategoriesVo extends BlogCategories {

    //引用数量
    private Integer usingCount=0;

    public Integer getUsingCount() {
        return usingCount;
    }

    public void setUsingCount(Integer usingCount) {
        this.usingCount = usingCount;
    }
}
