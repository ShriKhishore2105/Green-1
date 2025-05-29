package com.example.project.Controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.project.model.Order;
import com.example.project.repositories.OrderRepository;
import com.example.project.service.UserService;

@Controller
@RequestMapping("/orders")
public class OrderController {

	@Autowired 
	private UserService userService;
	
	@Autowired
	private OrderRepository  orderRepo;
	
	@GetMapping("/my")
	public String viewOrders(Model model,Principal principal) {
		if(principal!=null) {
			String email=principal.getName();
			int userId=userService.getIdByEmail(email);
			
				List<Order> orders=orderRepo.findByUserId(userId);
			
			model.addAttribute("orders",orders);}		
		return "orders";
	}
	
}
