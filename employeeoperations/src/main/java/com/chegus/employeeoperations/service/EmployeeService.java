package com.chegus.employeeoperations.service;

import java.util.List;

import com.chegus.employeeoperations.dto.Department;
import com.chegus.employeeoperations.dto.Employee;

public interface EmployeeService
{
	boolean createEmployee(Employee e);

	List<Employee> displayAllEmps();

	Employee getEmployeeById(int id);
	
	boolean deleteEmployee(int id);
	
	boolean updateEmployee(Employee emp);

	List<Department> getAllDepartments();

	boolean createDepartment(Department department);

	Department getDepartmentById(int id);

	List<Employee> searchEmployee(Integer id, String name, double salary);

	boolean isEmailDuplicate(String email);
}
