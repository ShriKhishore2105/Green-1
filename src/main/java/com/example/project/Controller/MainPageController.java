package com.example.project.Controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project.model.Product;
import com.example.project.service.ProductService;
import com.example.project.service.UserService;
import com.example.project.service.CartService;

@Controller

public class MainPageController {

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @Autowired
    private CartService cartService;

    @GetMapping("/products")
    public String showProductList(@RequestParam(value = "query", required = false) String query,
                                   @RequestParam(value = "categoryId", required = false) Integer categoryId,
                                   Model model,
                                   Principal principal) {
        List<Product> products;

        if (query != null && !query.trim().isEmpty()) {
            products = productService.searchProducts(query);
        } else if (categoryId != null) {
            products = productService.getProductsByCategoryId(categoryId);
        } else {
            products = productService.getAllProducts();
        }

        Map<Integer, String> CATEGORY_MAP = Map.of(
            1, "Consoles",
            2, "Mobiles and Tablets",
            3, "Tv, Appliances, Electronics",
            4, "Home and Kitchen",
            5, "Mens's Fashion",
            6, "Women's Fashion",
            7, "Sports, Fitness, Bags",
            8, "Books",
            9, "Movies, Music & Video Games",
            10, "Toys, Baby Products, Kids' Fashion"
           
        );

        int userId = 0;
        int cartItemCount = 0;

        if (principal != null) {
            String email = principal.getName();
            userId = userService.getIdByEmail(email); 
            cartItemCount = cartService.getCartItemCount(userId);
        }

        model.addAttribute("products", products);
        model.addAttribute("categories", CATEGORY_MAP.entrySet());
        model.addAttribute("query", query);
        model.addAttribute("userId", userId);
        model.addAttribute("cartItemCount", cartItemCount);

        return "home";
    }
}
