<%@page import="org.apache.jasper.tagplugins.jstl.core.Redirect"%>
<%@page import="negocio.ControladorCliente"%>
<%@page import="negocio.ControladorLibro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Baja Clientes</title>
	</head>
	<body>
		<% ControladorCliente cc = new ControladorCliente();
			cc.bajaCliente(cc.getOneCliente(Integer.parseInt(request.getParameter("idElim"))));
			response.sendRedirect("listadoClientes.jsp");
		%>
	</body>
</html>