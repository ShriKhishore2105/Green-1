<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders - Emporia</title>
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
            margin: 0 2rem; /* Adjusted for consistency */
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

        /* Container specific styles */
        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: var(--radius-lg);
            padding: 2.5rem;
            box-shadow: var(--shadow-lg);
            border: 1px solid rgba(255, 255, 255, 0.2);
            margin-top: 3rem;
            margin-bottom: 3rem;
            max-width: 900px;
        }

        h2 {
            color: var(--text-primary);
            text-align: center;
            margin-bottom: 2rem;
            font-size: 1.875rem;
            font-weight: 700;
            letter-spacing: -0.025em;
        }

        .table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 1.5rem;
        }

        .table thead th {
            background-color: var(--primary-light);
            color: var(--primary-color);
            padding: 1rem 1.25rem;
            text-align: left;
            font-weight: 600;
            font-size: 0.9rem;
            border-bottom: 2px solid var(--primary-color);
        }

        .table tbody td {
            background-color: var(--surface);
            color: var(--text-secondary);
            padding: 1rem 1.25rem;
            border-bottom: 1px solid var(--border-color);
            font-size: 0.9rem;
        }

        .table tbody tr:last-child td {
            border-bottom: none;
        }

        .table th:first-child,
        .table td:first-child {
            border-top-left-radius: var(--radius-md);
        }

        .table th:last-child,
        .table td:last-child {
            border-top-right-radius: var(--radius-md);
        }

        /* Specific border-radius for first/last rows */
        .table thead tr:first-child th:first-child {
            border-top-left-radius: var(--radius-md);
        }
        .table thead tr:first-child th:last-child {
            border-top-right-radius: var(--radius-md);
        }
        .table tbody tr:last-child td:first-child {
            border-bottom-left-radius: var(--radius-md);
        }
        .table tbody tr:last-child td:last-child {
            border-bottom-right-radius: var(--radius-md);
        }


        .alert {
            padding: 1rem;
            border-radius: var(--radius-md);
            margin-top: 1.5rem;
            font-weight: 500;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            backdrop-filter: blur(5px);
        }

        .alert-warning {
            background: rgba(254, 243, 199, 0.9);
            color: var(--warning-color);
            border: 1px solid #fcd34d;
        }
        .alert-warning::before {
            content: "⚠️";
            font-size: 1rem;
        }

        .btn-secondary {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.75rem 1.5rem;
            background: var(--secondary-color);
            color: white;
            border: none;
            border-radius: var(--radius-md);
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            text-decoration: none;
            box-shadow: var(--shadow-sm);
        }

        .btn-secondary:hover {
            background: #475569; /* Darker secondary */
            transform: translateY(-1px);
            box-shadow: 0 6px 12px rgba(100, 116, 139, 0.3);
        }

        .btn-secondary:active {
            transform: translateY(0);
        }

        .btn-secondary i {
            margin-right: 0.5rem;
        }

        /* Alignment for "Back to Profile" button */
        .back-button-container {
            text-align: center; /* Center the button */
            margin-top: 2rem; /* Add some space above */
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

            .table thead {
                display: none; /* Hide table headers on small screens */
            }

            .table, .table tbody, .table tr, .table td {
                display: block; /* Make table elements behave like blocks */
                width: 100%;
            }

            .table tr {
                margin-bottom: 1rem;
                border: 1px solid var(--border-color);
                border-radius: var(--radius-md);
                box-shadow: var(--shadow-sm);
            }

            .table td {
                text-align: right;
                padding-left: 50%;
                position: relative;
                border: none;
                border-bottom: 1px dashed var(--border-color);
            }

            .table td:last-child {
                border-bottom: none;
            }

            .table td::before {
                content: attr(data-label);
                position: absolute;
                left: 1rem;
                width: calc(50% - 1.5rem);
                text-align: left;
                font-weight: 600;
                color: var(--text-primary);
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
                <button type="submit"><i class="fas fa-sign-out-alt"></i> Logout</button>
            </form>
        </div>
    </div>
</nav>

<main style="flex: 1; display: flex; justify-content: center;">
    <div class="container">
        <h2>My Orders</h2>
        <#if orders?has_content>
        <table class="table">
            <thead>
                <tr>
                    <th>Order Id</th>
                    <th>Total</th>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <#list orders as order>
                <tr>
                    <td data-label="Order Id">${order.orderId}</td>
                    <td data-label="Total">₹${order.totalAmount}</td>
                    <td data-label="Date">${order.orderDate}</td>
                    <td data-label="Status">${order.status}</td>
                </tr>
                </#list>
            </tbody>
        </table>
        <#else>
        <p class="alert alert-warning">You have no orders yet. Start shopping now!</p>
        </#if>
        <div class="back-button-container">
            <a href="/profile" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back to Profile</a>
        </div>
    </div>
</main>

</body>
</html>