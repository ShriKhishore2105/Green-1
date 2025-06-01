package com.example.project.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.project.model.OrderDTO;
import com.example.project.model.Order;
import com.example.project.model.OrderStatus;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {

    List<Order> findByUserId(Integer userId);

    Optional<Order> findByOrderId(Long orderId);

    // Custom query to get all orders with user details
    @Query("SELECT new com.example.project.model.OrderDTO(" +
            "o.orderId, u.username, u.email, 'Product', " +
            "CAST(1 as integer), o.totalAmount, " +
            "o.address, o.phoneNumber, o.orderDate, o.status) " +
            "FROM Order o " +
            "JOIN UserModel u ON o.userId = u.id " +
            "ORDER BY o.orderDate DESC")
    List<OrderDTO> findAllOrdersWithUserDetails();

    // Get orders by status
    @Query("SELECT new com.example.project.model.OrderDTO(" +
            "o.orderId, u.username, u.email, 'Product', " +
            "CAST(1 as integer), o.totalAmount, " +
            "o.address, o.phoneNumber, o.orderDate, o.status) " +
            "FROM Order o " +
            "JOIN UserModel u ON o.userId = u.id " +
            "WHERE o.status = :status " +
            "ORDER BY o.orderDate DESC")
    List<OrderDTO> findOrdersByStatus(@Param("status") OrderStatus status);
}