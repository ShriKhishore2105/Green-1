package com.example.project.model;



import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name="products")

public class Product  {
	
	
	
	@Id
@Column(name="productid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer productId;
	
	@NotEmpty(message="product name is required")
	private String name;
	
	@Lob
	private String description;
	
	@NotNull(message="price is required")
	private double price;
	
	private int categoryId;
	
	private int stockQuantity;
	
	@Transient
	private MultipartFile productImage;
	
	public Product() {
		
	}

	public Product(Integer productId, String name, String description,
			 double price, int categoryId, int stockQuantity) {
		super();
		this.productId = productId;
		this.name = name;
		this.description = description;
		this.price = price;
		this.categoryId = categoryId;
		this.stockQuantity = stockQuantity;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getStockQuantity() {
		return stockQuantity;
	}

	public void setStockQuantity(int stockQuantity) {
		this.stockQuantity = stockQuantity;
	}

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", name=" + name + ", description=" + description + ", price="
				+ price + ", categoryId=" + categoryId + ", stockQuantity=" + stockQuantity + ", productImage="
				+ productImage + "]";
	}
	
	
	

}
