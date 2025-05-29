<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #000;
            color: #FFD700;
            margin: 0;
            padding: 0;
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

        .navbar a {
            color: #FFD700;
            text-decoration: none;
            margin-left: 20px;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        .container {
            max-width: 600px;
            margin: 40px auto;
            background-color: #111;
            padding: 30px;
            border-radius: 10px;
            border: 1px solid #FFD700;
            box-shadow: 0 0 12px rgba(255, 215, 0, 0.2);
        }

        .container h2 {
            margin-bottom: 20px;
            text-align: center;
            color: #FFD700;
        }

        .info {
            margin-bottom: 20px;
        }

        .info p {
            margin: 10px 0;
            font-size: 16px;
            color: #FFD700;
        }

        .actions {
            text-align: center;
        }

        .actions a {
            display: inline-block;
            margin: 10px;
            padding: 10px 24px;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .actions a.orders {
            background: linear-gradient(145deg, #FFD700, #B8860B);
            color: #000;
            box-shadow: 0 0 10px rgba(255, 215, 0, 0.5);
        }

        .actions a.orders:hover {
            background: linear-gradient(145deg, #FFFACD, #DAA520);
        }

        .actions a.logout {
            background-color: #d9534f;
            color: white;
        }

        .actions a.logout:hover {
            background-color: #c9302c;
        }
        
        .navbar .brand {
            font-size: 2em;
            font-weight: bold;
            color: white;
            font-style: italic;
        }
    </style>
</head>
<body>

<div class="navbar">
    <div class="brand">AdiBaBa</div>
    <div>
        <a href="/products">Home</a>
        <a href="/cart/details">Cart</a>
    </div>
</div>

<div class="container">
    <h2 style="color:white">My Profile</h2>
    <div class="info">
        <p><strong>Name:</strong> ${user.username!}</p>
        <p><strong>Email:</strong> ${user.email!}</p>
    </div>

    <div class="actions">
        <a href="/orders/my" class="orders">View Orders</a>
        <a href="/logout" class="logout">Logout</a>
    </div>
</div>

</body>
</html>
