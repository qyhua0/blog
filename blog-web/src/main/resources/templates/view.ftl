<!DOCTYPE html>
<html lang="zh">
<#include "/common/header.ftl">
<body>
    <#include "/common/nav.ftl">

<!--    <div class="search-container">-->
<!--        <form class="search-box">-->
<!--            <input type="text" class="search-input" placeholder="搜索文章...">-->
<!--            <button type="submit" class="search-button">搜索</button>-->
<!--        </form>-->
<!--    </div>-->

    <main>
        <section class="posts">
            <article class="post">
                <h2 class="post-title">深入理解React Hooks的工作原理</h2>
                <div class="post-meta">发布于 2024年11月14日 | 作者: 张三 | 分类: React</div>
                <div class="tags">
                    <a href="#" class="tag">React</a>
                    <a href="#" class="tag">Hooks</a>
                    <a href="#" class="tag">前端开发</a>
                    <a href="#" class="tag">JavaScript</a>
                </div>
                <div class="post-content" id="viewer" data-content="${blog.content?html}" >

                </div>

                <div class="comments">
                    <h3>评论 (2)</h3>
                    <div class="comment">
                        <div class="comment-header">
                            <span class="comment-author">王五</span>
                            <span class="comment-date">2024-11-14</span>
                        </div>
                        <p>开发测试1->写得非常好，特别是关于useEffect的解释很清晰！</p>
                    </div>
                    <div class="comment">
                        <div class="comment-header">
                            <span class="comment-author">老六</span>
                            <span class="comment-date">2024-11-14</span>
                        </div>
                        <p>开发测试2->这篇文章帮我理解了很多之前困惑的问题，感谢分享！</p>
                    </div>
                    <!--
                    <form class="comment-form">
                        <textarea class="comment-input" rows="4" placeholder="写下你的评论..."></textarea>
                        <button type="submit" class="comment-submit">发表评论</button>
                    </form>
                    -->
                </div>
            </article>


        </section>

        <aside class="sidebar">
            <h2>分类</h2>
            <ul class="categories">
                <li><a href="#">Python (0)</a></li>
                <li><a href="#">后端开发 (0)</a></li>
                <li><a href="#">机器学习 (0)</a></li>
                <li><a href="#">算法 (1)</a></li>
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
<script>
  document.addEventListener("DOMContentLoaded", function () {
      // 获取 Freemarker 填充的内容
      const content = document.querySelector('#viewer').getAttribute('data-content');

      // 初始化 Toast UI Viewer
      const viewer = new toastui.Editor.factory({
          el: document.querySelector('#viewer'),
          viewer: true, // 以只读模式渲染
          initialValue: content // 使用 Freemarker 渲染的 Markdown 内容
      });
  });

</script>
</body>
</html>

