package com.example.project.service;

import java.util.List;
import java.util.Optional;

import com.example.project.model.Product;

public interface ProductService {

	
	
	Product addProduct(Product product);
	
	void deleteProduct(Integer productId);
	
	void updateProduct(Product product);
	
	Optional<Product> getProductDetails(Integer productId);
	
	List<Product> getAllProducts();

	List<Product> searchProducts(String keyword);

	List<Product> getProductsByCategoryId(Integer categoryId);
	
	void setStockQuantity(int quantity);
}
