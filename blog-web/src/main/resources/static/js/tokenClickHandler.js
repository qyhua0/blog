/**
 * @author zhenhua
 * 初始化全局的 a 标签点击拦截逻辑。
 * 在 a 标签点击时，附加 Authorization Token 并发起请求。
 *
 * @param {function} getToken - 返回当前 Token 的函数。
 * @param {function} onUnauthorized - 在权限验证失败时的回调函数（可选）。
 */
function initializeTokenClickHandler(getToken, onUnauthorized) {
    document.addEventListener('DOMContentLoaded', () => {
        document.body.addEventListener('click', (event) => {
            const target = event.target;
            if (target.tagName === 'A' && target.href) {
                event.preventDefault();

                const token = getToken(); // 从外部传入的函数获取 Token

                if (!token) {
                    console.error('Token 未提供！');
                    if (onUnauthorized) onUnauthorized();
                    return;
                }

                const url = target.href;

                // 使用 Fetch API 发起请求
                fetch(url, {
                    method: 'GET',
                    headers: {
                        Authorization: `Bearer ${token}`,
                    },
                })
                    .then((response) => {
                        if (response.ok) {
                            return response.text();
                        } else {
                            throw new Error('权限验证失败！');
                        }
                    })
                    .then((html) => {
                        document.open();
                        document.write(html); // 替换当前页面内容
                        document.close();
                    })
                    .catch((error) => {
                        console.error(error);
                        alert('请求失败或无权限！');
                        if (onUnauthorized) onUnauthorized();
                    });
            }
        });
    });
}

// 导出函数模块
export { initializeTokenClickHandler };