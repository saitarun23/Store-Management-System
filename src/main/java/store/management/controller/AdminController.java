package store.management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import store.management.model.AdminCredentials;
import store.management.model.Product;
import store.management.repository.AdminCredentialsRepo;
import store.management.repository.ProductRepo;

@Controller
public class AdminController {
	
	@Autowired
	private AdminCredentialsRepo adminCredentialsRepo;
	
	@Autowired
	private ProductRepo productRepo;
	
	@GetMapping("/")
	public ModelAndView logintest(Model model)
	{
		ModelAndView login=new ModelAndView("login");
		model.addAttribute("products",productRepo.findAll());
		return login;
	}
	
	
	@PostMapping("/home")
	public ModelAndView showSalesForm(@ModelAttribute AdminCredentials adminCredentials,Model model) {
		String user=adminCredentials.getAdminId();
		String password=adminCredentials.getPassword();
		ModelAndView modelAndView=new ModelAndView();
		List<Product> products=productRepo.findAll();
		AdminCredentials admindetails=adminCredentialsRepo.findByAdminId(user);
//		modelAndView.setViewName("sales");
		if(admindetails!=null) {
			if(admindetails.getPassword().equals(password)) {
				
				modelAndView.setViewName("sales");
				model.addAttribute("products",products);
			}
			else {
				modelAndView.setViewName("login");
				model.addAttribute("ErrorMessage","Incorrect Password");
			}
			
		}
		else {
			modelAndView.setViewName("login");
			model.addAttribute("ErrorMessage","User not found");
		}
	
		return modelAndView;
	}
	
	
	@GetMapping("/aboutus")
	public ModelAndView aboutUs()
	{
		ModelAndView aboutus=new ModelAndView("aboutus");
		return aboutus;
	}
	

}
