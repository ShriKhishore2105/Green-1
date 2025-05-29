package com.example.project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication 
@EnableJpaRepositories("com.example.project.repositories")
@EntityScan("com.example.project.model")
public class Green1Application {

	public static void main(String[] args) {
		SpringApplication.run(Green1Application.class, args);
	}

}
