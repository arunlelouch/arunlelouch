<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="tile" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
 integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title><tile:insertAttribute name="title" ignore="true"/></title>
</head>
<body>
	<center>
		<div style="background-color:rgb(226, 238, 97); ">
			<tile:insertAttribute name="header"/>
		</div>
		<div style="float:left;padding:10px;width:10%;height:420px;">
			<tile:insertAttribute name="menu"/>
		</div>
		<div style="float:left;padding:10px;width:85%;height:420px; border-left:1px solid pink;">
			<tile:insertAttribute name="body"/>
		</div>
		<div style="clear:both;">
			<tile:insertAttribute name="footer"/>
		</div>
	
	</center>
</body>
</html>