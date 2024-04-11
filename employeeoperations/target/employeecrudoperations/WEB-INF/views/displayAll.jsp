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
    <title>Display All</title>
    <style type="text/css">
        form {
            background-color: #92a8d1;
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
    </style>
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
            <form:form action="search" method="POST" modelAttribute="emp">
                <div class="mb-3">
                    <h3> Search employee details</h3>
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                    <form:label for="name" path="name">Name</form:label> &nbsp;&nbsp;
                                    <form:input type="text" class="form-control" id="name" path="name"/>
                                </td>
                                <td>
                                    <form:label for="email" path="email">Email</form:label>
                                    <form:input type="email" class="form-control" id="email" path="email"/>
                                </td>
                                <td>
                                    <form:label for="dob" path="dob">Date Of Birth</form:label>
                                    <form:input type="date" class="form-control" id="dob" path="dob"/>
                                </td>
                                <td>
                                    <form:label for="salary" path="salary">Salary</form:label>
                                    <form:input type="number" class="form-control" id="salary" path="salary"/>
                                </td>
                                
								<td colspan="4">
								    <form:label path="status">Status</form:label>
								    <div class="form-check">
								        <form:radiobutton path="status" id="active" value="true"/>
								        <label class="form-check-label" for="active">Active</label>
								    </div>
								    <div class="form-check">
								        <form:radiobutton path="status" id="inactive" value="false"/>
								        <label class="form-check-label" for="inactive">Inactive</label>
								    </div>
								</td>

                                <td>
                                    <button type="button" class="btn btn-primary" id="search">Search</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </form:form>
        </div>
        <hr>
        <div class="container">
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
			                    <td><a href="./edit/${emp.id}">edit</a></td>
			                    <td><a href="./delete/${emp.id}">delete</a></td>
			                </tr>
			            </c:forEach>
			        </tbody>
			    </table>
			</div>
			<%-- 
			<div class="container">
			    <table class="table table-striped">
			        <tr>
			            <th>Department Id</th>
			            <th>Department name</th>
			            <th>Department type</th>
			            <th>location</th>
			            <th>Department manager</th>
			        </tr>
			        <c:forEach items="${allDepartments}" var="dept">
			            <tr>
			                <td>${dept.deptId}</td>
			                <td>${dept.deptName}</td>
			                <td>${dept.deptType}</td>
			                <td>${dept.deptLoc}</td>
			                <td>${dept.deptManager}</td>
			            </tr>
			        </c:forEach>
			    </table>
			</div>
 --%>
    </div>
</body>
</html>
