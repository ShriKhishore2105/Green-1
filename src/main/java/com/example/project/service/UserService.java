package com.example.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.project.model.UserModel;
import com.example.project.repositories.UserRepo;

@Service
public class UserService implements UserDetailsService{
	
	@Autowired
	private UserRepo repo;
	

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		UserModel user=repo.findByEmail(email);
		if(user!=null) {
			var dUser=User.withUsername(user.getEmail())
					.password(user.getPassword())
					.roles(user.getRole())
					.build();
		
		return dUser ;
	}
		return null;
		}
//debugging

	public int getIdByEmail(String email) {
		UserModel user=repo.findByEmail(email);
		System.out.print("user id:"+user.getId());
		return user!=null?user.getId():0;
	}

}
