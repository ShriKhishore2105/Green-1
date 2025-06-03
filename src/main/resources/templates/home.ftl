<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List - Emporia</title>
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

        /* Main Content Layout */
        .content {
            display: flex;
            flex: 1;
            padding: 1.5rem;
            gap: 1.5rem;
        }

        /* Sidebar Styles */
        aside {
            width: 250px;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            padding: 1.5rem;
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-md);
            min-height: calc(100vh - 80px - 3rem);
            overflow-y: auto;
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: box-shadow 0.3s ease;
        }

        aside:hover {
            box-shadow: var(--shadow-lg);
        }

        aside h3 {
            color: var(--text-primary);
            border-bottom: 1px solid var(--border-color);
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
            font-size: 1.125rem;
            font-weight: 600;
        }

        aside ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        aside li {
            margin-bottom: 0.75rem;
        }

        aside a {
            text-decoration: none;
            color: var(--text-secondary);
            display: block;
            padding: 0.25rem 0;
            transition: color 0.2s ease, transform 0.2s ease;
        }

        aside a:hover {
            color: var(--primary-color);
            transform: translateX(5px);
        }

        /* Product Grid Styles */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.5rem;
            flex: 1;
        }

        .product-link {
            text-decoration: none;
            color: inherit;
        }

        .product-card {
            background: var(--surface);
            border: 1px solid var(--border-color);
            color: var(--text-primary);
            border-radius: var(--radius-lg);
            padding: 1.25rem;
            display: flex;
            flex-direction: column;
            transition: transform 0.2s ease, box-shadow 0.3s ease, border-color 0.3s ease;
            cursor: pointer;
            box-shadow: var(--shadow-md);
            overflow: hidden;
            height: 100%;
        }

        .product-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 30px rgba(37, 99, 235, 0.2);
            border-color: var(--primary-light);
        }

        .product-image-container {
            width: 100%;
            height: 200px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 1rem;
            background: #f8fafc;
            border-radius: var(--radius-md);
            overflow: hidden;
        }

        .product-card img {
            width: 100%;
            height: 100%;
            object-fit: contain;
            object-position: center;
            transition: transform 0.3s ease;
            padding: 0.5rem;
        }

        .product-card:hover img {
            transform: scale(1.05);
        }

        .product-info {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .product-card h3 {
            margin: 0 0 0.75rem;
            font-size: 1.125rem;
            font-weight: 600;
            line-height: 1.4;
            color: var(--text-primary);
        }

        .product-description {
            margin: 0 0 1rem;
            font-size: 0.875rem;
            color: var(--text-secondary);
            line-height: 1.5;
            flex: 1;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .product-price {
            margin: 0;
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--primary-color);
            letter-spacing: -0.01em;
            align-self: flex-start;
        }

        .product-card .view-details {
            display: inline-block;
            margin-top: 1rem;
            padding: 0.6rem 1.2rem;
            text-decoration: none;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-hover));
            color: white;
            border-radius: var(--radius-md);
            font-size: 0.875rem;
            font-weight: 600;
            box-shadow: 0 4px 6px -1px rgb(37 99 235 / 0.1), 0 2px 4px -2px rgb(37 99 235 / 0.1);
            transition: all 0.2s ease;
            position: relative;
            overflow: hidden;
            border: none;
            cursor: pointer;
            text-align: center;
            align-self: center;
        }

        .product-card .view-details::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .product-card .view-details:hover::before {
            left: 100%;
        }

        .product-card .view-details:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 15px rgba(37, 99, 235, 0.3);
        }

        .product-card .view-details:active {
            transform: translateY(0);
        }

        h1.page-title {
            text-align: center;
            color: var(--text-primary);
            margin-top: 1.5rem;
            margin-bottom: 1.5rem;
            font-size: 2.25rem;
            font-weight: 700;
            letter-spacing: -0.05em;
            text-shadow: var(--shadow-sm);
        }

        .no-products-message {
            text-align: center;
            color: var(--text-secondary);
            font-size: 1.1rem;
            margin-top: 2rem;
            width: 100%;
            grid-column: 1 / -1;
            padding: 2rem;
            background: rgba(255, 255, 255, 0.8);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-sm);
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

            .content {
                flex-direction: column;
                padding: 1rem;
            }

            aside {
                width: 100%;
                min-height: auto;
                margin-bottom: 1rem;
            }

            .product-grid {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
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

            .product-grid {
                grid-template-columns: 1fr;
            }

            .navbar-links a,
            .navbar-links button {
                padding: 0.5rem 0.75rem;
                font-size: 0.8rem;
            }

            h1.page-title {
                font-size: 1.75rem;
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

<main style="flex: 1; display: flex; flex-direction: column;">
    <h1 class="page-title">Discover Our Products</h1>

    <div class="content">
        <aside>
            <h3>Categories</h3>
            <#if categories??>
                <ul>
                    <#list categories as entry>
                        <li><a href="/products?categoryId=${entry.key}">${entry.value}</a></li>
                    </#list>
                </ul>
            <#else>
                <p style="font-size: 0.875rem; color: var(--text-muted);">No categories available.</p>
            </#if>
        </aside>

        <div class="product-grid">
            <#if products?? && products?size gt 0>
                <#list products as product>
                <a href="/product/${product.productId}" class="product-link">
                    <div class="product-card">
                        <div class="product-image-container">
                            <img src="/images/${product.productId}.jpg" alt="${product.name!}" onerror="this.onerror=null;this.src='/static/image/placeholder.jpg';" />
                        </div>
                        <div class="product-info">
                            <h3>${product.name!}</h3>
                            <p class="product-description">${product.description!'High-quality product with excellent features and durability. Perfect for everyday use with modern design and reliable performance.'}</p>
                            <p class="product-price">₹${product.price!0}</p>
                            <div class="view-details">View Details <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i></div>
                        </div>
                    </div>
                </a>
                </#list>
            <#else>
                <p class="no-products-message">
                    <i class="fas fa-search" style="font-size: 2rem; margin-bottom: 1rem; display: block; color: var(--text-muted);"></i>
                    No products found for your search criteria. Please try different keywords or browse our categories!
                </p>
            </#if>
        </div>
    </div>
</main>

</body>
</html>