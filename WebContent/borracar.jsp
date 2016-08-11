<%@page import="entidades.Libro"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	</head>
	<body>
		<%
			int posicion=Integer.parseInt(request.getParameter("id"));
			ArrayList<Libro> carrito=(ArrayList<Libro>)session.getAttribute("carrito");
			ArrayList<Libro> nuevocarrito=new ArrayList<Libro>();
			for(int i=0;i<carrito.size();i++){
			if(i!=posicion){
					nuevocarrito.add(carrito.get(i));			
				}
			}
			session.setAttribute("carrito", nuevocarrito);
			response.sendRedirect("carrito.jsp");
		%>
	</body>
</html>