<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Management - Emporia Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #2563eb; /* Blue 700 */
            --primary-hover: #1d4ed8; /* Blue 800 */
            --primary-light: #dbeafe; /* Blue 100 */
            --secondary-color: #64748b; /* Slate 500 */
            --success-color: #059669; /* Green 600 */
            --error-color: #dc2626; /* Red 600 */
            --warning-color: #d97706; /* Amber 600 */
            --info-color: #0ea5e9; /* Sky Blue 500 */
            --background: #f8fafc; /* Cool Gray 50 */
            --surface: #ffffff; /* White */
            --text-primary: #0f172a; /* Slate 900 */
            --text-secondary: #475569; /* Slate 700 */
            --text-muted: #94a3b8; /* Slate 400 */
            --border-color: #e2e8f0; /* Slate 200 */
            --border-focus: #3b82f6; /* Blue 500 */
            --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
            --radius-sm: 0.375rem; /* 6px */
            --radius-md: 0.5rem; /* 8px */
            --radius-lg: 0.75rem; /* 12px */
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

        /* Navbar */
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

        /* Main Content Styling */
        .main-content {
            flex: 1; /* Takes up remaining vertical space */
            display: flex;
            flex-direction: column;
            padding: 2rem;
            max-width: 1400px; /* Wider for order table */
            width: 100%;
            margin: 2rem auto;
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 1.5rem;
            margin-bottom: 2rem;
            border-bottom: 1px solid var(--border-color);
        }

        .header-section h1 {
            color: var(--text-primary);
            font-weight: 700;
            font-size: 2.2rem;
            letter-spacing: -0.025em;
            margin: 0;
        }

        /* Order Statistics Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2.5rem;
        }

        .stat-card {
            background-color: var(--surface);
            padding: 1.5rem;
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-md);
            text-align: center;
            color: white; /* Default text color for cards */
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            border: 1px solid var(--border-color); /* Subtle border for consistency */
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-lg);
        }

        .stat-card h5 {
            font-size: 1.1rem;
            margin-bottom: 0.5rem;
            font-weight: 500;
        }

        .stat-card h3 {
            font-size: 2.5rem;
            font-weight: 700;
            margin: 0;
            line-height: 1;
        }

        /* Specific card colors */
        .card-total { background: linear-gradient(135deg, var(--primary-color), var(--primary-hover)); }
        .card-pending { background: linear-gradient(135deg, var(--warning-color), #b45309); }
        .card-shipped { background: linear-gradient(135deg, var(--info-color), #0369a1); }
        .card-delivered { background: linear-gradient(135deg, var(--success-color), #047857); }

        /* Orders Table */
        .card-table {
            background-color: var(--surface);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-lg);
            border: 1px solid var(--border-color);
            overflow: hidden; /* Ensures border-radius is applied to content */
        }

        .card-table-header {
            padding: 1.5rem;
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--text-primary);
            border-bottom: 1px solid var(--border-color);
            background-color: var(--background);
        }

        .table-responsive {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }

        .orders-table {
            width: 100%;
            border-collapse: collapse;
        }

        .orders-table thead th {
            background-color: var(--primary-light);
            color: var(--primary-color);
            font-weight: 600;
            padding: 1rem 1.5rem;
            text-align: left;
            border-bottom: 2px solid var(--primary-color);
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.02em;
        }

        .orders-table tbody tr {
            border-bottom: 1px solid var(--border-color);
        }

        .orders-table tbody tr:last-child {
            border-bottom: none;
        }

        .orders-table tbody tr:nth-child(even) {
            background-color: var(--background);
        }

        .orders-table td {
            padding: 1rem 1.5rem;
            vertical-align: middle;
            color: var(--text-secondary);
            font-size: 0.9rem;
        }

        .orders-table td.text-truncate {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 200px; /* Adjust as needed */
        }

        /* Status Badges */
        .badge {
            display: inline-block;
            padding: 0.4em 0.8em;
            border-radius: var(--radius-sm);
            font-size: 0.8em;
            font-weight: 600;
            text-transform: uppercase;
            text-align: center;
            white-space: nowrap;
            vertical-align: baseline;
            line-height: 1;
            color: white; /* Default badge text color */
        }

        .badge-warning { background-color: var(--warning-color); }
        .badge-info { background-color: var(--info-color); }
        .badge-success { background-color: var(--success-color); }
        .badge-secondary { background-color: var(--secondary-color); }

        /* Dropdown Button for Update Status */
        .btn-dropdown-toggle {
            background: var(--primary-light);
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
            padding: 0.5rem 1rem;
            border-radius: var(--radius-md);
            font-weight: 500;
            font-size: 0.9rem;
            transition: all 0.2s ease;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-dropdown-toggle:hover {
            background: var(--primary-color);
            color: white;
            box-shadow: var(--shadow-sm);
        }

        .btn-dropdown-toggle::after {
            display: inline-block;
            margin-left: 0.5em;
            vertical-align: 0.255em;
            content: "";
            border-top: 0.3em solid;
            border-right: 0.3em solid transparent;
            border-bottom: 0;
            border-left: 0.3em solid transparent;
        }

        .dropdown-menu {
            position: absolute;
            z-index: 1000;
            min-width: 10rem;
            padding: 0.5rem 0;
            margin: 0.125rem 0 0;
            font-size: 1rem;
            color: var(--text-primary);
            text-align: left;
            list-style: none;
            background-color: var(--surface);
            background-clip: padding-box;
            border: 1px solid var(--border-color);
            border-radius: var(--radius-md);
            box-shadow: var(--shadow-lg);
            transform: translateY(0.5rem);
            opacity: 0;
            visibility: hidden;
            transition: transform 0.2s ease-out, opacity 0.2s ease-out, visibility 0.2s ease-out;
        }

        .dropdown-menu.show {
            transform: translateY(0);
            opacity: 1;
            visibility: visible;
        }

        .dropdown-item {
            display: block;
            width: 100%;
            padding: 0.75rem 1.5rem;
            clear: both;
            font-weight: 400;
            color: var(--text-secondary);
            text-align: inherit;
            white-space: nowrap;
            background-color: transparent;
            border: 0;
            transition: background-color 0.2s ease, color 0.2s ease;
            cursor: pointer;
        }

        .dropdown-item:hover, .dropdown-item:focus {
            color: var(--primary-color);
            background-color: var(--primary-light);
        }

        .dropdown-item i {
            margin-right: 0.75rem;
            font-size: 1rem;
        }

        .dropdown-item .text-warning { color: var(--warning-color) !important; }
        .dropdown-item .text-info { color: var(--info-color) !important; }
        .dropdown-item .text-success { color: var(--success-color) !important; }

        /* Empty state for table */
        .empty-table-state {
            padding: 5rem 0;
            text-align: center;
            color: var(--text-muted);
        }
        .empty-table-state i {
            font-size: 4rem;
            margin-bottom: 1rem;
            color: var(--border-color);
        }
        .empty-table-state h5 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        .empty-table-state p {
            font-size: 1rem;
        }


        /* Responsive Design */
        @media (max-width: 767px) {
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
            .navbar-links {
                justify-content: center;
                gap: 0.5rem;
            }
            .main-content {
                padding: 1.5rem;
                margin-top: 1.5rem;
            }
            .header-section {
                flex-direction: column;
                align-items: flex-start;
                margin-bottom: 1.5rem;
            }
            .header-section h1 {
                font-size: 1.75rem;
                margin-bottom: 1rem;
            }
            .stats-grid {
                grid-template-columns: 1fr; /* Stack cards on small screens */
            }
            .stat-card {
                padding: 1rem;
            }
            .stat-card h3 {
                font-size: 2rem;
            }
            .orders-table thead th,
            .orders-table td {
                padding: 0.8rem 1rem;
                font-size: 0.85rem;
            }
            .btn-dropdown-toggle {
                padding: 0.4rem 0.8rem;
                font-size: 0.8rem;
            }
            .dropdown-item {
                padding: 0.6rem 1rem;
                font-size: 0.85rem;
            }
            .empty-table-state {
                padding: 2rem 0;
            }
            .empty-table-state i {
                font-size: 3rem;
            }
            .empty-table-state h5 {
                font-size: 1.2rem;
            }
            .empty-table-state p {
                font-size: 0.9rem;
            }
        }

        @media (max-width: 480px) {
            .navbar .brand {
                font-size: 1.5rem;
            }
            .navbar-links a,
            .navbar-links button {
                padding: 0.5rem 0.75rem;
                font-size: 0.8rem;
            }
            .main-content {
                margin-left: 1rem;
                margin-right: 1rem;
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
        <div class="navbar-links">
            <a href="/admin/dashboard"><i class="fas fa-home"></i> Dashboard</a>
            <a href="/admin/product/all"><i class="fas fa-boxes"></i> Products</a>
            <a href="/admin/orders"><i class="fas fa-receipt"></i> Orders</a>
            <form action="/logout" method="post" class="logout-form">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit"><i class="fas fa-sign-out-alt"></i> Logout</button>
            </form>
        </div>
    </div>
</nav>

<div class="main-content">
    <div class="header-section">
        <h1><i class="fas fa-shopping-cart"></i> Order Management</h1>
    </div>

    <div class="stats-grid">
        <div class="stat-card card-total">
            <h5>Total Orders</h5>
            <h3>${orders?size}</h3>
        </div>
        <div class="stat-card card-pending">
            <h5>Pending Orders</h5>
            <h3>
                <#assign pendingCount = 0>
                <#list orders as order>
                    <#if order.status == "PENDING">
                        <#assign pendingCount = pendingCount + 1>
                    </#if>
                </#list>
                ${pendingCount}
            </h3>
        </div>
        <div class="stat-card card-shipped">
            <h5>Shipped Orders</h5>
            <h3>
                <#assign shippedCount = 0>
                <#list orders as order>
                    <#if order.status == "SHIPPED">
                        <#assign shippedCount = shippedCount + 1>
                    </#if>
                </#list>
                ${shippedCount}
            </h3>
        </div>
        <div class="stat-card card-delivered">
            <h5>Delivered Orders</h5>
            <h3>
                <#assign deliveredCount = 0>
                <#list orders as order>
                    <#if order.status == "DELIVERED">
                        <#assign deliveredCount = deliveredCount + 1>
                    </#if>
                </#list>
                ${deliveredCount}
            </h3>
        </div>
    </div>

    <div class="card-table">
        <div class="card-table-header">
            <h5>All Orders</h5>
        </div>
        <div class="table-responsive">
            <table class="orders-table">
                <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer</th>
                    <th>Email</th>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Total Amount</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Order Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <#if orders?? && orders?size &gt; 0>
                    <#list orders as order>
                        <tr>
                            <td>#${order.orderId}</td>
                            <td>${order.username!""}</td>
                            <td>${order.email!""}</td>
                            <td>${order.productName!""}</td>
                            <td>${order.quantity!0}</td>
                            <td>₹${order.totalAmount?string("0.00")}</td>
                            <td>${order.phoneNumber?c?replace("(\\d{3})(\\d{3})(\\d{4})", "$1-$2-$3", "r")!""}</td>
                            <td class="text-truncate" style="max-width: 150px;">${order.address!""}</td>
                            <td>
                                <#-- Handle different date formats safely -->
                                <#attempt>
                                    ${order.orderDate?datetime("iso")?string("MMM d, yyyy HH:mm")}
                                <#recover>
                                    <#attempt>
                                        ${order.orderDate?datetime("yyyy-MM-dd'T'HH:mm:ss.SSSSSS")?string("MMM d, yyyy HH:mm")}
                                    <#recover>
                                        <#attempt>
                                            ${order.orderDate?datetime("yyyy-MM-dd'T'HH:mm:ss")?string("MMM d, yyyy HH:mm")}
                                        <#recover>
                                            ${order.orderDate!"N/A"}
                                        </#attempt>
                                    </#attempt>
                                </#attempt>
                            </td>
                            <td>
                                <#if order.status == "PENDING">
                                    <span class="badge badge-warning">${order.status}</span>
                                <#elseif order.status == "SHIPPED">
                                    <span class="badge badge-info">${order.status}</span>
                                <#elseif order.status == "DELIVERED">
                                    <span class="badge badge-success">${order.status}</span>
                                <#else>
                                    <span class="badge badge-secondary">${order.status!""}</span>
                                </#if>
                            </td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn-dropdown-toggle" type="button" id="dropdownMenuButton${order.orderId}"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        Update Status
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton${order.orderId}">
                                        <li>
                                            <form action="/admin/orders/update-status/${order.orderId}" method="post" style="display: inline;">
                                                <input type="hidden" name="status" value="PENDING">
                                                <button type="submit" class="dropdown-item">
                                                    <i class="fas fa-clock text-warning"></i> Pending
                                                </button>
                                            </form>
                                        </li>
                                        <li>
                                            <form action="/admin/orders/update-status/${order.orderId}" method="post" style="display: inline;">
                                                <input type="hidden" name="status" value="SHIPPED">
                                                <button type="submit" class="dropdown-item">
                                                    <i class="fas fa-shipping-fast text-info"></i> Shipped
                                                </button>
                                            </form>
                                        </li>
                                        <li>
                                            <form action="/admin/orders/update-status/${order.orderId}" method="post" style="display: inline;">
                                                <input type="hidden" name="status" value="DELIVERED">
                                                <button type="submit" class="dropdown-item">
                                                    <i class="fas fa-check-circle text-success"></i> Delivered
                                                </button>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </#list>
                <#else>
                    <tr>
                        <td colspan="11" class="empty-table-state">
                            <i class="fas fa-shopping-cart mb-3"></i>
                            <h5>No orders found</h5>
                            <p>Orders will appear here when customers place them.</p>
                        </td>
                    </tr>
                </#if>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>