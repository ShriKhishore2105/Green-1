<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart - Emporia</title>
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
            display: none; /* Hide search on cart page */
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

        /* --- Main Content Styling --- */
        .container {
            max-width: 900px; /* Adjusted max-width for cart content */
            margin: 3rem auto; /* Center container with top/bottom margin */
            background: var(--surface); /* White background */
            border-radius: var(--radius-lg); /* Rounded corners */
            box-shadow: var(--shadow-lg); /* Prominent shadow */
            border: 1px solid var(--border-color); /* Subtle border */
            padding: 2.5rem; /* Adjusted padding */
        }

        h1 {
            color: var(--text-primary); /* Primary text color for heading */
            text-align: center;
            margin-bottom: 2.5rem; /* Increased margin */
            font-size: 2.25rem; /* Larger font size */
            font-weight: 700;
            letter-spacing: -0.05em;
            text-shadow: var(--shadow-sm); /* Subtle text shadow */
        }

        /* Custom Table Styles */
        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1.5rem;
            background-color: var(--surface); /* Ensure table background is consistent */
        }

        .cart-table thead th {
            background-color: var(--primary-light); /* Light primary background for header */
            color: var(--primary-color); /* Primary color for header text */
            padding: 1rem;
            text-align: center;
            border-bottom: 2px solid var(--primary-color); /* Stronger bottom border */
            font-weight: 600;
            font-size: 0.95rem;
        }

        .cart-table tbody td {
            padding: 1rem;
            text-align: center;
            border-bottom: 1px solid var(--border-color); /* Subtle row border */
            color: var(--text-secondary);
            font-size: 0.9rem;
        }

        .cart-table tbody tr:last-child td {
            border-bottom: none; /* No border for last row */
        }

        .cart-table tbody tr:hover {
            background-color: var(--background); /* Light hover effect */
        }

        .quantity-input {
            width: 70px; /* Wider input for quantity */
            height: 38px; /* Taller input */
            padding: 0.5rem;
            border: 1px solid var(--border-color);
            border-radius: var(--radius-md);
            text-align: center;
            font-size: 0.9rem;
            color: var(--text-primary);
            background: var(--background);
            transition: all 0.2s ease;
        }

        .quantity-input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        /* Button Styling */
        .btn-action {
            padding: 0.6rem 1.2rem;
            font-size: 0.875rem;
            border: none;
            border-radius: var(--radius-md);
            cursor: pointer;
            font-weight: 600;
            transition: all 0.2s ease;
            position: relative;
            overflow: hidden;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
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
            transform: translateY(-1px);
            box-shadow: var(--shadow-sm);
        }
        .btn-action:active {
            transform: translateY(0);
        }

        .btn-buy-now {
            background: var(--primary-color);
            color: white;
            box-shadow: 0 4px 6px -1px rgb(37 99 235 / 0.1), 0 2px 4px -2px rgb(37 99 235 / 0.1);
        }

        .btn-buy-now:hover {
            background: var(--primary-hover);
            box-shadow: 0 8px 15px rgba(37, 99, 235, 0.3);
        }

        .btn-remove {
            background: var(--error-color); /* Red for remove */
            color: white;
            box-shadow: 0 4px 6px -1px rgb(220 38 38 / 0.1), 0 2px 4px -2px rgb(220 38 38 / 0.1);
        }

        .btn-remove:hover {
            background: #b91c1c; /* Darker red */
            box-shadow: 0 8px 15px rgba(220, 38, 38, 0.3);
        }

        .total {
            text-align: right;
            margin-top: 1.5rem;
            font-size: 1.3em;
            font-weight: 700;
            color: var(--text-primary);
            padding-right: 1rem; /* Align with table content */
        }

        .actions {
            margin-top: 2rem;
            text-align: center;
            display: flex;
            justify-content: center;
            gap: 1.5rem;
            flex-wrap: wrap;
        }

        .btn-continue-shopping {
            background: var(--secondary-color); /* Secondary color for continue shopping */
            color: white;
            box-shadow: 0 4px 6px -1px rgb(100 116 139 / 0.1), 0 2px 4px -2px rgb(100 116 139 / 0.1);
        }

        .btn-continue-shopping:hover {
            background: #475569; /* Darker secondary */
            box-shadow: 0 8px 15px rgba(100, 116, 139, 0.3);
        }

        /* Message Styling (Success/Error) */
        .message-box {
            padding: 1rem 1.5rem;
            border-radius: var(--radius-md);
            font-size: 0.9rem;
            font-weight: 500;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            box-shadow: var(--shadow-sm);
            backdrop-filter: blur(5px);
        }

        .message-box.success {
            background: rgba(240, 253, 244, 0.9);
            color: var(--success-color);
            border: 1px solid #bbf7d0;
        }

        .message-box.error {
            background: rgba(254, 242, 242, 0.9);
            color: var(--error-color);
            border: 1px solid #fecaca;
        }

        .message-box.warning {
            background: rgba(255, 251, 235, 0.9);
            color: var(--warning-color);
            border: 1px solid #fde68a;
        }

        .empty-cart-message {
            padding: 2rem;
            background: rgba(255, 255, 255, 0.8);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-sm);
            text-align: center;
            color: var(--text-secondary);
            font-size: 1.1rem;
            margin-top: 2rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
        }
        .empty-cart-message i {
            font-size: 3rem;
            color: var(--text-muted);
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
            .navbar-links {
                justify-content: center;
                gap: 0.5rem;
            }
            .container {
                padding: 1.5rem;
                margin: 1.5rem auto;
            }
            h1 {
                font-size: 1.75rem;
            }
            .cart-table thead th,
            .cart-table tbody td {
                padding: 0.75rem;
                font-size: 0.85rem;
            }
            .quantity-input {
                width: 50px;
                height: 32px;
                font-size: 0.8rem;
            }
            .btn-action {
                padding: 0.5rem 1rem;
                font-size: 0.8rem;
            }
            .total {
                font-size: 1.1em;
                padding-right: 0.5rem;
            }
            .actions {
                flex-direction: column;
                gap: 1rem;
            }
            .btn-continue-shopping {
                width: 100%;
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
            .cart-table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }
            .cart-table thead, .cart-table tbody, .cart-table th, .cart-table td, .cart-table tr {
                display: block;
            }
            .cart-table thead tr {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }
            .cart-table tr { border: 1px solid var(--border-color); margin-bottom: 0.5rem; border-radius: var(--radius-md); }
            .cart-table td {
                border: none;
                border-bottom: 1px solid var(--border-color);
                position: relative;
                padding-left: 50%;
                text-align: right;
            }
            .cart-table td:last-child { border-bottom: none; }
            .cart-table td::before {
                content: attr(data-label);
                position: absolute;
                left: 0;
                width: 45%;
                padding-left: 1rem;
                font-weight: 600;
                text-align: left;
                color: var(--text-primary);
            }
            .quantity-input {
                width: 100%; /* Full width for quantity input in mobile card view */
            }
            .actions {
                padding: 0 1rem;
            }
            .btn-action {
                width: 100%;
                max-width: none;
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
            <input type="text" name="query" placeholder="Search for products..." value="${query!}" />
            <button type="submit"><i class="fas fa-search"></i></button>
        </form>
    </div>
    <div class="navbar-section">
        <div class="navbar-links">
            <a href="/products"><i class="fas fa-home"></i> Products</a>
            <a href="/profile"><i class="fas fa-user-circle"></i> Profile</a>
            <a href="/cart/details">
                <i class="fas fa-shopping-cart"></i> Cart
                <#if cartItemCount?? && (cartItemCount?is_number && cartItemCount > 0)>
                    (<span>${cartItemCount}</span>)
                </#if>
            </a>
            <form action="/logout" method="post" class="logout-form">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit"><i class="fas fa-sign-out-alt"></i> Logout</button>
            </form>
        </div>
    </div>
</nav>

<div class="container">
    <h1>Your Shopping Cart</h1>

    <#-- Display success/error messages from RedirectAttributes -->
    <#if success??>
        <div class="message-box success">
            <i class="fas fa-check-circle"></i>
            <span>${success}</span>
        </div>
    </#if>
    <#if error??>
        <div class="message-box error">
            <i class="fas fa-times-circle"></i>
            <span>${error}</span>
        </div>
    </#if>

    <#if products?has_content>
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Price (₹)</th>
                    <th>Quantity</th>
                    <th>Total (₹)</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <#assign grandTotal = 0>
                <#list products as product>
                    <#assign total = product.price * product.stockQuantity>
                    <#assign grandTotal += total>
                    <tr>
                        <td data-label="Product">${product.name}</td>
                        <td data-label="Price (₹)">₹${product.price}</td>
                        <td data-label="Quantity">
                            <form action="/cart/update" method="post" style="display: inline;">
                                <input type="hidden" name="productId" value="${product.productId}" />
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="number" name="quantity" value="${product.stockQuantity}"
                                       min="1" class="quantity-input" onchange="this.form.submit()">
                            </form>
                        </td>
                        <td data-label="Total (₹)">₹${total}</td>
                        <td data-label="Action">
                           <form action="/payment" method="get" style="display:inline-block; margin-right: 0.5rem;">
                             <input type="hidden" name="productId" value="${product.productId}" />
                             <input type="hidden" name="userId" value="${userId}" />
                             <input type="hidden" name="quantity" id="buyQuantity_${product.productId}" value="${product.stockQuantity}" />
                              <button type="submit" class="btn-action btn-buy-now" onclick="document.getElementById('buyQuantity_${product.productId}').value=document.getElementById('quantity').value">Buy Now</button>
                             </form>

                               <form action="/cart/remove" method="post" style="display: inline-block;">
                                <input type="hidden" name="productId" value="${product.productId}" />
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button type="submit" class="btn-action btn-remove"><i class="fas fa-trash-alt"></i></button>
                            </form>
                        </td>
                    </tr>
                </#list>
            </tbody>
        </table>

        <div class="total">
            <strong>Grand Total: ₹${grandTotal}</strong>
        </div>

        <div class="actions">
            <a href="/products" class="btn-action btn-continue-shopping"><i class="fas fa-shopping-bag"></i> Continue Shopping</a>
        </div>

    <#else>
        <div class="empty-cart-message">
            <i class="fas fa-shopping-cart"></i>
            <p>Your cart is sempty! Start adding some amazing products.</p>
            <a href="/products" class="btn-action btn-buy-now"><i class="fas fa-store"></i> Shop Now</a>
        </div>
    </#if>
</div>

</body>
</html>
