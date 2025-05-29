<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #1a1a1a; /* Dark black background */
            color: #FFD700; /* Gold text color for overall page */
        }
        .container {
            background-color: #000000; /* Even darker black for the container */
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4); /* Subtle shadow */
        }
        h2 {
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
        }
        .table tbody tr {
            border-color: #444444; /* Dark gray border for table rows */
        }
        .table-bordered th,
        .table-bordered td {
            border-color: #444444; /* Dark gray borders for cells */
        }
        .alert-warning {
            background-color: #2e2e2e; /* Darker background for warning */
            color: #FFD700; /* Gold text for warning */
            border-color: #555555; /* Dark border for warning */
            text-align: center;
        }
        .btn-secondary {
            background-color: #FFD700; /* Gold button background */
            border-color: #FFD700; /* Gold button border */
            color: #000000; /* Black text on gold button */
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .btn-secondary:hover {
            background-color: #e6c200; /* Slightly darker gold on hover */
            border-color: #e6c200;
            color: #000000;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>My Orders</h2>
    <#if orders?has_content>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Order Id</th>
                <th>Total</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <#list orders as order>
            <tr>
                <td>${order.orderId}</td>
                <td>${order.totalAmount}</td>
                <td>${order.orderDate}</td>
                <td>${order.status}</td>
            </tr>
            </#list>
        </tbody>
    </table>
    <#else>
    <p class="alert alert-warning">You have no orders</p>
    </#if>
    <a href="/profile" class="btn btn-secondary mt-3">Back to profile</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>