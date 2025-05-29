package com.example.project.service;

import java.time.LocalDateTime;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.model.Order;
import com.example.project.model.OrderStatus;
import com.example.project.repositories.OrderRepository;

@Service
public class OrderService {


	
	@Autowired
	private OrderRepository orderRepo;
	
	public Order createOrder(Order order) {
		
		return orderRepo.save(order);
	}
	
	public Optional<Order> getOrderDetails(Long orderId){
		
		return orderRepo.findByOrderId(orderId);
	}
	
	public void updateOrderDetails(Order order) {
		
		System.out.println("shipped called");
		order.setStatus(OrderStatus.SHIPPED);
		orderRepo.save(order);
		}
	
	
}
