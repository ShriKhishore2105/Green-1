<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa; /* Light gray background */
            font-family: 'Segoe UI', sans-serif;
            padding-top: 40px; /* Space from the top */
        }
        .container {
            background-color: #ffffff; /* White background for the form container */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Soft shadow */
            max-width: 600px; /* Limit container width for better readability */
            margin-bottom: 40px; /* Space at the bottom */
        }
        h1 {
            text-align: center;
            color: #343a40; /* Darker heading color */
            margin-bottom: 30px;
            font-weight: 600;
        }
        .form-group label {
            font-weight: 500;
            color: #495057; /* Slightly darker label color */
        }
        .btn-primary {
            background-color: #007bff; /* Bootstrap primary blue */
            border-color: #007bff;
            font-weight: 600;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.2s ease, border-color 0.2s ease;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .btn-secondary {
            font-weight: 600;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.2s ease, border-color 0.2s ease;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }
        .mt-3 {
            margin-top: 1rem !important;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Edit Product</h1>
    <form action="/admin/product/edit" method="post" enctype="multipart/form-data">

        <input type="hidden" name="productId" value="${editProductObj.productId!}"/>

        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="${editProductObj.name!}" required/>
        </div>

        <div class="form-group">
            <label for="description">Description:</label>
            <textarea class="form-control" id="description" name="description" rows="3">${editProductObj.description!}</textarea>
        </div>

        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" step="0.01" class="form-control" id="price" name="price" value="${editProductObj.price!}" required min="0"/>
        </div>

        <div class="form-group">
            <label for="categoryId">Category ID:</label>
            <input type="number" class="form-control" id="categoryId" name="categoryId" value="${editProductObj.categoryId!}" required min="1"/>
        </div>

        <div class="form-group">
            <label for="stockQuantity">Stock Quantity:</label>
            <input type="number" class="form-control" id="stockQuantity" name="stockQuantity" value="${editProductObj.stockQuantity!}" required min="0"/>
        </div>

        <div class="form-group">
            <label for="productImage">Image:</label>
            <input type="file" class="form-control-file" id="productImage" name="productImage" accept="image/*"/>
        </div>
        
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary btn-block">Update Product</button>
    </form>

    <a href="/admin/product/all" class="btn btn-secondary mt-4">Back to List</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>