package com.example.project.Controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.project.model.Register;
import com.example.project.model.UserModel;
import com.example.project.repositories.UserRepo;

import jakarta.validation.Valid;

@Controller
public class RegisterController {

	@Autowired
	private UserRepo repo;
	
	@PostMapping("/logout")
	public String logout(Model model) {
		return "redirect:/login";
	}
	
	@GetMapping("/login")
	public String login(Principal principal) {
		if(principal!=null) {
			return "redirect:/";
		}
		
		return "login";
	}
	
	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("user",new Register());
		
		return "registration";
	}
	@PostMapping("/register")
	public String saveReg(@Valid @ModelAttribute Register reg,Model model,BindingResult res) {
		
		UserModel user=repo.findByEmail(reg.getEmail());
		
		
		if(user!=null) {
			res.addError(new FieldError("reg","email","User Already Exists"));
		}
		
		if(res.hasErrors()) {
			model.addAttribute("user",reg);
			return "redirect:/register";
			
		}
		
		var encoder=new BCryptPasswordEncoder();
		UserModel newuser=new UserModel();
		newuser.setUsername(reg.getUsername());
		
		newuser.setPassword(encoder.encode(reg.getPassword()));
		newuser.setEmail(reg.getEmail());
		
		if("admin".equals(reg.getAdminKey())) {
		newuser.setRole("ADMIN");}
		else {
			newuser.setRole("CUSTOMER");
		}
		
		System.out.println(newuser);
		repo.save(newuser);
		
		
		return "redirect:/login";
	}
}
