<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product - Emporia Admin</title>
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

        /* Professional Navbar (reused from other pages) */
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
            display: none; /* Hide search for admin page if not needed */
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

        /* Main Content Container for two-column layout */
        .main-content {
            flex: 1; /* Allows main content to take remaining vertical space */
            display: flex;
            justify-content: center;
            align-items: flex-start; /* Align items to the top */
            padding: 2rem;
            gap: 2rem; /* Space between the two columns */
            max-width: 1200px;
            margin: 2rem auto; /* Center the main content area */
        }

        .form-column {
            flex: 1; /* Each column takes equal width */
            background-color: var(--surface); /* White background for the form container */
            padding: 2.5rem; /* Increased padding */
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-lg); /* Soft shadow */
            border: 1px solid var(--border-color); /* Subtle border */
        }

        h1 {
            text-align: center;
            color: var(--text-primary);
            margin-bottom: 2rem;
            font-weight: 700;
            font-size: 2rem;
            letter-spacing: -0.025em;
        }

        .form-group {
            margin-bottom: 1.5rem; /* More space between form groups */
        }

        .form-group label {
            font-weight: 600;
            color: var(--text-secondary);
            margin-bottom: 0.5rem;
            display: block; /* Ensure label is on its own line */
            font-size: 0.95rem;
        }

        .form-control, .form-control-file, .form-select {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid var(--border-color);
            border-radius: var(--radius-md);
            font-size: 0.9rem;
            background: var(--background);
            color: var(--text-primary);
            transition: all 0.2s ease;
            outline: none;
        }

        .form-control:focus, .form-control-file:focus, .form-select:focus {
            border-color: var(--border-focus);
            box-shadow: 0 0 0 3px rgb(59 130 246 / 0.1);
            background: var(--surface);
        }

        .form-control::placeholder {
            color: var(--text-muted);
        }

        /* Button Styling (reused and adapted from payment/product pages) */
        .btn-action {
            padding: 0.875rem 1.5rem;
            font-size: 0.95rem;
            border: none;
            border-radius: var(--radius-md);
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: var(--shadow-md);
            position: relative;
            overflow: hidden;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 0.025em;
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
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .btn-action:active {
            transform: translateY(0);
        }

        .btn-primary-custom { /* For Add Product */
            background: linear-gradient(135deg, var(--primary-color), var(--primary-hover));
            color: white;
            box-shadow:
                var(--shadow-md),
                0 4px 14px rgba(37, 99, 235, 0.25);
            width: 100%; /* Make it block level */
            margin-top: 1.5rem;
        }

        .btn-primary-custom:hover {
            background: linear-gradient(135deg, var(--primary-hover), #173e97);
            box-shadow:
                0 8px 20px rgba(37, 99, 235, 0.3),
                0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .btn-secondary-custom { /* For Back to List */
            background: var(--secondary-color);
            color: white;
            box-shadow:
                var(--shadow-md),
                0 4px 14px rgba(100, 116, 139, 0.25);
        }

        .btn-secondary-custom:hover {
            background: #4b5563;
            box-shadow:
                0 8px 20px rgba(100, 116, 139, 0.3),
                0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .btn-danger-custom { /* For Logout */
            background: var(--error-color);
            color: white;
            box-shadow:
                var(--shadow-md),
                0 4px 14px rgba(220, 38, 38, 0.25);
        }

        .btn-danger-custom:hover {
            background: #b91c1c;
            box-shadow:
                0 8px 20px rgba(220, 38, 38, 0.3),
                0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .d-flex.justify-content-between.mt-4 {
            display: flex;
            justify-content: space-between;
            margin-top: 2rem; /* Adjusted margin-top for better spacing */
        }
        .d-flex.justify-content-between.mt-4 .btn-action {
            flex-grow: 1; /* Allow buttons to grow */
            max-width: 48%; /* Adjust max-width to create space between them */
        }

        /* Informational/Welcome Column */
        .info-column {
            flex: 1;
            background: linear-gradient(135deg, var(--primary-light), rgba(255, 255, 255, 0.8));
            padding: 2.5rem;
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-lg);
            border: 1px solid var(--border-color);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .info-column h2 {
            font-size: 2.25rem;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            font-weight: 700;
            letter-spacing: -0.03em;
            text-shadow: 0 2px 4px rgba(37, 99, 235, 0.1);
        }

        .info-column p {
            font-size: 1rem;
            color: var(--text-secondary);
            margin-bottom: 1.5rem;
            line-height: 1.7;
            max-width: 400px;
        }

        .info-column ul {
            list-style: none;
            padding: 0;
            margin-bottom: 1.5rem;
            text-align: left;
            width: 100%;
            max-width: 300px;
        }

        .info-column ul li {
            font-size: 0.95rem;
            color: var(--text-primary);
            margin-bottom: 0.75rem;
            display: flex;
            align-items: flex-start;
            gap: 0.75rem;
        }

        .info-column ul li i {
            color: var(--primary-color);
            font-size: 1.1em;
            flex-shrink: 0;
            margin-top: 2px;
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .main-content {
                flex-direction: column; /* Stack columns on smaller screens */
                padding: 1.5rem;
                gap: 1.5rem;
            }
            .form-column, .info-column {
                max-width: 100%; /* Allow columns to take full width */
                padding: 2rem;
            }
            .d-flex.justify-content-between.mt-4 .btn-action {
                max-width: 100%; /* Buttons take full width */
            }
        }

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
            .navbar-links {
                justify-content: center;
                gap: 0.5rem;
            }
            h1 {
                font-size: 1.75rem;
            }
            .form-column, .info-column {
                padding: 1.5rem;
            }
            .info-column h2 {
                font-size: 1.75rem;
            }
            .info-column p {
                font-size: 0.9rem;
            }
            .info-column ul li {
                font-size: 0.85rem;
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
            .btn-action {
                padding: 0.75rem 1rem;
                font-size: 0.85rem;
            }
            .d-flex.justify-content-between.mt-4 {
                flex-direction: column;
                gap: 1rem;
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
            <a href="/admin/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <a href="/admin/product/all"><i class="fas fa-box"></i> Products</a>
            <a href="/admin/users"><i class="fas fa-users"></i> Users</a>
            <form action="/logout" method="post" class="logout-form">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit"><i class="fas fa-sign-out-alt"></i> Logout</button>
            </form>
        </div>
    </div>
</nav>

<div class="main-content">
    <div class="form-column">
        <h1><i class="fas fa-plus-circle"></i> Add New Product</h1>

        <form action="/admin/product/add" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Product Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="${productFormObj.name!}" required placeholder="e.g., Smartwatch X10"/>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description" rows="4" placeholder="Detailed description of the product...">${productFormObj.description!}</textarea>
            </div>
            <div class="form-group">
                <label for="price">Price (₹):</label>
                <input type="number" step="0.01" class="form-control" id="price" name="price" value="${productFormObj.price!}" required min="0" placeholder="e.g., 2999.00"/>
            </div>
            <div class="form-group">
                <label for="categoryId">Category ID:</label>
                <input type="number" class="form-control" id="categoryId" name="categoryId" value="${productFormObj.categoryId!}" required min="1" placeholder="e.g., 1 (Electronics)"/>
            </div>
            <div class="form-group">
                <label for="stockQuantity">Stock Quantity:</label>
                <input type="number" class="form-control" id="stockQuantity" name="stockQuantity" value="${productFormObj.stockQuantity!}" required min="0" placeholder="e.g., 150"/>
            </div>
            <div class="form-group">
                <label for="productImage">Product Image:</label>
                <input type="file" class="form-control-file" id="productImage" name="productImage" accept="image/*"/>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="submit" class="btn-action btn-primary-custom">
                <i class="fas fa-plus-square"></i> Add Product
            </button>
        </form>

        <div class="d-flex justify-content-between mt-4">
            <a href="/admin/product/all" class="btn-action btn-secondary-custom">
                <i class="fas fa-arrow-alt-circle-left"></i> Back to List
            </a>
            <form action="/logout" method="post" class="logout-form">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button class="btn-action btn-danger-custom" type="submit">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </button>
            </form>
        </div>
    </div>

    <div class="info-column">
        <h2><i class="fas fa-info-circle"></i> Product Management Guide</h2>
        <p>
            Use this form to add new products to your Emporia store. Ensure all details are accurate
            for a smooth customer experience.
        </p>
        <ul>
            <li><i class="fas fa-check-circle"></i> **Product Name:** Keep it concise and descriptive.</li>
            <li><i class="fas fa-check-circle"></i> **Description:** Provide comprehensive details about the product's features and benefits.</li>
            <li><i class="fas fa-check-circle"></i> **Price:** Enter the selling price. Only positive values are allowed.</li>
            <li><i class="fas fa-check-circle"></i> **Category ID:** Assign the correct category to help customers find it easily.</li>
            <li><i class="fas fa-check-circle"></i> **Stock Quantity:** Update current available stock. Minimum 0.</li>
            <li><i class="fas fa-check-circle"></i> **Product Image:** Upload a clear, high-quality image.</li>
        </ul>
        <p>
            After adding, you can manage products via the "Products" link in the navigation.
        </p>
    </div>
</div>

</body>
</html>