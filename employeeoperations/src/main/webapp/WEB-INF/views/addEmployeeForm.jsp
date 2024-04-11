<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Employee Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" type="text/javascript"></script>
	
    <style type="text/css">
        form {background-color: #92a8d1;}
        table {
            width: 95%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-left: 15px;
        }
        td {
            padding: 12px;
           
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
        #addTblRow{
        	position:absolute;
        	left:63.5em;
        }
        .mb-3{
        padding:5px;
        }
    </style>
  
 	
</head>
<body>
<div class="container">
    <h1>Employee Operations</h1>
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/employee/displayAll">View Employees</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/employee/addEmpForm">Add Employee Details</a>
        </li>
    </ul><br>
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
                                <form:input type="text" id="name" class="form-control" path="name" required="true"/>
                            </td>
                            <td>
                                <label for="email" class="form-label">Email</label>
                                <form:input type="email" class="form-control" id="email" path="email"/>
                                <span id="emailMsg" style ="color:red"></span>
                            </td>
                            <td>
                                <label for="dob" class="form-label">Date Of Birth</label>
                                <form:input type="date" id="dob" class="form-control" path="dob" required="true"/>
                            </td>
                            <td>
                                <label for="salary" class="form-label">Salary</label>
                                <form:input type="number" id="salary" class="form-control" path="salary"/>
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
      
                    <table id="tab">
                    <thead>
                    	<tr>
                    	<td> &nbsp; &nbsp;&nbsp;</td>
                    		<td><label for="" class="form-label">Department Name</label> </td>
                    		<td> <label for="deptType" class="form-label">Department Type</label></td>
                    		<td><label for="deptLoc" class="form-label">Department Location</label></td>
                    		<td><label for="deptManager" class="form-label">Department Manager</label></td>
                    		<td><button type="button" class="btn btn-primary mb-3 mx-5" id="addTblRow">Add</button></td>
                    	</tr>
                     </thead>
                     <tbody id="Tbody">
                            <c:forEach  begin="0" end="${emp.dept.size()==0?0:emp.dept.size()-1}" var="i">
                                <tr id="addRow">
                                    <td>
                                        <form:input type="hidden" class="form-control deptId" id="deptId" name="deptId"
                                           path="dept[${i}].deptId" />
                                    </td>
                                    <td>
                                        
                                        <form:input type="text" class="form-control deptName" id="deptName" name="deptName"
                                            path="dept[${i}].deptName" required="true" />
                                    </td>
                                    <td>
                                        <form:select path="dept[${i}].deptType" class="form-select form-select-m mb-2">
                                            <form:option value="Technical" label="Technical"/>
                                            <form:option value="Non-technical" label="Non-technical"/>
                                        </form:select>
                                    </td>
                                    <td>
                                        
                                        <form:input type="text" class="form-control" path="dept[${i}].deptLoc" required="true"/>
                                    </td>
                                    <td>
                                        <form:input type="text" class="form-control" path="dept[${i}].deptManager" required="true"/>
                                    </td>
                                    <td>
										<button type="button" class="btn btn-primary mb-3 mx-5" id="delTblRow">Delete</button>&nbsp;&nbsp;
 									</td>
 									
                                	</tr>
                            </c:forEach>                           
                        </tbody>
                    </table>
                </div>
            </div>
            <br>
            <button type="submit" class="btn btn-success mb-3 mx-5" id="addDetailsBtn">Add Details</button> &nbsp;&nbsp;
            <br>
        </form:form>
        <br>
    </div>
</div>
	 <script>
	 $(document).ready(function () {
		    $(document).on('click', "#delTblRow", function()
		    	{
		        if ($(this).closest('tr').index() !== 0) {
		            $(this).closest('tr').find('input, select').val('');
		            $(this).closest('tr').remove();
		            updateRowIndices();
		        }
		        else {
		            alert("Cannot delete the first row");
		        }
		    });
		    
		    function updateRowIndices()
		    {
		        // Update indices of the remaining rows
		        $('#tab Tbody tr').each(function (index) {
		            // Update indices for inputs
		            $(this).find('input, select').each(function ()
		            	{
		                var name = $(this).attr('name');
		                $(this).attr('name', name.replace(/\[\d+\]/, '[' + index + ']'));
		            });
		        });
		   	 }

		   	 $("#addTblRow").click(function() {
		      /*   var lastRowInputs = $("#tab tr:last").find('input:not(.deptId)');
		        var isEmpty = false;

		        lastRowInputs.each(function () {
		            if ($(this).val().trim() === '') {
		                isEmpty = true;
		                return false;
		            }
		        }); */
		        var lastRowDeptNames = $("#tab tbody tr:last #deptName")
		        console.log("lastRowDeptNames :"+lastRowDeptNames);
		        var isEmpty = false;

		        lastRowDeptNames.parent().children().each(function () {
		            if ($(this).val() === '') {
		                isEmpty = true;
		                return false; 
		                
		            }
		        });
		              
		         if (isEmpty) {
		            alert("Enter the department name input value");
		        } 
		        else {
		            var lastRow = $("#tab tr:last");
		            var newRow = lastRow.clone();
		            newRow.find('input').val('');

		            newRow.find('input[name^="dept"]').each(function () {
		                var name = $(this).attr('name');
		                $(this).attr('name', name.replace(/\[\d+\]/, '[' + ($('#Tbody tr').length) + ']'));
		            });

		            newRow.find('select[name^="dept"]').each(function () {
		                var name = $(this).attr('name');
		                $(this).attr('name', name.replace(/\[\d+\]/, '[' + ($('#Tbody tr').length) + ']'));
		            });

		            $('#tab tbody').append(newRow);
		            
		            updateRowIndices();
		        }		         	        
		    });
		    
		 	var alreadyExists = false;
		 	var existingEmail = $("#email").val();
		 	
		    function handleEmailValidity()
		    {		    	
		    	var emailToCheck = $(this).val();
		        console.log("Entered Email: " + emailToCheck);
		    	
		    	if(emailToCheck.trim() === existingEmail.trim())
		    	{	    	
		    		alreadyExists = true;
		    		 $("#emailMsg").html("");
		    		 $("#addDetailsBtn").prop("disabled", false);
		    	}
		    	else if(emailToCheck.trim()!== existingEmail.trim() )
		    	{
		    			checkEmailExists(emailToCheck);	
		    	}
		    }
		    
		    function checkEmailExists(emailToCheck)
		    {		 
			    $.ajax({
			        type: "GET",
			         url: "/employeeoperations/employee/validateEmail",
			        data: { email: emailToCheck },
			     success: function(result) {
			            	
			      		console.log("AJAX Response: " + result);
			               
				         if (result === 'duplicate')
				         {
				           	//alert("Email is already Registered!");
				           //$("#email").val('');
				           $("#email").val(existingEmail)
				            $("#emailMsg").html("Email is already Registered!");
				            $("#addDetailsBtn").prop("disabled", true); // Disable the submit button
				         } 
				         else if(result ==='notDuplicate')
				         {					        	
				             $("#emailMsg").html("");
				             $("#addDetailsBtn").prop("disabled", false); // Enable the submit button
				          }
			       	  },
			       error: function(error) {
			              alert("Error checking email address");
			         }
		      	 });
			 }
		     $("#email").on("blur", handleEmailValidity);
    
		  });	  

	</script>
</body>
</html>
