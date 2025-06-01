package com.example.project.model;

import java.time.LocalDateTime;

public class OrderDTO {
    private Integer orderId;
    private String username;
    private String email;
    private String productName;
    private Integer quantity;
    private Double totalAmount;
    private String address;
    private Long phoneNumber;
    private LocalDateTime orderDate;
    private OrderStatus status;

    // Default constructor
    public OrderDTO() {}

    // Constructor for JPA query
    public OrderDTO(Integer orderId, String username, String email, String productName,
                    Integer quantity, Double totalAmount, String address, Long phoneNumber,
                    LocalDateTime orderDate, OrderStatus status) {
        this.orderId = orderId;
        this.username = username;
        this.email = email;
        this.productName = productName;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.orderDate = orderDate;
        this.status = status;
    }

    // Getters and Setters
    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Long getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Long phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }
}