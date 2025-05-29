package com.example.project.model;

import jakarta.validation.constraints.NotEmpty;

public class Register {

	@NotEmpty
	private  String username;
	@NotEmpty
	private String email;
	@NotEmpty
	private String password;
	
	private String adminKey;
	
	
	
	
	@Override
	public String toString() {
		return "Register [username=" + username + ", email=" + email + ", password=" + password + ", adminKey="
				+ adminKey + "]";
	}
	public String getUsername() {
		return username;
	}
	public String getAdminKey() {
		return adminKey;
	}
	public void setAdminKey(String adminKey) {
		this.adminKey = adminKey;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
