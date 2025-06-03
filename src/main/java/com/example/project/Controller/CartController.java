package com.example.project.Controller;

import com.example.project.model.Product;
import com.example.project.model.Cart;
import com.example.project.service.CartService;
import com.example.project.service.ProductService;
import com.example.project.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;



@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    // Add to cart and return to same page
    @PostMapping("/add")
    public String addToCart(@RequestParam int productId,
                            @RequestParam(defaultValue = "1") int quantity,
                            Principal principal,
                            @RequestHeader(value = "referer", required = false) String referer,
                            RedirectAttributes redirectAttributes) {
        try {
            if (principal != null) {
                String email = principal.getName();
                int userId = userService.getIdByEmail(email);
                if (userId > 0) { // Ensure a valid userId is obtained
                    cartService.addToCart(userId, productId, quantity);
                    redirectAttributes.addFlashAttribute("success", "Product added to cart successfully!");
                } else {
                    redirectAttributes.addFlashAttribute("error", "Could not determine user ID. Please login.");
                }
            } else {
                redirectAttributes.addFlashAttribute("error", "Please login to add items to cart");
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error adding product to cart: " + e.getMessage());
            e.printStackTrace(); // Log the error for debugging
        }

        return "redirect:" + (referer != null ? referer : "/products");
    }

    // Remove item from cart
    @PostMapping("/remove")
    public String removeFromCart(@RequestParam int productId,
                                 Principal principal,
                                 @RequestHeader(value = "referer", required = false) String referer,
                                 RedirectAttributes redirectAttributes) {
        try {
            if (principal != null) {
                String email = principal.getName();
                int userId = userService.getIdByEmail(email);
                if (userId > 0) { // Ensure a valid userId is obtained
                    cartService.removeFromCart(userId, productId);
                    redirectAttributes.addFlashAttribute("success", "Product removed from cart successfully!");
                } else {
                    redirectAttributes.addFlashAttribute("error", "Could not determine user ID. Please login.");
                }
            } else {
                redirectAttributes.addFlashAttribute("error", "Please login to remove items from cart");
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error removing product from cart: " + e.getMessage());
            e.printStackTrace(); // Log the error for debugging
        }

        return "redirect:" + (referer != null ? referer : "/cart/details");
    }

    // Update cart quantity
    @PostMapping("/update")
    public String updateCartQuantity(@RequestParam int productId,
                                   @RequestParam int quantity,
                                   Principal principal,
                                   RedirectAttributes redirectAttributes) {
        try {
            if (principal != null) {
                String email = principal.getName();
                int userId = userService.getIdByEmail(email);
                
                // Validate userId
                if (userId <= 0) {
                    redirectAttributes.addFlashAttribute("error", "Invalid user ID. Please login.");
                    return "redirect:/login"; // Redirect to login if user ID is invalid
                }

                // Validate quantity
                if (quantity <= 0) {
                    redirectAttributes.addFlashAttribute("error", "Quantity must be greater than 0");
                    return "redirect:/cart/details";
                }
                
                cartService.updateCartQuantity(userId, productId, quantity);
                redirectAttributes.addFlashAttribute("success", "Cart quantity updated successfully!");
            } else {
                redirectAttributes.addFlashAttribute("error", "Please login to update cart");
                return "redirect:/login";
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error updating cart quantity: " + e.getMessage());
            e.printStackTrace(); // Log the error for debugging
        }

        return "redirect:/cart/details";
    }

    // View cart details
    @GetMapping("/details")
    public String viewCart(Model model, Principal principal) {
        int userId = 0;
        int cartItemCount = 0;
        List<Product> productList = new ArrayList<>();
        Map<Integer, Integer> cartQuantities = new HashMap<>();

        try {
            if (principal != null) {
                String email = principal.getName();
                userId = userService.getIdByEmail(email);
                
                if (userId > 0) { // Only proceed if userId is valid
                    List<Cart> cartItems = cartService.getCartDetails(userId);

                    for (Cart item : cartItems) {
                        Optional<Product> opt = productService.getProductDetails(item.getProductId());
                        if (opt.isPresent()) {
                            Product product = opt.get();
                            // IMPORTANT: Set the cart quantity in stockQuantity field for template compatibility
                            product.setStockQuantity(item.getQuantity());
                            productList.add(product);
                            cartQuantities.put(product.getProductId(), item.getQuantity());
                        } else {
                            // Log if a product in cart is not found in product database
                            System.err.println("Warning: Product with ID " + item.getProductId() + " in cart for user " + userId + " not found in product catalog.");
                        }
                    }
                    cartItemCount = cartService.getCartItemCount(userId);
                } else {
                    model.addAttribute("error", "Could not retrieve user ID. Please ensure you are logged in correctly.");
                }
            } else {
                model.addAttribute("error", "You are not logged in. Please log in to view your cart.");
            }
        } catch (Exception e) {
            model.addAttribute("error", "Error loading cart details: " + e.getMessage());
            e.printStackTrace(); // Log the error for debugging
        }

        model.addAttribute("products", productList);
        model.addAttribute("cartQuantities", cartQuantities);
        model.addAttribute("userId", userId);
        model.addAttribute("cartItemCount", cartItemCount);

        return "cart-details";
    }
}