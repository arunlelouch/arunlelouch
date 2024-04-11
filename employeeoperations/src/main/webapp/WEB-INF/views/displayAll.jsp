<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
      integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
       crossorigin="anonymous" referrerpolicy="no-referrer" />
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" type="text/javascript"></script>
        
    <title>Display All</title>
    <style type="text/css">
        form {
            background-color: #92a8d1;
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        .departmenttable {
            width: 100;
            border-collapse: collapse;
        }

        .form-control {
            width: calc(100% - 16px);
            box-sizing: border-box;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
         .mb-3{
        padding:18px;
        }
    </style>
    <script type="text/javascript">
	    function redirectToForm() {
	        window.location.href = "/employeeoperations/employee/";
	    }
    
    </script>
</head>
<body>
    <div class="container">

        <h1>Employee Operations</h1>

        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" href="./displayAll">View Employees</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" aria-current="page" href="./addEmpForm">Add Employee Details</a>
            </li>
        </ul>
        <br>
        <div class="container">
            <form:form action="search" method="GET" modelAttribute="emp" >
                <div class="mb-3">
                    <h3> Search employee details</h3>
                    <table>
                        <tbody>
                            <tr>
                            	<td>
                                    <form:label for="id" path="name">Employee Id</form:label> &nbsp;
                                    <form:input type="text" class="form-control" id="id" path="id" required="true"/>
                                </td>
                                
                                <td>
                                    <form:label for="name" path="name">Name</form:label> &nbsp;&nbsp;
                                    <form:input type="text" class="form-control" id="name" path="name"/>
                                </td>
                                
                                <td>
                                    <form:label for="salary" path="salary">Salary</form:label>
                                    <form:input type="number" class="form-control" id="salary" path="salary"/>
                                </td>

                                <td>
                                    <button type="submit" class="btn btn-primary" id="search">Search</button>                                   
                                </td> 
                                <td> <button type="reset" class=" btn btn-primary resetButton" onclick="redirectToForm()">Reset</button></td> 
                            </tr>
                        </tbody>
                    </table>
                </div>
            </form:form>
        </div>
        <hr>
         <div class="container">
      		<c:if test="${not empty searchResults }">  
       
        	<h3>Search Results : </h3>
			    <table class="table table-info">
			    
			        <thead class="table-dark">
			            <tr>
			                <th>Employee Id</th>
			                <th>Name</th>
			                <th>Email</th>
			                <th>Date Of Birth</th>
			                <th>Age</th>
			                <th>Salary</th>
			                <th>Status</th>
			                <th>Edit</th>
			                <th>Delete</th>
			            </tr>
			        </thead>
			        <tbody>
			       		<c:forEach items="${searchResults}" var="result">
			       			<tr>
				                <td>${result.id}</td>
			                    <td>${result.name}</td>
			                    <td>${result.email}</td>
			                    <td>${result.dob}</td>
			                    <td>${result.age}</td>
			                    <td>${result.salary}</td>
			                    <td>${result.status}</td>
			                    <td><a href="./edit/${result.id}"><i class="fa-solid fa-pen-to-square" style="color: #0a0a0a;"></i></a></td>
			                    <td><a href="./delete/${result.id}"><i class="fa-solid fa-trash-can" style="color: #0a0a0a;"></i></a></td>
			                </tr>
			    		</c:forEach>
			       	</tbody>
			    </table>
			 	 
			  </c:if>		 
			    <c:if test="${empty searchResults}">
		            <h3>All Employees:</h3>
		            <table class="table table-info">
		               <thead class="table-dark">
			            <tr>
			                <th>Employee Id</th>
			                <th>Name</th>
			                <th>Email</th>
			                <th>Date Of Birth</th>
			                <th>Age</th>
			                <th>Salary</th>
			                <th>Status</th>
			                <th>Edit</th>
			                <th>Delete</th>
			            </tr>
			       	</thead>
					<tbody>
						 <c:forEach items="${allEmployees}" var="emp">
						     <tr>
						       <td>${emp.id}</td>
						       <td>${emp.name}</td>
						       <td>${emp.email}</td>
						       <td>${emp.dob}</td>
						       <td>${emp.age}</td>
						       <td>${emp.salary}</td>
						       <td>${emp.status}</td>
						       <td><a href="./edit/${emp.id}"><i class="fa-solid fa-pen-to-square" style="color: #0a0a0a;"></i></a></td>
						       <td><a href="./delete/${emp.id}"><i class="fa-solid fa-trash-can" style="color: #0a0a0a;"></i></a></td>
						      </tr>
					     </c:forEach>
					         <c:if test="${empty searchResults && empty allEmployees}">
                        	<tr>
                            	<td colspan="7" class="colspan-center">No records found.</td>
                       		</tr>
                    		</c:if>	 
					 </tbody>
				 </table>
				</c:if>
			</div>
		</div>
</body>
</html>
