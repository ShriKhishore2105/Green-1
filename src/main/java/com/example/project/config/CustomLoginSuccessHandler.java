package com.example.project.config;

import java.io.IOException;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
@Override
public void onAuthenticationSuccess(HttpServletRequest request,HttpServletResponse response,Authentication authentication)throws IOException,ServletException{
	for(GrantedAuthority auth:authentication.getAuthorities()) {
		if(auth.getAuthority().equals("ROLE_ADMIN")) {
			response.sendRedirect("/admin/dashboard");
			return;
		}
	}
	response.sendRedirect("/products");
}
}
