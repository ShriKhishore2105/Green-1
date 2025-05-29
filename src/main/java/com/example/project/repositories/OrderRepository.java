package com.example.project.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.project.model.Order;

public interface OrderRepository extends JpaRepository<Order,Integer> {
Optional<Order> findByOrderId(Long orderId);
List<Order> findByUserId(int userId);
}
