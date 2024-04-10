package employeeApp.service;

import java.util.List;

import employeeApp.model.Employee;

public interface EmployeeService {
	
	void createEmp(Employee employee);
	
	List<Employee> getAllEmployees();
	
	Employee getSingleEmployee(int empId );
	
	void deleteEmployee(int empId);
	
	List<Employee> searchEmployee(Employee searchEmployee);

}
