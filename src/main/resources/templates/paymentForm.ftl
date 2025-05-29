<!DOCTYPE html>
<html lang="en">
<head>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #1a1a1a; /* Dark black background */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #FFD700; /* Gold text for general page */
        }

        .payment-container {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            background-color: #000000; /* Pure black for the container */
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4); /* Stronger shadow */
            border: 1px solid #333333; /* Subtle dark border */
        }

        h3 {
            color: #FFD700; /* Gold heading color */
            text-align: center;
            margin-bottom: 30px;
            text-shadow: 1px 1px 2px rgba(255, 215, 0, 0.5); /* Gold text shadow */
        }

        .form-label {
            font-weight: 500;
            color: #FFD700; /* Gold labels */
        }

        .form-control, .form-select {
            background-color: #333333; /* Dark gray input fields */
            color: #F0E68C; /* Lighter gold text in inputs */
            border: 1px solid #555555; /* Darker border for inputs */
        }

        .form-control:focus, .form-select:focus {
            background-color: #4a4a4a; /* Slightly lighter on focus */
            border-color: #FFD700; /* Gold border on focus */
            box-shadow: 0 0 5px rgba(255, 215, 0, 0.3); /* Gold glow on focus */
            color: #F0E68C;
        }

        /* Adjust placeholder color for better visibility */
        .form-control::placeholder {
            color: #888888; /* Lighter gray for placeholders */
            opacity: 1; /* Ensure placeholder is not transparent */
        }

        .btn-primary {
            background-color: #FFD700; /* Gold button background */
            border-color: #FFD700; /* Gold button border */
            color: #000000; /* Black text on gold button */
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #e6c200; /* Slightly darker gold on hover */
            border-color: #e6c200;
            color: #000000;
        }

        .btn-secondary { /* If you add a back button, this will style it */
            background-color: #6c757d; /* Keep default Bootstrap secondary for consistency if used */
            border-color: #6c757d;
            color: #ffffff;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #5a6268;
        }

        .hidden {
            display: none !important;
        }

        #paymentResponse, #statusResponse {
            margin-top: 20px;
        }

        .alert-success {
            background-color: #2e2e2e; /* Darker background for success */
            color: #FFD700; /* Gold text for success */
            border-color: #555555; /* Dark border for success */
        }

        .alert-danger {
            background-color: #2e2e2e; /* Darker background for error */
            color: #d9534f; /* Keep red for error */
            border-color: #555555; /* Dark border for error */
        }

        /* Styles for the G-Pay modal */
        #gpayRedirectModal .modal-content {
            background-color: #000000; /* Pure black */
            color: #FFD700; /* Gold text */
            border: 1px solid #333333;
        }
        #gpayRedirectModal .modal-header,
        #gpayRedirectModal .modal-footer {
            border-color: #333333;
        }
        #gpayRedirectModal .btn-close {
            filter: invert(1); /* Makes the close button visible on dark background */
        }
    </style>
