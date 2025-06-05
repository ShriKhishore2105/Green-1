<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2563eb;
            --primary-hover: #1d4ed8;
            --primary-light: #dbeafe;
            --secondary-color: #64748b;
            --success-color: #059669;
            --error-color: #dc2626;
            --warning-color: #d97706;
            --background: #f8fafc;
            --surface: #ffffff;
            --text-primary: #0f172a;
            --text-secondary: #475569;
            --text-muted: #94a3b8;
            --border-color: #e2e8f0;
            --border-focus: #3b82f6;
            --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
            --radius-sm: 0.375rem;
            --radius-md: 0.5rem;
            --radius-lg: 0.75rem;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-primary);
            line-height: 1.6;
            position: relative;
            background: #f0f9ff;
        }

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

        .payment-container {
            max-width: 600px;
            margin: 40px auto;
            padding: 2.5rem;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-lg);
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
            transform: translateX(-50px);
            opacity: 0;
            transition: all 0.8s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .payment-container.show {
            transform: translateX(0);
            opacity: 1;
        }

        .payment-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 1px;
            background: linear-gradient(90deg, transparent, rgba(59, 130, 246, 0.3), transparent);
        }

        h3 {
            color: var(--text-primary);
            text-align: center;
            margin-bottom: 2rem;
            font-size: 1.875rem;
            font-weight: 700;
            letter-spacing: -0.025em;
        }

        .form-label {
            font-weight: 500;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
            font-size: 0.875rem;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid var(--border-color);
            border-radius: var(--radius-md);
            font-size: 0.875rem;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(5px);
            color: var(--text-primary);
            transition: all 0.2s ease;
            outline: none;
        }

        .form-control:focus {
            border-color: var(--border-focus);
            box-shadow: 0 0 0 3px rgb(59 130 246 / 0.1);
            background: rgba(255, 255, 255, 0.95);
        }

        .form-control::placeholder {
            color: var(--text-muted);
        }

        .form-control-plaintext {
            color: var(--text-primary) !important;
            padding-top: 0.75rem;
            padding-bottom: 0.75rem;
        }

        .btn-primary {
            width: 100%;
            padding: 0.875rem 1.5rem;
            background: linear-gradient(135deg, var(--primary-color), #1e40af);
            color: white;
            border: none;
            border-radius: var(--radius-md);
            font-size: 0.875rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            outline: none;
            position: relative;
            overflow: hidden;
        }

        .btn-primary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .btn-primary:hover:not(:disabled)::before {
            left: 100%;
        }

        .btn-primary:hover:not(:disabled) {
            background: linear-gradient(135deg, var(--primary-hover), #1d4ed8);
            transform: translateY(-1px);
            box-shadow: 0 10px 20px rgba(37, 99, 235, 0.3);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        .btn-primary:disabled {
            background: var(--text-muted);
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        #paymentResponse {
            margin-top: 20px;
        }

        .alert-success {
            background: rgba(237, 248, 245, 0.9);
            color: var(--success-color);
            border: 1px solid #a7f3d0;
            padding: 0.75rem 1rem;
            border-radius: var(--radius-md);
            font-size: 0.875rem;
            font-weight: 500;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            backdrop-filter: blur(5px);
        }

        .alert-success::before {
            content: "✓";
            font-size: 1rem;
        }

        .alert-danger {
            background: rgba(254, 242, 242, 0.9);
            color: var(--error-color);
            border: 1px solid #fecaca;
            padding: 0.75rem 1rem;
            border-radius: var(--radius-md);
            font-size: 0.875rem;
            font-weight: 500;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            backdrop-filter: blur(5px);
        }

        .alert-danger::before {
            content: "⚠";
            font-size: 1rem;
        }

        .card-row {
            display: flex;
            gap: 1rem;
        }

        .card-row .form-group {
            flex: 1;
        }

        .card-row .form-group:first-child {
            flex: 2;
        }
    </style>
</head>
<body>
<div class="payment-container" id="paymentContainer">
    <h3 class="text-center mb-4">Make a Payment</h3>
    <form id="paymentForm">
        <input type="hidden" id="orderId" name="orderId" value="<#if orderId??>${orderId}</#if>">

        <div class="mb-3">
            <label for="amount" class="form-label">Amount (INR)</label>
            <div id="productInfo" data-price="${totalAmount!0}">
                <p class="form-control-plaintext">₹${totalAmount!0}</p>
            </div>
        </div>

        <div class="mb-3">
            <label for="address" class="form-label">Shipping Address</label>
            <textarea class="form-control" id="address" name="address" rows="3" placeholder="Enter your full shipping address, including street, city, state, and zip code." required></textarea>
        </div>

        <div class="mb-3">
            <label for="phoneNumber" class="form-label">Phone Number</label>
            <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="e.g., 9876543210" pattern="[0-9]{10}" title="Please enter a 10-digit phone number" maxlength="10" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Payment Method</label>
            <p class="form-control-plaintext">Card Payment</p>
        </div>

        <div class="mb-3">
            <label for="cardNumber" class="form-label">Card Number</label>
            <input type="text" class="form-control" id="cardNumber" name="cardNumber" maxlength="16" placeholder="16-digit card number" required>
        </div>

        <div class="card-row mb-3">
            <div class="form-group">
                <label for="expiryDate" class="form-label">Expiry Date</label>
                <input type="text" class="form-control" id="expiryDate" name="expiryDate" placeholder="MM/YY" maxlength="5" required>
            </div>
            <div class="form-group">
                <label for="cvv" class="form-label">CVV</label>
                <input type="text" class="form-control" id="cvv" name="cvv" maxlength="3" placeholder="3-digit CVV" required>
            </div>
        </div>

        <button type="submit" class="btn btn-primary w-100">Confirm Payment</button>
    </form>

    <div id="paymentResponse"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    window.onload = function() {
        document.getElementById('paymentContainer').classList.add('show');

        const phoneNumberInput = document.getElementById('phoneNumber');
        const cardNumberInput = document.getElementById('cardNumber');
        const cvvInput = document.getElementById('cvv');
        const expiryDateInput = document.getElementById('expiryDate');
        const paymentResponseDiv = document.getElementById('paymentResponse');

        function restrictToNumeric(event) {
            if ([8, 9, 27, 13, 37, 38, 39, 40, 46].indexOf(event.keyCode) !== -1 ||
                (event.keyCode === 65 && (event.ctrlKey === true || event.metaKey === true)) ||
                (event.keyCode === 67 && (event.ctrlKey === true || event.metaKey === true)) ||
                (event.keyCode === 86 && (event.ctrlKey === true || event.metaKey === true)) ||
                (event.keyCode === 88 && (event.ctrlKey === true || event.metaKey === true))) {
                return;
            }
            if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                event.preventDefault();
            }
        }

        // Function to remove non-numeric characters on input (e.g., paste)
        function cleanNonNumeric(event) {
            this.value = this.value.replace(/\D/g, '');
        }

        // Function to format expiry date and add basic validation
        function formatExpiryDate(event) {
            let value = this.value.replace(/\D/g, '');
            if (value.length >= 2) {
                value = value.substring(0, 2) + '/' + value.substring(2, 4);
            }
            this.value = value;
        }

        // Event listeners for phone number
        phoneNumberInput.addEventListener('keydown', restrictToNumeric);
        phoneNumberInput.addEventListener('input', cleanNonNumeric);

        // Event listeners for card number
        cardNumberInput.addEventListener('keydown', restrictToNumeric);
        cardNumberInput.addEventListener('input', cleanNonNumeric);

        // Event listeners for CVV
        cvvInput.addEventListener('keydown', restrictToNumeric);
        cvvInput.addEventListener('input', cleanNonNumeric);

        // Event listeners for expiry date
        expiryDateInput.addEventListener('keydown', restrictToNumeric);
        expiryDateInput.addEventListener('input', formatExpiryDate);


        // --- Form Submission and Validation ---
        document.getElementById('paymentForm').addEventListener('submit', async function(event) {
            event.preventDefault();

            paymentResponseDiv.innerHTML = ''; // Clear previous messages

            const orderId = document.getElementById('orderId').value;
            const address = document.getElementById('address').value;
            const phoneNumber = document.getElementById('phoneNumber').value;
            const amount = parseFloat(document.getElementById('productInfo').dataset.price) * 1000;
            const cardNumber = document.getElementById('cardNumber').value;
            const cvv = document.getElementById('cvv').value;
            const expiryDate = document.getElementById('expiryDate').value;

            // Basic validation
            if (cardNumber.length !== 16) {
                paymentResponseDiv.innerHTML =
                    '<div class="alert alert-danger mt-3">' +
                    '<strong>Error:</strong> Please enter a valid 16-digit card number.</div>';
                return;
            }

            if (cvv.length !== 3) {
                paymentResponseDiv.innerHTML =
                    '<div class="alert alert-danger mt-3">' +
                    '<strong>Error:</strong> Please enter a valid 3-digit CVV.</div>';
                return;
            }

            // --- Expiry Date Validation ---
            if (!/^\d{2}\/\d{2}$/.test(expiryDate)) {
                paymentResponseDiv.innerHTML =
                    '<div class="alert alert-danger mt-3">' +
                    '<strong>Error:</strong> Please enter expiry date in MM/YY format.</div>';
                return;
            }

            const [expMonth, expYear] = expiryDate.split('/').map(Number);
            const currentYear = new Date().getFullYear() % 100;
            const currentMonth = new Date().getMonth() + 1;

            if (expMonth < 1 || expMonth > 12) {
                paymentResponseDiv.innerHTML =
                    '<div class="alert alert-danger mt-3">' +
                    '<strong>Error:</strong> Expiry month must be between 01 and 12.</div>';
                return;
            }

            if (expYear < currentYear || (expYear === currentYear && expMonth < currentMonth)) {
                paymentResponseDiv.innerHTML =
                    '<div class="alert alert-danger mt-3">' +
                    '<strong>Error:</strong> Card has expired. Please enter a valid expiry date.</div>';
                return;
            }

            if (expYear === currentYear && expMonth === currentMonth -1) {
                paymentResponseDiv.innerHTML =
                    '<div class="alert alert-danger mt-3">' +
                    '<strong>Error:</strong> Card is about to expire. Please use a card with a later expiry date.</div>';
                return;
            }


            const paymentData = {
                orderId: orderId ? parseInt(orderId) : null,
                amount: amount,
                paymentMethod: "CARD",
                paymentStatus: "PENDING",
                cardNumber: cardNumber,
                cvv: cvv,
                upiId: ""
            };

            const customerDetails = {
                address: address,
                phoneNumber: phoneNumber
            };

            // Get CSRF token properly
            const csrfToken = document.querySelector('meta[name="_csrf"]').getAttribute("content");
            const csrfHeader = document.querySelector('meta[name="_csrf_header"]').getAttribute("content");

            const paymentAttributes = {
                customerDetails: customerDetails,
                payment: paymentData
            };

            console.log(paymentAttributes);

            const submitButton = document.querySelector('.btn-primary');
            submitButton.disabled = true;
            submitButton.textContent = 'Processing...';

            try {
                const headers = {
                    'Content-Type': 'application/json'
                };

                // Add CSRF header if available
                if (csrfHeader && csrfToken) {
                    headers[csrfHeader] = csrfToken;
                }

                const response = await fetch('/payments/process', {
                    method: 'POST',
                    headers: headers,
                    body: JSON.stringify(paymentAttributes)
                });

                console.log("Response status:", response.status);

                if (!response.ok) {
                    let errorMessage = "Payment failed";
                    try {
                        const errorJson = await response.json();
                        console.log("Error response:", errorJson);
                        errorMessage = errorJson.message || "Invalid input data.";
                    } catch (e) {
                        console.log("Could not parse error response as JSON");
                        errorMessage = response.statusText || errorMessage;
                    }
                    throw new Error(errorMessage);
                }

                const result = await response.json();
                console.log("Payment successful:", result);

                paymentResponseDiv.innerHTML =
                    '<div class="alert alert-success mt-3">' +
                    '<strong>Success!</strong> Payment ID: ' + result.paymentId +
                    ', Status: ' + result.paymentStatus + '</div>';

                setTimeout(() => {
                    window.location.href = "/orders/my";
                }, 1000);

            } catch (error) {
                console.error("Payment error:", error);
                paymentResponseDiv.innerHTML =
                    '<div class="alert alert-danger mt-3">' +
                    '<strong>Error:</strong> ' + error.message + '</div>';
            } finally {
                submitButton.disabled = false;
                submitButton.textContent = 'Confirm Payment';
            }
        });
    };
</script>
</body>
</html>