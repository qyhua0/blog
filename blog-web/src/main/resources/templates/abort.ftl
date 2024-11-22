<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>关于 - 码农小屋</title>
    <style>
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
        }

        .about-section {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
        }

        .about-section h1 {
            color: #2c3e50;
            margin-bottom: 1.5rem;
            font-size: 2rem;
        }

        .about-section h2 {
            color: #2c3e50;
            margin: 1.5rem 0 1rem;
            font-size: 1.5rem;
        }

        .about-section p {
            margin-bottom: 1rem;
            line-height: 1.8;
        }

        .contact-info {
            background: #e1f0fa;
            padding: 1.5rem;
            border-radius: 8px;
            margin-top: 1rem;
        }

        .skills {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
            margin: 1rem 0;
        }

        .skill-tag {
            background: #e1f0fa;
            color: #3498db;
            padding: 0.2rem 0.6rem;
            border-radius: 15px;
            font-size: 0.9rem;
        }

        footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 1rem;
            margin-top: 2rem;
        }

        footer a {
            color: white;
            text-decoration: none;
        }

        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }
        }
    </style>
</head>
<body>
    <#include "/common/nav.ftl">
    <main>
        <section class="about-section">
            <h1>关于码农小屋</h1>
            <p>码农小屋是一个致力于分享编程技术、开发经验和实用工具的技术博客。我们希望通过知识分享，帮助更多的开发者在编程之路上不断进步。</p>

            <h2>我们的愿景</h2>
            <p>打造一个优质的技术交流平台，让知识分享变得简单而有趣。我们相信，技术改变生活，分享创造价值。</p>

            <h2>主要方向</h2>
            <div class="skills">
                <span class="skill-tag">前端开发</span>
                <span class="skill-tag">后端开发</span>
                <span class="skill-tag">Python</span>
                <span class="skill-tag">JavaScript</span>
                <span class="skill-tag">React</span>
                <span class="skill-tag">机器学习</span>
                <span class="skill-tag">算法</span>
                <span class="skill-tag">数据库</span>
            </div>

            <h2>更新计划</h2>
            <p>我们会定期更新以下内容：</p>
            <ul style="margin-left: 2rem; margin-bottom: 1rem;">
                <li>技术教程和最佳实践</li>
                <li>编程语言深度解析</li>
                <li>实用开发工具推荐</li>
                <li>程序员成长经验分享</li>
            </ul>

            <div class="contact-info">
                <h2>联系我们</h2>
                <p>如果您有任何问题、建议或合作意向，欢迎通过以下方式联系我们：</p>
                <p>邮箱：qyhua0@hotmail.com</p>
                <!--
                <p>GitHub：github.com/qyhua0/blog</p>
                -->
            </div>
        </section>
    </main>

    <footer>
        <p>© 2024 码农小屋. <a href="http://beian.miit.gov.cn/" target="_blank" rel="noreferrer noopener">粤ICP备2024335469号-1</a></p>
    </footer>
</body>
</html>