<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Your Account</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Poppins:wght@500;700&display=swap" rel="stylesheet">
    <style>
        /* Define CSS Variables for easy color management */
        :root {
            --bg-color: #E6E6FA; /* Light Lavender */
            --pop-up-bg-color: #FFFFFF; /* Pure White */
            --primary-text-color: #5D3FD3; /* Dark Lavender for general text on pop-up */
            --secondary-text-color: #B0C4DE; /* Light Steel Blue for muted elements/placeholders */
            --link-color: #8A2BE2; /* Blue Violet for links */
            --success-color: #4CAF50;
            --error-color: #D32F2F;
            --border-color: #E0E0E0; /* Light grey border for inputs */
        }

        body {
            font-family: 'Open Sans', sans-serif; /* Body font */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: var(--bg-color); /* Plain light lavender background */
            color: var(--primary-text-color); /* Default text color for the body (overridden by container) */
        }

        .container {
            background-color: var(--pop-up-bg-color); /* Pure White background for the form */
            padding: 25px; /* Even more reduced padding */
            border-radius: 12px; /* Consistent rounded corners */
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            width: 350px; /* Even smaller fixed width */
            max-width: 90%; /* Responsive max width */
            height: fit-content;
            text-align: left; /* Ensure text inside is left-aligned */
        }

        h2 {
            font-family: 'Poppins', sans-serif; /* Poppins for headings */
            text-align: center;
            margin-bottom: 25px;
            color: var(--primary-text-color); /* Dark Lavender heading on white pop-up */
            font-weight: 700;
            font-size: 2.1em; /* Slightly smaller heading */
        }

        .form-group {
            margin-bottom: 15px; /* Reduced spacing between form groups */
        }
        label {
            font-family: 'Open Sans', sans-serif; /* Open Sans for labels */
            font-weight: 600;
            display: block;
            margin-bottom: 5px; /* Reduced space below label */
            color: var(--primary-text-color); /* Dark Lavender label on white pop-up */
            font-size: 0.9em;
        }
        .form-control {
            font-family: 'Open Sans', sans-serif; /* Open Sans for input text */
            width: 100%;
            height: 42px; /* Slightly smaller input height */
            padding: 10px 14px;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            box-sizing: border-box;
            background-color: #F8F8F8; /* Very light grey input field for subtle contrast */
            color: var(--primary-text-color); /* Dark Lavender text inside input */
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        .form-control::placeholder {
            color: var(--secondary-text-color); /* Light Steel Blue placeholder text */
        }
        .form-control:focus {
            border-color: var(--primary-text-color); /* Dark Lavender border on focus */
            box-shadow: 0 0 0 0.2rem rgba(93, 63, 211, 0.4); /* Dark Lavender focus ring */
            outline: none;
        }
        .form-control.error {
            border-color: var(--error-color);
            box-shadow: 0 0 0 0.2rem rgba(211, 47, 47, 0.25);
        }
        .form-control.success {
            border-color: var(--success-color);
            box-shadow: 0 0 0 0.2rem rgba(76, 175, 80, 0.25);
        }
        .btn-primary {
            font-family: 'Poppins', sans-serif; /* Poppins for buttons */
            background-color: var(--primary-text-color); /* Dark Lavender button */
            color: var(--pop-up-bg-color); /* White text on lavender button */
            border: none;
            margin-top: 20px;
            padding: 10px 22px; /* Slightly adjusted padding */
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            font-size: 1.05em; /* Slightly adjusted font size */
            font-weight: 700;
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn-primary:hover:not(:disabled) {
            background-color: #6A4DB8; /* Slightly darker lavender on hover */
            transform: translateY(-2px);
        }
        .btn-primary:disabled {
            background-color: var(--secondary-text-color); /* Muted grey for disabled state */
            color: rgba(255, 255, 255, 0.7);
            cursor: not-allowed;
            opacity: 0.7;
        }
        p {
            margin-top: 20px;
            text-align: center;
            color: var(--primary-text-color); /* Dark Lavender text on white pop-up */
            font-size: 0.85em;
        }
        a {
            color: var(--link-color); /* Blue Violet for links */
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }
        a:hover {
            text-decoration: underline;
            color: #AF7AC5; /* Slightly lighter violet on hover */
        }
        .error-message {
            color: var(--primary-text-color); /* Dark Lavender for error messages */
            font-size: 0.78em;
            margin-top: 4px;
            display: none;
            font-weight: 600;
            background-color: rgba(230, 230, 250, 0.5); /* Semi-transparent light lavender background */
            padding: 3px 8px;
            border-radius: 4px;
        }
        .success-message {
            color: var(--primary-text-color); /* Dark Lavender for success messages */
            font-size: 0.78em;
            margin-top: 4px;
            display: none;
            font-weight: 600;
            background-color: rgba(230, 230, 250, 0.5); /* Semi-transparent light lavender background */
            padding: 3px 8px;
            border-radius: 4px;
        }
        .password-requirements {
            font-size: 0.7em; /* Smallest font for requirements */
            margin-top: 6px;
            color: var(--secondary-text-color); /* Light Steel Blue for muted text */
            padding-left: 0;
        }
        .requirement {
            display: flex;
            align-items: center;
            margin: 3px 0;
        }
        .requirement::before {
            content: "•";
            margin-right: 8px;
            font-weight: bold;
            font-size: 1.1em;
            width: 15px;
            text-align: left;
            color: var(--secondary-text-color); /* Muted bullet point */
        }
        .requirement.met {
            color: var(--success-color);
        }
        .requirement.met::before {
            content: "✓";
            color: var(--success-color);
            font-weight: bold;
        }
        .requirement.unmet {
            color: var(--error-color);
        }
        .requirement.unmet::before {
            content: "✗";
            color: var(--error-color);
            font-weight: bold;
        }

        /* Radio Buttons */
        .radio-group {
            display: flex;
            gap: 20px;
            margin-top: 10px;
        }
        .radio-group input[type="radio"] {
            appearance: none;
            width: 18px;
            height: 18px;
            border-radius: 50%;
            border: 2px solid var(--secondary-text-color); /* Border for radio button */
            background-color: transparent;
            margin-right: 8px;
            cursor: pointer;
            position: relative;
            flex-shrink: 0;
            transition: background-color 0.2s, border-color 0.2s;
        }
        .radio-group input[type="radio"]:checked {
            background-color: var(--primary-text-color); /* Filled with lavender when checked */
            border-color: var(--primary-text-color);
        }
        .radio-group input[type="radio"]:checked::before {
            content: '';
            display: block;
            width: 8px;
            height: 8px;
            background-color: var(--pop-up-bg-color); /* White dot */
            border-radius: 50%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .radio-group label {
            display: flex;
            align-items: center;
            font-weight: 400;
            cursor: pointer;
            margin-bottom: 0;
            color: var(--primary-text-color); /* Dark Lavender text for radio labels */
        }

        /* Admin Key Pop-down */
        #adminKeyPopdown {
            display: none;
            margin-top: 15px; /* Reduced space above the pop-down field */
            animation: fadeIn 0.3s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive adjustments */
        @media(max-width:768px){
            .container{
                padding: 25px;
                margin: 20px auto;
            }
        }
        @media(max-width:576px){
            .container{
                max-width: 95%;
                padding: 20px; /* Smallest padding for tiny screens */
                margin-left: auto;
                margin-right: auto;
            }
            h2 {
                font-size: 1.9em;
                margin-bottom: 15px;
            }
            .btn-primary {
                padding: 10px 18px;
                font-size: 0.95em;
            }
            label {
                font-size: 0.85em;
            }
            .form-control {
                height: 40px;
            }
            .password-requirements, .error-message, .success-message {
                font-size: 0.7em;
            }
            p {
                font-size: 0.8em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Join Us</h2>
        <form action="/register" method="post" id="registrationForm" novalidate>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" required aria-describedby="usernameHelp" placeholder="Choose your unique username">
                <small id="usernameHelp" class="form-text" style="color: var(--secondary-text-color);">Your public display name.</small>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required aria-describedby="passwordHelp passwordError passwordSuccess" placeholder="Create a strong password">
                <div class="password-requirements">
                    <div class="requirement unmet" id="lengthReq">At least 8 characters</div>
                </div>
                <div id="passwordError" class="error-message" role="alert">
                    Password must be at least 8 characters long.
                </div>
                <div id="passwordSuccess" class="success-message">
                    Password meets requirements!
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" required placeholder="your.email@example.com">
                <div id="emailError" class="error-message" role="alert">
                    Please enter a valid email address.
                </div>
            </div>

            <div class="form-group">
                <label>Account Type</label>
                <div class="radio-group">
                    <input type="radio" id="userRadio" name="userType" value="user" checked>
                    <label for="userRadio">User</label>
                    <input type="radio" id="adminRadio" name="userType" value="admin">
                    <label for="adminRadio">Admin</label>
                </div>
            </div>

            <div class="form-group" id="adminKeyPopdown">
                <label for="adminKey">Admin Key</label>
                <input type="password" class="form-control" id="adminKey" name="adminKey" placeholder="Enter the secret admin key" autocomplete="off">
                <div id="adminKeyError" class="error-message" role="alert">
                    Admin Key is required for Admin accounts.
                </div>
            </div>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-primary" id="submitBtn" disabled>Register Account</button>
        </form>
        <p>Already have an account? <a href="/login">Log In Here</a></p>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const usernameInput = document.getElementById('username');
            const passwordInput = document.getElementById('password');
            const emailInput = document.getElementById('email');
            const lengthReq = document.getElementById('lengthReq');
            const passwordError = document.getElementById('passwordError');
            const passwordSuccess = document.getElementById('passwordSuccess');
            const emailError = document.getElementById('emailError');

            const submitBtn = document.getElementById('submitBtn');
            const form = document.getElementById('registrationForm');

            const userRadio = document.getElementById('userRadio');
            const adminRadio = document.getElementById('adminRadio');
            const adminKeyPopdown = document.getElementById('adminKeyPopdown');
            const adminKeyInput = document.getElementById('adminKey');
            const adminKeyError = document.getElementById('adminKeyError');

            // --- Validation Functions ---
            function validateUsername() {
                const username = usernameInput.value.trim();
                if (username.length > 0) {
                    usernameInput.classList.remove('error');
                    usernameInput.classList.add('success');
                    return true;
                } else {
                    usernameInput.classList.remove('success');
                    usernameInput.classList.add('error');
                    return false;
                }
            }

            function validatePassword() {
                const password = passwordInput.value;
                const isLengthValid = password.length >= 8;

                if (isLengthValid) {
                    lengthReq.classList.remove('unmet');
                    lengthReq.classList.add('met');
                } else {
                    lengthReq.classList.remove('met');
                    lengthReq.classList.add('unmet');
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
                return isLengthValid;
            }

            function validateEmail() {
                const email = emailInput.value.trim();
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (emailRegex.test(email)) {
                    emailInput.classList.remove('error');
                    emailInput.classList.add('success');
                    emailError.style.display = 'none';
                    return true;
                } else {
                    emailInput.classList.remove('success');
                    emailInput.classList.add('error');
                    emailError.style.display = 'block';
                    return false;
                }
            }

            function validateAdminKey() {
                if (adminRadio.checked) {
                    if (adminKeyInput.value.trim().length > 0) {
                        adminKeyInput.classList.remove('error');
                        adminKeyInput.classList.add('success');
                        adminKeyError.style.display = 'none';
                        return true;
                    } else {
                        adminKeyInput.classList.remove('success');
                        adminKeyInput.classList.add('error');
                        adminKeyError.style.display = 'block';
                        return false;
                    }
                }
                adminKeyInput.classList.remove('error', 'success');
                adminKeyError.style.display = 'none';
                return true;
            }

            // --- Form State Update ---
            function updateSubmitButtonState() {
                const isUsernameValid = validateUsername();
                const isPasswordValid = validatePassword();
                const isEmailValid = validateEmail();
                const isAdminKeyValid = validateAdminKey();

                if (isUsernameValid && isPasswordValid && isEmailValid && isAdminKeyValid) {
                    submitBtn.disabled = false;
                } else {
                    submitBtn.disabled = true;
                }
            }

            // --- Event Listeners ---
            usernameInput.addEventListener('input', updateSubmitButtonState);
            usernameInput.addEventListener('blur', updateSubmitButtonState);

            passwordInput.addEventListener('input', updateSubmitButtonState);
            passwordInput.addEventListener('blur', updateSubmitButtonState);

            emailInput.addEventListener('input', updateSubmitButtonState);
            emailInput.addEventListener('blur', updateSubmitButtonState);

            adminKeyInput.addEventListener('input', updateSubmitButtonState);
            adminKeyInput.addEventListener('blur', updateSubmitButtonState);

            function handleUserTypeChange() {
                if (adminRadio.checked) {
                    adminKeyPopdown.style.display = 'block';
                    adminKeyInput.setAttribute('required', 'true');
                } else {
                    adminKeyPopdown.style.display = 'none';
                    adminKeyInput.removeAttribute('required');
                    adminKeyInput.value = '';
                    adminKeyInput.classList.remove('error', 'success');
                    adminKeyError.style.display = 'none';
                }
                updateSubmitButtonState();
            }

            userRadio.addEventListener('change', handleUserTypeChange);
            adminRadio.addEventListener('change', handleUserTypeChange);

            form.addEventListener('submit', function(e) {
                const isUsernameValid = validateUsername();
                const isPasswordValid = validatePassword();
                const isEmailValid = validateEmail();
                const isAdminKeyValid = validateAdminKey();

                if (!isUsernameValid || !isPasswordValid || !isEmailValid || !isAdminKeyValid) {
                    e.preventDefault();
                    alert('Please correct the highlighted errors before submitting.');
                    if (!isUsernameValid) usernameInput.focus();
                    else if (!isPasswordValid) passwordInput.focus();
                    else if (!isEmailValid) emailInput.focus();
                    else if (adminRadio.checked && !isAdminKeyValid) adminKeyInput.focus();
                }
            });

            // Initial state setup
            updateSubmitButtonState();
            handleUserTypeChange();
        });
    </script>
</body>
</html>