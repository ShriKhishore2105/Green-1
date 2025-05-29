package com.example.project.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.project.model.UserModel;

public interface UserRepo extends JpaRepository<UserModel,Integer> {
	
	public UserModel findByEmail(String email);

}
