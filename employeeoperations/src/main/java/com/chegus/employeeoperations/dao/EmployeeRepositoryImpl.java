package com.chegus.employeeoperations.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;

import com.chegus.employeeoperations.dto.Department;
import com.chegus.employeeoperations.dto.Employee;

@Repository
public class EmployeeRepositoryImpl implements EmployeRepository
{
	private static SessionFactory factory;
	static {
		    try {
		        Configuration config = new Configuration();
		        config.configure();
		        factory = config.buildSessionFactory();
		    }
		    catch (Exception e) {
		        e.printStackTrace();
		        throw new ExceptionInInitializerError(e);
		    }
	}

	@Transactional
	@Override
	public boolean insertEmployee(Employee emp)
	{
		boolean b = false;
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		/* List<Department> departmentsToRemove = new ArrayList<>();
	        for (Department dept : emp.getDept()) {
	            if (dept.getDeptName() == null) {
	                departmentsToRemove.add(dept);
	            }
	        }
	        emp.getDept().removeAll(departmentsToRemove);*/

		
		session.saveOrUpdate(emp);
		
		try
		{
			tx.commit();
			b = true;
		}
		catch (Exception e)
		{
			tx.rollback();
			e.printStackTrace();
			b = false;
		}
		session.close();
		return b;
	}

	@Transactional
	@Override
	public List<Employee> getAllEmployees() 
	{
		Session session = factory.openSession();
		Query query = session.createQuery("FROM Employee");
		List<Employee> allEmps = query.getResultList();
		session.close();
		return allEmps;
	}

	@Transactional
	@Override
	public Employee getEmployeeById(int id)
	{
		Session session = factory.openSession();
		Employee e = session.get(Employee.class, id);
		session.close();
		return e;
	}
	
	@Transactional
	public boolean deleteEmployee(int id)
	{
		boolean b = false;
		Session session= factory.openSession();
		Transaction tx = session.beginTransaction();
		Employee e=session.get(Employee.class, id);
		session.delete(e);
		try
		{
			tx.commit();
			b= true;
		}
		catch (Exception ex)
		{
			tx.rollback();
			ex.printStackTrace();
			b=false;
		}
		session.close();
		return b;
		
	}

	@Transactional
	@Override
	public boolean updateEmployee(Employee updatedEmployee) {
	    Session session = factory.openSession();
	    Transaction tx = session.beginTransaction();
	    boolean b;

	    try {
	        Employee existingEmployee = getEmployeeById(updatedEmployee.getId());

	        existingEmployee.setName(updatedEmployee.getName());
	        existingEmployee.setEmail(updatedEmployee.getEmail());
	        existingEmployee.setDob(updatedEmployee.getDob());
	        existingEmployee.setSalary(updatedEmployee.getSalary());
	        existingEmployee.setStatus(updatedEmployee.isStatus());
	        
	        int yob = Integer.parseInt(updatedEmployee.getDob().substring(0, 4));
			int curYear = LocalDate.now().getYear();
			int age = curYear - yob;
			existingEmployee.setAge(age);

	        List<Department> existingDepts = existingEmployee.getDept();
	        List<Department> newDepts = updatedEmployee.getDept();
	        List<Department> deptToRemove = new ArrayList<>();

	        for (Department existingDept : existingDepts) {
	            if (!newDepts.contains(existingDept)) {
	               
	                deptToRemove.add(existingDept);
	            }
	        }

	        existingDepts.removeAll(deptToRemove);

	        for (Department updatedDept : newDepts)
	        {
	            if (updatedDept.getDeptId() != null) 
	            {
	                boolean deptfound = false;
	                for (Department existingDept : existingDepts)
	                {
	                    if (existingDept.getDeptId().equals(updatedDept.getDeptId()))
	                    {	                        
	                        existingDept.setDeptName(updatedDept.getDeptName());
	                        existingDept.setDeptType(updatedDept.getDeptType());
	                        existingDept.setDeptLoc(updatedDept.getDeptLoc());
	                        existingDept.setDeptManager(updatedDept.getDeptManager());
	                        deptfound = true;
	                        break;
	                    }
	                }

	                if (!deptfound)
	                {
	                    updatedDept.setEmployee(existingEmployee);
	                    existingDepts.add(updatedDept);
	                }
	            } 
	            else {
	                // New department, add it
	                updatedDept.setEmployee(existingEmployee);
	                existingDepts.add(updatedDept);
	            }
	        }

	        existingEmployee.setDept(existingDepts);

	        session.update(existingEmployee);
	        tx.commit();
	        b = true;
	    } catch (Exception e) {
	        tx.rollback();
	        e.printStackTrace();
	        b = false;
	    } finally {
	        session.close();
	    }

	    return b;
	}
	 
	@Transactional
	 @Override
	public boolean insertDepartment(Department dept) {
		 boolean b = false;
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(dept);
		try
		{
			tx.commit();
			b = true;
		}
			catch (Exception e)
		{
			tx.rollback();
			e.printStackTrace();
				b = false;	
		}
		session.close();
		return b;
	}
	
	@Transactional
	 @Override
	public List<Department> getAllDepartments() {
		Session session =factory.openSession();
		Query query = session.createQuery("FROM Department");
		List<Department> departments = query.getResultList();
		session.close();
		return departments;
	}
		 
	@Transactional
	 @Override
	public Department getDepartmentById(int id) {
		Session session = factory.openSession();
		Department dept = session.get(Department.class, id);
		session.close();
		return dept;
	}
	
	@Transactional
	public boolean deleteDepartment(int id)
	{
		boolean b = false;
		Session session= factory.openSession();
		Transaction tx = session.beginTransaction();
		Department department =session.get(Department.class, id);
		session.delete(department);
		try
		{
			tx.commit();
			b= true;
		}
		catch (Exception ex)
		{
			tx.rollback();
			ex.printStackTrace();
			b=false;
		}
		session.close();
		return b;
		
	}

	@Transactional
	@Override
	public List<Employee> searchEmployee(Integer id, String name, double salary) {
		
		try 
		{
			Session session = factory.openSession();
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Employee> criteriaQuery = builder.createQuery(Employee.class);
			Root<Employee> root = criteriaQuery.from(Employee.class);
			Predicate predicate =builder.conjunction();
			if(id != null)
			{
				predicate = builder.and(predicate, builder.equal(root.get("id"), id));
			}
			if(name !=null && !name.isEmpty())
			{
				predicate = builder.and(predicate, builder.like(builder.lower(root.get("name")),"%" + name.toLowerCase()+"%"));
			}
			if(salary > 0.0)
			{
				predicate =builder.and(predicate ,builder.equal(root.get("salary"), salary));
			}

			criteriaQuery.where(predicate);
			
			List<Employee> resultList = session.createQuery(criteriaQuery).getResultList();
	        
	        // Close the session after fetching results if not i'll get search result as empty
	        session.close();

	        return resultList;
			
		}
		catch(Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

	@Transactional
	@Override
	public boolean isEmailDuplicate(String email) {
		 try {
		        Session session = factory.openSession();
		        
		        String hql = "select count(*) from Employee e where lower(e.email) = :email";
		        Query query = session.createQuery(hql, Long.class);
		        query.setParameter("email", email.toLowerCase());
		        
		        System.out.println("Generated Query: " + hql);
		        
		        Long count = ((org.hibernate.query.Query<Long>) query).uniqueResult();
		        
		        System.out.println("Email count: " + count);

		        session.close();
		        return count != null && count > 0;
		    } 
		 	catch (Exception e) {
		        e.printStackTrace();
		        return false;
		    }
	}

}