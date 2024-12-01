<!-- 前端页面代码 login.html -->
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>码农小屋 - 登录</title>
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
            background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 2.5rem;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            backdrop-filter: blur(10px);
        }

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .logo {
            font-size: 2rem;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 0.5rem;
        }

        .subtitle {
            color: #666;
            font-size: 0.9rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #2c3e50;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 0.8rem;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: white;
        }

        .form-control:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            outline: none;
        }

        .error-message {
            color: #e74c3c;
            font-size: 0.875rem;
            margin-top: 0.25rem;
            display: none;
        }

        .btn {
            width: 100%;
            padding: 1rem;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background: #2980b9;
            transform: translateY(-1px);
        }

        .btn:active {
            transform: translateY(0);
        }

        .btn.disabled {
            background: #95a5a6;
            cursor: not-allowed;
        }

        .password-toggle {
            position: absolute;
            right: 12px;
            top: 38px;
            cursor: pointer;
            color: #666;
        }

        .loading-spinner {
            display: none;
            width: 20px;
            height: 20px;
            border: 2px solid #fff;
            border-radius: 50%;
            border-top-color: transparent;
            animation: spin 0.8s linear infinite;
            margin: 0 auto;
        }

        @keyframes spin {
            to {
                transform: rotate(360deg);
            }
        }

        .timer {
            text-align: center;
            color: #e74c3c;
            margin-top: 1rem;
            display: none;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <div class="logo">码农小屋</div>
            <div class="subtitle">探索技术的无限可能</div>
        </div>

        <form id="loginForm" novalidate>
            <div class="form-group">
                <label for="username">用户名</label>
                <input type="text" id="username" name="username" class="form-control" placeholder="请输入用户名" autocomplete="username">
                <div class="error-message" id="usernameError">请输入用户名</div>
            </div>

            <div class="form-group">
                <label for="password">密码</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码" autocomplete="current-password">
                <span class="password-toggle" id="passwordToggle">👁️</span>
                <div class="error-message" id="passwordError">请输入密码</div>
            </div>

            <button type="submit" class="btn" id="loginBtn">
                <span>登 录</span>
                <div class="loading-spinner"></div>
            </button>

            <div class="timer" id="timer"></div>
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const loginForm = document.getElementById('loginForm');
            const loginBtn = document.getElementById('loginBtn');
            const spinner = document.querySelector('.loading-spinner');
            const passwordToggle = document.getElementById('passwordToggle');
            const passwordInput = document.getElementById('password');
            const timer = document.getElementById('timer');

            // 切换密码显示/隐藏
            passwordToggle.addEventListener('click', function() {
                const type = passwordInput.type === 'password' ? 'text' : 'password';
                passwordInput.type = type;
                passwordToggle.textContent = type === 'password' ? '👁️' : '👁️‍🗨️';
            });

            // 表单提交处理
            loginForm.addEventListener('submit', async function(e) {
                e.preventDefault();
                
                // 重置错误提示
                document.querySelectorAll('.error-message').forEach(el => el.style.display = 'none');
                
                // 表单验证
                let isValid = true;
                const username = document.getElementById('username').value.trim();
                const password = document.getElementById('password').value;
                
                if (!username) {
                    document.getElementById('usernameError').style.display = 'block';
                    isValid = false;
                }
                
                if (!password) {
                    document.getElementById('passwordError').style.display = 'block';
                    isValid = false;
                }
                
                if (!isValid) return;

                // 显示加载状态
                loginBtn.disabled = true;
                loginBtn.querySelector('span').style.display = 'none';
                spinner.style.display = 'block';

                try {
                    const response = await fetch('/doLogin', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify({ username, password })
                    });

                    const data = await response.json();

                    if (response.ok) {
                        // 登录成功，重定向到首页
                        window.location.href = '/';
                    } else {
                        // 登录失败处理
                        if (data.remainingTime > 0) {
                            // 显示剩余等待时间
                            startTimer(data.remainingTime);
                        } else {
                            // 显示错误信息
                            document.getElementById('passwordError').textContent = data.message;
                            document.getElementById('passwordError').style.display = 'block';
                        }
                    }
                } catch (error) {
                    console.error('Error:', error);
                    document.getElementById('passwordError').textContent = '登录失败，请稍后重试';
                    document.getElementById('passwordError').style.display = 'block';
                } finally {
                    // 恢复按钮状态
                    loginBtn.disabled = false;
                    loginBtn.querySelector('span').style.display = 'block';
                    spinner.style.display = 'none';
                }
            });

            // 倒计时功能
            function startTimer(seconds) {
                loginBtn.disabled = true;
                loginBtn.classList.add('disabled');
                timer.style.display = 'block';
                
                const intervalId = setInterval(() => {
                    const minutes = Math.floor(seconds / 60);
                    const remainingSeconds = seconds % 60;
                    timer.textContent = `请等待 ${minutes}:${remainingSeconds.toString().padStart(2, '0')} 后重试`;
                    
                    if (seconds <= 0) {
                        clearInterval(intervalId);
                        loginBtn.disabled = false;
                        loginBtn.classList.remove('disabled');
                        timer.style.display = 'none';
                    }
                    seconds--;
                }, 1000);
            }
        });
    </script>
</body>
</html>
