package employeeApp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import employeeApp.model.Employee;
import employeeApp.service.EmployeeService;

@Controller
public class MainController {
	
	@Autowired
	private EmployeeService service;
	@RequestMapping("/home")
	public String home(Model model) {
		
		List<Employee> employees = service.getAllEmployees();
		System.out.println("home method");
		model.addAttribute("employees",employees);
		model.addAttribute("employee", new Employee());
		return "home";
	}
	
	@RequestMapping("/empForm")
	public String addEmpForm(Model model) {
		
		Employee employee =new Employee();
		model.addAttribute("employee", employee);
		return "addEmpForm";
	}
	
	@PostMapping("/saveEmp")
	public RedirectView saveEmp(@ModelAttribute Employee employee,HttpServletRequest request)
	{	
		service.createEmp(employee);
		System.out.println(employee);
		RedirectView redirectView =new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/home");
		return redirectView;
	}
	
	@RequestMapping(path="/searchEmp",method= RequestMethod.POST )
	public String searchEmp(@ModelAttribute Employee employee,Model model)
	{
		List<Employee> searchedEmployees = service.searchEmployee(employee);
		model.addAttribute("employees", searchedEmployees);
		return "home";
	}
	
	
	
	
	
	
}