</head>
<body>
    <div class="payment-container">
        <h3 class="text-center mb-4">Make a Payment</h3>
        <form  id="paymentForm" >
            <input type="hidden" id="orderId" name="orderId" value="<#if orderId??>${orderId}</#if>">
            <div class="mb-3">
                <label for="amount" class="form-label">Amount (INR)</label>
                <div id="productInfo" data-price="${totalAmount!0}">
                    <p class="form-control-plaintext" style="color: #F0E68C;">₹${totalAmount!0}</p>
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
                <label for="paymentMethod" class="form-label">Payment Method</label>
                <select class="form-select" id="paymentMethod" name="paymentMethod" onchange="togglePaymentFields(this.value)">
                    <option value="CARD">Card</option>
                    <option value="UPI">UPI</option>
                </select>
            </div>

            <div id="cardFields">
                <div class="mb-3">
                    <label for="cardNumber" class="form-label">Card Number</label>
                    <input type="text" class="form-control" id="cardNumber" name="cardNumber" maxlength="16" placeholder="16-digit card number">
                </div>
                <div class="mb-3">
                    <label for="cvv" class="form-label">CVV</label>
                    <input type="text" class="form-control" id="cvv" name="cvv" maxlength="3" placeholder="3-digit CVV">
                </div>
            </div>

            <div id="upiFields" class="hidden">
                <div class="mb-3">
                    <label for="upiId" class="form-label">UPI ID</label>
                    <input type="text" class="form-control" id="upiId" name="upiId" placeholder="e.g., user@upi">
                </div>
            </div>

            <button type="submit" class="btn btn-primary w-100">Confirm Payment</button>
        </form>

        <div id="paymentResponse"></div>
    </div>

    <div class="modal fade" id="gpayRedirectModal" tabindex="-1" aria-labelledby="gpayRedirectModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="gpayRedirectModalLabel">Redirecting for Payment</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <p>You are being redirected to G-Pay to complete your payment.</p>
                    <p>Please do not close this window.</p>
                    <div class="spinner-border text-warning" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Function to toggle payment fields using CSS classes
        function togglePaymentFields(paymentMethod) {
            console.log("Payment method changed to: " + paymentMethod);

            var cardFields = document.getElementById('cardFields');
            var upiFields = document.getElementById('upiFields');
            var cardNumberInput = document.getElementById('cardNumber');
            var cvvInput = document.getElementById('cvv');
            var upiIdInput = document.getElementById('upiId');

            if (paymentMethod === 'CARD') {
                // Show card fields
                cardFields.classList.remove('hidden');
                // Hide UPI fields
                upiFields.classList.add('hidden');

                // Set required for card fields
                cardNumberInput.required = true;
                cvvInput.required = true;

                // Remove required for UPI field and clear its value
                upiIdInput.required = false;
                upiIdInput.value = '';
            }
            else if (paymentMethod === 'UPI') {
                // Hide card fields
                cardFields.classList.add('hidden');
                // Show UPI fields
                upiFields.classList.remove('hidden');

                // Set required for UPI field
                upiIdInput.required = true;

                // Remove required for card fields and clear their values
                cardNumberInput.required = false;
                cardNumberInput.value = '';
                cvvInput.required = false;
                cvvInput.value = '';
            }
        }

        // Initial setup when page loads
        window.onload = function() {
            // Set initial state
            togglePaymentFields(document.getElementById('paymentMethod').value);

            // Get the phone number input element
            const phoneNumberInput = document.getElementById('phoneNumber');

            // Event listener for keyboard input to prevent non-numeric characters
            phoneNumberInput.addEventListener('keydown', function(event) {
                // Allow backspace, delete, tab, escape, enter, and arrow keys
                if ([8, 9, 27, 13, 37, 38, 39, 40, 46].indexOf(event.keyCode) !== -1 ||
                    // Allow: Ctrl+A, Ctrl+C, Ctrl+V, Ctrl+X
                    (event.keyCode === 65 && (event.ctrlKey === true || event.metaKey === true)) || // Ctrl+A
                    (event.keyCode === 67 && (event.ctrlKey === true || event.metaKey === true)) || // Ctrl+C
                    (event.keyCode === 86 && (event.ctrlKey === true || event.metaKey === true)) || // Ctrl+V
                    (event.keyCode === 88 && (event.ctrlKey === true || event.metaKey === true))) { // Ctrl+X
                    // Let it happen, do not do anything
                    return;
                }
                // Ensure that it is a number and stop the keypress
                if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                    event.preventDefault();
                }
            });

            // Event listener for paste and other inputs to remove non-numeric characters
            phoneNumberInput.addEventListener('input', function(event) {
                // Remove any non-digit characters
                this.value = this.value.replace(/\D/g, '');
            });


            // Set up form submission
            document.getElementById('paymentForm').addEventListener('submit', async function(event) {
                event.preventDefault();

                // Get values from form
                const orderId = document.getElementById('orderId').value;
                const address = document.getElementById('address').value; // Get address
                const phoneNumber = document.getElementById('phoneNumber').value; // Get phone number

                // Get amount from the data-price attribute, parse it to float, and then multiply by 100 for smallest currency unit
                const amount = parseFloat(document.getElementById('productInfo').dataset.price) * 1000;
                const paymentMethodString = document.getElementById('paymentMethod').value;

                const paymentData = {
                    orderId: orderId ? parseInt(orderId) : null,
                    amount: amount,
                    paymentMethod: paymentMethodString,
                    paymentStatus: "PENDING"
                };

                const customerDetails = {
                    address: address,
                    phoneNumber: phoneNumber
                };

                // Add payment method specific fields
                if (paymentMethodString === 'CARD') {
                    paymentData.cardNumber = document.getElementById('cardNumber').value;
                    paymentData.cvv = document.getElementById('cvv').value;
                    // Initialize UPI field to empty string to avoid null
                    paymentData.upiId = "";
                } else if (paymentMethodString === 'UPI') {
                    paymentData.upiId = document.getElementById('upiId').value;
                    // Initialize card fields to empty strings to avoid null
                    paymentData.cardNumber = "";
                    paymentData.cvv = "";
                }

                const csrfToken=document.querySelector('meta[name="_csrf"]').getAttribute("content");
                const csrfHeader=document.querySelector('meta[name="_csrf_header"]').getAttribute("content");

                const paymentAttributes = {
                    customerDetails:customerDetails,
                    payment:paymentData
                };
                console.log(paymentAttributes);
                try {
                    const response = await fetch('/payments/process', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',[csrfHeader]:csrfToken
                        },
                        body: JSON.stringify(paymentAttributes)
                    });

                    // Log response status for debugging
                    console.log("Response status:", response.status);

                    if (!response.ok) {
                        let errorMessage = "Payment failed";
                        try {
                            const errorJson = await response.json();
                            console.log("Error response:", errorJson);
                            errorMessage = errorJson.message || "Invalid input data.";
                        } catch (e) {
                            // If response can't be parsed as JSON, use status text
                            console.log("Could not parse error response as JSON");
                            errorMessage = response.statusText || errorMessage;
                        }
                        throw new Error(errorMessage);
                    }

                    const result = await response.json();
                    console.log("Payment successful:", result);

                    if (paymentMethodString === 'UPI') {
                        // Show the G-Pay redirect modal
                        const gpayModal = new bootstrap.Modal(document.getElementById('gpayRedirectModal'));
                        gpayModal.show();

                        // Simulate redirection after a short delay (e.g., 3 seconds)
                        setTimeout(() => {
                            gpayModal.hide(); // Hide the modal
                            // In a real application, you'd redirect to your G-Pay integration endpoint here.
                            // For this example, I'll redirect to a placeholder page.
                            window.location.href = "/products"; // Placeholder for G-Pay redirect
                        }, 3000); // 3 seconds
                    } else {
                        // For CARD payments, show success message and redirect directly
                        document.getElementById('paymentResponse').innerHTML =
                            '<div class="alert alert-success mt-3">' +
                            '<strong>Success!</strong> Payment ID: ' + result.paymentId +
                            ', Status: ' + result.paymentStatus + '</div>';
                        setTimeout(()=>{
                            window.location.href="/orders/my";
                        }, 3000);
                    }

                } catch (error) {
                    console.error("Payment error:", error);
                    document.getElementById('paymentResponse').innerHTML =
                        '<div class="alert alert-danger mt-3">' +
                        '<strong>Error:</strong> ' + error.message + '</div>';
                    console.error("Full error details:", error);
                }
            });
        };
    </script>
</body>
</html>