package com.example.project.Controller;

import com.example.project.model.Order;
import com.example.project.model.OrderStatus;
import com.example.project.model.Payment;
import com.example.project.model.PaymentDetails;
import com.example.project.model.CustomerDetails;
import com.example.project.model.Payment.PaymentStatus;
import com.example.project.model.Product;
import com.example.project.service.OrderService;
import com.example.project.service.PaymentService;
import com.example.project.service.ProductService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@Controller
public class PaymentController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private ProductService productService;

    @GetMapping("/payment")
    public String showPaymentForm(Model model,
                                  @RequestParam Integer productId,
                                  @RequestParam Integer userId,
                                  @RequestParam Integer quantity
    ) {

        Optional<Product> productOpt = productService.getProductDetails(productId);
        if (productOpt.isPresent()) {
            Product product = productOpt.get();
            model.addAttribute("product", product);

            Order order = new Order();
            order.setUserId(userId);
            order.setOrderDate(LocalDateTime.now());
            order.setStatus(OrderStatus.PENDING);
            order.setProductId(productId);
            order.setQuantity(quantity);

            double totalAmount=product.getPrice() * quantity;
            order.setTotalAmount(totalAmount);

            Order savedOrder = orderService.createOrder(order);
            model.addAttribute("orderId", savedOrder.getOrderId());
            model.addAttribute("totalAmount",savedOrder.getTotalAmount());
        }

        return "paymentForm";
    }

    @PostMapping("/payments/process")
    @ResponseBody
    public ResponseEntity<Payment> processPayment(@RequestBody PaymentDetails paymentAttributes) {
        try {
            Payment paymentData = paymentAttributes.getPayment();
            System.out.println(paymentAttributes);
            CustomerDetails customerDetails = paymentAttributes.getCustomerDetails();

            paymentData.setPaymentStatus(PaymentStatus.COMPLETED);
            Payment savedPayment = paymentService.processPayment(paymentData);

            Optional<Order> order = orderService.getOrderDetails(paymentData.getOrderId());
            Order orderData = order.get();

            orderData.setAddress(customerDetails.getAddress());
            orderData.setPhoneNumber(customerDetails.getPhoneNumber());

            Order savedOrder = orderService.createOrder(orderData);
            return ResponseEntity.ok(savedPayment);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(null);
        }
    }

    @GetMapping("/payment/status/{paymentId}")
    @ResponseBody
    public ResponseEntity<Payment> getPaymentStatus(@PathVariable Long paymentId) {
        try {
            Payment payment = paymentService.getPaymentStatus(paymentId);
            return ResponseEntity.ok(payment);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.notFound().build();
        }
    }
}
