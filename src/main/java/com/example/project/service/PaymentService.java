package com.example.project.service;

import com.example.project.model.Order;
import com.example.project.model.OrderStatus;
import com.example.project.model.PayAccount;
import com.example.project.model.Payment;
import com.example.project.repositories.OrderRepository;
import com.example.project.repositories.PayAccountRepository;
import com.example.project.repositories.PaymentRepository;

import jakarta.transaction.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PaymentService {

    private static final Logger logger = LoggerFactory.getLogger(PaymentService.class);

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private PayAccountRepository payAccountRepository;

    @Autowired
    private OrderService orderService;

    @Transactional
    public Long generateOrderId() {
        Optional<Payment> lastPayment = paymentRepository.findTopByOrderByOrderIdDesc();
        return lastPayment.map(payment -> payment.getOrderId() + 1).orElse(1000L);
    }

    public Payment processPayment(Payment payment) {
        logger.info("Processing payment for orderId: {}, amount: {}, card: {}",
                payment.getOrderId(), payment.getAmount(),
                payment.getCardNumber() != null ? payment.getCardNumber().substring(0, 4) + "****" : "null");

        validatePaymentInput(payment);

        // Clean and format card data
        String cardNumber = payment.getCardNumber().replaceAll("\\s+", "");
        String cvv = payment.getCvv().trim();
        payment.setCardNumber(cardNumber);
        payment.setCvv(cvv);

        logger.info("DEBUG: Searching for card - CardNumber: {}, CVV: {}",
                cardNumber.substring(0, 4) + "****", cvv);

        debugPayAccountTable();

        Optional<PayAccount> payAccountOpt = findPayAccountWithDebug(cardNumber, cvv);

        if (!payAccountOpt.isPresent()) {
            logger.error("Card not found in PayAccount: {}", cardNumber.substring(0, 4) + "****");
            return saveFailedPayment(payment, "Invalid card details. Card not found in our records.");
        }

        // Check balance - ADD MORE DETAILED LOGGING
        PayAccount payAccount = payAccountOpt.get();
        logger.info("Card found: {}, balance: {}", cardNumber.substring(0, 4) + "****", payAccount.getBalance());
        logger.info("Payment amount: {}", payment.getAmount());
        logger.info("Balance check: {} < {} = {}", payAccount.getBalance(), payment.getAmount(), payAccount.getBalance() < payment.getAmount());

        if (payAccount.getBalance() < payment.getAmount()) {
            logger.error("INSUFFICIENT BALANCE DETECTED - card: {}, required: {}, available: {}",
                    cardNumber.substring(0, 4) + "****", payment.getAmount(), payAccount.getBalance());

            String errorMessage = String.format("Insufficient balance. Required: ₹%.2f, Available: ₹%.2f",
                    payment.getAmount(), payAccount.getBalance());
            logger.error("Saving failed payment with message: {}", errorMessage);
            return saveFailedPayment(payment, errorMessage);
        }

        logger.info("Balance is sufficient. Proceeding with successful payment.");

        // Process successful payment
        return processSuccessfulPayment(payment, payAccount);
    }

    // DEBUG METHOD: Let's see what's actually in the database
    private void debugPayAccountTable() {
        try {
            List<PayAccount> allAccounts = payAccountRepository.findAll();
            logger.info("DEBUG: Total PayAccounts in database: {}", allAccounts.size());

            for (PayAccount account : allAccounts) {
                logger.info("DEBUG: DB Record - CardNumber: {}, CVV: {}, Balance: {}",
                        account.getCardNumber() != null ? account.getCardNumber().substring(0, 4) + "****" : "NULL",
                        account.getCvv(),
                        account.getBalance());
            }
        } catch (Exception e) {
            logger.error("DEBUG: Error fetching PayAccount records", e);
        }
    }

    // DEBUG METHOD: Enhanced card lookup with multiple attempts
    private Optional<PayAccount> findPayAccountWithDebug(String cardNumber, String cvv) {
        logger.info("DEBUG: Starting card lookup...");

        // Method 1: Original query
        Optional<PayAccount> result1 = payAccountRepository.findByCardNumberAndCvv(cardNumber, cvv);
        logger.info("DEBUG: Method 1 (findByCardNumberAndCvv) result: {}", result1.isPresent() ? "FOUND" : "NOT FOUND");

        // Method 2: Try finding by card number only first
        try {
            List<PayAccount> cardMatches = payAccountRepository.findByCardNumber(cardNumber);
            logger.info("DEBUG: Method 2 (findByCardNumber) found {} matches", cardMatches.size());

            for (PayAccount account : cardMatches) {
                logger.info("DEBUG: Card match - CVV in DB: '{}', CVV provided: '{}', Match: {}",
                        account.getCvv(), cvv, account.getCvv().equals(cvv));
            }
        } catch (Exception e) {
            logger.error("DEBUG: Error in Method 2", e);
        }

        return result1;
    }

    private void validatePaymentInput(Payment payment) {
        if (payment.getAmount() <= 0) {
            logger.error("Invalid payment amount: {}", payment.getAmount());
            throw new IllegalArgumentException("Invalid payment amount");
        }

        if (payment.getCardNumber() == null || payment.getCardNumber().trim().isEmpty()) {
            logger.error("Card number is null or empty");
            throw new IllegalArgumentException("Card number is required");
        }

        String cardNumber = payment.getCardNumber().replaceAll("\\s+", "");
        if (cardNumber.length() != 16) {
            logger.error("Invalid card number length: {}", cardNumber.length());
            throw new IllegalArgumentException("Invalid card number. Please enter a 16-digit card number.");
        }

        if (payment.getCvv() == null || payment.getCvv().trim().isEmpty()) {
            logger.error("CVV is null or empty");
            throw new IllegalArgumentException("CVV is required");
        }

        String cvv = payment.getCvv().trim();
        if (cvv.length() != 3) {
            logger.error("Invalid CVV length: {}", cvv.length());
            throw new IllegalArgumentException("Invalid CVV. Please enter a 3-digit CVV.");
        }
    }

    private Payment saveFailedPayment(Payment payment, String errorMessage) {
        logger.info("ENTERING saveFailedPayment method with message: {}", errorMessage);
        try {
            payment.setPaymentStatus(Payment.PaymentStatus.FAILED);
            payment.setPaymentMethod(Payment.PaymentMethod.CARD);
            logger.info("About to save failed payment to database...");
            Payment failedPayment = paymentRepository.save(payment);
            logger.info("Failed payment saved with ID: {} and status: {}",
                    failedPayment.getPaymentId(), failedPayment.getPaymentStatus());

            // Throw exception after saving the failed record
            logger.info("Throwing exception: {}", errorMessage);
            throw new IllegalArgumentException(errorMessage);
        } catch (IllegalArgumentException e) {
            // Re-throw the business logic exception
            logger.info("Re-throwing IllegalArgumentException: {}", e.getMessage());
            throw e;
        } catch (Exception e) {
            logger.error("Failed to save failed payment record", e);
            throw new IllegalArgumentException(errorMessage);
        }
    }

    @Transactional
    protected Payment processSuccessfulPayment(Payment payment, PayAccount payAccount) {
        try {
            // Deduct the amount from the balance
            logger.info("Deducting amount: {} from balance: {}", payment.getAmount(), payAccount.getBalance());
            double newBalance = payAccount.getBalance() - payment.getAmount();
            payAccount.setBalance(newBalance);
            payAccountRepository.save(payAccount);
            logger.info("New balance after deduction: {}", newBalance);

            // Set payment method and status to success
            payment.setPaymentMethod(Payment.PaymentMethod.CARD);
            payment.setPaymentStatus(Payment.PaymentStatus.COMPLETED);

            // Save successful payment
            Payment savedPayment = paymentRepository.save(payment);
            logger.info("Payment completed successfully for card: {}, paymentId: {}",
                    payment.getCardNumber().substring(0, 4) + "****", savedPayment.getPaymentId());

            // Update order status to SHIPPED
            if (payment.getOrderId() != null) {
                Optional<Order> optionalOrder = orderRepository.findByOrderId(payment.getOrderId());
                if (optionalOrder.isPresent()) {
                    Order order = optionalOrder.get();
                    order.setProductId(order.getProductId());
                    order.setQuantity(order.getQuantity());

                    order.setStatus(OrderStatus.SHIPPED);
                    orderService.updateOrderDetails(order);
                    logger.info("Order {} updated to SHIPPED", payment.getOrderId());
                } else {
                    logger.warn("Order not found for orderId: {}", payment.getOrderId());
                }
            }

            return savedPayment;

        } catch (Exception e) {
            logger.error("Unexpected error during successful payment processing", e);
            throw new RuntimeException("Payment processing failed due to system error");
        }
    }

    public Payment getPaymentStatus(Long paymentId) {
        return paymentRepository.findById(paymentId)
                .orElseThrow(() -> new IllegalArgumentException("Payment not found"));
    }

    public Payment findByOrderId(Long orderId) {
        return paymentRepository.findByOrderId(orderId)
                .orElseThrow(() -> new IllegalArgumentException("Order not found"));
    }
}