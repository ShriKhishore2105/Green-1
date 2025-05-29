<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Product</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

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
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar a {
            color: #FFD700;
            text-decoration: none;
            margin-left: 20px;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        .container {
            display: flex;
            padding: 40px;
            gap: 40px;
        }

        .product-image {
            flex: 1;
            max-width: 500px;
        }

        .product-image img {
            width: 100%;
            height: 400px;
            border-radius: 4px;
            border: 2px solid #FFD700;
        }

        .product-details {
            flex: 2;
        }

        .product-details h1 {
            font-size: 32px;
            margin-bottom: 15px;
            color: #FFD700;
        }

        .price {
            font-size: 24px;
            color: #FFA500;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .product-details button {
            padding: 10px 20px;
            margin: 10px 10px 10px 0;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .buy-now {
            background: linear-gradient(145deg, #FFD700, #B8860B);
            color: #000;
            box-shadow: 0 0 8px rgba(255, 215, 0, 0.6);
        }

        .buy-now:hover {
            background: linear-gradient(145deg, #FFFACD, #DAA520);
            box-shadow: 0 0 12px rgba(255, 215, 0, 0.9);
        }

        .add-to-cart {
            background: linear-gradient(145deg, #BFA46F, #FFD700);
            color: #000;
            box-shadow: 0 0 8px rgba(191, 164, 111, 0.6);
        }

        .add-to-cart:hover {
            background: linear-gradient(145deg, #FFD700, #DAA520);
            box-shadow: 0 0 12px rgba(255, 215, 0, 0.9);
        }
        .navbar .brand {
            font-size: 2em;
            font-weight: bold;
            color: white;
            font-style: italic;
        }

        .description {
            margin-top: 30px;
            font-size: 16px;
            line-height: 1.6;
            color: #FFD700;
        }
    </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar">
     <div class="brand">AdiBaBa</div>
    <div>
                <a style="color:white" href="/products"><i class="fas fa-home"></i></a>

        <a style="color:white" href="/profile"><i class="fas fa-user-circle"></i></a>
        <a href="/cart/details">
            <i class="fas fa-shopping-cart"></i>
            <#if cartItemCount?? && (cartItemCount?is_number && cartItemCount > 0)>
                (<span>${cartItemCount}</span>)
            </#if>
        </a>
        <a href="/logout">Logout</a>
    </div>
</nav>

<#if productObj??>
    <div class="container">

        <!-- Product Image -->
        <div class="product-image">
            <img src="/images/${productObj.productId}.jpg" alt="product image" />
        </div>

        <!-- Product Details -->
        <div class="product-details">
            <h1 style="color:white">${productObj.name!}</h1>
            <div class="price">₹${productObj.price!0}</div>



         <!-- Quantity-->
         <div class="quantity" style="margin-bottom:20 px;">
         
         <label for="quantity" style="font-weight:bold">Quantity:</label>
         <div style="display:flex; align-items:center;">
         <input type="number" id="quantity"  value="1" min="1" style="margin-top:5px;width:28px ;height:28px;text-align:center;" />
          
          </div>
          </div>
            <!-- Buy Now -->
            <form action="/payment" method="get" style="display:inline;">
                <input type="hidden" name="productId" value="${productObj.productId}" />
                <input type="hidden" name="userId" value="${userId}" />
                <input type="hidden" name="quantity" id="buyQuantity" />
                <button class="buy-now" onclick="document.getElementById('buyQuantity').value=document.getElementById('quantity').value">Buy Now</button>
            </form>

            <!-- Add to Cart -->
            <form action="/cart/add" method="post" style="display:inline;">
                <input type="hidden" name="productId" value="${productObj.productId}" />
                
                <input type="hidden" name="quantity" value="1" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                
                <button type="submit" class="add-to-cart">Add to Cart</button>
            </form>

            <div class="description">
                <h3>Description:</h3>
                <p>${productObj.description!}</p>
            </div>
        </div>
    </div>
<#else>
    <p style="padding: 40px;">Product not found</p>
</#if>

</body>
</html>
