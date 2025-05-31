package com.example.project.Controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.project.model.Register;

@Controller
@RequestMapping("/")
public class HomeController {

	@GetMapping
	public String view(Authentication authentication) {
		if(authentication!=null) {
			for(GrantedAuthority authority:authentication.getAuthorities()) {
				if("ROLE_ADMIN".equals(authority.getAuthority())) {
					return "redirect:/admin/dashboard";
				}
				else if("ROLE_CUSTOMER".equals(authority.getAuthority())) {
					return "redirect:/products";
				}
			}
		}
		
		return "redirect:/products";
	}
}
