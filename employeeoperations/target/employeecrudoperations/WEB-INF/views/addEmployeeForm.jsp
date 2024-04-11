<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Employee Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.js"></script>
	
    <style type="text/css">
        form {background-color: #92a8d1;}
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-left: 15px;
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
    <script>
		$(document).ready(function () {
		 	$(document).on('click', '#delTblRow', function() {
		    	if ($(this).closest('tr').index() !== 0){
		    		$(this).closest('tr').find('input, select').val('');
		        	$(this).closest('tr').remove();
		        }
		    	else{
		    		alert("cannot delete the first row");
		    	}    
		        
		    });
		 	var numberOfdepartments = ${emp.dept.size()==0?0:emp.dept.size()};
	
	
	
		 	$("#addTblRow").click(function(){
		 	   let i = $('#Tbody').find('tr').length;
		 	  numberOfdepartments = i;
		 	   var v = $('#addRow').clone(true);
		 	   $('#Tbody').find('tr:last').after(v);
	
		 	   $(v).find('input,select').each(function() {
		 	       $(this).val('').attr('name', $(this).attr('name').replace(/\[\d+\]/, '[' + i + ']'));
		 	   });
		  })
	 	
	</script> 	
</head>
<body>
<div class="container">
    <h1>Employee Operations</h1>
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" href="./displayAll">View Employees</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="./addEmpForm">Add Employee Details</a>
        </li>
    </ul>
    <div class="container">
        <form:form action="${emp.id == null ? 'addEmp' : 'update'}" method="POST" modelAttribute="emp">
            <div class="mb-3">
                <h3 class="my-3 mx-2">Employee details</h3>
                <table>
                    <tbody>
                        <tr>
                            <form:hidden path="id"/>
                            <td>
                                <label for="name" class="form-label">Name</label> &nbsp;&nbsp;
                                <form:input type="text" class="form-control" path="name"/>
                            </td>
                            <td>
                                <label for="email" class="form-label">Email</label>
                                <form:input type="email" class="form-control" path="email"/>
                            </td>
                            <td>
                                <label for="dob" class="form-label">Date Of Birth</label>
                                <form:input type="date" class="form-control" path="dob"/>
                            </td>
                            <td>
                                <label for="salary" class="form-label">Salary</label>
                                <form:input type="number" class="form-control" path="salary"/>
                            </td>
                            <td colspan="4">
                                <label>Status</label>
                                <div class="form-check">
                                    <form:radiobutton path="status" id="active" value="true" label="Active"/>
                                    <form:radiobutton path="status" id="inactive" value="false" label="Inactive"/>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <hr>
            <div class="container">
                <div class="mb-3">
                    <h3>Department details</h3>
                    <table>
                        <tbody id=Tbody>
                            <c:forEach  begin="0" end="${emp.dept.size()==0?0:emp.dept.size()-1}" var="i">
                                <tr id=addRow>
                                    <td>
                                        <form:input type="hidden" class="form-control" id="deptId" name="deptId"
                                           path="dept[${i}].deptId" />
                                    </td>
                                    <td>
                                        <label for="deptName" class="form-label">Department Name</label> &nbsp;&nbsp;
                                        <form:input type="text" class="form-control" id="deptName" name="deptName"
                                            path="dept[${i}].deptName" required="true" />
                                    </td>
                                    <td>
                                        <label for="deptType" class="form-label">Department Type</label>
                                        <form:select path="dept[${i}].deptType">
                                            <form:option value="Technical" label="Technical"/>
                                            <form:option value="Non-technical" label="Non-technical"/>
                                        </form:select>
                                    </td>
                                    <td>
                                        <label for="deptLoc" class="form-label">Department Location</label>
                                        <form:input type="text" class="form-control" path="dept[${i}].deptLoc" required="true"/>
                                    </td>
                                    <td>
                                        <label for="deptManager" class="form-label">Department Manager</label>
                                        <form:input type="text" class="form-control" path="dept[${i}].deptManager" required="true"/>
                                    </td>
                                    <td><button type="button" class="btn btn-primary mb-3 mx-5" id="addTblRow">Add</button>&nbsp;
                                    <button type="button" class="btn btn-primary mb-3 mx-5" id="delTblRow">Delete</button>  </td>
                           
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <br>
            <button type="submit" class="btn btn-success mb-3 mx-5">Add Details</button> &nbsp;&nbsp;
            <br>
        </form:form>
        <br>
    </div>
</div>
</body>
</html>
