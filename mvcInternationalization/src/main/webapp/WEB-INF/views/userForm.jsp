<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
button{
	border: none;
	color: white;
	font-weight: bold;
	background-color: green;
	padding: 7px;
	border-radius:20px; 
}


</style>
<title><spring:message code="userForm.title" text="Default title" /></title>
</head>
<body>
	<div>
		<p><a href="?language=en_US">English</a> &nbsp;&nbsp;<a href="?language=zh_CN">Simplifed Chinese</a>&nbsp;&nbsp;<a href="?language=ja">Japanese</a> </p>
		<h4><spring:message code="userForm.title" text="Default title"/></h4>
		<form >
			<label for="uname"><spring:message code="userForm.Username" text="Default Username :" /></label>
			<input type="text" id="uname" palceholder="Enter you username"><br><br>
			<label for="password"><spring:message code="userForm.Password" text="Default Password :"/></label>
			<input type="password" id="password" palceholder="Enter you password"><br><br>
			<button type="submit"><spring:message code="userForm.signup" text="Default Sign up"/></button>
		</form>
	</div>
</body>
</html>