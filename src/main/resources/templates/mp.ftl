<!DOCTYPE html>
<html>
<head>
    <title>Welcome to MyShop</title>
</head>
<body>

<!-- Navbar -->
<div>
    <h2>MyShop</h2>
    <#if userId?default(0) == 0>
        <a href="/login">Login</a> |
        <a href="/register">Register</a>
    <#else>
        <a href="/cart/details?userId=${userId}">View Cart</a> |
        <a href="/logout">Logout</a>
    </#if>
    <hr/>
</div>

<!-- Product List -->
<h3>Available Products</h3>
<table border="1" cellpadding="5">
    <tr>
        <th>Name</th>
        <th>Price</th>
        <th>Action</th>
    </tr>
    <#list products as product>
        <tr>
            <td>${product.name}</td>
            <td>$${product.price}</td>
            <td>
                <form action="/cart/add" method="post">
                    <input type="hidden" name="userId" value="${userId}" />
                    <input type="hidden" name="productId" value="${product.productId}" />
                    <input type="number" name="quantity" value="1" min="1" required />
                    <button type="submit">Add to Cart</button>
                </form>
            </td>
        </tr>
    </#list>
</table>

</body>
</html>