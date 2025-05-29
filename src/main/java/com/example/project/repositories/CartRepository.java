package com.example.project.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.project.model.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart, Integer> {
    List<Cart> findByUserId(Integer userId); // Changed to Integer for consistency
    
    int countByUserId(Integer userId); // Changed to Integer for consistency
    
    // This method is crucial for finding an existing cart item by user and product
    Optional<Cart> findByUserIdAndProductId(Integer userId, Integer productId); // Changed to Integer for consistency
}