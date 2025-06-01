<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Products - Emporia Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #2563eb; /* Blue 700 */
            --primary-hover: #1d4ed8; /* Blue 800 */
            --primary-light: #dbeafe; /* Blue 100 */
            --secondary-color: #64748b; /* Slate 500 */
            --success-color: #059669; /* Green 600 */
            --error-color: #dc2626; /* Red 600 */
            --warning-color: #d97706; /* Amber 600 */
            --background: #f8fafc; /* Cool Gray 50 */
            --surface: #ffffff; /* White */
            --text-primary: #0f172a; /* Slate 900 */
            --text-secondary: #475569; /* Slate 700 */
            --text-muted: #94a3b8; /* Slate 400 */
            --border-color: #e2e8f0; /* Slate 200 */
            --border-focus: #3b82f6; /* Blue 500 */
            --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
            --radius-sm: 0.375rem; /* 6px */
            --radius-md: 0.5rem; /* 8px */
            --radius-lg: 0.75rem; /* 12px */
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

        /* Navbar */
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

        /* Main Content Container for the table */
        .main-content {
            flex: 1; /* Allows main content to take remaining vertical space */
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 2rem;
        }

        .content-card {
            background-color: var(--surface); /* White background for the main content area */
            padding: 2.5rem;
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-lg); /* Soft shadow */
            border: 1px solid var(--border-color); /* Subtle border */
            max-width: 1200px; /* Max width for the table */
            width: 100%;
            margin-top: 2rem; /* Space below navbar */
        }

        h3 {
            text-align: center;
            color: var(--text-primary);
            margin-bottom: 2rem;
            font-weight: 700;
            font-size: 2rem;
            letter-spacing: -0.025em;
        }

        /* Table Styling */
        .table-custom {
            width: 100%;
            border-collapse: collapse; /* Remove double borders */
            margin-bottom: 25px;
            border-radius: var(--radius-md); /* Apply radius to table */
            overflow: hidden; /* Ensures rounded corners are visible */
            box-shadow: var(--shadow-sm); /* Subtle shadow for the table */
        }

        .table-custom thead th {
            background-color: var(--primary-light); /* Lighter header background */
            color: var(--primary-color); /* Darker text for headers */
            font-weight: 600;
            padding: 1rem;
            text-align: left;
            border-bottom: 2px solid var(--primary-color); /* Stronger bottom border for header */
            font-size: 0.95rem;
            text-transform: uppercase;
            letter-spacing: 0.02em;
        }

        .table-custom tbody tr {
            border-bottom: 1px solid var(--border-color); /* Subtle border between rows */
        }

        .table-custom tbody tr:last-child {
            border-bottom: none; /* No border for the last row */
        }

        .table-custom tbody tr:nth-child(even) {
            background-color: var(--background); /* Light stripe effect */
        }

        .table-custom td {
            padding: 1rem;
            vertical-align: middle; /* Center content vertically in cells */
            color: var(--text-secondary);
            font-size: 0.9rem;
        }

        /* Action Buttons within table cells */
        .action-buttons {
            display: flex;
            gap: 0.5rem; /* Space between buttons */
            justify-content: center; /* Center buttons within the cell */
            flex-wrap: wrap; /* Allow buttons to wrap on smaller screens */
        }

        /* Button Base Styling (reused from other pages) */
        .btn-action {
            padding: 0.6rem 1rem; /* Slightly smaller padding for table buttons */
            font-size: 0.85rem; /* Slightly smaller font for table buttons */
            border-radius: var(--radius-md);
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: var(--shadow-sm);
            position: relative;
            overflow: hidden;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.4rem; /* Smaller gap for icons */
            text-transform: uppercase;
            letter-spacing: 0.025em;
            text-decoration: none; /* For anchor tags styled as buttons */
        }

        .btn-action::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .btn-action:hover::before {
            left: 100%;
        }

        .btn-action:hover {
            transform: translateY(-1px); /* Slight lift */
            box-shadow: var(--shadow-md); /* More prominent shadow on hover */
        }

        .btn-action:active {
            transform: translateY(0);
            box-shadow: var(--shadow-sm); /* Reset shadow on click */
        }

        /* Specific Button Colors */
        .btn-primary-custom { /* For "Add New Product" and "Edit" */
            background: linear-gradient(135deg, var(--primary-color), var(--primary-hover));
            color: white;
            border: none;
            box-shadow: var(--shadow-md), 0 4px 10px rgba(37, 99, 235, 0.25);
        }

        .btn-primary-custom:hover {
            background: linear-gradient(135deg, var(--primary-hover), #173e97);
            box-shadow: 0 6px 15px rgba(37, 99, 235, 0.35), 0 3px 6px rgba(0, 0, 0, 0.15);
        }

        .btn-danger-custom { /* For "Delete" */
            background: var(--error-color);
            color: white;
            border: none;
            box-shadow: var(--shadow-md), 0 4px 10px rgba(220, 38, 38, 0.25);
        }

        .btn-danger-custom:hover {
            background: #b91c1c;
            box-shadow: 0 6px 15px rgba(220, 38, 38, 0.35), 0 3px 6px rgba(0, 0, 0, 0.15);
        }

        /* Add New Product Button Container */
        .add-product-button-container {
            text-align: center;
            margin-top: 2rem;
            margin-bottom: 0; /* Remove default margin-bottom */
        }
        .add-product-button-container .btn-action {
            padding: 0.9rem 2rem; /* Larger padding for this main action */
            font-size: 1.1rem; /* Larger font size */
        }


        /* Responsive Design */
        @media (max-width: 992px) {
            .content-card {
                padding: 2rem;
            }
            .table-custom thead th, .table-custom td {
                padding: 0.8rem;
                font-size: 0.85rem;
            }
            .btn-action {
                padding: 0.5rem 0.8rem;
                font-size: 0.8rem;
            }
            .action-buttons {
                flex-direction: column; /* Stack buttons in table cells */
                gap: 0.3rem;
            }
            .action-buttons .btn-action {
                width: 100%; /* Make stacked buttons full width */
            }
        }

        @media (max-width: 767px) {
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
            .navbar-links {
                justify-content: center;
                gap: 0.5rem;
            }
            .content-card {
                padding: 1.5rem;
                margin-top: 1.5rem;
            }
            h3 {
                font-size: 1.75rem;
                margin-bottom: 1.5rem;
            }
            /* Make table scrollable on small screens */
            .table-responsive {
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
            }
            .table-custom {
                min-width: 600px; /* Ensure table doesn't shrink too much */
            }
            .add-product-button-container .btn-action {
                width: 100%; /* Full width for add new product button */
                padding: 0.8rem 1.5rem;
                font-size: 1rem;
            }
        }

        @media (max-width: 480px) {
            .navbar .brand {
                font-size: 1.5rem;
            }
            .navbar-links a,
            .navbar-links button {
                padding: 0.5rem 0.75rem;
                font-size: 0.8rem;
            }
            .content-card {
                margin-left: 1rem;
                margin-right: 1rem;
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
        <div class="navbar-links">
            <a href="/admin/dashboard"><i class="fas fa-home"></i> Dashboard</a>
            <a href="/admin/product/all"><i class="fas fa-boxes"></i> Products</a>
            <form action="/logout" method="post" class="logout-form">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit"><i class="fas fa-sign-out-alt"></i> Logout</button>
            </form>
        </div>
    </div>
</nav>

<div class="main-content">
    <div class="content-card">
        <h3><i class="fas fa-box-open"></i> All Products</h3>

        <div class="table-responsive">
            <table class="table-custom">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Category</th>
                        <th>Stock</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <#list products as product>
                    <tr>
                        <td>${product.productId}</td>
                        <td>${product.name}</td>
                        <td>${product.description}</td>
                        <td>₹${product.price}</td>
                        <td>${product.categoryId}</td>
                        <td>${product.stockQuantity}</td>
                        <td class="action-buttons">
                            <a href="/admin/product/edit/${product.productId}" class="btn-action btn-primary-custom">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <a href="/admin/product/delete/${product.productId}"
                               class="btn-action btn-danger-custom"
                               onclick="return confirm('Are you sure you want to delete product: ${product.name}? This action cannot be undone.');">
                                <i class="fas fa-trash-alt"></i> Delete
                            </a>
                        </td>
                    </tr>
                    </#list>
                </tbody>
            </table>
        </div>

        <div class="add-product-button-container">
            <a href="/admin/product/add" class="btn-action btn-primary-custom">
                <i class="fas fa-plus-circle"></i> Add New Product
            </a>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>