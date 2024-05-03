package store.management.controller;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import store.management.model.Sales;
import store.management.repository.SalesRepo;

@Controller
public class SalesController {
	
	@Autowired
	private SalesRepo salesRepo;

	@PostMapping("/generateReceipt")
	public ModelAndView generateReceipt(@ModelAttribute() Sales sales,Model model) {
		sales.setSaleDate(new Date());
		salesRepo.save(sales);
		
		System.out.println((sales));
		ModelAndView receipt=new ModelAndView("receipt");

		model.addAttribute("receipt",sales);
		
		return receipt;
	}

	
	@GetMapping("/DailyReport")
	public ModelAndView showDailyReport(Model model) {
		ModelAndView report=new ModelAndView("report");
		List<Sales> dailySales=salesRepo.findBySaleDate(new Date());
		
		double totalSales=0;
		double profit=0;
		for(Sales sales:dailySales)
		{
			profit=profit+sales.getSellingPrice()-sales.getCostPrice();			
		}
		for(Sales sales:dailySales)
		{
			totalSales=totalSales+sales.getSellingPrice();
		}
		model.addAttribute("SalesType","Daily Report");
		model.addAttribute("Profit",profit );
		model.addAttribute("TotalSales",totalSales);
		model.addAttribute("AllSales",dailySales);
		
		return report;
	}
	
	@GetMapping("/WeeklyReport")
	public ModelAndView showWeeklyReport(Model model) {
		ModelAndView report=new ModelAndView("report");
		List<Sales> weeklySales=salesRepo.findByCurrentWeek();
		
		double totalSales=0;
		double profit=0;
		for(Sales sales:weeklySales)
		{
			profit=profit+sales.getSellingPrice()-sales.getCostPrice();		
			System.out.println(profit);
		}
		for(Sales sales:weeklySales)
		{
			totalSales=totalSales+sales.getSellingPrice();
		}
		model.addAttribute("SalesType","Weekly Report");
		model.addAttribute("Profit",profit );
		model.addAttribute("TotalSales",totalSales);
		model.addAttribute("AllSales",weeklySales);
		
		return report;
	}
	
	@GetMapping("/MonthlyReport")
	public ModelAndView showMonthlyReport(Model model) {
		ModelAndView report=new ModelAndView("report");
		List<Sales> monthlySales=salesRepo.findByCurrentMonth();
		
		double totalSales=0;
		double profit=0;
		for(Sales sales:monthlySales)
		{
			profit=profit+sales.getSellingPrice()-sales.getCostPrice();			
		}
		for(Sales sales:monthlySales)
		{
			totalSales=totalSales+sales.getSellingPrice();
		}
		model.addAttribute("SalesType","Monthly Report");
		model.addAttribute("Profit",profit );
		model.addAttribute("TotalSales",totalSales);
		model.addAttribute("AllSales",monthlySales);
		
		return report;
	}
	
	@GetMapping("/QuarterlyReport")
	public ModelAndView showQuarterlyReport(Model model) {
		ModelAndView report=new ModelAndView("report");
		List<Sales> quarterlySales=salesRepo.findByQuarterMonth();
		
		double totalSales=0;
		double profit=0;
		for(Sales sales:quarterlySales)
		{
			profit=profit+sales.getSellingPrice()-sales.getCostPrice();			
		}
		for(Sales sales:quarterlySales)
		{
			totalSales=totalSales+sales.getSellingPrice();
		}
		model.addAttribute("SalesType","Quarterly Report");
		model.addAttribute("Profit",profit );
		model.addAttribute("TotalSales",totalSales);
		model.addAttribute("AllSales",quarterlySales);
		
		return report;
	}
}	