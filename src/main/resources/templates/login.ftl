<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In - Platform</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2563eb;
            --primary-hover: #1d4ed8;
            --primary-light: #dbeafe;
            --secondary-color: #64748b;
            --success-color: #059669;
            --error-color: #dc2626;
            --warning-color: #d97706;
            --background: #f8fafc;
            --surface: #ffffff;
            --text-primary: #0f172a;
            --text-secondary: #475569;
            --text-muted: #94a3b8;
            --border-color: #e2e8f0;
            --border-focus: #3b82f6;
            --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
            --radius-sm: 0.375rem;
            --radius-md: 0.5rem;
            --radius-lg: 0.75rem;
        }

        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-primary);
            line-height: 1.6;
            position: relative;
            background: #f0f9ff;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background:
                radial-gradient(circle at 20% 50%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(255, 99, 132, 0.2) 0%, transparent 50%),
                radial-gradient(circle at 40% 80%, rgba(54, 162, 235, 0.2) 0%, transparent 50%),
                linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 50%, #f0f4ff 100%);
            animation: float 20s ease-in-out infinite;
            z-index: -2;
        }

        body::after {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image:
                radial-gradient(circle at 25% 25%, rgba(255, 255, 255, 0.8) 1px, transparent 1px),
                radial-gradient(circle at 75% 75%, rgba(255, 255, 255, 0.6) 1px, transparent 1px);
            background-size: 50px 50px, 80px 80px;
            opacity: 0.4;
            z-index: -1;
            animation: drift 30s linear infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            33% { transform: translateY(-10px) rotate(1deg); }
            66% { transform: translateY(5px) rotate(-1deg); }
        }

        @keyframes drift {
            0% { transform: translateX(0px); }
            100% { transform: translateX(50px); }
        }

        .wrapper {
            transform: translateX(-50px);
            opacity: 0;
            transition: all 0.8s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            z-index: 1;
        }

        .wrapper.show {
            transform: translateX(0);
            opacity: 1;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 2.5rem;
            border-radius: var(--radius-lg);
            box-shadow:
                0 20px 25px -5px rgb(0 0 0 / 0.1),
                0 10px 10px -5px rgb(0 0 0 / 0.04),
                0 0 0 1px rgba(255, 255, 255, 0.1);
            width: 100%;
            max-width: 400px;
            margin: 1rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 1px;
            background: linear-gradient(90deg, transparent, rgba(59, 130, 246, 0.3), transparent);
        }

        .header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .header h1 {
            font-size: 1.875rem;
            font-weight: 700;
            color: var(--text-primary);
            margin: 0 0 0.5rem 0;
            letter-spacing: -0.025em;
        }

        .header p {
            color: var(--text-secondary);
            font-size: 0.875rem;
            margin: 0;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group:last-of-type {
            margin-bottom: 2rem;
        }

        label {
            display: block;
            font-weight: 500;
            font-size: 0.875rem;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
        }

        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-icon {
            position: absolute;
            left: 0.875rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
            font-size: 0.875rem;
            pointer-events: none;
            z-index: 2;
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid var(--border-color);
            border-radius: var(--radius-md);
            font-size: 0.875rem;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(5px);
            color: var(--text-primary);
            transition: all 0.2s ease;
            outline: none;
        }

        .form-control.has-icon {
            padding-left: 2.5rem;
        }

        .form-control::placeholder {
            color: var(--text-muted);
        }

        .form-control:focus {
            border-color: var(--border-focus);
            box-shadow: 0 0 0 3px rgb(59 130 246 / 0.1);
            background: rgba(255, 255, 255, 0.95);
        }

        .form-control:focus + .input-icon {
            color: var(--border-focus);
        }

        .form-control.success {
            border-color: var(--success-color);
            background-image: url("data:image/svg+xml,%3csvg width='16' height='16' viewBox='0 0 16 16' fill='none' xmlns='http://www.w3.org/2000/svg'%3e%3cpath d='m13.854 3.646-7.5 7.5L2.646 7.439a.5.5 0 1 0-.708.708l4 4a.5.5 0 0 0 .708 0l8-8a.5.5 0 0 0-.708-.708z' fill='%23059669'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 0.75rem center;
            padding-right: 2.5rem;
        }

        .form-control.error {
            border-color: var(--error-color);
            background-image: url("data:image/svg+xml,%3csvg width='16' height='16' viewBox='0 0 16 16' fill='none' xmlns='http://www.w3.org/2000/svg'%3e%3cpath d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zM8 4a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 1 0v-3A.5.5 0 0 0 8 4zm0 8a.75.75 0 1 0 0-1.5.75.75 0 0 0 0 1.5z' fill='%23dc2626'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 0.75rem center;
            padding-right: 2.5rem;
        }

        .btn-primary {
            width: 100%;
            padding: 0.875rem 1.5rem;
            background: linear-gradient(135deg, var(--primary-color), #1e40af);
            color: white;
            border: none;
            border-radius: var(--radius-md);
            font-size: 0.875rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            outline: none;
            position: relative;
            overflow: hidden;
        }

        .btn-primary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .btn-primary:hover:not(:disabled)::before {
            left: 100%;
        }

        .btn-primary:hover:not(:disabled) {
            background: linear-gradient(135deg, var(--primary-hover), #1d4ed8);
            transform: translateY(-1px);
            box-shadow: 0 10px 20px rgba(37, 99, 235, 0.3);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        .btn-primary:disabled {
            background: var(--text-muted);
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        .error-message {
            background: rgba(254, 242, 242, 0.9);
            color: var(--error-color);
            border: 1px solid #fecaca;
            padding: 0.75rem 1rem;
            border-radius: var(--radius-md);
            font-size: 0.875rem;
            font-weight: 500;
            margin-top: 1rem;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            backdrop-filter: blur(5px);
        }

        .error-message::before {
            content: "⚠";
            font-size: 1rem;
        }

        .register-link {
            text-align: center;
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 1px solid rgba(226, 232, 240, 0.5);
        }

        .register-link p {
            color: var(--text-secondary);
            font-size: 0.875rem;
            margin: 0;
        }

        .register-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s ease;
        }

        .register-link a:hover {
            color: var(--primary-hover);
            text-decoration: underline;
        }

        .forgot-password {
            text-align: right;
            margin-top: 0.5rem;
        }

        .forgot-password a {
            color: var(--primary-color);
            text-decoration: none;
            font-size: 0.75rem;
            transition: color 0.2s ease;
        }

        .forgot-password a:hover {
            color: var(--primary-hover);
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .container {
                padding: 1.5rem;
                margin: 0.5rem;
            }

            .header h1 {
                font-size: 1.5rem;
            }
        }

        .btn-primary.loading {
            position: relative;
            color: transparent;
        }

        .btn-primary.loading::after {
            content: '';
            position: absolute;
            width: 1rem;
            height: 1rem;
            top: 50%;
            left: 50%;
            margin-left: -0.5rem;
            margin-top: -0.5rem;
            border: 2px solid transparent;
            border-top-color: white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="header">
                <h1>Welcome Back</h1>
                <p>Sign in to your account to continue</p>
            </div>

            <form action="/login" method="post" id="loginForm" novalidate>
                <div class="form-group">
                    <label for="username">Email Address</label>
                    <div class="input-wrapper">
                        <input type="email" class="form-control has-icon" id="username" name="username" placeholder="Enter your email" required autocomplete="email">
                        <span class="input-icon">✉</span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-wrapper">
                        <input type="password" class="form-control has-icon" id="password" name="password" placeholder="Enter your password" required autocomplete="current-password">
                        <span class="input-icon">🔒</span>
                    </div>
                    <div class="forgot-password">
                        <a href="/forgot-password">Forgot password?</a>
                    </div>
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit" class="btn-primary" id="submitBtn">Sign In</button>
            </form>

            <#if error??>
                <div class="error-message">
                    Invalid email or password. Please try again.
                </div>
            </#if>

            <div class="register-link">
                <p>Don't have an account? <a href="/register">Create one here</a></p>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const wrapper = document.querySelector('.wrapper');
            const form = document.getElementById('loginForm');
            const submitBtn = document.getElementById('submitBtn');
            const usernameInput = document.getElementById('username');
            const passwordInput = document.getElementById('password');

            // Show animation
            setTimeout(function() {
                wrapper.classList.add('show');
            }, 100);

            // Form validation
            function validateEmail(email) {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                return emailRegex.test(email);
            }

            function updateFormState() {
                const email = usernameInput.value.trim();
                const password = passwordInput.value;
                const isEmailValid = validateEmail(email);
                const isPasswordValid = password.length > 0;

                // Update email field visual state
                if (email.length > 0) {
                    if (isEmailValid) {
                        usernameInput.classList.remove('error');
                        usernameInput.classList.add('success');
                    } else {
                        usernameInput.classList.remove('success');
                        usernameInput.classList.add('error');
                    }
                } else {
                    usernameInput.classList.remove('error', 'success');
                }

                // Update password field visual state
                if (password.length > 0) {
                    passwordInput.classList.remove('error');
                    passwordInput.classList.add('success');
                } else {
                    passwordInput.classList.remove('error', 'success');
                }

                // Enable/disable submit button
                submitBtn.disabled = !(isEmailValid && isPasswordValid);
            }

            // Add event listeners
            usernameInput.addEventListener('input', updateFormState);
            usernameInput.addEventListener('blur', updateFormState);
            passwordInput.addEventListener('input', updateFormState);
            passwordInput.addEventListener('blur', updateFormState);

            // Handle form submission
            form.addEventListener('submit', function(e) {
                const email = usernameInput.value.trim();
                const password = passwordInput.value;

                if (!validateEmail(email) || !password) {
                    e.preventDefault();
                    if (!validateEmail(email)) {
                        usernameInput.classList.add('error');
                        usernameInput.focus();
                    } else if (!password) {
                        passwordInput.classList.add('error');
                        passwordInput.focus();
                    }
                    return;
                }

                // Add loading state
                submitBtn.classList.add('loading');
                submitBtn.disabled = true;
            });

            // Initial state
            updateFormState();
        });
    </script>
</body>
</html>