  package com.chegus.employeeoperations.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import com.chegus.employeeoperations.dto.Department;
import com.chegus.employeeoperations.dto.Employee;
import com.chegus.employeeoperations.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController
{
	@Autowired
	private EmployeeService service;
	
	@RequestMapping("/")
	public String getIndexPage(Model model)
	{
		List<Employee> allEmps = service.displayAllEmps();
		model.addAttribute("allEmployees", allEmps);
		//List<Department> departments = service.getAllDepartments();
		//model.addAttribute("allDepartments",departments);
		model.addAttribute("emp", new Employee());
		return "displayAll";
	}
	
	@RequestMapping(path="/addEmpForm",method=RequestMethod.GET)
	public String getAddFormPage(Model model )
	{
		Employee emp = new Employee();
        emp.setDept(new ArrayList<>()); 
        emp.getDept().add(new Department()); 
        model.addAttribute("emp", emp);
             
		return "addEmployeeForm";
	}

	@RequestMapping(path="/addEmp",method=RequestMethod.POST)
	public RedirectView addEmployee(@ModelAttribute Employee emp,HttpServletRequest request)
	{
		RedirectView redirectView =new RedirectView();
		
		List<Department> dept = emp.getDept();
		for(Department department:dept) {
			department.setEmployee(emp);
		}
		emp.setDept(dept);
		
		boolean isEmpInserted = service.createEmployee(emp);
		String msg1 = "";
		if(isEmpInserted) {
			msg1 = "Employee data Inserted";
		}
		else {
			msg1 = "Employee data NOT Inserted";
		}
		
		redirectView.setUrl(request.getContextPath()+"/employee/displayAll");
		System.out.println(msg1);
			
		return redirectView;
	}
	  
	@RequestMapping(path="/displayAll",method=RequestMethod.GET)
	public String displayAllEmpDepart(Model model)
	{
		List<Employee> allEmps = service.displayAllEmps();
		model.addAttribute("allEmployees", allEmps);
		/*
		List<Department> departments = service.getAllDepartments();
		model.addAttribute("allDepartments", departments);*/
		
		model.addAttribute("emp", new Employee());
		return "displayAll";
	}
		
	@RequestMapping(path="/edit/{id}",method=RequestMethod.GET)
	public String getEditPage(@PathVariable("id") int id,Model empModel)
	{
			
		//System.out.println(id);
		Employee emp = service.getEmployeeById(id);
			
	empModel.addAttribute("emp", emp);
	return "addEmployeeForm";
	}
		
	@Transactional
	@RequestMapping(path="/edit/update", method=RequestMethod.POST)
	public String updateEmployee(@ModelAttribute Employee updatedEmployee, Model model)
	{
		for(Department dept:updatedEmployee.getDept())
	    {
	    	if(dept.getDeptName()!=null ||dept.getDeptName()!="" )
	    	{
		        dept.setEmployee(updatedEmployee);
	    	}
		}
	    boolean isUpdated = service.updateEmployee(updatedEmployee);

		 if (isUpdated)
		   {
	          return "redirect:/employee/displayAll";
	       }
	       else
	       {
		        model.addAttribute("error", "Failed to update employee");
		        return "addEmployeeForm";
	       }
		}

		@RequestMapping(path="/delete/{id}", method= RequestMethod.GET)
		public RedirectView deleteEmployee(@PathVariable("id") int id,HttpServletRequest request) 
		{
			RedirectView redirectView =new RedirectView();
			boolean isInserted = service.deleteEmployee(id);
			String msg = "";
			if(isInserted) {
				msg = "Deleted";
			}
			else {
				msg = "NOT Deleted";
			}
			redirectView.setUrl(request.getContextPath()+"/employee/displayAll");
			System.out.println(msg);
			return redirectView;
		}
				
		@RequestMapping(path="/search", method = RequestMethod.GET)
		public String searchEmployeeDetails(@RequestParam Integer id,@RequestParam(required =false) String name,
											@RequestParam(required =false) double salary,Model model,
											@ModelAttribute("emp") Employee emp )
		{
			System.out.println("Employee Id: "+id+" name: "+name+" salary: "+salary);
			List<Employee> searchResults = service.searchEmployee(id,name,salary);
			System.out.println("Search Results: "+searchResults);
			model.addAttribute("searchResults", searchResults);
			return "displayAll";
		}
		
		@RequestMapping("/validateEmail")
	    public @ResponseBody String validateEmail(@RequestParam String email) 
		{
			try 
			{
				System.out.println("email = "+email);
				boolean isEmailDuplicate = service.isEmailDuplicate(email);
				System.out.println("Is Email Duplicate: " + isEmailDuplicate);
		        if (isEmailDuplicate)
		        {
		            return "duplicate";
		        } 
		        else
		        {
		            return "notDuplicate";
		        }
		    } 
			catch (Exception e) 
			{
		        e.printStackTrace();
		        return "error";
		    }
	    }	  
}


