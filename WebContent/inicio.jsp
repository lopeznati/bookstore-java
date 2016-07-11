<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Libro" %>
<%@page import="negocio.ControladorLibro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
    	<div class="col-md-12"></div>
  	</div>
  	<div class="row">
    	<div class="col-md-12"></div>
  	</div>
  	<div class="row">
  		<div class="col-md-4"></div>
  	
  		
    	<%  
	     ArrayList<Libro> l = new ControladorLibro().getAllLibros();
			
		
		%>
		<%=l.get(1).getCantidad_paginas() %>
	
			
</div>
  	
  	<div class="row">
  		<div class="col-md-12">
  			<h3>Aca va el footer</h3>
  		</div>
  	</div>
</div>



</body>
</html>