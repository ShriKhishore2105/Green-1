<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - Emporia</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            flex-direction: column;
            color: var(--text-primary);
            line-height: 1.6;
            position: relative;
            background: #f0f9ff;
            overflow-x: hidden;
        }

        /* Animated Background */
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

        /* Professional Navbar */
        .navbar {
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(16px);
            border-bottom: 1px solid rgba(226, 232, 240, 0.6);
            color: var(--text-primary);
            padding: 0 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05), 0 1px 2px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
            min-height: 72px;
            transition: all 0.3s ease;
        }

        .navbar:hover {
            box-shadow: 0 4px 25px rgba(0, 0, 0, 0.08);
        }

        .navbar-section {
            display: flex;
            align-items: center;
        }

        .navbar .brand {
            font-size: 1.75rem;
            font-weight: 700;
            color: var(--primary-color);
            letter-spacing: -0.02em;
            position: relative;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .navbar .brand:hover {
            color: var(--primary-hover);
            transform: scale(1.02);
        }

        .navbar .brand::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, var(--primary-color), var(--primary-hover));
            transition: width 0.3s ease;
        }

        .navbar .brand:hover::after {
            width: 100%;
        }

        .search-container {
            display: flex;
            align-items: center;
            background: var(--surface);
            border: 1.5px solid var(--border-color);
            border-radius: var(--radius-lg);
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: var(--shadow-sm);
            margin: 0 2rem;
        }

        .search-container:hover {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        .search-container:focus-within {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
        }

        .search-container input[type="text"] {
            padding: 0.75rem 1rem;
            width: 320px;
            border: none;
            outline: none;
            font-size: 0.9rem;
            background: transparent;
            color: var(--text-primary);
            font-weight: 400;
        }

        .search-container input[type="text"]::placeholder {
            color: var(--text-muted);
        }

        .search-container button {
            padding: 0.75rem 1.25rem;
            background: var(--primary-color);
            color: white;
            border: none;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .search-container button:hover {
            background: var(--primary-hover);
        }

        .search-container button:active {
            transform: scale(0.98);
        }

        .navbar-links {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .navbar-links a,
        .navbar-links button {
            color: var(--text-secondary);
            text-decoration: none;
            display: flex;
            align-items: center;
            font-weight: 500;
            padding: 0.625rem 1rem;
            transition: all 0.2s ease;
            border: none;
            background: none;
            cursor: pointer;
            font-size: 0.9rem;
            border-radius: var(--radius-md);
            position: relative;
        }

        .navbar-links a:hover,
        .navbar-links button:hover {
            color: var(--primary-color);
            background: rgba(37, 99, 235, 0.08);
            transform: translateY(-1px);
        }

        .navbar-links a:active,
        .navbar-links button:active {
            transform: translateY(0);
        }

        .navbar-links a i,
        .navbar-links button i {
            margin-right: 0.5rem;
            font-size: 1rem;
            transition: transform 0.2s ease;
        }

        .navbar-links a:hover i,
        .navbar-links button:hover i {
            transform: scale(1.1);
        }

        .logout-form {
            display: inline-flex;
        }

        /* Profile Container Specific Styles */
        .container {
            max-width: 600px;
            margin: 3rem auto; /* Consistent margin */
            background: var(--surface); /* White background */
            padding: 2.5rem; /* Increased padding */
            border-radius: var(--radius-lg); /* Rounded corners */
            box-shadow: var(--shadow-lg); /* Prominent shadow */
            border: 1px solid var(--border-color); /* Subtle border */
            text-align: center; /* Center content within container */
        }

        .container h2 {
            margin-bottom: 2rem; /* Increased margin */
            font-size: 2rem; /* Larger font size */
            font-weight: 700;
            color: var(--text-primary); /* Primary text color */
            letter-spacing: -0.025em;
            text-shadow: var(--shadow-sm); /* Subtle text shadow */
        }

        .info {
            margin-bottom: 2.5rem; /* Increased margin */
            background-color: var(--background); /* Light background for info block */
            border: 1px solid var(--border-color);
            border-radius: var(--radius-md);
            padding: 1.5rem;
            text-align: left; /* Align info text left */
        }

        .info p {
            margin: 0.75rem 0;
            font-size: 1rem;
            color: var(--text-secondary); /* Secondary text color */
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .info p strong {
            color: var(--text-primary); /* Primary text color for labels */
            min-width: 80px; /* Align labels */
            flex-shrink: 0;
        }

        .info p i {
            color: var(--primary-color); /* Primary color for icons */
            font-size: 1.1em;
        }

        .actions {
            display: flex;
            justify-content: center; /* Center action buttons */
            gap: 1rem; /* Space between buttons */
            flex-wrap: wrap; /* Allow buttons to wrap on smaller screens */
        }

        .actions a,
        .actions button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.75rem 1.5rem;
            text-decoration: none;
            border-radius: var(--radius-md);
            font-weight: 600;
            transition: all 0.2s ease;
            border: none;
            cursor: pointer;
            font-size: 0.9rem;
            position: relative;
            overflow: hidden;
            box-shadow: var(--shadow-sm);
        }

        .actions a::before,
        .actions button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .actions a:hover::before,
        .actions button:hover::before {
            left: 100%;
        }

        .actions a:hover,
        .actions button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        .actions a:active,
        .actions button:active {
            transform: translateY(0);
        }

        .actions a.orders {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-hover));
            color: white;
            box-shadow: 0 4px 6px -1px rgb(37 99 235 / 0.1), 0 2px 4px -2px rgb(37 99 235 / 0.1);
        }
        .actions a.orders:hover {
            background: linear-gradient(135deg, var(--primary-hover), #173e97);
            box-shadow: 0 8px 15px rgba(37, 99, 235, 0.3);
        }

        .actions .logout-button { /* Use a class for the logout button */
            background: var(--error-color);
            color: white;
            box-shadow: 0 4px 6px -1px rgb(220 38 38 / 0.1), 0 2px 4px -2px rgb(220 38 38 / 0.1);
        }
        .actions .logout-button:hover {
            background: #b91c1c; /* Darker red */
            box-shadow: 0 8px 15px rgba(220, 38, 38, 0.3);
        }

        .actions a i,
        .actions button i {
            margin-right: 0.5rem;
            font-size: 1rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                padding: 1rem;
                min-height: auto;
                gap: 1rem;
            }

            .navbar-section {
                width: 100%;
                justify-content: center;
            }

            .search-container {
                margin: 0;
                max-width: 100%;
            }

            .search-container input[type="text"] {
                width: 250px;
            }

            .navbar-links {
                justify-content: center;
                gap: 0.5rem;
            }

            .container {
                padding: 1.5rem;
                margin: 1.5rem auto;
            }

            h2 {
                font-size: 1.75rem;
            }

            .info p {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.25rem;
            }

            .info p strong {
                min-width: auto;
                width: 100%;
                text-align: left;
            }

            .actions {
                flex-direction: column;
                gap: 0.75rem;
            }

            .actions a,
            .actions button {
                width: 100%;
                max-width: none;
            }
        }

        @media (max-width: 480px) {
            .navbar .brand {
                font-size: 1.5rem;
            }

            .search-container input[type="text"] {
                width: 200px;
            }

            .search-container button {
                padding: 0.75rem 1rem;
            }

            .navbar-links a,
            .navbar-links button {
                padding: 0.5rem 0.75rem;
                font-size: 0.8rem;
            }

            h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>

<nav class="navbar">
    <div class="navbar-section">
        <a href="/" class="brand">Emporia</a>
    </div>
    <div class="navbar-section">
        <form action="/products" method="get" class="search-container">
            <input type="text" name="query" placeholder="Search for products..." />
            <button type="submit"><i class="fas fa-search"></i></button>
        </form>
    </div>
    <div class="navbar-section">
        <div class="navbar-links">
            <a href="/products"><i class="fas fa-home"></i> Home</a>
            <a href="/profile"><i class="fas fa-user-circle"></i> Profile</a>
            <form action="/logout" method="post" class="logout-form">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit" class="logout-button"><i class="fas fa-sign-out-alt"></i> Logout</button>
            </form>
        </div>
    </div>
</nav>

<main style="flex: 1; display: flex; justify-content: center;">
    <div class="container">
        <h2>My Profile</h2>
        <div class="info">
            <p><i class="fas fa-user"></i> <strong>Name:</strong> ${user.username!}</p>
            <p><i class="fas fa-envelope"></i> <strong>Email:</strong> ${user.email!}</p>
        </div>

        <div class="actions">
            <a href="/orders/my" class="orders"><i class="fas fa-box-seam"></i> View Orders</a>
            <form action="/logout" method="post" class="logout-form">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit" class="logout-button"><i class="fas fa-sign-out-alt"></i> Logout</button>
            </form>
        </div>
    </div>
</main>

</body>
</html>