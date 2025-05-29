package com.example.project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.model.Product;
import com.example.project.repositories.ProductRepository;

import jakarta.transaction.Transactional;

@Service
public class ProductServiceImpl implements ProductService {

	
	@Autowired
	private ProductRepository productRepository;
	private int quantity;

	@Override
	@Transactional
	public Product addProduct(Product product) {
		return productRepository.save(product);
		
	}

	@Override
	@Transactional
	public void deleteProduct(Integer productId) {
		productRepository.deleteById(productId);
		
	}

	@Override
	public void updateProduct(Product product) {
		
		System.out.println("service id:"+product.getProductId());
		System.out.println(product);
		if(product.getProductId()!=null&&productRepository.existsById(product.getProductId())) {
			productRepository.save(product);

		}
		else {
			System.out.print("invalid Update");
		}
		
	}

	
	@Override
	public Optional<Product> getProductDetails(Integer productId) {
		return productRepository.findById(productId);
	}

	@Override
	public List<Product> getAllProducts() {
		return productRepository.findAll();
	}

	@Override
	public List<Product> searchProducts(String keyword) {
		return productRepository.findByNameContainingIgnoreCase(keyword);
	}

	@Override
	public List<Product> getProductsByCategoryId(Integer categoryId) {
		return productRepository.findByCategoryId(categoryId);
	}

	@Override
	public void setStockQuantity(int quantity) {
		this.quantity=quantity;
		
	}
	
}
