<header>
        <nav>
            <div class="logo">码农小屋   （建设中……）</div>
            <div class="nav-links">
                <a href="/">首页</a>
                <a href="#">文章</a>
                <a href="/json">Json格式化</a>
                <a href="/abort">关于</a>
            </div>
<#--            <div class="nav-right"><a href="/admin/add">发布</a></div>-->
        </nav>
    <a href="/admin/add" class="login-btn">发布文章</a>

    <script type="module">
        import { initializeTokenClickHandler } from '/js/tokenClickHandler.js';

        // 获取 Token 的方法
        const getToken = () => localStorage.getItem('x-token');

        // 权限验证失败时的回调
        const onUnauthorized = () => {
            alert('您没有访问权限，请登录！');
        };

        // 初始化拦截器
        initializeTokenClickHandler(getToken, onUnauthorized);
    </script>
</header>