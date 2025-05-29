package com.example.project.Controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.project.model.UserModel;
import com.example.project.repositories.UserRepo;

@Controller


public class ProfileController {
	
	@Autowired
	private UserRepo userRepo;
@GetMapping("/profile")
public String profilePage(Model model,Principal principal) {
			String email=principal.getName();
			UserModel user=userRepo.findByEmail(email);
			model.addAttribute("user",user);
			return "profile";
}
}
