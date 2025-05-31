<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
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
        .form-control-medium {
            max-width: 100%; /* Ensure it fills the form group width */
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
        .btn-secondary, .btn-danger {
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
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }
        .mt-3 {
            margin-top: 1rem !important; /* Overriding Bootstrap default for more space */
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Add Product</h1>

    <form action="/admin/product/add" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="${productFormObj.name!}" required/>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea class="form-control" id="description" name="description" rows="3">${productFormObj.description!}</textarea>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" step="0.01" class="form-control" id="price" name="price" value="${productFormObj.price!}" required min="0"/>
        </div>
        <div class="form-group">
            <label for="categoryId">Category ID:</label>
           <label for="categoryId">Category</label>
        	<select name="categoryId" id="categoryId" class="form-control" required>
   			 <option value="">-- Select Category --</option>
   			 <#list categories as entry>
      		  <option value="${entry.key}" <#if productFormObj.categoryId?? && productFormObj.categoryId == entry.key>selected</#if>>
            ${entry.value}
       		 </option>
   			 </#list>
			</select>
            
        </div>
        <div class="form-group">
            <label for="stockQuantity">Stock Quantity:</label>
            <input type="number" class="form-control" id="stockQuantity" name="stockQuantity" value="${productFormObj.stockQuantity!}" required min="0"/>
        </div>
        <div class="form-group">
            <label for="productImage">Image:</label>
            <input type="file" class="form-control-file" id="productImage" name="productImage" accept="image/*"/>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary btn-block">Add Product</button>
    </form>

    <div class="d-flex justify-content-between mt-4">
        <a href="/admin/product/all" class="btn btn-secondary">Back to List</a>
        
        <form action="/logout" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button  class="btn btn-danger" type="submit" >Logout</button>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>