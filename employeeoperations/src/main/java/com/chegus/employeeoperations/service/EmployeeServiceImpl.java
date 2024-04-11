package com.chegus.employeeoperations.service;

import java.time.LocalDate;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chegus.employeeoperations.dao.EmployeRepository;
import com.chegus.employeeoperations.dto.Department;
import com.chegus.employeeoperations.dto.Employee;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService
{

	@Autowired
	private EmployeRepository repository;
	
	@Override
	public boolean createEmployee(Employee e)
	{
		//calculate age
		int yob = Integer.parseInt(e.getDob().substring(0, 4));
		int curYear = LocalDate.now().getYear();
		int age = curYear - yob;
		e.setAge(age);
		
		return repository.insertEmployee(e);
		
	}

	@Override
	public List<Employee> displayAllEmps() 
	{
		return repository.getAllEmployees();
	}

	@Override
	public Employee getEmployeeById(int id) {
		return repository.getEmployeeById(id);
	}
	@Override
	public boolean deleteEmployee(int id) {
		
		return repository.deleteEmployee(id);
	}
	 
	@Override
	public boolean updateEmployee(Employee updatedEmployee) {
		
		/*//calculate age
				int yob = Integer.parseInt(updatedEmployee.getDob().substring(0, 4));
				int curYear = LocalDate.now().getYear();
				int age = curYear - yob;
				updatedEmployee.setAge(age);*/
				
		return repository.updateEmployee(updatedEmployee);
	}
	
	@Override
	public boolean createDepartment(Department department) {
		
		return repository.insertDepartment(department);
	}
	
	@Override
	public List<Department> getAllDepartments() {
		
		return repository.getAllDepartments();
	}
	
	@Override
	public Department getDepartmentById(int id) {
		
		return repository.getDepartmentById(id);
	}

	@Override
	public List<Employee> searchEmployee(Integer id, String name, double salary ) {
		
		return repository.searchEmployee(id, name, salary);
	}
	
	@Transactional
	@Override
	public boolean isEmailDuplicate(String email) {
	
		return repository.isEmailDuplicate(email);
	}
}
