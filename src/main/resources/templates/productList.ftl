<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Products</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa; /* Light gray background */
            font-family: 'Segoe UI', sans-serif;
            padding-top: 40px; /* Space from the top */
        }
        .container {
            background-color: #ffffff; /* White background for the main content area */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Soft shadow */
            margin-bottom: 40px; /* Space at the bottom */
        }
        h3 {
            text-align: center;
            color: #343a40; /* Darker heading color */
            margin-bottom: 30px;
            font-weight: 600;
        }
        .table {
            margin-bottom: 25px; /* Space below the table */
        }
        .table thead th {
            background-color: #e9ecef; /* Lighter header background */
            color: #495057; /* Darker text for headers */
            font-weight: 600;
            border-bottom: 2px solid #dee2e6;
        }
        .table-bordered th, .table-bordered td {
            border: 1px solid #dee2e6; /* Standard border color */
            vertical-align: middle; /* Center content vertically in cells */
        }
        .btn-sm {
            padding: .25rem .75rem; /* Adjust padding for small buttons */
            font-size: .875rem; /* Adjust font size for small buttons */
            line-height: 1.5;
            border-radius: .2rem;
            font-weight: 500;
            transition: background-color 0.2s ease, border-color 0.2s ease;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            font-weight: 600;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.2s ease, border-color 0.2s ease;
        }
        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
        .action-buttons {
            display: flex; /* Use flexbox to align buttons */
            gap: 5px; /* Space between buttons */
            justify-content: center; /* Center buttons within the cell */
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h3>All Products</h3>

    <table class="table table-bordered">
        <thead class="thead-light">
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
                    <a href="/admin/product/edit/${product.productId}" class="btn btn-sm btn-primary">Edit</a>
                    <a href="/admin/product/delete/${product.productId}" class="btn btn-sm btn-danger">Delete</a>
                </td>
            </tr>
            </#list>
        </tbody>
    </table>

    <div class="text-center">
        <a href="/admin/product/add" class="btn btn-success">Add New Product</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>