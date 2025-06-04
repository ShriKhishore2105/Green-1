package com.example.project.tests;


import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import com.example.project.service.ProductServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.example.project.model.Product;
import com.example.project.repositories.ProductRepository;

@ExtendWith(MockitoExtension.class)
public class ProductServiceImplTest {

    @Mock
    private ProductRepository productRepository;

    @InjectMocks
    private ProductServiceImpl productService;

    private Product product1;
    private Product product2;

    @BeforeEach
    void setUp() {
        product1 = new Product();
        product1.setProductId(1);
        product1.setName("Laptop");
        product1.setPrice(1200.00);
        product1.setDescription("Powerful laptop for work and gaming");
        product1.setCategoryId(101);

        product2 = new Product();
        product2.setProductId(2);
        product2.setName("Mouse");
        product2.setPrice(25.00);
        product2.setDescription("Wireless mouse");
        product2.setCategoryId(101);
    }

    @Test
    @DisplayName("Test addProduct - success")
    void testAddProduct_Success() {
        when(productRepository.save(any(Product.class))).thenReturn(product1);
        Product result = productService.addProduct(product1);

        assertNotNull(result);
        assertEquals(product1.getProductId(), result.getProductId());
        assertEquals(product1.getName(), result.getName());

        verify(productRepository, times(1)).save(product1);
    }

    @Test
    @DisplayName("Test deleteProduct - success")
    void testDeleteProduct_Success() {
        doNothing().when(productRepository).deleteById(product1.getProductId());
        productService.deleteProduct(product1.getProductId());

        verify(productRepository, times(1)).deleteById(product1.getProductId());
    }

    @Test
    @DisplayName("Test updateProduct - success")
    void testUpdateProduct_Success() {
        when(productRepository.existsById(product1.getProductId())).thenReturn(true);
        when(productRepository.save(any(Product.class))).thenReturn(product1);

        product1.setName("Updated Laptop Name");
        productService.updateProduct(product1);

        verify(productRepository, times(1)).existsById(product1.getProductId());
        verify(productRepository, times(1)).save(product1);
    }

    @Test
    @DisplayName("Test getProductDetails - product found")
    void testGetProductDetails_Found() {
        when(productRepository.findById(product1.getProductId())).thenReturn(Optional.of(product1));
        Optional<Product> result = productService.getProductDetails(product1.getProductId());

        assertTrue(result.isPresent());
        assertEquals(product1.getProductId(), result.get().getProductId());

        verify(productRepository, times(1)).findById(product1.getProductId());
    }

    @Test
    @DisplayName("Test getAllProducts - returns list of products")
    void testGetAllProducts_Success() {
        List<Product> products = Arrays.asList(product1, product2);
        when(productRepository.findAll()).thenReturn(products);

        List<Product> result = productService.getAllProducts();

        assertNotNull(result);
        assertEquals(2, result.size());
        assertEquals(product1.getName(), result.get(0).getName());
        assertEquals(product2.getName(), result.get(1).getName());

        verify(productRepository, times(1)).findAll();
    }

    @Test
    @DisplayName("Test searchProducts - found matching products")
    void testSearchProducts_Found() {
        List<Product> products = Arrays.asList(product1);
        when(productRepository.findByNameContainingIgnoreCase("laptop")).thenReturn(products);

        List<Product> result = productService.searchProducts("laptop");

        assertNotNull(result);
        assertEquals(1, result.size());
        assertEquals(product1.getName(), result.get(0).getName());

        verify(productRepository, times(1)).findByNameContainingIgnoreCase("laptop");
    }
}

