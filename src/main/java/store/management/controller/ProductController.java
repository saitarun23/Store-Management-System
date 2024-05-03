package store.management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import store.management.model.Product;
import store.management.repository.ProductRepo;

@Controller
public class ProductController {
	
	@Autowired
	private ProductRepo productRepo;
	
	@GetMapping("/items")
	public ModelAndView generateReceipt(Model model) {
		List<Product> products=productRepo.findAll();
		ModelAndView items=new ModelAndView("items");
		model.addAttribute("items",products);
		return items;
	}
	
	@PostMapping("/addProduct")
	public ModelAndView AddProduct(@ModelAttribute Product product){
		productRepo.save(product);
		ModelAndView Products=new ModelAndView("redirect:/items");
		return Products;
	}	
}