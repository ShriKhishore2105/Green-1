package com.example.project.service;

import java.util.List;
import java.util.Optional; // Import Optional

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.model.Cart;
import com.example.project.repositories.CartRepository;

@Service
public class CartService {

    @Autowired
    private CartRepository cartRepository;

    public void addToCart(int userId, int productId, int quantity) {
        // Find by Integer userId and productId for consistency with repository
        Cart cart = cartRepository.findByUserIdAndProductId(userId, productId)
                .orElse(null);

        if (cart == null) {
            // Create new cart item
            cart = new Cart();
            cart.setUserId(userId);
            cart.setProductId(productId);
            cart.setQuantity(quantity);
            System.out.println("New cart item created for userId: " + userId + ", productId: " + productId);
        } else {
            // Update existing cart item - add to existing quantity
            cart.setQuantity(cart.getQuantity() + quantity);
            System.out.println("Existing cart item for userId: " + userId + ", productId: " + productId + " updated quantity by adding: " + quantity);
        }

        cartRepository.save(cart);
        System.out.println("Cart item saved/updated in DB.");
    }

    public void removeFromCart(int userId, int productId) {
        cartRepository.findByUserIdAndProductId(userId, productId)
                .ifPresent(cartRepository::delete);
        System.out.println("Cart item removed (if found) for userId: " + userId + ", productId: " + productId);
    }

    public void updateCartQuantity(int userId, int productId, int quantity) {
        Optional<Cart> optionalCart = cartRepository.findByUserIdAndProductId(userId, productId);

        if (optionalCart.isPresent()) {
            Cart cart = optionalCart.get();
            cart.setQuantity(quantity);
            cartRepository.save(cart);
            System.out.println("Cart item for userId: " + userId + ", productId: " + productId + " updated to quantity: " + quantity);
        } else {
            System.err.println("Error: Cart item not found for userId: " + userId + ", productId: " + productId + ". Cannot update quantity.");
            // You might want to throw an exception here so the controller can catch it and display an error.
            // throw new RuntimeException("Cart item not found for update");
        }
    }

    public List<Cart> getCartDetails(int userId) {
        return cartRepository.findByUserId(userId);
    }

    public int getCartItemCount(int userId) {
        return cartRepository.countByUserId(userId);
    }
}