package com.example.project.service;

import com.example.project.model.Order;
import com.example.project.model.OrderStatus;
import com.example.project.model.Payment;
import com.example.project.repositories.OrderRepository;
import com.example.project.repositories.PaymentRepository;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderService orderService;

    @Transactional
    public Long generateOrderId() {
        Optional<Payment> lastPayment = paymentRepository.findTopByOrderByOrderIdDesc();
        return lastPayment.map(payment -> payment.getOrderId() + 1).orElse(1000L);
    }

    @Transactional
    public Payment processPayment(Payment payment) {
        // Validate card details (only card payment is supported now)
        if (payment.getCardNumber() == null || payment.getCardNumber().length() != 16) {
            throw new IllegalArgumentException("Invalid card number. Please enter a 16-digit card number.");
        }

        if (payment.getCvv() == null || payment.getCvv().length() != 3) {
            throw new IllegalArgumentException("Invalid CVV. Please enter a 3-digit CVV.");
        }

        // Ensure payment method is set to CARD
        payment.setPaymentMethod(Payment.PaymentMethod.CARD);

        // Save payment
        Payment savedPayment = paymentRepository.save(payment);

        // Update order status to SHIPPED
        Optional<Order> optionalOrder = orderRepository.findByOrderId(payment.getOrderId());
        if (optionalOrder.isPresent()) {
            Order order = optionalOrder.get();
            order.setStatus(OrderStatus.SHIPPED);
            orderService.updateOrderDetails(order);
        }

        return savedPayment;
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