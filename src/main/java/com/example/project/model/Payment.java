package com.example.project.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "Payment")
public class Payment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long paymentId;

    @Column(unique = true)
    private Long orderId;

    @Column
    private double amount;

    private String cardNumber;
    private String cvv;

    // Removed UPI enum option
    public enum PaymentMethod {
        CARD
    }

    @Enumerated(EnumType.STRING)
    private PaymentMethod paymentMethod;

    public enum PaymentStatus {
        PENDING, COMPLETED, FAILED
    }

    @Enumerated(EnumType.STRING)
    private PaymentStatus paymentStatus;

    private LocalDateTime paymentDate;
    private Integer productId;
    private Integer quantity;

    @PrePersist
    protected void onCreate() {
        paymentDate = LocalDateTime.now();
    }

    public Payment() {
        this.paymentMethod = PaymentMethod.CARD; // Default to CARD
        this.paymentStatus = PaymentStatus.PENDING;
        this.paymentDate = LocalDateTime.now();
    }

    public Payment(Long paymentId, Long orderId, double amount, PaymentMethod paymentMethod) {
        this.paymentId = paymentId;
        this.orderId = orderId;
        this.amount = amount;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = PaymentStatus.PENDING;
        this.paymentDate = LocalDateTime.now();
    }

    // Getters and Setters
    public Long getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Long paymentId) {
        this.paymentId = paymentId;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public PaymentMethod getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(PaymentMethod paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public PaymentStatus getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(PaymentStatus paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public LocalDateTime getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(LocalDateTime paymentDate) {
        this.paymentDate = paymentDate;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}