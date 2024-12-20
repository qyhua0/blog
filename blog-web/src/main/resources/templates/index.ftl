<!DOCTYPE html>
<html lang="zh">
<#include "/common/header.ftl">
<body>
<#include "/common/nav.ftl">

<#--    <div class="search-container">-->
<#--        <form class="search-box">-->
<#--            <input type="text" class="search-input" placeholder="搜索文章标题.">-->
<#--            <button type="submit" class="search-button">搜索</button>-->
<#--        </form>-->
<#--    </div>-->

<main>
    <section class="posts">

        <#if blog_list?size gt 0>
            <#list blog_list as blog>
                <article class="post">
                    <h2 class="post-title">${blog.title}</h2>
                    <div class="post-meta">发布于 ${blog.createTime?date} | 作者: ${blog.authorName} |
                        分类: ${blog.categoryName}</div>
                    <div class="tags">
                        <#if blog.tags??>
                            <#if blog.tags?has_content>

                                <#list blog.tags as tag>
                                    <a href="#" class="tag">${tag.name}</a>
                                </#list>

                            </#if>
                        </#if>
                    </div>
                    <div class="post-content">
                        <p>${blog.summary}</p>
                    </div>
                    <a href="/view/${blog.id}" target="_blank" class="read-more">阅读更多 →</a>
                </article>
            </#list>
        <#else>
        <article class="post">
            <div style="align-content: center;">暂时无数据。</div>

        </article>
        </#if>

<#--        <article class="post">-->
<#--            <h2 class="post-title">Python异步编程实战指南(示例模板)</h2>-->
<#--            <div class="post-meta">发布于 2024年11月14日 | 作者: 李四 | 分类: Python</div>-->
<#--            <div class="tags">-->
<#--                <a href="#" class="tag">Python</a>-->
<#--                <a href="#" class="tag">异步编程</a>-->
<#--                <a href="#" class="tag">asyncio</a>-->
<#--                <a href="#" class="tag">并发</a>-->
<#--            </div>-->
<#--            <div class="post-content">-->
<#--                <p>随着异步编程在Python中的应用越来越广泛，掌握asyncio和异步编程模式变得越来越重要。本文将通过实际案例，带你掌握Python异步编程的核心概念...</p>-->
<#--            </div>-->
<#--            <a href="#" class="read-more">阅读更多 →</a>-->
<#--        </article>-->
    </section>

    <aside class="sidebar">
        <h2>分类</h2>
        <ul class="categories">

            <#if categories_list?size gt 0>
                <#list categories_list as c>
                    <li><a href="/${c.id}">${c.name} (${c.usingCount})</a></li>
                </#list>
            <#else >
                <li><a href="#">Python模板示例 (0)</a></li>
                <li><a href="#">后端开发 (0)</a></li>
                <li><a href="#">机器学习 (0)</a></li>
                <li><a href="#">算法 (1)</a></li>
            </#if>


        </ul>

        <h2>热门标签</h2>
        <div class="tags">
            <a href="#" class="tag">React</a>
            <a href="#" class="tag">Python</a>
            <a href="#" class="tag">JavaScript</a>
            <a href="#" class="tag">Docker</a>
            <a href="#" class="tag">机器学习</a>
            <a href="#" class="tag">前端开发</a>
            <a href="#" class="tag">后端开发</a>
            <a href="#" class="tag">数据库</a>
            <a href="#" class="tag">算法</a>
            <a href="#" class="tag">Web开发</a>
        </div>
    </aside>
</main>


<#include "/common/footer.ftl">
</body>
</html>

