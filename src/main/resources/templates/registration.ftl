<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account - Platform</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
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
            max-width: 420px;
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

        .form-control::placeholder {
            color: var(--text-muted);
        }

        .form-control:focus {
            border-color: var(--border-focus);
            box-shadow: 0 0 0 3px rgb(59 130 246 / 0.1);
            background: rgba(255, 255, 255, 0.95);
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

        .help-text {
            font-size: 0.75rem;
            color: var(--text-muted);
            margin-top: 0.25rem;
        }

        .password-requirements {
            display: none;
            margin-top: 0.5rem;
            padding: 0.75rem;
            background: rgba(248, 250, 252, 0.8);
            backdrop-filter: blur(5px);
            border-radius: var(--radius-sm);
            border: 1px solid var(--border-color);
        }

        .requirement {
            display: flex;
            align-items: center;
            font-size: 0.75rem;
            margin: 0.25rem 0;
            color: var(--text-muted);
        }

        .requirement-icon {
            width: 1rem;
            height: 1rem;
            margin-right: 0.5rem;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.625rem;
            font-weight: 600;
        }

        .requirement.unmet .requirement-icon {
            background: #fee2e2;
            color: var(--error-color);
        }

        .requirement.met .requirement-icon {
            background: #dcfce7;
            color: var(--success-color);
        }

        .radio-group {
            display: flex;
            gap: 1.5rem;
            margin-top: 0.5rem;
        }

        .radio-option {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .radio-option input[type="radio"] {
            appearance: none;
            width: 1.25rem;
            height: 1.25rem;
            border: 2px solid var(--border-color);
            border-radius: 50%;
            margin-right: 0.5rem;
            position: relative;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .radio-option input[type="radio"]:checked {
            border-color: var(--primary-color);
            background: var(--primary-color);
        }

        .radio-option input[type="radio"]:checked::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 0.375rem;
            height: 0.375rem;
            background: white;
            border-radius: 50%;
        }

        .radio-option label {
            font-size: 0.875rem;
            color: var(--text-primary);
            cursor: pointer;
            margin: 0;
        }

        .admin-key-section {
            display: none;
            animation: slideDown 0.3s ease-out;
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
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

        .btn-primary:disabled {
            background: var(--text-muted);
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        .error-message, .success-message {
            display: none;
            margin-top: 0.5rem;
            padding: 0.5rem 0.75rem;
            border-radius: var(--radius-sm);
            font-size: 0.75rem;
            font-weight: 500;
        }

        .error-message {
            background: rgba(254, 242, 242, 0.9);
            color: var(--error-color);
            border: 1px solid #fecaca;
            backdrop-filter: blur(5px);
        }

        .success-message {
            background: rgba(240, 253, 244, 0.9);
            color: var(--success-color);
            border: 1px solid #bbf7d0;
            backdrop-filter: blur(5px);
        }

        .login-link {
            text-align: center;
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 1px solid rgba(226, 232, 240, 0.5);
        }

        .login-link p {
            color: var(--text-secondary);
            font-size: 0.875rem;
            margin: 0;
        }

        .login-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s ease;
        }

        .login-link a:hover {
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

            .radio-group {
                flex-direction: column;
                gap: 0.75rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Create Account</h1>
            <p>Join our platform and get started today</p>
        </div>

        <form action="/register" method="post" id="registrationForm" novalidate>
            <div class="form-group">
                <label for="username">Username</label>
                <div class="input-wrapper">
                    <input type="text" class="form-control" id="username" name="username" required placeholder="Enter your username">
                </div>
                <div class="help-text">This will be your public display name</div>
                <div id="usernameError" class="error-message">Username is required</div>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <div class="input-wrapper">
                    <input type="email" class="form-control" id="email" name="email" required placeholder="Enter your email">
                </div>
                <div id="emailError" class="error-message">Please enter a valid email address</div>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <div class="input-wrapper">
                    <input type="password" class="form-control" id="password" name="password" required placeholder="Create a secure password">
                </div>
                <div class="password-requirements">
                    <div class="requirement unmet" id="lengthReq">
                        <span class="requirement-icon">✗</span>
                        <span>At least 8 characters long</span>
                    </div>
                </div>
                <div id="passwordError" class="error-message">Password must meet all requirements</div>
                <div id="passwordSuccess" class="success-message">Password is strong!</div>
            </div>

            <div class="form-group">
                <label>Account Type</label>
                <div class="radio-group">
                    <div class="radio-option">
                        <input type="radio" id="userRadio" name="userType" value="user" checked>
                        <label for="userRadio">Regular User</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="adminRadio" name="userType" value="admin">
                        <label for="adminRadio">Administrator</label>
                    </div>
                </div>
            </div>

            <div class="form-group admin-key-section" id="adminKeySection">
                <label for="adminKey">Administrator Key</label>
                <div class="input-wrapper">
                    <input type="password" class="form-control" id="adminKey" name="adminKey" placeholder="Enter administrator key" autocomplete="off">
                </div>
                <div class="help-text">Required for administrator account creation</div>
                <div id="adminKeyError" class="error-message">Invalid administrator key</div>
            </div>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="submit" class="btn-primary" id="submitBtn" disabled>Create Account</button>
        </form>

        <div class="login-link">
            <p>Already have an account? <a href="/login">Sign in here</a></p>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('registrationForm');
            const usernameInput = document.getElementById('username');
            const emailInput = document.getElementById('email');
            const passwordInput = document.getElementById('password');
            const userRadio = document.getElementById('userRadio');
            const adminRadio = document.getElementById('adminRadio');
            const adminKeySection = document.getElementById('adminKeySection');
            const adminKeyInput = document.getElementById('adminKey');
            const submitBtn = document.getElementById('submitBtn');

            // Error message elements
            const usernameError = document.getElementById('usernameError');
            const emailError = document.getElementById('emailError');
            const passwordError = document.getElementById('passwordError');
            const passwordSuccess = document.getElementById('passwordSuccess');
            const adminKeyError = document.getElementById('adminKeyError');

            // Password requirement elements
            const lengthReq = document.getElementById('lengthReq');

            const VALID_ADMIN_KEY = 'admin'; // The only valid admin key

            // Validation functions
            function validateUsername() {
                const username = usernameInput.value.trim();
                const isValid = username.length >= 3;

                if (username.length === 0) {
                    usernameInput.classList.remove('error', 'success');
                    usernameError.style.display = 'none';
                } else if (isValid) {
                    usernameInput.classList.remove('error');
                    usernameInput.classList.add('success');
                    usernameError.style.display = 'none';
                } else {
                    usernameInput.classList.remove('success');
                    usernameInput.classList.add('error');
                    usernameError.textContent = 'Username must be at least 3 characters long';
                    usernameError.style.display = 'block';
                }

                return isValid || username.length === 0;
            }

            function validateEmail() {
                const email = emailInput.value.trim();
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                const isValid = emailRegex.test(email);

                if (email.length === 0) {
                    emailInput.classList.remove('error', 'success');
                    emailError.style.display = 'none';
                } else if (isValid) {
                    emailInput.classList.remove('error');
                    emailInput.classList.add('success');
                    emailError.style.display = 'none';
                } else {
                    emailInput.classList.remove('success');
                    emailInput.classList.add('error');
                    emailError.style.display = 'block';
                }

                return isValid || email.length === 0;
            }

            function validatePassword() {
                const password = passwordInput.value;
                const isLengthValid = password.length >= 8;

                // Update requirement indicator
                if (isLengthValid) {
                    lengthReq.classList.remove('unmet');
                    lengthReq.classList.add('met');
                    lengthReq.querySelector('.requirement-icon').textContent = '✓';
                } else {
                    lengthReq.classList.remove('met');
                    lengthReq.classList.add('unmet');
                    lengthReq.querySelector('.requirement-icon').textContent = '✗';
                }

                if (password.length === 0) {
                    passwordInput.classList.remove('error', 'success');
                    passwordError.style.display = 'none';
                    passwordSuccess.style.display = 'none';
                } else if (isLengthValid) {
                    passwordInput.classList.remove('error');
                    passwordInput.classList.add('success');
                    passwordError.style.display = 'none';
                    passwordSuccess.style.display = 'block';
                } else {
                    passwordInput.classList.remove('success');
                    passwordInput.classList.add('error');
                    passwordError.style.display = 'block';
                    passwordSuccess.style.display = 'none';
                }

                return isLengthValid || password.length === 0;
            }

            function validateAdminKey() {
                if (adminRadio.checked) {
                    const adminKey = adminKeyInput.value.trim();
                    const isValid = adminKey === VALID_ADMIN_KEY;

                    if (adminKey.length === 0) {
                        adminKeyInput.classList.remove('error', 'success');
                        adminKeyError.textContent = 'Administrator key is required';
                        adminKeyError.style.display = 'block';
                        return false;
                    } else if (isValid) {
                        adminKeyInput.classList.remove('error');
                        adminKeyInput.classList.add('success');
                        adminKeyError.style.display = 'none';
                        return true;
                    } else {
                        adminKeyInput.classList.remove('success');
                        adminKeyInput.classList.add('error');
                        adminKeyError.textContent = 'Invalid administrator key. Please contact your system administrator.';
                        adminKeyError.style.display = 'block';
                        return false;
                    }
                }

                adminKeyInput.classList.remove('error', 'success');
                adminKeyError.style.display = 'none';
                return true;
            }

            function updateSubmitButton() {
                const isUsernameValid = usernameInput.value.trim().length >= 3;
                const isEmailValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailInput.value.trim());
                const isPasswordValid = passwordInput.value.length >= 8;
                const isAdminKeyValid = validateAdminKey();

                const allValid = isUsernameValid && isEmailValid && isPasswordValid && isAdminKeyValid;
                submitBtn.disabled = !allValid;
            }

            function handleAccountTypeChange() {
                if (adminRadio.checked) {
                    adminKeySection.style.display = 'block';
                    adminKeyInput.setAttribute('required', 'true');
                } else {
                    adminKeySection.style.display = 'none';
                    adminKeyInput.removeAttribute('required');
                    adminKeyInput.value = '';
                    adminKeyInput.classList.remove('error', 'success');
                    adminKeyError.style.display = 'none';
                }
                updateSubmitButton();
            }

            // Event listeners
            usernameInput.addEventListener('input', function() {
                validateUsername();
                updateSubmitButton();
            });

            emailInput.addEventListener('input', function() {
                validateEmail();
                updateSubmitButton();
            });

            passwordInput.addEventListener('input', function() {
                validatePassword();
                updateSubmitButton();
            });

            adminKeyInput.addEventListener('input', function() {
                validateAdminKey();
                updateSubmitButton();
            });

            userRadio.addEventListener('change', handleAccountTypeChange);
            adminRadio.addEventListener('change', handleAccountTypeChange);

            form.addEventListener('submit', function(e) {
                // Final validation before submit
                const isUsernameValid = usernameInput.value.trim().length >= 3;
                const isEmailValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailInput.value.trim());
                const isPasswordValid = passwordInput.value.length >= 8;
                const isAdminKeyValid = validateAdminKey();

                if (!isUsernameValid || !isEmailValid || !isPasswordValid || !isAdminKeyValid) {
                    e.preventDefault();

                    // Show all validation errors
                    validateUsername();
                    validateEmail();
                    validatePassword();
                    validateAdminKey();

                    // Focus on first invalid field
                    if (!isUsernameValid) {
                        usernameInput.focus();
                    } else if (!isEmailValid) {
                        emailInput.focus();
                    } else if (!isPasswordValid) {
                        passwordInput.focus();
                    } else if (!isAdminKeyValid) {
                        adminKeyInput.focus();
                    }
                }
            });

            // Initial state
            updateSubmitButton();
            handleAccountTypeChange();
        });
    </script>
</body>
</html>