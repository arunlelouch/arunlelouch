<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Employee Form</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">

		<h1>Employee CURD Operations</h1>
		
		
		 		
		<div class="container">
			<form action="${pageContext.request.contextPath }/employee/update" method="POST">
			  <div class="mb-3">
			  	<input type="hidden" id="id" class="form-control" name="id" 
			  	value="${emp.id }">
			    <label for="name" class="form-label">Name</label>
			    <input type="text" class="form-control" id="name" name="name" 
			    value="${ emp.name }">
			  </div>
			  <div class="mb-3">
			    <label for="mail" class="form-label">Email</label>
			    <input type="email" class="form-control" id="mail" name="email" 
			    value="${ emp.email }">
			  </div>
			  
			  <div class="mb-3">
			    <label for="dob" class="form-label">Date Of Birth</label>
			    <input type="date" class="form-control" id="dob" name="dob" value="${ emp.dob }">
			  </div>
			  
			  <div class="mb-3">
			    <label for="sal" class="form-label">Salary</label>
			    <input type="number" class="form-control" id="sal" name="salary" 
			    value="${ emp.salary }">
			  </div>
			  
			  <c:choose>
			  <c:when test="${ emp.status }">
			  <div class="mb-3">
			  <label>Status</label>
			    <div class="form-check">
				  <input class="form-check-input" type="radio" name="status" id="active"
				   value="1" checked="checked">
				  <label class="form-check-label" for="active">
				    Active
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="status" id="inactive" 
				  value="0">
				  <label class="form-check-label" for="inactive">
				    Inactive
				  </label>
				</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="mb-3">
			  <label>Status</label>
			    <div class="form-check">
				  <input class="form-check-input" type="radio" name="status" id="active"
				   value="1" >
				  <label class="form-check-label" for="active">
				    Active
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="status" id="inactive"
				   value="0" checked="checked">
				  <label class="form-check-label" for="inactive">
				    Inactive
				  </label>
				</div>
				</div>
			</c:otherwise>
			</c:choose>
			 			  			 
			  <button type="submit" class="btn btn-primary">Update Employee</button>
			</form>
		</div>
	</div>
</body>
</html>