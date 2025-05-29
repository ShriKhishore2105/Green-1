package com.example.project.Controller;

import java.security.Principal;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.Product;
import com.example.project.service.CartService;
import com.example.project.service.ProductService;
import com.example.project.service.UserService;

@Controller
@RequestMapping("/product")
public class ViewProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @Autowired
    private CartService cartService;

    @GetMapping("/{productId}")
    public ModelAndView getProductDetails(@PathVariable Integer productId, Principal principal) {
        Optional<Product> product = productService.getProductDetails(productId);

        if (product.isEmpty()) {
            return new ModelAndView("redirect:/products");
        }

        Product viewprod = product.get();

        int userId = 0;
        int cartItemCount = 0;

        if (principal != null) {
            String email = principal.getName();
            userId = userService.getIdByEmail(email);
            cartItemCount = cartService.getCartItemCount(userId);
        }

        ModelAndView mv = new ModelAndView("view");
        mv.addObject("productObj", viewprod);
        mv.addObject("userId", userId);
        mv.addObject("cartItemCount", cartItemCount);

        return mv;
    }
}
