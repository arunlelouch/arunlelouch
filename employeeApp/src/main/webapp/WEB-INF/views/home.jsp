<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	
    <title>Search Employee Form</title>
    <style type="text/css">
    	.container1 {
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    margin-bottom: 20px;
		}
		
		.container1 table {
		    width: 80%;
		}
		
		.container1 table td {
		    padding: 5px;
		    width: 20%;
		}
		
		.container1 button {
		    margin-top: 10px;
		}
		
		.container2 {
		    /* Add styles for container2 if needed */
		}
    	
    
    
    </style>
  </head>
  <body>
    	<div class ="container1 ">
    		<form:form action="searchEmp" modelAttribute="employee" method="post" cssClass="form-horizontal">
    			<table cellpadding ="1" cellspacing="1" width=100%>
    				<tr>
    					<td class="subHeaderText">Employee Search </td>
    				</tr>
    				<tr>
    					<td>Employee Id</td>
    				
    					<td>Employee Name</td>
    					<td>Employee Email</td>
    					<td>Employee Address</td>
    					<td>Department</td>
    				</tr>
    				<tr>
    					<td><form:input path="empId" id ="empId" type="number" name="empId" placeholder="Enter employee Id" /></td>
    				
    				
    					<td><form:input path="empName" type="text" id ="empName" name="empName" placeholder="Enter employee Name" /></td>
    				
    					<td><form:input path="empEmail" type="email" id ="empEmail" name="empEmail" placeholder="Enter employee Email" /></td>
    				
    					<td><form:input path="empAddress"  id ="empAddress" name="empAddress" placeholder="Enter employee Address" /></td>
    				
    					<td>
    						<form:select path="dept" id ="dept" name="dept" placeholder="Enter dept"
    						 multiple="multiple" cssClass="dropDowm_fixed110" >
	    						<form:option value=" ">Select Department</form:option>
	    						<form:option value="Hr">Human Resources</form:option>
	    						<form:option value="javaDeveloper">Java Developer</form:option>
	    						<form:option value="sqlDeveloper">SQL Developer</form:option>
	    						<form:option value="accounts">Accounts Department</form:option>
	    					</form:select>
    					</td>
    				</tr>   			
    			</table>
    			<button type="submit">Search Employee</button>
    			
      		</form:form>
      		<div class="container mx-4">
      			<a href="empForm" class="btn btn-outline-primary" >Add Employee</a>
      		</div>
    	
    	</div>
    	<hr>
    	<div class="container ">
    		<div class="row">
				<div class="col-row md-12 text-center mx-auto">
							
						<table class="table table-striped table-boardered">
						  <thead class="thead-dark">
						    <tr>
						      <th scope="col">Id</th>
						      <th scope="col">Employee Name</th>
						      <th scope="col">Employee Email</th>
						      <th scope="col">Employee address</th>
						      <th scope="col">Department</th>
						    </tr>
						  </thead>
						  <tbody>
						 	<c:forEach items="${employees}" var="emp">
						  <tr>
						      <th scope="row">${emp.empId }</th>
						      <td>${emp.empName}</td>
						      <td>${emp. empEmail}</td>
						      <td> ${emp.empAddress }</td>
							  <td>
							    <c:forEach var="dept" items="${emp.dept}">
							        ${dept.deptName}<br>
							    </c:forEach>
							  </td>
						      <td> <a href="./delete/${emp.id }"><i class="fa-solid fa-trash-can text-danger "></i> </a> 
						      	&nbsp;&nbsp; <a href="./update/${emp.id }"><i class="fa-solid fa-pen-to-square"></i></a></td>
						    </tr>
						  </c:forEach>
						 </tbody>
					</table>
    			</div>
    		</div>	
    	</div>
    

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>>