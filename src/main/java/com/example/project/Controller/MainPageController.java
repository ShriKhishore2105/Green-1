package com.example.project.Controller;
import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project.model.Product;
import com.example.project.service.CartService;
import com.example.project.service.CategoryService;
import com.example.project.service.ProductService;
import com.example.project.service.UserService;


@Controller
public class MainPageController {

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @Autowired
    private CartService cartService;

    @Autowired
    private CategoryService categoryService;

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

        int userId = 0;
        int cartItemCount = 0;

        if (principal != null) {
            String email = principal.getName();
            userId = userService.getIdByEmail(email);
            cartItemCount = cartService.getCartItemCount(userId);
        }

        model.addAttribute("products", products);
        model.addAttribute("categories", categoryService.getCategoryMap().entrySet());
        model.addAttribute("query", query);
        model.addAttribute("userId", userId);
        model.addAttribute("cartItemCount", cartItemCount);

        return "home";
    }
}