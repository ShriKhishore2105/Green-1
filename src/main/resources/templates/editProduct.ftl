<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product - Emporia Admin</title>
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

        /* Main Content Styling */
        .main-content {
            flex: 1; /* Takes up remaining vertical space */
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem;
        }

        /* Container for the form */
        .form-container {
            background-color: var(--surface);
            padding: 2.5rem;
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-lg);
            border: 1px solid var(--border-color);
            max-width: 800px; /* Adjusted max-width for two-column layout */
            width: 100%;
            margin: 2rem auto 40px auto;
        }

        h1 {
            text-align: center;
            color: var(--text-primary);
            margin-bottom: 2rem;
            font-weight: 700;
            font-size: 2rem;
            letter-spacing: -0.025em;
        }

        /* Form Grid for Two Columns */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr; /* Two equal columns */
            gap: 1.5rem 2rem; /* Row gap, Column gap */
            margin-bottom: 1.5rem;
        }

        .form-group.full-width {
            grid-column: 1 / -1; /* Spans all columns */
        }

        .form-group {
            margin-bottom: 0;
        }

        .form-group label {
            font-weight: 600;
            color: var(--text-secondary);
            margin-bottom: 0.5rem;
            display: block;
            font-size: 0.95rem;
        }

        /* Form Controls (input, textarea, select) */
        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid var(--border-color);
            border-radius: var(--radius-md);
            font-size: 0.95rem;
            background: var(--background);
            color: var(--text-primary);
            transition: all 0.2s ease;
            outline: none;
        }

        .form-control:focus {
            border-color: var(--border-focus);
            box-shadow: 0 0 0 3px rgb(59 130 246 / 0.1);
            background: var(--surface);
        }

        .form-control::placeholder {
            color: var(--text-muted);
            opacity: 0.8;
        }

        .form-control-file {
            display: block;
            width: 100%;
            padding: 0.75rem 0;
            font-size: 0.95rem;
            color: var(--text-secondary);
            border: none;
            background-color: transparent;
        }

        /* Disabled Category Field */
        .form-control[disabled] {
            background-color: var(--background); /* Use a slightly darker background for disabled */
            cursor: not-allowed;
            opacity: 0.7;
        }

        /* Button Styling */
        .btn {
            padding: 0.8rem 1.5rem;
            font-size: 1rem;
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
            gap: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 0.025em;
            text-decoration: none;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .btn:active {
            transform: translateY(0);
            box-shadow: var(--shadow-sm);
        }

        /* Primary Button (Update Product) */
        .btn-primary-custom {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-hover));
            color: white;
            border: none;
            box-shadow: var(--shadow-md), 0 4px 10px rgba(37, 99, 235, 0.25);
            min-width: 160px;
        }

        .btn-primary-custom:hover {
            background: linear-gradient(135deg, var(--primary-hover), #173e97);
            box-shadow: 0 6px 15px rgba(37, 99, 235, 0.35), 0 3px 6px rgba(0, 0, 0, 0.15);
        }

        /* Ghost/Outline Button for Secondary Actions (Back to List) */
        .btn-ghost-secondary {
            background: transparent;
            color: var(--secondary-color);
            border: 1px solid var(--secondary-color);
            box-shadow: none;
            min-width: 150px;
        }

        .btn-ghost-secondary:hover {
            background: var(--secondary-color);
            color: white;
            box-shadow: var(--shadow-sm);
        }

        /* Button Group for specific alignment */
        .form-actions {
            display: flex;
            justify-content: space-between; /* Pushes items to opposite ends */
            align-items: center;
            margin-top: 2rem;
            padding-top: 1rem;
            border-top: 1px solid var(--border-color);
        }

        /* Responsive Adjustments */
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
            .form-container {
                padding: 1.5rem;
                margin-top: 1.5rem;
            }
            h1 {
                font-size: 1.75rem;
                margin-bottom: 1.5rem;
            }
            .form-grid {
                grid-template-columns: 1fr; /* Stack columns on small screens */
                gap: 1rem;
            }
            .form-group.full-width {
                grid-column: auto; /* Reset spanning for stacked layout */
            }
            .btn-primary-custom,
            .btn-ghost-secondary {
                padding: 0.7rem 1rem;
                font-size: 0.9rem;
                width: 100%; /* Make buttons full width on small screens */
                min-width: auto;
            }
            .form-actions {
                flex-direction: column; /* Stack buttons on small screens */
                gap: 1rem;
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
            .form-container {
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
    <div class="form-container">
        <h1><i class="fas fa-edit"></i> Edit Product</h1>

        <form action="/admin/product/edit" method="post" enctype="multipart/form-data">

            <input type="hidden" name="productId" value="${editProductObj.productId!}"/>

            <div class="form-grid">
                <div class="form-group">
                    <label for="name">Product Name:</label>
                    <input type="text" class="form-control" id="name" name="name" value="${editProductObj.name!}" required placeholder="e.g., Smartwatch X10"/>
                </div>
                <div class="form-group">
                    <label for="price">Price (₹):</label>
                    <input type="number" step="0.01" class="form-control" id="price" name="price" value="${editProductObj.price!}" required min="0" placeholder="e.g., 2999.00"/>
                </div>
                <div class="form-group">
                    <label for="categoryId">Category:</label>
                    <select name="categoryId" id="categoryId" class="form-control">
                        <option value="">-- Select Category --</option>
                        <#list categories as entry>
                            <option value="${entry.key}"
                                <#if editProductObj.categoryId?? && editProductObj.categoryId == entry.key>
                                    selected
                                </#if>>
                                ${entry.value}
                            </option>
                        </#list>
                    </select>
                </div>
                <div class="form-group">
                    <label for="stockQuantity">Stock Quantity:</label>
                    <input type="number" class="form-control" id="stockQuantity" name="stockQuantity" value="${editProductObj.stockQuantity!}" required min="0" placeholder="e.g., 150"/>
                </div>
                <div class="form-group full-width">
                    <label for="description">Description:</label>
                    <textarea class="form-control" id="description" name="description" rows="4" placeholder="Detailed description of the product...">${editProductObj.description!}</textarea>
                </div>
                <div class="form-group full-width">
                    <label for="productImage">Product Image:</label>
                    <input type="file" class="form-control-file" id="productImage" name="productImage" accept="image/*"/>
                    <#if editProductObj.imagePath?? && editProductObj.imagePath?has_content>
                        <small class="form-text text-muted mt-2">Current image: <a href="${editProductObj.imagePath}" target="_blank">View Image</a></small>
                    </#if>
                </div>
            </div>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="form-actions">
                <a href="/admin/product/all" class="btn btn-ghost-secondary">
                    <i class="fas fa-arrow-alt-circle-left"></i> Back to List
                </a>
                <button type="submit" class="btn btn-primary-custom">
                    <i class="fas fa-save"></i> Update Product
                </button>
            </div>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>