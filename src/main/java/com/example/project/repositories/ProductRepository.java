package com.example.project.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.project.model.Product;

public interface ProductRepository extends JpaRepository<Product,Integer> {
	
public Optional<Product> findById(Integer productId);

public List<Product> findByNameContainingIgnoreCase(String keyword);

public List<Product> findByCategoryId(Integer categoryId);

}
