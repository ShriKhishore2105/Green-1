package com.example.project.tests;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import com.example.project.service.CartService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.example.project.model.Cart;
import com.example.project.repositories.CartRepository;

@ExtendWith(MockitoExtension.class)
public class CartServiceTest {

    @Mock
    private CartRepository cartRepository; // Mock the repository dependency

    @InjectMocks
    private CartService cartService; // Inject mocks into the service to be tested

    private int userId;
    private int productId;
    private int quantity;
    private Cart sampleCart;

    @BeforeEach
    void setUp() {
        userId = 1;
        productId = 101;
        quantity = 2;
        sampleCart = new Cart();
        sampleCart.setUserId(userId);
        sampleCart.setProductId(productId);
        sampleCart.setQuantity(quantity);
        sampleCart.setCartId(1); // Set an ID for consistency in mocks
    }

    @Test
    @DisplayName("Should add a new item to cart when it does not exist")
    void testAddToCart_NewItem() {
        // Given: The item is not in the cart yet
        when(cartRepository.findByUserIdAndProductId(userId, productId)).thenReturn(Optional.empty());

        // When: addToCart is called
        cartService.addToCart(userId, productId, quantity);

        // Then: verify that a new Cart object was saved
        verify(cartRepository, times(1)).save(argThat(cart ->
                cart.getUserId() == userId &&
                        cart.getProductId() == productId &&
                        cart.getQuantity() == quantity
        ));
    }

    @Test
    @DisplayName("Should update quantity of existing item in cart")
    void testAddToCart_ExistingItem() {
        // Given: The item already exists in the cart with some quantity
        int existingQuantity = 3;
        sampleCart.setQuantity(existingQuantity);
        when(cartRepository.findByUserIdAndProductId(userId, productId)).thenReturn(Optional.of(sampleCart));

        int quantityToAdd = 2;

        // When: addToCart is called
        cartService.addToCart(userId, productId, quantityToAdd);

        // Then: verify that the existing Cart object's quantity was updated and saved
        verify(cartRepository, times(1)).save(argThat(cart ->
                cart.getUserId() == userId &&
                        cart.getProductId() == productId &&
                        cart.getQuantity() == existingQuantity + quantityToAdd
        ));
    }

    @Test
    @DisplayName("Should remove an item from cart if it exists")
    void testRemoveFromCart_ItemExists() {
        // Given: The item exists in the cart
        when(cartRepository.findByUserIdAndProductId(userId, productId)).thenReturn(Optional.of(sampleCart));

        // When: removeFromCart is called
        cartService.removeFromCart(userId, productId);

        // Then: verify that the item was deleted
        verify(cartRepository, times(1)).delete(sampleCart);
    }

    @Test
    @DisplayName("Should do nothing if item to remove does not exist")
    void testRemoveFromCart_ItemDoesNotExist() {
        // Given: The item does not exist in the cart
        when(cartRepository.findByUserIdAndProductId(userId, productId)).thenReturn(Optional.empty());

        // When: removeFromCart is called
        cartService.removeFromCart(userId, productId);

        // Then: verify that delete was never called
        verify(cartRepository, never()).delete(any(Cart.class));
    }


    @Test
    @DisplayName("Should update quantity of an existing cart item")
    void testUpdateCartQuantity_ItemExists() {
        // Given: The item exists in the cart
        when(cartRepository.findByUserIdAndProductId(userId, productId)).thenReturn(Optional.of(sampleCart));
        int newQuantity = 5;

        // When: updateCartQuantity is called
        cartService.updateCartQuantity(userId, productId, newQuantity);

        // Then: verify that the cart item's quantity was updated and saved
        verify(cartRepository, times(1)).save(argThat(cart ->
                cart.getUserId() == userId &&
                        cart.getProductId() == productId &&
                        cart.getQuantity() == newQuantity
        ));
    }

    @Test
    @DisplayName("Should not update quantity if item does not exist")
    void testUpdateCartQuantity_ItemDoesNotExist() {
        // Given: The item does not exist in the cart
        when(cartRepository.findByUserIdAndProductId(userId, productId)).thenReturn(Optional.empty());
        int newQuantity = 5;

        // When: updateCartQuantity is called
        cartService.updateCartQuantity(userId, productId, newQuantity);

        // Then: verify that save was never called
        verify(cartRepository, never()).save(any(Cart.class));
    }

    @Test
    @DisplayName("Should return all cart items for a given user")
    void testGetCartDetails() {
        // Given: A list of cart items for the user
        // Create the second cart item separately
        Cart anotherCart = new Cart();
        anotherCart.setCartId(2); // Assuming setCartId is setId for consistency
        anotherCart.setProductId(102);
        anotherCart.setUserId(userId);
        anotherCart.setQuantity(1); // Assuming quantity 1 from your previous example

        List<Cart> userCartItems = Arrays.asList(
                sampleCart,
                anotherCart // Add the separately created object here
        );

        when(cartRepository.findByUserId(userId)).thenReturn(userCartItems);

        // When: getCartDetails is called
        List<Cart> result = cartService.getCartDetails(userId);

        // Then: verify that the correct list of cart items is returned
        assertNotNull(result);
        assertEquals(2, result.size());
        assertEquals(userCartItems, result);
    }

    @Test
    @DisplayName("Should return empty list if user has no cart items")
    void testGetCartDetails_NoItems() {
        // Given: No cart items for the user
        when(cartRepository.findByUserId(userId)).thenReturn(Collections.emptyList());

        // When: getCartDetails is called
        List<Cart> result = cartService.getCartDetails(userId);

        // Then: verify that an empty list is returned
        assertNotNull(result);
        assertTrue(result.isEmpty());
    }


    @Test
    @DisplayName("Should return the correct count of items in the cart for a user")
    void testGetCartItemCount() {
        // Given: A specific count of items for the user
        int expectedCount = 3;
        when(cartRepository.countByUserId(userId)).thenReturn(expectedCount);

        // When: getCartItemCount is called
        int result = cartService.getCartItemCount(userId);

        // Then: verify that the correct count is returned
        assertEquals(expectedCount, result);
    }

    @Test
    @DisplayName("Should return 0 if user has no items in cart")
    void testGetCartItemCount_NoItems() {
        // Given: User has no items in the cart
        when(cartRepository.countByUserId(userId)).thenReturn(0);

        // When: getCartItemCount is called
        int result = cartService.getCartItemCount(userId);

        // Then: verify that 0 is returned
        assertEquals(0, result);
    }
}