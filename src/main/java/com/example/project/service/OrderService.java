package com.example.project.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.model.Order;
import com.example.project.model.OrderDTO;
import com.example.project.model.OrderStatus;
import com.example.project.repositories.OrderRepository;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepo;

	public Order createOrder(Order order) {
		return orderRepo.save(order);
	}

	public Optional<Order> getOrderDetails(Long orderId) {
		return orderRepo.findByOrderId(orderId);
	}

	public Optional<Order> getOrderById(Integer orderId) {
		return orderRepo.findById(orderId);
	}

	public void updateOrderDetails(Order order) {
		System.out.println("shipped called");
		order.setStatus(OrderStatus.SHIPPED);
		orderRepo.save(order);
	}

	// New method for admin to get all orders with user details
	public List<OrderDTO> getAllOrdersWithUserDetails() {
		return orderRepo.findAllOrdersWithUserDetails();
	}

	// Get orders by status
	public List<OrderDTO> getOrdersByStatus(OrderStatus status) {
		return orderRepo.findOrdersByStatus(status);
	}
}