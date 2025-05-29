<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #000;
            color: #FFD700;
        }

        .navbar {
            background-color: #000;
            border-bottom: 2px solid #FFD700;
            color: #FFD700;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .brand {
            font-size: 2em;
            font-weight: bold;
            color: white;
            font-style: italic;
        }

        .navbar form {
            display: flex;
            align-items: center;
        }

        .navbar input[type="text"] {
            padding: 6px;
            width: 250px;
            border: none;
            border-radius: 4px;
        }

        .navbar button {
            padding: 6px 12px;
            margin-left: 8px;
            background: linear-gradient(145deg, #FFD700, #B8860B);
            color: #000;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            box-shadow: 0 0 10px #FFD700;
        }

        .navbar button:hover {
            background: linear-gradient(145deg, #FFFACD, #DAA520);
            box-shadow: 0 0 15px #FFD700;
        }

        .navbar-links {
            display: flex;
            gap: 20px;
            align-items: center; /* Align items vertically */
        }

        .navbar-links a {
            color: #FFD700;
            text-decoration: none;
            display: flex; /* Allow icon and text to be side-by-side */
            align-items: center;
        }

        .navbar-links a:hover {
            text-decoration: underline;
        }

        .navbar-links a i { /* Styling for Font Awesome icons */
            margin-right: 5px;
            font-size: 1.2em;
        }

        .content {
            display: flex;
        }

        aside {
            width: 200px;
            background-color:black;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(255, 215, 0, 0.2);
            min-height: 100vh;
            overflow-y: auto;
            border:1px solid #FFD700;
            border-radius:8px;
            transition:box-shadow 0.3s ease;
        }

        aside:hover{
            box-shadow: 0 0 20px rgba(255,215,0,0.9);
        }

        aside h3 {
            color: white;
            border-bottom: 1px solid #FFD700;
            margin-bottom: 12px;
            padding-bottom: 6px
        }

        aside ul {
            list-style: none;
            padding: 0;
        }

        aside li {
            margin-bottom: 10px;
        }

        aside a {
            text-decoration: none;
            color: #FFD700;
        }

        aside a:hover {
            color:#FFF;
        }

        .product-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 16px;
            padding: 20px;
        }

        .product-link {
            text-decoration:none;
            color:inherit;
        }

        .product-card {
            background-color: #111;
            border: 1px solid #FFD700;
            color: white;
            border-radius: 8px;
            padding: 12px;
            width: 200px;
            height:290px;
            flex-direction:column;
            justify-content:space-between;
            display:flex;
            transition:transform 0.2s ease, box-shadow 0.3s ease;
            cursor:pointer;
            text-align: center;
            box-shadow: 0 2px 8px rgba(255, 215, 0, 0.15);
        }

        .product-card:hover{
            transform: translateY(-10px);
            box-shadow: 0 0 15px rgba(255,215,0,1);
        }

        .product-card img {
            width: 100%;
            height: 195px;
            object-fit: cover;
            border-radius: 4px;
            margin-bottom: 4px;
        }

        .product-card h3 {
            margin: 10px 0 5px;
            font-size: 14px;
            min-height: 40px;
        }

        .product-card p {
            margin: 4px 0;
            font-size: 14px;
        }

        .product-card a {
            display: inline-block;
            margin-top: 8px;
            padding: 8px 12px;
            text-decoration: none;
            background-color: #BFA46F;
            color: #000;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            box-shadow:0 0 5px rgba(191,164,111,0.5);
            transition: all 0.3s ease, box-shadow 0.3s ease;
            position:relative;
            overflow:hidden;
        }

        .product-card a:hover {
            background-color: #FFD700;
            box-shadow:0 0 10px rgba(255,215,0,0.9);
            color:#000;
        }

        h1 {
            text-align: center;
            color: #FFD700;
            margin-top: 5px;
            margin-bottom:10px;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

<nav class="navbar">
    <div class="brand">AdiBaBa</div>
    <form action="/products" method="get">
        <input type="text" name="query" placeholder="Search products..." value="${query!}" />
        <button type="submit">Search</button>
    </form>
    <div class="navbar-links">
        <a style="color:white" href="/profile"><i class="fas fa-user-circle"></i></a>
     <form action="/logout" method="post">
     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button type="submit" >Logout</button>
        </form>
    </div>
</nav>

<div class="content">

    <aside>
        <h3>Categories</h3>
        <#if categories??>
            <ul>
                <#list categories as entry>
                    <li><a href="/products?categoryId=${entry.key}">${entry.value}</a></li>
                </#list>
            </ul>
        </#if>
    </aside>

    <main style="flex: 1;">

        <div class="product-grid">
            <#if products?? && products?size gt 0>
                <#list products as product>
                <a href="/product/${product.productId}" class="product-link">

                    <div class="product-card">
                        <img src="/images/${product.productId}.jpg" alt="${product.name!}" />
                        <h3>${product.name!}</h3>
                        <p><strong>₹${product.price!0}</strong></p>
                    </div>
                </a>
                </#list>
            <#else>
                <p style="text-align: center;">No products found.</p>
            </#if>
        </div>
    </main>
</div>

</body>
</html>