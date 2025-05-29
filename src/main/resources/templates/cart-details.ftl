<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #1a1a1a; /* Dark black background */
            color: #FFD700; /* Gold text color for overall page */
            font-family: sans-serif;
            margin: 0;
            padding: 20px;
        }

        .container {
            background-color: #000000; /* Even darker black for the container */
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4); /* Subtle shadow */
        }

        h1 {
            color: #FFD700; /* Gold heading color */
            text-align: center;
            margin-bottom: 30px;
            text-shadow: 1px 1px 2px rgba(255, 215, 0, 0.5); /* Gold text shadow */
        }

        .table {
            background-color: #333333; /* Dark gray for table background */
            color: #F0E68C; /* Lighter gold/khaki for table text */
        }

        .table thead th {
            background-color: #333333; /* Dark black for table header background */
            color: #FFD700; /* Gold for table header text */
            border-color: #555555; /* Darker border for table header */
            text-align: center; /* Ensure header text is centered */
        }

        .table tbody tr {
            border-color: #444444; /* Dark gray border for table rows */
        }

        .table-bordered th,
        .table-bordered td {
            border-color: #444444; /* Dark gray borders for cells */
            text-align: center; /* Ensure cell text is centered */
        }

        .table tbody tr:hover {
            background-color: #4a4a4a; /* Slightly lighter gray on hover */
        }

        .btn-remove {
            background-color: #d9534f; /* Keep red for remove, it's a standard alert color */
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-remove:hover {
            background-color: #c9302c;
        }
        .buy-now {
            background: linear-gradient(145deg, #FFD700, #B8860B);
            color: #000;
           border-radius:5px;
        }

        .quantity-input {
            width: 60px;
            text-align: center;
            background-color: #444;
            color: #FFD700;
            border: 1px solid #666;
            border-radius: 3px;
        }

        .total {
            text-align: right;
            margin-top: 20px;
            font-size: 1.2em; /* Adjusted font size for Bootstrap alignment */
            font-weight: bold;
            color: #FFD700; /* Gold color for grand total */
            padding-right: 15px; /* Adjust padding if needed to align with table */
        }

        .actions {
            margin-top: 20px;
            text-align: center;
        }

        .actions a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #FFD700; /* Gold button background */
            color: #000000; /* Black text on gold button */
            border-radius: 4px;
            transition: background-color 0.3s ease, color 0.3s ease;
            display: inline-block; /* For proper padding and margin */
        }

        .actions a:hover {
            background-color: #e6c200; /* Slightly darker gold on hover */
            color: #000000;
        }

        p {
            color: #F0E68C; /* Lighter gold for general text */
            text-align: center;
        }
       
        .table-bordered {
            border: 1px solid #444444; 
        }
    </style>
</head>
<body>

<div class="container">
    <h1 style="color:white">Your Cart</h1>

    <#-- Display success/error messages from RedirectAttributes -->
    <#if success??>
        <div class="alert alert-success">${success}</div>
    </#if>
    <#if error??>
        <div class="alert alert-danger">${error}</div>
    </#if>

    <#if products?has_content>
        <table class="table table-bordered">
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
                        <td>${product.name}</td>
                        <td>${product.price}</td>
                        <td>
                            <form action="/cart/update" method="post" style="display: inline;">
                                <input type="hidden" name="productId" value="${product.productId}" />
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="number" name="quantity" value="${product.stockQuantity}" 
                                       min="1" class="quantity-input" onchange="this.form.submit()">
                            </form>
                        </td>
                        <td>${total}</td>
                        <td>
                           <form action="/payment" method="get" style="display:inline;">
                             <input type="hidden" name="productId" value="${product.productId}" />
                             <input type="hidden" name="userId" value="${userId}" />
                             <input type="hidden" name="quantity" id="buyQuantity" value="${product.stockQuantity}" />
                              <button class="buy-now" >Buy Now</button>
                             </form>
                             
                               <form action="/cart/remove" method="post" style="display: inline-block;">
                                <input type="hidden" name="productId" value="${product.productId}" />
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button type="submit" class="btn-remove"><i class="fas fa-trash-alt"></i></button>
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
            <a href="/products" class="btn">Continue Shopping</a>
        </div>

    <#else>
        <p class="alert alert-warning">Your cart is empty!</p>
        <div class="actions">
            <a href="/products" class="btn">Shop Now</a>
        </div>
    </#if>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>