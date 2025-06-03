<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Product - Emporia</title>
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
            display: none;
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

        /* Enhanced Main Content Styling */
        .container {
            flex: 1;
            display: flex;
            padding: 3.5rem;
            gap: 3rem;
            max-width: 1200px;
            margin: 2rem auto;
            background: var(--surface);
            border-radius: var(--radius-lg);
            box-shadow:
                var(--shadow-lg),
                0 0 0 1px rgba(255, 255, 255, 0.1) inset;
            border: 1px solid var(--border-color);
            position: relative;
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 1px;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.8), transparent);
        }

        .product-image {
            flex: 1;
            max-width: 500px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--background);
            border-radius: var(--radius-lg);
            padding: 2rem;
            box-shadow:
                var(--shadow-md),
                inset 0 1px 2px rgba(0, 0, 0, 0.02);
            border: 1px solid var(--border-color);
            position: relative;
        }

        .product-image::after {
            content: '';
            position: absolute;
            top: 8px;
            left: 8px;
            right: 8px;
            bottom: 8px;
            border: 1px solid rgba(255, 255, 255, 0.5);
            border-radius: calc(var(--radius-lg) - 8px);
            pointer-events: none;
        }

        .product-image img {
            width: 100%;
            max-height: 450px;
            object-fit: contain;
            border-radius: var(--radius-md);
            border: 1px solid var(--border-color);
            transition: transform 0.3s ease;
            filter: drop-shadow(0 2px 8px rgba(0, 0, 0, 0.08));
        }

        .product-image img:hover {
            transform: scale(1.02);
        }

        .product-details {
            flex: 2;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .product-details h1 {
            font-size: 2.5rem;
            margin-bottom: 0.75rem;
            color: var(--text-primary);
            font-weight: 700;
            letter-spacing: -0.04em;
            line-height: 1.1;
        }

        .price {
            font-size: 2rem;
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 1.5rem;
            letter-spacing: -0.02em;
            text-shadow: 0 1px 2px rgba(37, 99, 235, 0.1);
        }

        .quantity {
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem 0;
            border-top: 1px solid var(--border-color);
            border-bottom: 1px solid var(--border-color);
        }

        .quantity label {
            font-weight: 600;
            color: var(--text-secondary);
            font-size: 1rem;
        }

        .quantity input[type="number"] {
            width: 80px;
            height: 45px;
            padding: 0.5rem;
            border: 2px solid var(--border-color);
            border-radius: var(--radius-md);
            text-align: center;
            font-size: 1rem;
            color: var(--text-primary);
            background: var(--background);
            transition: all 0.2s ease;
            font-weight: 500;
        }

        .quantity input[type="number"]:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
            background: var(--surface);
        }

        .quantity input[type="number"]:hover {
            border-color: var(--primary-color);
        }

        .product-actions {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            flex-wrap: wrap;
        }

        .product-details button {
            padding: 1rem 2rem;
            font-size: 1.05rem;
            border: none;
            border-radius: var(--radius-md);
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: var(--shadow-md);
            position: relative;
            overflow: hidden;
            flex-grow: 1;
            max-width: 200px;
            text-transform: uppercase;
            letter-spacing: 0.025em;
            font-size: 0.95rem;
        }

        .product-details button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .product-details button:hover::before {
            left: 100%;
        }

        .buy-now {
            background: var(--primary-color);
            color: white;
            box-shadow:
                var(--shadow-md),
                0 4px 14px rgba(37, 99, 235, 0.25);
        }

        .buy-now:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow:
                0 8px 20px rgba(37, 99, 235, 0.3),
                0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .buy-now:active {
            transform: translateY(0);
        }

        .add-to-cart {
            background: var(--success-color);
            color: white;
            box-shadow:
                var(--shadow-md),
                0 4px 14px rgba(5, 150, 105, 0.25);
        }

        .add-to-cart:hover {
            background: #047857;
            transform: translateY(-2px);
            box-shadow:
                0 8px 20px rgba(5, 150, 105, 0.3),
                0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .add-to-cart:active {
            transform: translateY(0);
        }

        .description {
            margin-top: 1rem;
            font-size: 1rem;
            line-height: 1.7;
            color: var(--text-secondary);
            padding-top: 1.5rem;
            border-top: 1px solid var(--border-color);
        }

        .description h3 {
            font-size: 1.25rem;
            color: var(--text-primary);
            margin-bottom: 0.75rem;
            font-weight: 600;
        }

        .description p {
            margin: 0;
        }

        .no-products-message {
            margin-top: 40px;
            text-align: center;
            color: var(--text-muted);
            font-size: 1.125rem;
            padding: 2rem;
            background: var(--surface);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-md);
            max-width: 400px;
            margin: 4rem auto;
        }

        /* Responsive Design for Product Page */
        @media (max-width: 1024px) {
            .container {
                flex-direction: column;
                padding: 2rem;
                gap: 2rem;
                margin: 1.5rem auto;
            }
            .product-image {
                max-width: 100%;
            }
            .product-details {
                align-items: center;
                text-align: center;
            }
            .product-details h1 {
                font-size: 2rem;
            }
            .price {
                font-size: 1.75rem;
            }
            .product-actions {
                justify-content: center;
            }
            .quantity {
                justify-content: center;
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
            .container {
                padding: 1.5rem;
                margin: 1rem auto;
            }
            .product-image img {
                max-height: 300px;
            }
            .product-details h1 {
                font-size: 1.75rem;
            }
            .price {
                font-size: 1.5rem;
            }
            .product-details button {
                padding: 0.7rem 1.4rem;
                font-size: 0.95rem;
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
            .product-image img {
                max-height: 250px;
            }
            .product-details button {
                width: 100%;
                max-width: none;
            }
            .product-actions {
                flex-direction: column;
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
        <form action="/products" method="get" class="search-container" style="display: none;">
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

<#if productObj??>
    <div class="container">

        <div class="product-image">
            <img src="/images/${productObj.productId}.jpg" alt="${productObj.name!}" onerror="this.onerror=null;this.src='/static/image/placeholder.jpg';" />
        </div>

        <div class="product-details">
            <h1>${productObj.name!}</h1>
            <div class="price">₹${productObj.price!0}</div>

            <div class="quantity">
                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" value="1" min="1" />
            </div>

            <div class="product-actions">
                <form action="/payment" method="get" style="display:inline;">
                    <input type="hidden" name="productId" value="${productObj.productId}" />
                    <input type="hidden" name="userId" value="${userId}" />
                    <input type="hidden" name="quantity" id="buyQuantity" />
                    <button type="submit" class="buy-now" onclick="document.getElementById('buyQuantity').value=document.getElementById('quantity').value">Buy Now</button>
                </form>
                <form action="/cart/add" method="post" style="display:inline;">
                    <input type="hidden" name="productId" value="${productObj.productId}" />
                    <input type="hidden" name="quantity" id="cartQuantity" value="1" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="add-to-cart" onclick="document.getElementById('cartQuantity').value=document.getElementById('quantity').value">Add to Cart</button>
                </form>
            </div>

            <div class="description">
                <h3>Description:</h3>
                <p>${productObj.description!}</p>
            </div>
        </div>
    </div>
<#else>
    <p class="no-products-message">Product not found</p>
</#if>
</body>
</html>