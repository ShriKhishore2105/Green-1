package com.example.project.tests;

import com.example.project.model.Order;
import com.example.project.model.OrderStatus;
import com.example.project.model.Payment;
import com.example.project.repositories.OrderRepository;
import com.example.project.repositories.PaymentRepository;
import com.example.project.service.OrderService;
import com.example.project.service.PaymentService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class PaymentServiceTest {

    @Mock
    private PaymentRepository paymentRepository;

    @Mock
    private OrderRepository orderRepository;

    @Mock
    private OrderService orderService;

    @InjectMocks
    private PaymentService paymentService;

    // No need for MockitoAnnotations.openMocks(this) with @ExtendWith(MockitoExtension.class)
    // but a @BeforeEach is still useful for common setup if needed.
    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void generateOrderId_shouldReturnInitialIdWhenNoPreviousPayments() {
        when(paymentRepository.findTopByOrderByOrderIdDesc()).thenReturn(Optional.empty());
        Long orderId = paymentService.generateOrderId();
        assertEquals(1000L, orderId);
    }

    @Test
    void generateOrderId_shouldReturnNextIdWhenPreviousPaymentsExist() {
        Payment lastPayment = new Payment();
        lastPayment.setOrderId(1005L);
        when(paymentRepository.findTopByOrderByOrderIdDesc()).thenReturn(Optional.of(lastPayment));
        Long orderId = paymentService.generateOrderId();
        assertEquals(1006L, orderId);
    }

    @Test
    void processPayment_shouldProcessCardPaymentAndShipOrder() {
        Payment payment = new Payment();
        payment.setPaymentMethod(Payment.PaymentMethod.CARD);
        payment.setCardNumber("1234567890123456");
        payment.setCvv("123");
        payment.setOrderId(1001L);

        Order order = new Order();
        order.setOrderId(1001);
        order.setStatus(OrderStatus.PENDING);

        when(paymentRepository.save(any(Payment.class))).thenReturn(payment);
        when(orderRepository.findByOrderId(1001L)).thenReturn(Optional.of(order));

        paymentService.processPayment(payment);

        verify(paymentRepository).save(any(Payment.class)); // Verifies once
        verify(orderService).updateOrderDetails(any(Order.class)); // Verifies once
        assertEquals(OrderStatus.SHIPPED, order.getStatus());
    }

    @Test
    void processPayment_shouldThrowExceptionForInvalidCardNumber() {
        Payment payment = new Payment();
        payment.setPaymentMethod(Payment.PaymentMethod.CARD);
        payment.setCardNumber("12345"); // Invalid length

        assertThrows(IllegalArgumentException.class, () -> paymentService.processPayment(payment));
        verifyNoInteractions(paymentRepository, orderRepository, orderService); // Simpler than multiple 'never()'
    }

    @Test
    void getPaymentStatus_shouldReturnPaymentWhenFound() {
        Payment payment = new Payment();
        payment.setPaymentId(1L);
        when(paymentRepository.findById(1L)).thenReturn(Optional.of(payment));

        Payment foundPayment = paymentService.getPaymentStatus(1L);
        assertEquals(payment, foundPayment);
    }

    @Test
    void getPaymentStatus_shouldThrowExceptionWhenNotFound() {
        when(paymentRepository.findById(2L)).thenReturn(Optional.empty());
        assertThrows(IllegalArgumentException.class, () -> paymentService.getPaymentStatus(2L));
    }
}