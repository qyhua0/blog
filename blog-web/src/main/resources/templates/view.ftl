<!DOCTYPE html>
<html lang="zh">
<#include "/common/header.ftl">

<body>
<#include "/common/nav.ftl">

<style>
    /* 保留原有的基础样式 */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        line-height: 1.6;
        color: #333;
        background-color: #f5f5f5;
    }

    header {
        background-color: #2c3e50;
        color: white;
        padding: 1rem;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    nav {
        max-width: 1200px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .logo {
        font-size: 1.5rem;
        font-weight: bold;
    }

    .nav-links {
        display: flex;
        gap: 2rem;
    }

    .nav-links a {
        color: white;
        text-decoration: none;
        padding: 0.5rem;
    }

    .nav-links a:hover {
        color: #3498db;
    }

    main {
        max-width: 1200px;
        margin: 2rem auto;
        padding: 0 1rem;
        grid-template-columns: auto;
        width: 100%;
    }

    /* 调整文章详情页的样式 */
    .article-detail {
        background: white;
        padding: 3rem;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        grid-column: 1 / 3;
    }

    .article-header {
        margin-bottom: 2rem;
        padding-bottom: 1rem;
        border-bottom: 1px solid #eee;
        background-color: white; /* 确保背景是白色 */
    }

    .article-title {
        font-size: 2.5rem;
        color: #2c3e50;
        margin-bottom: 1rem;
        font-weight: bold;
    }

    .article-meta {
        color: #666;
        font-size: 1rem;
    }

    .article-content {
        font-size: 1.1rem;
        line-height: 1.8;
    }

    .article-content h2 {
        margin: 2rem 0 1rem;
        color: #2c3e50;
    }

    .article-content p {
        margin-bottom: 1.5rem;
    }

    .article-content pre {
        background: #f8f9fa;
        padding: 1rem;
        border-radius: 4px;
        overflow-x: auto;
        margin: 1rem 0;
    }

    /* 新增相关推荐样式 */
    .related-articles {
        margin-top: 2rem;
        padding: 2rem;
        background: white;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    .related-articles h3 {
        color: #2c3e50;
        font-size: 1.5rem;
        margin-bottom: 1.5rem;
        padding-bottom: 0.5rem;
        border-bottom: 2px solid #3498db;
    }

    .related-list {
        list-style: none;
    }

    .related-item {
        padding: 1rem;
        border-bottom: 1px solid #eee;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .related-item:last-child {
        border-bottom: none;
    }

    .related-link {
        color: #2c3e50;
        text-decoration: none;
        font-size: 1.1rem;
        flex: 1;
    }

    .related-link:hover {
        color: #3498db;
    }

    .related-meta {
        color: #666;
        font-size: 0.9rem;
        margin-left: 1rem;
    }

    .category-tag {
        background: #e1f0fa;
        color: #3498db;
        padding: 0.2rem 0.8rem;
        border-radius: 15px;
        font-size: 0.9rem;
        margin-left: 1rem;
    }

    footer {
        background-color: #2c3e50;
        color: white;
        text-align: center;
        padding: 1rem;
        margin-top: 2rem;
    }

    @media (max-width: 768px) {
        .article-detail {
            padding: 1.5rem;
        }

        .article-title {
            font-size: 2rem;
        }

        /*.nav-links {*/
        /*    display: none;*/
        /*}*/

        /*.related-item {*/
        /*    flex-direction: column;*/
        /*    align-items: flex-start;*/
        /*}*/

        /*.related-meta {*/
        /*    margin-left: 0;*/
        /*    margin-top: 0.5rem;*/
        /*}*/
    }

    .toastui-editor-toolbar{
        /*display: none;!important;*/
    }

</style>
<!-- CSS -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">


<main >
    <article class="article-detail">
        <header class="article-header">
            <h1 class="article-title">${blog.title}</h1>
            <div class="article-meta">
                发布于 ${blog.createTime?date} | 作者: ${blog.authorName} |
                分类: ${blog.categoryName} | 阅读: ${blog.viewCount}
            </div>
        </header>

        <div class="article-content">
            <div id="div-view"></div>
            <div id="div-view-org" style="display: none;">${blog_content.content}</div>
        </div>
    </article>

    <!-- 新增相关推荐部分 -->
<#--    <section class="related-articles">-->
<#--        <h3>相关推荐</h3>-->
<#--        <ul class="related-list">-->
<#--            <li class="related-item">-->
<#--                <a href="#" class="related-link">React性能优化最佳实践</a>-->
<#--                <span class="category-tag">React</span>-->
<#--                <span class="related-meta">3天前</span>-->
<#--            </li>-->
<#--            <li class="related-item">-->
<#--                <a href="#" class="related-link">使用React Hooks重构你的应用</a>-->
<#--                <span class="category-tag">React</span>-->
<#--                <span class="related-meta">1周前</span>-->
<#--            </li>-->
<#--            <li class="related-item">-->
<#--                <a href="#" class="related-link">深入理解React的虚拟DOM实现</a>-->
<#--                <span class="category-tag">React</span>-->
<#--                <span class="related-meta">2周前</span>-->
<#--            </li>-->
<#--        </ul>-->
<#--    </section>-->
</main>

<#include "/common/footer.ftl">

<!-- JavaScript -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>

    let content = document.getElementById('div-view-org').innerHTML;
    document.addEventListener('DOMContentLoaded', function() {

        const editor = new toastui.Editor({
            el: document.querySelector('#div-view'),
            height: 'auto',
            initialEditType: 'wysiwyg',
            initialValue: content, // 直接设置初始值
            hideModeSwitch: true, // 隐藏模式切换按钮
            toolbarItems: [] ,// 不显示工具栏
            useCommandShortcut: false, // 禁用快捷键
            useDefaultHTMLSanitizer: true // 使用默认的HTML净化器
        });

        // 设置为只读模式
        editor.setOptions({ readOnly: true });
        // 动态设置初始值
       // editor.setHTML(content);

    });
</script>





</body>
</html>