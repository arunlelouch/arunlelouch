package employeeApp.service;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import employeeApp.model.Department;
import employeeApp.model.Employee;

@Service 
public class EmployeeServiceImp implements EmployeeService {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	//create or update emp
	@Transactional
	public void createEmp(Employee employee) {
		
		this.hibernateTemplate.saveOrUpdate(employee);
	}
	//get all emp
	@Transactional
	public List<Employee> getAllEmployees()
	{
		List<Employee> employees = this.hibernateTemplate.loadAll(Employee.class);
		
		return employees;
	}
	//get single emp
	@Transactional
	public Employee getSingleEmployee(int empId ) {
		
		Employee employee = this.hibernateTemplate.get(Employee.class, empId);
		return employee;
	}
	@Transactional
	public void deleteEmployee(int empId) {
		
		Employee employee = this.hibernateTemplate.get(Employee.class, empId);
		this.hibernateTemplate.delete(employee);
	}
	 
	public List<Employee> searchEmployee(Employee searchEmployee) {
	    Criteria criteria = hibernateTemplate.getSessionFactory().getCurrentSession().createCriteria(Employee.class);

	    if (searchEmployee.getEmpId() != null) {
	        criteria.add(Restrictions.eq("empId", searchEmployee.getEmpId()));
	    }

	    if (searchEmployee.getEmpName() != null) {
	        criteria.add(Restrictions.ilike("empName", "%" + searchEmployee.getEmpName() + "%"));
	    }

	    if (searchEmployee.getEmpEmail() != null) {
	        criteria.add(Restrictions.ilike("empEmail", "%" + searchEmployee.getEmpEmail() + "%"));
	    }

	    if (searchEmployee.getEmpAddress() != null) {
	        criteria.add(Restrictions.ilike("empAddress", "%" + searchEmployee.getEmpAddress() + "%"));
	    }

	    // Department is a separate entity in Employee
	    
	    if (searchEmployee.getDept() != null && searchEmployee.getDept() != null) {
	    	for(Department departments:searchEmployee.getDept()) {	    	
		        //dept is the reference name of List<Department> present in employee entity class
		        criteria.add(Restrictions.eq("dept.deptId",departments.getDeptId()));
		    }
	    }

	    return criteria.list();
	}
}