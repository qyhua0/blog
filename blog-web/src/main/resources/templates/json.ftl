<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>工具 - 码农小屋</title>
    <link rel="stylesheet" href="./css/json.css">

</head>
<body>
    <#include "/common/nav.ftl">
    <main>
        <section class="tool-section">
            <h1>JSON格式化工具</h1>
            <p class="tool-description">
                JSON格式化工具，可以帮助您美化和验证JSON数据。
                支持大量文本输入，自动缩进和格式化，使JSON数据更易读。
            </p>

            <div class="json-tool">
                <div class="input-area">
                    <div class="label">输入JSON数据：</div>
                    <textarea id="jsonInput" placeholder="请在此输入需要格式化的JSON数据..."></textarea>
                </div>
                <div class="output-area">
                    <div class="label">格式化结果：</div>
                    <textarea id="jsonOutput" readonly placeholder="格式化后的JSON将显示在这里..."></textarea>
                </div>
            </div>

            <div class="button-group">
                <button onclick="formatJSON()">格式化JSON</button>
                <button onclick="clearAll()">清空</button>
            </div>
            <div id="errorMessage" class="error-message"></div>
        </section>
    </main>

<#include "/common/footer.ftl">

    <script>
        function formatJSON() {
            const input = document.getElementById('jsonInput').value;
            const outputArea = document.getElementById('jsonOutput');
            const errorArea = document.getElementById('errorMessage');

            if (!input.trim()) {
                errorArea.textContent = '请输入JSON数据';
                return;
            }

            try {
                // 先解析JSON以验证格式
                const parsed = JSON.parse(input);
                // 使用2个空格进行缩进格式化
                const formatted = JSON.stringify(parsed, null, 2);
                outputArea.value = formatted;
                errorArea.textContent = '';
            } catch (e) {
                errorArea.textContent = '无效的JSON格式：' + e.message;
                outputArea.value = '';
            }
        }

        function clearAll() {
            document.getElementById('jsonInput').value = '';
            document.getElementById('jsonOutput').value = '';
            document.getElementById('errorMessage').textContent = '';
        }

        // 示例JSON数据
        const exampleJson = {
            "name": "码农小屋",
            "description": "技术博客",
            "features": ["教程", "工具", "分享"],
            "active": true,
            "stats": {
                "articles": 100,
                "users": 1000
            }
        };

        // 页面加载时添加示例数据
        window.onload = function() {
            document.getElementById('jsonInput').value = JSON.stringify(exampleJson);
            formatJSON();
        }
    </script>
</body>
</html>