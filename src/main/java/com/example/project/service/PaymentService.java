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
import java.util.Random;

@Service
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderService orderService;

    private final Random random = new Random();

    @Transactional
    public Long generateOrderId() {
        Optional<Payment> lastPayment = paymentRepository.findTopByOrderByOrderIdDesc();
        return lastPayment.map(payment -> payment.getOrderId() + 1).orElse(1000L);
    }

    @Transactional
    public Payment processPayment(Payment payment) {
        if ("CARD".equals(payment.getPaymentMethod().toString())) {
            if (payment.getCardNumber() == null || payment.getCardNumber().length() != 16 ||
                payment.getCvv() == null || payment.getCvv().length() != 3) {
                throw new IllegalArgumentException("Invalid card details");
            }
        } else if (Payment.PaymentMethod.UPI.equals(payment.getPaymentMethod())) {
            if (payment.getUpiId() == null || !payment.getUpiId().contains("@")) {
                throw new IllegalArgumentException("Invalid UPI ID");
            }
        } else {
            throw new IllegalArgumentException("Unsupported payment method");
        }

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
