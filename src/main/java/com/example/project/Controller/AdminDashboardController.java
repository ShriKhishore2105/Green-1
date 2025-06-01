package com.example.project.Controller;

import com.example.project.model.OrderDTO;
import com.example.project.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminDashboardController {

    @GetMapping("/dashboard")
    public String adminDashboard() {
        return "admin-dashboard"; // this will map to admin-dashboard.ftl or .html
    }

    @Autowired
    private OrderService orderService;

    @GetMapping("/orders")
    public String viewAllOrders(Model model) {
        try {
            List<OrderDTO> orders = orderService.getAllOrdersWithUserDetails();
            model.addAttribute("orders", orders);
            return "adminOrders"; // This should match your FreeMarker template name
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Error loading orders: " + e.getMessage());
            return "adminOrders";
        }
    }
}
