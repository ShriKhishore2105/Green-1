package com.example.project.Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.Product;
import com.example.project.service.ProductService;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/admin/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	
	private  String uploadDir="C:/stock images";
	
	@GetMapping("/all")
	public ModelAndView getAllProducts() {
		List<Product> products=productService.getAllProducts();
		return new ModelAndView("productList","products",products);
		
	}

	
	@GetMapping("/add")
	public String getAddForm(Model model) {
		System.out.print("get calleff");
		Product product=new Product();
		model.addAttribute("productFormObj", product);
		return "addProduct";
	}
	
	@PostMapping("/add")
	public String addProduct(@Valid @ModelAttribute("productFormObj") Product product,BindingResult result) {
		System.out.print("called");
		
	
	Product savedProduct=productService.addProduct(product);
		
		

		
		MultipartFile image=product.getProductImage();
		if(image!=null &&!image.isEmpty()) {
			Path path=Paths.get(uploadDir+savedProduct.getProductId()+".jpg");
			
			try {
				image.transferTo(new File(path.toString()));
				
			}
			catch(IOException e) {
			e.printStackTrace();
			}
		}
		return "redirect:/admin/product/all";
		
	}
	
	@GetMapping("/edit/{productId}")
	public ModelAndView getEditForm(@PathVariable Integer productId) {
		Optional<Product> product=productService.getProductDetails(productId);
		
		Product p=product.get();
		System.out.println("id"+p.getProductId());
		
		
		return new ModelAndView("editProduct","editProductObj",p);
		
	}
	
	@PostMapping("/edit")
	public String updateProduct(@ModelAttribute("editProductObj") Product product) {

		productService.updateProduct(product);
		return "redirect:/admin/product/all";
	}
	
	@GetMapping("/delete/{productId}")
	public String deleteProduct(@PathVariable Integer productId) {
		Path path=Paths.get(uploadDir+productId+".jpg");
		try {
			if(Files.exists(path)) Files.delete(path);
		}
		catch(IOException e) {
			e.printStackTrace();
		}
		productService.deleteProduct(productId);
		return "redirect:/admin/product/all";
	}
	
	
	
	
	
	
}
