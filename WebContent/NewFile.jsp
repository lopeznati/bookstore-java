<%@page import="negocio.ControladorEditorial"%>
<%@page import="datos.ConnectionDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.catalina.mbeans.ConnectorMBean"%>
<%@page import="datos.CatalogoEditorial"%>
<%@page import="entidades.Editorial"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Libro"%>
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

	
    	<%  
    	Connection conn =ConnectionDB.getInstancia().getconn();
		if(conn!=null){
			%>
			
			<p>holaaa</p>
			<% 
		}
		
		Editorial e=new CatalogoEditorial().getOneEditorial(1);
		ArrayList<Libro> libros=new ControladorLibro().getAllLibros();
    	
    %>
    <%=libros.get(1).getCantidad_paginas() %>

	

</body>
</html>