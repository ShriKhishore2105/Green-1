package com.example.project.tests;


import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

import java.util.Optional;
import java.util.List;

import com.example.project.service.OrderService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.example.project.model.Order;
import com.example.project.model.OrderDTO;
import com.example.project.model.OrderStatus;
import com.example.project.repositories.OrderRepository;

public class OrderServiceTest {

    @Mock
    private OrderRepository orderRepo;

    @InjectMocks
    private OrderService orderService;

    private Order order;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
        order = new Order();
        order.setOrderId(1);
        order.setStatus(OrderStatus.PENDING);
    }

    @Test
    public void testCreateOrder() {
        when(orderRepo.save(order)).thenReturn(order);
        Order createdOrder = orderService.createOrder(order);
        assertEquals(order, createdOrder);
    }

    @Test
    public void testGetOrderDetails() {
        when(orderRepo.findByOrderId(1L)).thenReturn(Optional.of(order));
        Optional<Order> foundOrder = orderService.getOrderDetails(1L);
        assertTrue(foundOrder.isPresent());
        assertEquals(order, foundOrder.get());
    }

    @Test
    public void testGetOrderById() {
        when(orderRepo.findById(1)).thenReturn(Optional.of(order));
        Optional<Order> foundOrder = orderService.getOrderById(1);
        assertTrue(foundOrder.isPresent());
        assertEquals(order, foundOrder.get());
    }

    @Test
    public void testUpdateOrderDetails() {
        orderService.updateOrderDetails(order);
        assertEquals(OrderStatus.SHIPPED, order.getStatus());
        verify(orderRepo, times(1)).save(order);
    }

    @Test
    public void testGetAllOrdersWithUserDetails() {
        List<OrderDTO> orderDTOList = List.of(new OrderDTO());
        when(orderRepo.findAllOrdersWithUserDetails()).thenReturn(orderDTOList);
        List<OrderDTO> result = orderService.getAllOrdersWithUserDetails();

        assertEquals(orderDTOList, result);
    }

    @Test
    public void testGetOrdersByStatus() {
        List<OrderDTO> orderDTOList = List.of(new OrderDTO());
        when(orderRepo.findOrdersByStatus(OrderStatus.SHIPPED)).thenReturn(orderDTOList);
        List<OrderDTO> result = orderService.getOrdersByStatus(OrderStatus.SHIPPED);
        System.out.println(result);
        assertEquals(orderDTOList, result);
    }
}
